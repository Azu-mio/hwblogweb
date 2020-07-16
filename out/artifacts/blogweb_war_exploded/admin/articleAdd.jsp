<%--
  Created by IntelliJ IDEA.
  User: hufox
  Date: 2020/7/16
  Time: 下午2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.edu.ahtcm.bean.User" %>
<%
    User user = (User)request.getSession().getAttribute("user");
%>
<html>
<head>
    <title>Title</title>
    <!-- 包含头部信息用于适应不同设备 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 包含 bootstrap 样式表 -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/js/kindeditor/themes/default/default.css" />
    <script type='text/javascript' src='/js/kindeditor/kindeditor-all-min.js' charset='utf-8'></script>
    <script>
        KindEditor.ready(function(K) {
            var editor1 = K.create('textarea[name="content1"]', {
                uploadJson : '/UploadImageServlet',
                allowFileManager : true,
                afterCreate : function() {
                    var self = this;
                    K.ctrl(document, 13, function() {
                        self.sync();
                        document.forms['articleForm'].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function() {
                        self.sync();
                        document.forms['articleForm'].submit();
                    });
                }
            });
            //prettyPrint();
        });
    </script>

</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">当前用户：<%out.print(user.getName()); %></a></li>
                <li><a href="/LoginOut">[退出]</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="/ArticleListServlet">文章列表</a></li>
                <li class="active"><a href="#">添加文章</a></li>
                <li><a href="/UserListServlet">用户列表</a></li>
            </ul>
            <hr class="hidden-sm hidden-md hidden-lg">
        </div>
        <div class="col-md-8">
            <form role="form" action="/ArticleAddServlet" name="articleForm"  method="post">
                <div class="form-group">
                    <label for="title">标题</label>
                    <input type="text" id="title" name="title" class="form-control" placeholder="文本输入" required>
                </div>
                <div class="form-group">
                    <label for="content">内容</label>
                    <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                </div>
                <div class="form-group">
                    <label for="content1">内容</label>
                    <textarea name="content1" id="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p>底部内容</p>
</div>
</body>
</html>
