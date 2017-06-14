
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/picture/queryById',{"id":"${param.id}"},function (result) {
            $('#idPicture').val(result.id);
            $('#namePicture').textbox({
                value:result.name,
            });
            $('#titlePicture').textbox({
                value:result.title,
            });
            if(result.type=='0'){
                $('#type1Picture').prop("checked",true);
            }else{
                $('#typePicture').prop("checked",true);
            }
        },'JSON');
    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ffPicture">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="idPicture" name="id"></div>
        <div style="margin-top: 30px">图片名：<input class="easyui-textbox" data-options="required:true" id="namePicture" name="name" readonly="readonly"></div>
        <div style="margin-top: 20px"> 图片标题：<input class="easyui-textbox" data-options="required:true" id="titlePicture" name="title"></div>
        <div style="margin-top: 20px"> 图片是否在前台展示：<input type="radio" id="typePicture" name="type" value="1">是<input type="radio" id="type1Picture" name="type" value="0">否</div>
    </form>
</div>
