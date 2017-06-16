
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/record/queryById',{"id":"${param.id}"},function (record) {
            $('#idRecord').val(record.id);
            $('#nameRecord').textbox({
                value:record.name,
            });
            if(record.user==null){
                $('#userRecord').textbox({
                    value:'无'
                })
            }else{
                $('#userRecord').textbox({
                    value:record.user.id
                })
            }
        },'JSON');
    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ffRecord">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="idRecord" name="id"></div>
        <div style="margin-top: 30px">功课名：<input class="easyui-textbox" data-options="required:true" name="name" id="nameRecord"></div>
        <div style="margin-top: 30px">所属用户的id：<input class="easyui-textbox" data-options="required:true" name="user.id" id="userRecord" readonly="readonly"></div>
    </form>
</div>
