<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    var $recordDa;
    $(function(){
        $recordDa = $('#recordDa');
        $recordDa.datagrid({
            url:'${pageContext.request.contextPath}/record/queryAll',
            fit:true,
            fitColumns:true,
            toolbar: [{
                text:'添加',
                plan: true,
                iconCls: 'icon-add',
                handler: addRecord
            }],
            columns:[[
                {field:'id',title:'编号', width:100},
                {field:'name',title:'功课记录名',width:100},
                {field:'user',title:'所属用户',width:100,
                    formatter:function (value,row,index) {
                        if(value==null){
                            return "所有用户";
                        }else {
                            return value.name;
                        }
                    }
                },
                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='del' onClick=\"delRecord('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                "<a class='edt' onClick=\"editRowRecord('"+ row.id +"')\"  href='javascript:;'>修改</a>";
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
    function delRecord(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){
                $.post('${pageContext.request.contextPath}/record/delete',{"id":id},function (result) {
                    $.messager.show({
                        title:'我的消息',
                        msg:result,
                        timeout:300,
                        showType:'slide'
                    });
                    $recordDa.datagrid('reload');
                },'JSON')
            }
        });
    }
    function editRowRecord(id) {
        $('#dgEditRecord').dialog({
            width:300,
            height:300,
            title:'功课记录信息展示',
            href:'${pageContext.request.contextPath}/back/record/recordEdit.jsp?id='+id,
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmitRecord,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cleRecord,
            }]
        });
    }
    function sbmitRecord() {
        $('#ffRecord').form('submit',{
            url:'${pageContext.request.contextPath}/record/update' ,
            success:function () {
                $('#dgEditRecord').dialog('close',true);
                $recordDa.datagrid('reload');
            }
        });
    }
    function sbmit1Record() {
        $('#fRecord').form('submit',{
            url:'${pageContext.request.contextPath}/record/save' ,
            success:function () {
                $('#addRecord').dialog('close',true);
                $recordDa.datagrid('reload');
            }
        });
    }
    function cleRecord() {
        $('#dgEditRecord').dialog('close',true);
    }
    function cle1Record() {
        $('#addRecord').dialog('close',true);
    }
    function addRecord() {
        $('#addRecord').dialog({
            width:300,
            height:300,
            title:'添加功课记录',
            href:'${pageContext.request.contextPath}/back/record/recordAdd.jsp',
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmit1Record,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cle1Record,
            }]
        });
    }
</script>
<div id="recordDa" >
        </div>
    <div id="dgEditRecord"></div><div id="addRecord"></div>


