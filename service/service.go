package service

import (
	"fmt"
	"net/http"
	"time"

	"github.com/google/wire"

	"github.com/dgrijalva/jwt-go"
	"github.com/dgrijalva/jwt-go/request"
	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"

	"github.com/go-ignite/ignite/api"
	"github.com/go-ignite/ignite/config"
	"github.com/go-ignite/ignite/model"
	"github.com/go-ignite/ignite/state"
)

var Set = wire.NewSet(wire.Struct(new(Options), "*"), New)

type Options struct {
	StateHandler *state.Handler
	ModelHandler *model.Handler
	Config       *config.Service
}

type Service struct {
	opts *Options
}

func New(opts *Options) *Service {
	return &Service{
		opts: opts,
	}
}

func (s *Service) errJSON(c *gin.Context, statusCode int, err error, codes ...int) {
	code := statusCode
	if len(codes) > 0 {
		code = codes[0]
	}
	message := http.StatusText(statusCode)
	if err != nil {
		message = err.Error()
	}

	resp := api.NewErrResponse(code, message)
	logrus.WithFields(logrus.Fields{
		"resp":       resp,
		"statusCode": statusCode,
	}).Error(c.Request.URL.String())

	c.JSON(code, resp)
}

func (s *Service) createToken(id string) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"id":  id,
		"exp": time.Now().Add(time.Hour * 1).Unix(),
	})

	tokenStr, err := token.SignedString([]byte(s.opts.Config.JWTSecret))
	if err != nil {
		return "", err
	}

	return tokenStr, nil
}

func (s *Service) Auth(isAdmin bool) gin.HandlerFunc {
	return func(c *gin.Context) {
		token, err := request.ParseFromRequest(c.Request, request.AuthorizationHeaderExtractor, func(token *jwt.Token) (interface{}, error) {
			b := []byte(s.opts.Config.JWTSecret)
			return b, nil
		})
		if err != nil {
			_ = c.AbortWithError(401, err)
			return
		}
		if !token.Valid {
			_ = c.AbortWithError(401, fmt.Errorf("token is invalid"))
			return
		}

		claims := token.Claims.(jwt.MapClaims)
		if !claims.VerifyExpiresAt(time.Now().Unix(), true) {
			_ = c.AbortWithError(401, fmt.Errorf("token is expired"))
			return
		}
		id, ok := claims["id"].(string)
		if !ok {
			_ = c.AbortWithError(401, fmt.Errorf("token'id is invalid"))
			return
		}
		if (isAdmin && id != s.opts.Config.AdminUsername) || (!isAdmin && id == "") {
			_ = c.AbortWithError(401, fmt.Errorf("token auth error"))
			return
		}

		c.Set("id", claims["id"])
		c.Set("token", token.Raw)
	}
}