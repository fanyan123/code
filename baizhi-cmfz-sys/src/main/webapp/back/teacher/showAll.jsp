
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    var $teacherDa;
    $(function(){
        $teacherDa = $('#teacherDa');
        $teacherDa.datagrid({
            url:'${pageContext.request.contextPath}/teacher/queryAll',
            fit:true,
            fitColumns:true,
            toolbar: [{
                text:'添加',
                plan: true,
                iconCls: 'icon-add',
                handler: addTeacher
            }],
            columns:[[
                {field:'id',title:'编号', width:100},
                {field:'name',title:'名字',width:100},
                {field:'picpath',title:'图片名',width:100},
                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='del' onClick=\"delTeacher('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                "<a class='edt' onClick=\"editRowTeacher('"+ row.id +"')\"  href='javascript:;'>修改</a>";
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
    function delTeacher(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){
                $.post('${pageContext.request.contextPath}/teacher/delete',{"id":id},function (result) {
                    $.messager.show({
                        title:'我的消息',
                        msg:result,
                        timeout:300,
                        showType:'slide'
                    });
                    $teacherDa.datagrid('reload');
                },'JSON')
            }
        });
    }
    function editRowTeacher(id) {
        $('#dgEditTeacher').dialog({
            width:300,
            height:300,
            title:'上师信息展示',
            href:'${pageContext.request.contextPath}/back/teacher/teacherEdit.jsp?id='+id,
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmitTeacher,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cleTeacher,
            }]
        });
    }
    function sbmitTeacher() {
        $('#ffTeacher').form('submit',{
            url:'${pageContext.request.contextPath}/teacher/update' ,
            success:function () {
                $('#dgEditTeacher').dialog('close',true);
                $teacherDa.datagrid('reload');
            }
        });
    }
    function sbmit1Teacher() {
        $('#fTeacher').form('submit',{
            url:'${pageContext.request.contextPath}/teacher/save' ,
            success:function () {
                $('#addTeacher').dialog('close',true);
                $teacherDa.datagrid('reload');
            }
        });
    }
    function cleTeacher() {
        $('#dgEditTeacher').dialog('close',true);
    }
    function cle1Teacher() {
        $('#addTeacher').dialog('close',true);
    }
    function addTeacher() {
        $('#addTeacher').dialog({
            width:300,
            height:300,
            title:'添加上师',
            href:'${pageContext.request.contextPath}/back/teacher/teacherAdd.jsp',
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmit1Teacher,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cle1Teacher,
            }]
        });
    }

</script>


<div  id="teacherDa" >
        </div>

    <div id="dgEditTeacher"></div><div id="addTeacher"></div>


