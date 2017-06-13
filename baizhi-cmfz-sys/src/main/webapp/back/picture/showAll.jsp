<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

 <script type="text/javascript">
        $(function(){
            $pictureda = $('#pictureda');
            $pictureda.datagrid({
                url:'${pageContext.request.contextPath}/picture/queryAll',
                fit:true,
                fitColumns:true,
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
                pageSize:2,
                pageList:[2,4,6,8],
            });
            $('#fb').filebox({
                buttonText: '选择文件',
                buttonAlign: 'left'
            });
            $('#picff').form({
                novalidate:true,
                success:function(data){
                    console.log(data);
                    $.messager.show({
                        title:'通知消息',
                        msg:data,
                        timeout:300,
                        showType:'slide'
                    });
                    $pictureda.datagrid('reload');
                },
            });
        });

        function del(id) {
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
        function editRow(id) {
            console.log(id);
            $('#dgEdit').dialog({
                width:300,
                height:300,
                title:'图片信息展示',
                href:'${pageContext.request.contextPath}/back/picture/pictureEdit.jsp?id='+id,
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
                url:'${pageContext.request.contextPath}/picture/update' ,
                success:function () {
                    $('#dgEdit').dialog('close',true);
                    $pictureda.datagrid('reload');
                }
            });
        }

        function cle() {
            $('#dgEdit').dialog('close',true);
        }

    </script>
    <form id="picff"  action="${pageContext.request.contextPath}/picture/upload" method="post" enctype="multipart/form-data">
         添加图片<input id="fb" type="text" style="width:150px" name="aaa">
         图片介绍<input class="easyui-textbox" name="title" /><br/>
         是否展示<input type="radio" checked="checked" name="type" value="1">是<input type="radio"  name="type" value="0">否<br/>
        <input type="submit" value="添加" >
    </form>
<div style="width: 100%;height: 80%">
    <div id="pictureda">
    </div>
</div>
<div id="dgEdit"></div>