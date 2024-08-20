# api 项目搭建

## 一 创建api目录
- mkdir api
- cd api 并创建创建go.mod文件并写入
```
module api
go 1.21
```
- 创建main.go文件并写入
```
package main

import "fmt"

func main() {
	fmt.Println("Hello World")
}
```
- 运行main.go,输出如下，基本项目搭建成功
```
➜  api go run main.go 
Hello World
```

## 二 引入gin框架
- 地址： https://github.com/gin-gonic/gin
- 执行下面命令
```
go get -u github.com/gin-gonic/gin
```
- 接下来在main.go中引入gin包并创建路由
```
r := gin.Default()
  r.GET("/ping", func(c *gin.Context) {
    c.JSON(http.StatusOK, gin.H{
      "message": "pong",
    })
  })
  r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
```
  - 再次运行go run main.go, 控制台显示如下，证明引入成功
```
 api go run main.go
Hello World
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /ping                     --> main.main.func1 (3 handlers)
[GIN-debug] [WARNING] You trusted all proxies, this is NOT safe. We recommend you to set a value.
Please check https://pkg.go.dev/github.com/gin-gonic/gin#readme-don-t-trust-all-proxies for details.
[GIN-debug] Environment variable PORT is undefined. Using port :8080 by default
[GIN-debug] Listening and serving HTTP on :8080
```

- 接下来访问 `http://localhost:8080/ping`,输出如下
```
{
  "message": "pong"
}
```

## 开始解析结构体的编写
创建models目录，并创建user.go文件，写入如下代码
```
package models

// 用户结构体
type User struct {
	UserId       int    `json:"userId"`
	RealName     string `json:"trueName"`
	Birthday     string `json:"birthday"`
	Mobile       string `json:"mobile"`
	Wechat       string `json:"wechat"`
	Email        string `json:"email"`
	Education    string `json:"education"`
	LiveAddress  string `json:"liveAddress"`
	NativePlace  string `json:"nativePlace"`
	Introduction string `json:"introduction"`
	DelStatus    int    `json:"delStatus"`
	CreateBy     int    `json:"createBy"`
	UpdateBy     int    `json:"updateBy"`
	CreateTime   string `json:"createTime"`
	UpdateTime   string `json:"updateTime"`
}
```

## 为了路由的扩展和分组，我们决定吧路由创建文件夹进行单独的声明
- 创建 routes目录，并创建user.go文件，写入如下代码
```
package routes

import (
	"fmt"
	"strings"

	"github.com/gin-gonic/gin"

	"api/apis"
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
```

## 创建api文件夹，并创建user.go文件，写入如下代码
```
package apis

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

var User = &user{}

type user struct{}

func (u *user) FindUserById(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "pong",
	})
}
```

## 接下来修改main.go文件，写入如下代码
```
package main

import (
	"api/routes"
)

func main() {
	r := routes.InitRoutes("dev")
	r.Run(":8080")

	// fmt.Println("Hello World")
	// r := gin.Default()
	// r.GET("/ping", func(c *gin.Context) {
	// 	c.JSON(http.StatusOK, gin.H{
	// 		"message": "pong",
	// 	})
	// })
	// r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
```
我们这次根据刚才配置的地址输入请求`http://localhost:8080/api/user/findById`,依然获取数据如下，证明我们的路由分组及封装是成功的
```
{
  "message": "pong"
}
```

## 接下来我们创建services目录，并创建user.go文件，写入如下代码
```
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
```
然后修改 apis/user.go文件，写入如下代码
```
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
```
我们再次请求`http://localhost:8080/api/user/findById`, 发现结果也是一样的，这样证明我们的service封装也正常了，接下来就是接入数据库和编写业务逻辑了