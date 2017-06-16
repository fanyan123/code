
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    var $CounterDa;
    $(function(){
        $CounterDa = $('#CounterDa');
        $CounterDa.datagrid({
            url:'${pageContext.request.contextPath}/counter/queryAll',
            fit:true,
            fitColumns:true,
            toolbar: [{
                text:'添加',
                plan: true,
                iconCls: 'icon-add',
                handler: addCounter
            }],
            columns:[[
                {field:'id',title:'编号', width:100},
                {field:'name',title:'名字',width:100},
                {field:'createdate',title:'创建时间',width:100},
                {field:'count',title:'次数',width:100},
                {field:'record',title:'所属功课',width:100,
                    formatter:function (value,row,index) {
                        return value.name;
                    }
                },

                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='del' onClick=\"delCounter('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                "<a class='edt' onClick=\"editRowCounter('"+ row.id +"')\"  href='javascript:;'>修改</a>";
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
    function delCounter(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){

                $.post('${pageContext.request.contextPath}/counter/delete',{"id":id},function (result) {

                    $.messager.show({
                        title:'我的消息',
                        msg:result,
                        timeout:300,
                        showType:'slide'
                    });
                    $CounterDa.datagrid('reload');
                },'JSON')
            }
        });
    }
    function editRowCounter(id) {
        $('#dgEditCounter').dialog({
            width:300,
            height:300,
            title:'计数器信息展示',
            href:'${pageContext.request.contextPath}/back/counter/counterEdit.jsp?id='+id,
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmitCounter,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cleCounter,
            }]
        });
    }
    function sbmitCounter() {
        $('#ffCounter').form('submit',{
            url:'${pageContext.request.contextPath}/counter/update' ,
            success:function () {
                $('#dgEditCounter').dialog('close',true);
                $CounterDa.datagrid('reload');
            }
        });
    }
    function sbmit1Counter() {
        $('#fCounter').form('submit',{
            url:'${pageContext.request.contextPath}/counter/save' ,
            success:function () {
                $('#addCounter').dialog('close',true);
                $CounterDa.datagrid('reload');
            }
        });
    }
    function cleCounter() {
        $('#dgEditCounter').dialog('close',true);
    }
    function cle1Counter() {
        $('#addCounter').dialog('close',true);
    }
    function addCounter() {
        $('#addCounter').dialog({
            width:300,
            height:300,
            title:'添加省',
            href:'${pageContext.request.contextPath}/back/counter/counterAdd.jsp',
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmit1Counter,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cle1Counter,
            }]
        });
    }

</script>


<div  id="CounterDa" >
        </div>

    <div id="dgEditCounter"></div><div id="addCounter"></div>


