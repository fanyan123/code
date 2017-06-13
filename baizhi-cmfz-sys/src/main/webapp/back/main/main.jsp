
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/static/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/static/css/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/static/css/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/static/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/static/js/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/static/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/static/editor/kindeditor-common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/static/editor/kindeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/static/editor/lang/zh_CN.js"></script>
    <script>
        var $aa,$tt;
        $(function(){
            $aa = $("#menus");
            $tt = $("#tt");
            //初始化系统菜单
            $.post("${pageContext.request.contextPath}/accordion/queryAll",function(menus){
                $.each(menus,function(i,menu){
                    var content = "<div style='text-align: center;'>";
                    $.each(menu.children,function(j,child){
                        content +="<div  onclick=\"addTabs('"+child.name+"','"+child.iconCls+"','"+child.href+"')\" class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\" style='border:1px solid green; width:90%;margin: 5 0  ;'>"+child.name+"</div>";
                    })
                    content +="</div>";
                    $aa.accordion('add',{
                        title:menu.name,
                        iconCls:menu.iconCls,
                        content:content,
                    });
                });
            },"JSON");
        });
        //添加选项卡
        function  addTabs(title,iconCls,href){
            if(!$tt.tabs('exists',title)){
                $tt.tabs('add',{
                    title:title,
                    iconCls:iconCls,
                    href:"${pageContext.request.contextPath}/"+href,
                    closable:true,
                });
                console.log(href)
            }else{
                $tt.tabs('select',title)
            }

        }
    </script>
</head>
<body class="easyui-layout">

        <div data-options="region:'north',split:false" style="height:70px; text-align: center; font-size: 40px;background:#E0ECFF"  >持明法州后台管理系统</div>
        <div data-options="region:'south',split:false" style="height:40px;"></div>
        <div data-options="region:'west',title:'系统菜单',split:false" style="width:200px;">
            <div id="menus" class="easyui-accordion" data-options="border:false,multiple:false" >
            </div>
        </div>
        <div data-options="region:'center',title:'主页',iconCls:'icon-house'">
            <div id="tt" class="easyui-tabs" data-options="fit:true"></div>
        </div>
</body>
</html>
