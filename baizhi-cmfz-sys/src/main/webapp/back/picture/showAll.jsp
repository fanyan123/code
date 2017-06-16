<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
 <script type="text/javascript">
        $(function(){
            $pictureda = $('#pictureda');
            $pictureda.datagrid({
                url:'${pageContext.request.contextPath}/picture/queryAll',
                fit:true,
                fitColumns:true,
                toolbar: [{
                    text:'添加',
                    plan: true,
                    iconCls: 'icon-add',
                    handler: addPicture
                }],
                columns:[[
                    {field:'id',title:'编号', width:100},
                    {field:'name',title:'图片预览',width:100,
                        formatter:function(value,row,index){
                            return "<a href=\"${pageContext.request.contextPath}/picture/download?fileName="+row.name+"\">"+row.name+"</a>"
                        }
                    },
                    {field:'title',title:'图片介绍', width:100},
                    {field:'type',title:'图片是否在前台展示', width:100,
                        formatter:function(value,row,index){
                            if(row.type=='0'){
                                return "不展示";
                            }else{
                                return "展示";
                            }
                        }
                    },
                    {field:'options',title:'操作',width:100,
                        formatter:function (value,row,index) {
                            return  "<a class='del' onClick=\"delPicture('"+ row.id +"')\" href='javascript:;'>删除</a>&nbsp;" +
                                    "<a class='edt' onClick=\"editRowPicture('"+ row.id +"')\"  href='javascript:;'>修改</a>";
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
                pageSize:2,
                pageList:[2,4,6,8],
            });

        })
        function delPicture(id) {
            $.messager.confirm("删除提示","您确认删除吗?",function (r) {
                if(r){
                    $.post('${pageContext.request.contextPath}/picture/delete',{"id":id},function (result) {

                        $.messager.show({
                            title:'我的消息',
                            msg:result,
                            timeout:300,
                            showType:'slide'
                        });
                        $pictureda.datagrid('reload');
                    },'JSON')
                }
            });
        }
        function editRowPicture(id) {
            console.log(id);
            $('#dgEditPicture').dialog({
                width:300,
                height:300,
                title:'图片信息展示',
                href:'${pageContext.request.contextPath}/back/picture/pictureEdit.jsp?id='+id,
                buttons:[{
                    text:'提交',
                    iconCls:'icon-save',
                    handler:sbmitPicture,
                },{
                    text:'取消',
                    iconCls:'icon-cancle',
                    handler:clePicture,
                }]
            });
        }
        function sbmitPicture() {
            $('#ffPicture').form('submit',{
                url:'${pageContext.request.contextPath}/picture/update' ,
                success:function () {
                    $('#dgEditPicture').dialog('close',true);
                    $pictureda.datagrid('reload');
                }
            });
        }
        function clePicture() {
            $('#dgEditPicture').dialog('close',true);
        }
        function addPicture() {
            $('#addPicture').dialog({
                width:300,
                height:300,
                title:'添加图片记录',
                href:'${pageContext.request.contextPath}/back/picture/pictureAdd.jsp',
                buttons:[{
                    text:'提交',
                    iconCls:'icon-save',
                    handler:sbmit1Picture,
                },{
                    text:'取消',
                    iconCls:'icon-cancle',
                    handler:cle1Picture,
                }]
            });
        }
        function sbmit1Picture() {
            $('#fPicture').form('submit',{
                url:'${pageContext.request.contextPath}/picture/save' ,
                success:function () {
                    $('#addPicture').dialog('close',true);
                    $pictureDa.datagrid('reload');
                }
            });
        }
        function cle1Picture() {
            $('#addPicture').dialog('close',true);
        }
    </script>

<div style="width: 100%;height: 80%">
    <div id="pictureda">
    </div>
</div>
<div id="dgEditPicture"></div>
<div id="addPicture"></div>