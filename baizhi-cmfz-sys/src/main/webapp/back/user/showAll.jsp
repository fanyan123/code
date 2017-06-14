
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    var $UserDa;
    $(function(){
        $UserDa = $('#UserDa');
        $UserDa.datagrid({
            url:'${pageContext.request.contextPath}/user/queryAll',
            fit:true,
            fitColumns:true,
            toolbar: [{
                text:'添加',
                plan: true,
                iconCls: 'icon-add',
                handler: addUser
            }],
            columns:[[
                {field:'id',title:'编号', width:100},
                {field:'name',title:'昵称',width:100},
                {field:'legalname',title:'法名',width:100},
                {field:'tel',title:'电话号码',width:100},
                {field:'sex',title:'性别',width:100},
                {field:'signature',title:'签名',width:100},
                {field:'picpath',title:'图像名',width:100},
                {field:'province',title:'所在省',width:100,
                    formatter:function (value,row,index) {
                        return value.name;
                    }
                },
                {field:'city',title:'所在市',width:100,
                    formatter:function (value,row,index) {
                        return value.name;
                    }
                },
                {field:'teacher',title:'上师',width:100,
                    formatter:function (value,row,index) {
                        return value.name;
                    }
                },

                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='del' onClick=\"delUser('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                "<a class='edt' onClick=\"editRowUser('"+ row.id +"')\"  href='javascript:;'>修改</a>";
                    }
                }
            ]],
            onLoadSuccess:function () {
                $('.del').linkbutton({
                    plain:true,
                    iconCls:'icon-remove'
                });
                $('.edt').linkbutton({
                    plain:true,
                    iconCls:'icon-edit'
                });
            },
            pagination:true,
            pageNumber:1,
            pageSize:10,
            pageList:[10,20,30,40],
        });

    });
    function delUser(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){

                $.post('${pageContext.request.contextPath}/user/delete',{"id":id},function (result) {

                    $.messager.show({
                        title:'我的消息',
                        msg:result,
                        timeout:300,
                        showType:'slide'
                    });
                    $UserDa.datagrid('reload');
                },'JSON')
            }
        });
    }
    function editRowUser(id) {
        $('#dgEditUser').dialog({
            width:300,
            height:300,
            title:'省信息展示',
            href:'${pageContext.request.contextPath}/back/user/userEdit.jsp?id='+id,
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmitUser,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cleUser,
            }]
        });
    }
    function sbmitUser() {
        $('#ffUser').form('submit',{
            url:'${pageContext.request.contextPath}/user/update' ,
            success:function () {
                $('#dgEditUser').dialog('close',true);
                $UserDa.datagrid('reload');
            }
        });
    }
    function sbmit1User() {
        $('#fUser').form('submit',{
            url:'${pageContext.request.contextPath}/user/save' ,
            success:function () {
                $('#addUser').dialog('close',true);
                $UserDa.datagrid('reload');
            }
        });
    }
    function cleUser() {
        $('#dgEditUser').dialog('close',true);
    }
    function cle1User() {
        $('#addUser').dialog('close',true);
    }
    function addUser() {
        $('#addUser').dialog({
            width:300,
            height:300,
            title:'添加用户',
            href:'${pageContext.request.contextPath}/back/user/userAdd.jsp',
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmit1User,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cle1User,
            }]
        });
    }

</script>


<div  id="UserDa" >
        </div>

    <div id="dgEditUser"></div><div id="addUser"></div>


