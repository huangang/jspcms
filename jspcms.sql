/*
*jspcms
*内容管理系统
*/
create table `users`
(

	`uid` int(8) NOT NULL comment '用户id',
	`username` varchar(255) NOT NULL comment '用户名',
	`password` varchar(255) NOT NULL comment '密码',
	`email` varchar(255) NOT NULL comment '邮箱',
	`role` varchar(11) NOT NULL comment '身份',
	`register_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' comment '注册时间',
	primary key (uid)

)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
alter table users comment '用户表';


create table `posts`
(

`pid` int(8) NOT NULL comment '文章id',
`uid` int(8) NOT NULL comment '用户id',
`sid` int(8) NOT NULL comment '分类id',
`title` text NOT NULL comment '文章标题',
`content` longtext NOT NULL comment '文章内容',
`post_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' comment '发布时间',
`have_comment` boolean NOT NULL DEFAULT true comment '是否评论',
primary key (pid)

)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
alter table posts comment '文章表';


create table `comments`
(

`cid` int(8) NOT NULL comment '评论id',
`pid` int(8) NOT NULL comment '文章id',
`uid` int(8) NOT NULL comment '用户id',
`reply_cid` int(8) comment '回复评论id',
`content` longtext NOT NULL comment '评论内容',
`comment_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' comment '评论时间',
primary key (cid)

)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
alter table comments comment '评论表';



create table `sorts`
( 

`sid` int(8) NOT NULL comment '分类id',
`sname` varchar(255) NOT NULL comment '分类名',
primary key (sid)

)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

alter table sorts comment '文章分类表';




