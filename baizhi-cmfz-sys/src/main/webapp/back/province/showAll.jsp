
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    var $provinceDa;
    $(function(){
        $provinceDa = $('#provinceDa');
        $provinceDa.datagrid({
            url:'${pageContext.request.contextPath}/province/queryAll',
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
                {field:'name',title:'名字',width:100},

                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='del' onClick=\"del('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                "<a class='edt' onClick=\"editRow('"+ row.id +"')\"  href='javascript:;'>修改</a>";
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
    function del(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){

                $.post('${pageContext.request.contextPath}/province/delete',{"id":id},function (result) {

                    $.messager.show({
                        title:'我的消息',
                        msg:'删除成功。',
                        timeout:300,
                        showType:'slide'
                    });
                    $provinceDa.datagrid('reload');
                },'JSON')
            }
        });
    }
    function editRow(id) {
        $('#dgEdit').dialog({
            width:300,
            height:300,
            title:'省信息展示',
            href:'${pageContext.request.contextPath}/back/province/provinceEdit.jsp?id='+id,
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmit,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cle,
            }]
        });
    }
    function sbmit() {
        $('#ff').form('submit',{
            url:'${pageContext.request.contextPath}/province/update' ,
            success:function () {
                $('#dgEdit').dialog('close',true);
                $provinceDa.datagrid('reload');
            }
        });
    }
    function sbmit1() {
        $('#ff').form('submit',{
            url:'${pageContext.request.contextPath}/province/save' ,
            success:function () {
                $('#add').dialog('close',true);
                $provinceDa.datagrid('reload');
            }
        });
    }
    function cle() {
        $('#dgEdit').dialog('close',true);
    }
    function cle1() {
        $('#add').dialog('close',true);
    }
    function addUser() {
        $('#add').dialog({
            width:300,
            height:300,
            title:'添加省',
            href:'${pageContext.request.contextPath}/back/province/provinceAdd.jsp',
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmit1,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cle1,
            }]
        });
    }

</script>


<div  id="provinceDa" >
        </div>

    <div id="dgEdit"></div><div id="add"></div>

