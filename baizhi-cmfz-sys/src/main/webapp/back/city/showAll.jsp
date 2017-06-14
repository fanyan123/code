
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    var $cityDa;
    $(function(){
        $cityDa = $('#cityDa');
        $cityDa.datagrid({
            url:'${pageContext.request.contextPath}/city/queryAll',
            fit:true,
            fitColumns:true,
            toolbar: [{
                text:'添加',
                plan: true,
                iconCls: 'icon-add',
                handler: addCity
            }],
            columns:[[
                {field:'id',title:'编号', width:100},
                {field:'name',title:'市名字',width:100},
                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='del' onClick=\"delCity('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                "<a class='edt' onClick=\"editRowCity('"+ row.id +"')\"  href='javascript:;'>修改</a>";
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
    function delCity(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){

                $.post('${pageContext.request.contextPath}/city/delete',{"id":id},function (result) {

                    $.messager.show({
                        title:'我的消息',
                        msg:result,
                        timeout:300,
                        showType:'slide'
                    });
                    $cityDa.datagrid('reload');
                },'JSON')
            }
        });
    }
    function editRowCity(id) {
        $('#dgEditCity').dialog({
            width:300,
            height:300,
            title:'市信息展示',
            href:'${pageContext.request.contextPath}/back/city/cityEdit.jsp?id='+id,
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmitCityUpdate,
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:cleEditCity,
            }]
        });
    }
    function sbmitCityUpdate() {
        $('#CityFf').form('submit',{
            url:'${pageContext.request.contextPath}/city/update' ,
            success:function () {
                $('#dgEditCity').dialog('close',true);
                $cityDa.datagrid('reload');
            }
        });
    }
    function sbmitAddCity() {
        $('#CityF').form('submit',{
            url:'${pageContext.request.contextPath}/city/save' ,
            success:function () {
                $('#addCity').dialog('close',true);
                $cityDa.datagrid('reload');
            }
        });
    }
    function cleEditCity() {
        $('#dgEditCity').dialog('close',true);
    }
    function cleAddCity() {
        $('#addCity').dialog('close',true);
    }
    function addCity() {
        $('#addCity').dialog({
            width:300,
            height:300,
            title:'添加市',
            href:'${pageContext.request.contextPath}/back/city/cityAdd.jsp',
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmitAddCity,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cleAddCity,
            }]
        });
    }

</script>


<div  id="cityDa" >
        </div>

    <div id="dgEditCity"></div><div id="addCity"></div>


