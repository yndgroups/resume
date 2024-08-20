package main

import (
	"app/routes"
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
