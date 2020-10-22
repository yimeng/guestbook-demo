package main

import (
	"github.com/gin-gonic/gin"
	"os"
)

func main() {
	hostname , err := os.Hostname()
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		if err != nil{
			c.JSON(500, gin.H{
				"message": "get hostname error",
			})
		}else {
			c.JSON(200, gin.H{
				"message": hostname,
			})
		}
	})
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")

}
