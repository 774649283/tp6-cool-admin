# cool-admin


### 技术栈

+ [thinkphp-v6.0.2](https://github.com/top-think/framework)
+ [layui-v2.5.6](https://github.com/top-think/framework)

### 演示地址

+ https://main.coolwl.cn/admin 账号密码 admin admin 禁止修改数据
 
<!-- + 社区地址 ： https://bbs.coolwl.com/index.php;  -->

### 更新日志
+ [日志](./docs/log.md)

### 前言

coolphp v2.0管理系统：为二次开发而生，让开发变得更简单
 + 这是一款快速、高效、便捷、灵活的应用开发框架。
 + 系统采用最新版TinkPHP6框架开发，底层安全可靠，数据查询更快，运行效率更高，网站速度更快, 后续随官网升级而升级
 + 密码动态加密,相同密码入库具有唯一性，用户信息安全牢固,告别简单md5加密
 + 自适应前端，桌面和移动端访问界面友好简洁，模块清晰。 
 + layui采用最新layui2.5.6 框架

#### 已开发功能
 + 后台权限 (已完成)
 + 日志管理 (已完成)
 + 模型管理 (开发中))


#### 待开发
+ 站点管理
+ 内容管理
+ 会员管理
+ 微信管理
+ 插件管理
+ restful api 接口
+ 前端自定义页面
+ ...更多

### 版权信息

coolphp 方便二次开发，您可以方便的使用到自己或企业的项目中,你可以免费学习或者使用

禁止在coolphp整体或任何部分基础上发展任何派生版本、修改版本或第三方版本用于重新分发，经发现必追责。

本项目包含的第三方源码和二进制文件之版权信息另行标注。

版权所有Copyright © 2019-2020 by hrbkcwl [www.hrbkcwl.com](https://www.hrbkcwl.com) All rights reserved。

若此项目能得到你的青睐，支持开源项目，可以捐赠支持作者持续开发与维护。

<img src="docs/img/pay.jpg" width="200px">

### 问题反馈

在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流

QQ群：[711296415](http://wpa.qq.com/msgrd?v=3&uin=711296415&site=qq&menu=yes)

Github：https://github.com/wzs28150/tp6-cool-admin/issues

### 安装

+ 安装第三方类库

```
composer install
```
+ 自行配置 .env 文件
+ 导入sql文件
+ 后台访问 /admin 账号:admin 密码:admin

## 项目目录结构

初始的目录结构如下：

~~~
www  WEB部署目录（或者子目录）
├─addons        插件目录
├─app           目录
│  ├─admin      后台应用目录
│  ├───controller      控制器目录
│  ├───middleware.php  后台中间件
│  ├─api        接口应用目录
│  ├───controller      控制器目录
│  ├─common     公共应用目录
│  ├─middleware 中间件目录
│  ├─ ...            更多类库目录
│  │
│  ├─common.php         公共函数文件
│  └─event.php          事件定义文件
│
├─config                应用配置目录
│  ├─app.php            应用配置
│  ├─cache.php          缓存配置
│  ├─cookie.php         Cookie配置
│  ├─database.php       数据库配置
│  ├─log.php            日志配置
│  ├─route.php          路由和URL配置
│  ├─session.php        Session配置
│  ├─template.php       模板引擎配置
│  └─trace.php          Trace配置
│
├─view                 视图目录
│  ├─app_name          应用视图目录
│  └─ ...   
│
├─public                WEB目录（对外访问目录）
│  ├─index.php          入口文件
│  ├─router.php         快速测试文件
│  └─.htaccess          用于apache的重写
│
├─extend                扩展类库目录
├─runtime               应用的运行时目录（可写，可定制）
├─vendor                第三方类库目录（Composer依赖库）
├─build.php             自动生成定义文件（参考）
├─composer.json         composer 定义文件
├─LICENSE.txt           授权说明文件
├─README.md             README 文件
├─think                 命令行入口文件




