
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    var $rfcDa;
    $(function(){
        $rfcDa = $('#rfcDa');
        $rfcDa.datagrid({
            url:'${pageContext.request.contextPath}/rfc/queryAll',
            fit:true,
            fitColumns:true,
            columns:[[
                {field:'id',title:'编号', width:100},
                {field:'content',title:'内容',width:100},
                {field:'user',title:'用户',width:100,
                    formatter:function (value,row,index) {
                        if(value==null){
                            return "无";
                        }else{
                            return value.name;
                        }
                    }
                },
                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='delRfc' onClick=\"delRfc('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;"
                    }
                }
            ]],
            onLoadSuccess:function () {
                $('.delRfc').linkbutton({
                    plain:true,
                    iconCls:'icon-remove'
                });

            },
            pagination:true,
            pageNumber:1,
            pageSize:10,
            pageList:[10,20,30,40],
        });

    });
    function delRfc(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){
                $.post('${pageContext.request.contextPath}/rfc/delete',{"id":id},function (result) {
                    $.messager.show({
                        title:'我的消息',
                        msg:result,
                        timeout:300,
                        showType:'slide'
                    });
                    $rfcDa.datagrid('reload');
                },'JSON')
            }
        });

    }

</script>


<div  id="rfcDa" >
        </div>

    <div id="dgEditRfc"></div>


