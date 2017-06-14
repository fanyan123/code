
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    var $musicfileDa;
    $(function(){
        $musicfileDa = $('#musicfileDa');
        $musicfileDa.datagrid({
            url:'${pageContext.request.contextPath}/musicfile/queryAll',
            fit:true,
            fitColumns:true,
            toolbar: [{
                text:'添加',
                plan: true,
                iconCls: 'icon-add',
                handler: addmusicfile
            }],
            columns:[[
                {field:'id',title:'编号', width:100},
                {field:'name',title:'文件名字',width:100},
                {field:'title',title:'文件标题',width:100},
                {field:'size',title:'文件大小(Mb)',width:100},
                {field:'music',title:'所属专辑',width:100,
                    formatter:function(value,row,index){
                        return row.music.title;
                    }
                },
                {field:'options',title:'操作',width:100,
                    formatter:function (value,row,index) {
                        return  "<a class='del' onClick=\"delMusicfile('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                "<a class='edt' onClick=\"editRowMusicfile('"+ row.id +"')\"  href='javascript:;'>修改</a>";
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
    function delMusicfile(id) {
        $.messager.confirm("删除提示","您确认删除吗?",function (r) {
            if(r){
                $.post('${pageContext.request.contextPath}/musicfile/delete',{"id":id},function (result) {

                    $.messager.show({
                        title:'我的消息',
                        msg:result,
                        timeout:300,
                        showType:'slide'
                    });
                    $musicfileDa.datagrid('reload');
                },'JSON')
            }
        });
    }
    function editRowMusicfile(id) {
        $('#MusicfiledgEdit').dialog({
            width:300,
            height:300,
            title:'音频信息展示',
            href:'${pageContext.request.contextPath}/back/musicfile/musicfileEdit.jsp?id='+id,
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmitMusicfile,
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:cleMusicfile,
            }]
        });
    }
    function sbmitMusicfile() {
        $('#fMusicfile').form('submit',{
            url:'${pageContext.request.contextPath}/musicfile/update' ,
            success:function () {
                $('#dgEdit').dialog('close',true);
                $musicfileDa.datagrid('reload');
            }
        });
    }
    function sbmit1Musicfile() {
        $('#ffMusicfile').form('submit',{
            url:'${pageContext.request.contextPath}/musicfile/upload' ,
            success:function () {
                $('#add').dialog('close',true);
                $musicfileDa.datagrid('reload');
            }
        });
    }
    function cleMusicfile() {
        $('#MusicfiledgEdit').dialog('close',true);
    }
    function cle1Musicfile() {
        $('#MusicfileAdd').dialog('close',true);
    }
    function addmusicfile() {
        $('#MusicfileAdd').dialog({
            width:300,
            height:300,
            title:'添加音频',
            href:'${pageContext.request.contextPath}/back/musicfile/musicfileAdd.jsp',
            buttons:[{
                text:'提交',
                iconCls:'icon-save',
                handler:sbmit1Musicfile,
            },{
                text:'取消',
                iconCls:'icon-cancle',
                handler:cle1Musicfile,
            }]
        });
    }

</script>


<div  id="musicfileDa" >
        </div>

    <div id="MusicfiledgEdit"></div><div id="MusicfileAdd"></div>


