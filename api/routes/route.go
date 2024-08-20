package routes

import (
	"fmt"
	"strings"

	"github.com/gin-gonic/gin"

	"app/apis"
)

func InitRoutes(env string) (route *gin.Engine) {
	routes := gin.Default()

	// 环境模式设置
	switch true {
	case strings.Contains(env, "test"):
		gin.SetMode(gin.TestMode)
	case strings.Contains(env, "prod"):
		gin.SetMode(gin.ReleaseMode)
		// 生产环境捕获异常并让成功不要挂掉
		// routes.Use(middleware.Recover)
	default:
		gin.SetMode(gin.TestMode)
	}

	// api基础路径
	basePath := "/api"

	// 简历用户路由
	user := routes.Group(fmt.Sprintf("%s/user", basePath))
	user.GET("/findById", apis.User.FindUserById)

	return routes
}
