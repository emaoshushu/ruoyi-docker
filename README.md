# ruoyi-docker
若依快速开发平台增加docker支持，可以自动完成mvn打包和jar包运行，因为写前端对接api的时候不想配置后台java运行环境，于是想借助docker让后端环境免于配置部署

## 脚本run.sh
实现包括：
### 自动导入sql （数据编码问题导致页面文字乱码TODO）
### 自动运行程序 （默认8080端口, http://127.0.0.1:8080访问）
计划实现：
### docker-compose 
### 热重载用于dev开发
### 自动化make脚本
