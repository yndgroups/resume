package apis

import (
	"net/http"

	"github.com/gin-gonic/gin"

	"app/service"
)

var User = &user{}

type user struct{}

func (u *user) FindUserById(c *gin.Context) {
	c.JSON(http.StatusOK, service.UserService.FindUserById(1))
}
