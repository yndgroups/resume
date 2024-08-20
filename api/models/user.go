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
