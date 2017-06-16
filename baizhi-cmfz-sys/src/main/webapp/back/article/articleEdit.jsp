
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
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
    $(function(){
        //富文本编辑器
        KindEditor.ready(function(K) {
            editor = K.create("#editor", {
                themeType:"simple",//修改主题
                height: "600px",
                items: [
                    "source",  "preview","fullscreen","clearhtml","|",
                    "undo", "redo","|",
                    "copy", "paste","plainpaste", "wordpaste", "|",
                    "justifycenter", "justifyright",
                    "justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent",  "|",
                    "formatblock", "fontname", "fontsize",
                    "forecolor", "hilitecolor", "bold",
                    "italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image","table", "hr", "emoticons", "baidumap", "pagebreak",
                    "anchor", "link", "unlink"
                ],
                langType: 'zh_CN',
                syncType: "form",
                filterMode: false,
                pagebreakHtml: '<hr class="pageBreak" \/>',
                allowFileManager: true,
                filePostName: "image",
                fileManagerJson:"${pageContext.request.contextPath }/imgs/browser",
                uploadJson:  "${pageContext.request.contextPath }/imgs/uploadImg",
                extraFileUploadParams: {
                    token: getCookie("token")
                },
                afterChange: function() {
                    this.sync();
                }
            });
        });
        $.post('${pageContext.request.contextPath}/article/queryById',{"id":"${param.id}"},function (article) {
            $('#ArticleId').val(article.id);
            $('#ArticleTitle').textbox({
                value:article.title,
            });
            $('#ArticleAuthor').textbox({
                value:article.author,
            });
            $('#editor').val(article.content)

        },'JSON');
        $('#ArticleType_sel').combobox({
            width:170,
            value:'请选择',
            required:true
        })
        $('#subEditArticle').linkbutton({
            text:'提交',
            width:60,
            height:35,
            onClick:function(){
                $('#ffArticle').form('submit',{
                    url:'${pageContext.request.contextPath}/article/update' ,
                    success:function () {
                        $.messager.show({
                            title:'我的消息',
                            msg:'修改成功',
                            timeout:300,
                            showType:'slide'
                        });
                    }
                })
            }
        })
        $('#buttArticle').linkbutton({
            text:'返回主页',
            width:70,
            height:35,
            onClick:function(){
                $('#buttArticle').prop('href','${pageContext.request.contextPath}/back/main/main.jsp')
            }
        })

    });
</script>
</head>
<body>
<div >
    <form method="post" class="easyui-form" id="ffArticle">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="ArticleId" name="id"></div>
        <div style="margin-top: 10px">标题：<input class="easyui-textbox" data-options="required:true" name="title" id="ArticleTitle"></div>
        <div style="margin-top: 10px">作者：<input class="easyui-textbox" data-options="required:true" name="author" id="ArticleAuthor"></div>
        <div style="margin-top: 10px">类型：<select name="type" id="ArticleType_sel">
            <option value="0">上师言教</option>
            <option value="1">显密法要</option>
        </select></div>
        <div style="margin-top: 10px"><textarea id="editor" class="editor" name="content" style="width:100%;display: none"></textarea></div>
        <a id="subEditArticle"></a>
        <a id="buttArticle"></a>
    </form>
</div>
</body>
</html>