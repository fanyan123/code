
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    var $ArticleDa;
    $(function(){
        $ArticleDa = $('#ArticleDa');
        $ArticleDa.datagrid({
            url:'${pageContext.request.contextPath}/article/queryAll',
            fit:true,
            fitColumns:true,
            toolbar: '#addArticle',
            columns:[[
                {field:'id',title:'编号', width:100},
                {field:'title',title:'标题',width:100},
                {field:'author',title:'作者',width:100},
                {field:'createdate',title:'创建时间',width:100},
                {field:'type',title:'文章类型',width:100,
                        formatter:function(value,row,index){
                               if(value=='0'){
                                       return "上师言教";
                               } else {
                                       return "显密法要";
                               }
                        }
                },
                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='del' onClick=\"delArticle('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                "<a class='edtArticle' onClick=\"editRowArticle('"+ row.id +"')\"  href='javascript:;'>修改</a>";
                    }
                }
            ]],
            onLoadSuccess:function () {
                $('.del').linkbutton({
                    plain:true,
                    iconCls:'icon-remove'
                });
                $('.edtArticle').linkbutton({
                    plain:true,
                    iconCls:'icon-edit',

                });
            },
            pagination:true,
            pageNumber:1,
            pageSize:10,
            pageList:[10,20,30,40],
        });

    });
    function delArticle(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){
                $.post('${pageContext.request.contextPath}/article/delete',{"id":id},function (result) {
                    $.messager.show({
                        title:'我的消息',
                        msg:result,
                        timeout:300,
                        showType:'slide'
                    });
                    $ArticleDa.datagrid('reload');
                },'JSON')
            }
        });
    }
    function editRowArticle(id) {
        $('.edtArticle').prop('href','${pageContext.request.contextPath}/back/article/articleEdit.jsp?id='+id)
    }






</script>


<div  id="ArticleDa" >
        </div>

<div id="dgEditArticle"></div>
<a class="easyui-linkbutton" id="addArticle" href="${pageContext.request.contextPath}/back/article/articleAdd.jsp" data-options="iconCls:'icon-add'" onclick="addArticle()"></a>

