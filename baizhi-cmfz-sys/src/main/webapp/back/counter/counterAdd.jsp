<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function () {
        $('#addCounterRecord').combobox({
            width:175,
            required:true,
            multiple:false,
            url:'${pageContext.request.contextPath}/record/queryAll1',
            valueField:'id',
            textField:'name',
            value:'请选择'
        })
    })
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="fCounter">
        <div style="margin-top: 30px">计数器名：<input class="easyui-textbox" data-options="required:true" name="name"></div>
        <div style="margin-top: 30px">次数：<input class="easyui-textbox" data-options="required:true" name="count"></div>
        <div style="margin-top: 30px">记录：<select id="addCounterRecord" name="record.id"/></div>
    </form>
</div>
