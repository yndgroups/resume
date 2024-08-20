package service

import (
	"github.com/gin-gonic/gin"
)

var UserService = &userService{}

type userService struct {
}

// 声明查找用户
func (u *userService) FindUserById(id int) any {
	return gin.H{
		"message": "pong",
	}
}
