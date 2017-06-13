<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
       $.post("${pageContext.request.contextPath}/province/queryAll1",function(result){
           $.each(result,function (i,province) {
               var $option = $('<option></option>');
               $option.prop("value",province.id).prop("text",province.name);
               $('#province').append($option);
           });

       });


    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ff">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="id" name="id" ></div>
        <div style="margin-top: 30px">市名：<input class="easyui-textbox" data-options="required:true" name="name"></div>
        <div style="margin-top: 30px">所属省：<select id="province"></select></div>
    </form>
</div>
