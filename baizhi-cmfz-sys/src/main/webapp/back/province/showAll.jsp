
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
                handler: addProvince
            }],
            columns:[[
                {field:'id',title:'编号', width:100},
                {field:'name',title:'名字',width:100},

                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='del' onClick=\"delProvince('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                "<a class='edt' onClick=\"editRowProvince('"+ row.id +"')\"  href='javascript:;'>修改</a>";
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
    function delProvince(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){

                $.post('${pageContext.request.contextPath}/province/delete',{"id":id},function (result) {

                    $.messager.show({
                        title:'我的消息',
                        msg:result,
                        timeout:300,
                        showType:'slide'
                    });
                    $provinceDa.datagrid('reload');
                },'JSON')
            }
        });
    }
    function editRowProvince(id) {
        $('#dgEditProvince').dialog({
            width:300,
            height:300,
            title:'省信息展示',
            href:'${pageContext.request.contextPath}/back/province/provinceEdit.jsp?id='+id,
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmitProvince,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cleProvince,
            }]
        });
    }
    function sbmitProvince() {
        $('#ffProvince').form('submit',{
            url:'${pageContext.request.contextPath}/province/update' ,
            success:function () {
                $('#dgEditProvince').dialog('close',true);
                $provinceDa.datagrid('reload');
            }
        });
    }
    function sbmit1Province() {
        $('#fProvince').form('submit',{
            url:'${pageContext.request.contextPath}/province/save' ,
            success:function () {
                $('#addProvince').dialog('close',true);
                $provinceDa.datagrid('reload');
            }
        });
    }
    function cleProvince() {
        $('#dgEditProvince').dialog('close',true);
    }
    function cle1Province() {
        $('#addProvince').dialog('close',true);
    }
    function addProvince() {
        $('#addProvince').dialog({
            width:300,
            height:300,
            title:'添加省',
            href:'${pageContext.request.contextPath}/back/province/provinceAdd.jsp',
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmit1Province,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cle1Province,
            }]
        });
    }

</script>


<div  id="provinceDa" >
        </div>

    <div id="dgEditProvince"></div><div id="addProvince"></div>


