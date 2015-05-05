/*
*jspcms
*内容管理系统
*/
--
-- Database: `jspcms`
--

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
	`cid` int(8) NOT NULL COMMENT '评论id',
	`pid` int(8) NOT NULL COMMENT '文章id',
	`uid` int(8) NOT NULL COMMENT '用户id',
	`reply_cid` int(8) DEFAULT NULL COMMENT '回复评论id',
	`content` longtext NOT NULL COMMENT '评论内容',
	`comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE `posts` (
	`pid` int(8) NOT NULL COMMENT '文章id',
	`uid` int(8) NOT NULL COMMENT '用户id',
	`sid` int(8) NOT NULL COMMENT '分类id',
	`title` text NOT NULL COMMENT '文章标题',
	`content` longtext NOT NULL COMMENT '文章内容',
	`post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
	`have_comment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否评论'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章表';

-- --------------------------------------------------------

--
-- 表的结构 `sorts`
--

CREATE TABLE `sorts` (
	`sid` int(8) NOT NULL COMMENT '分类id',
	`sname` varchar(255) NOT NULL COMMENT '分类名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
	`uid` int(8) NOT NULL COMMENT '用户id',
	`username` varchar(255) NOT NULL COMMENT '用户名',
	`password` varchar(255) NOT NULL COMMENT '密码',
	`email` varchar(255) NOT NULL COMMENT '邮箱',
	`role` varchar(11) NOT NULL COMMENT '身份',
	`register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `sorts`
--
ALTER TABLE `sorts`
ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `cid` int(8) NOT NULL AUTO_INCREMENT COMMENT '评论id';
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `pid` int(8) NOT NULL AUTO_INCREMENT COMMENT '文章id';
--
-- AUTO_INCREMENT for table `sorts`
--
ALTER TABLE `sorts`
MODIFY `sid` int(8) NOT NULL AUTO_INCREMENT COMMENT '分类id';
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `uid` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户id';