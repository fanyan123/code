<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function () {
        $('#fbUser').filebox({
            buttonText: '选择图片',
            buttonAlign: 'left',
            accept:'image/jpeg',
            width:170
        });
        $('#UserAddProvince').combobox({
            width:175,
            required:true,
            multiple:false,
            url:'${pageContext.request.contextPath}/province/queryAll1',
            valueField:'id',
            textField:'name',
            value:'请选择'
        })
        $('#UserAddCity').combobox({
            width:175,
            required:true,
            multiple:false,
            url:'${pageContext.request.contextPath}/city/queryAll1',
            valueField:'id',
            textField:'name',
            value:'请选择'
        })
        $('#UserAddTeacher').combobox({
            width:175,
            required:true,
            multiple:false,
            url:'${pageContext.request.contextPath}/teacher/queryAll1',
            valueField:'id',
            textField:'name',
            value:'请选择'
        })
    })

</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="fUser" >
        <div style="margin-top: 10px">昵称：<input class="easyui-textbox" data-options="required:true" name="name"></div>
        <div style="margin-top: 10px">密码：<input class="easyui-textbox" data-options="required:true" name="password"></div>
        <div style="margin-top: 10px">法名：<input class="easyui-textbox" data-options="required:true" name="legalname"></div>
        <div style="margin-top: 10px">电话：<input class="easyui-textbox" data-options="required:true" name="tel"></div>
        <div style="margin-top: 10px">性别：<input type="radio" name="sex" value="男" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女"/></div>
        <div style="margin-top: 10px">签名：<input class="easyui-textbox" data-options="required:true" name="signature"></div>
        <div style="margin-top: 10px">头像：<input id="fbUser" type="text" style="width:150px" name="aaa"></div>
        <div style="margin-top: 10px">所在省：<select id="UserAddProvince" name="province.id"/></div>
        <div style="margin-top: 10px">所在市：<select id="UserAddCity" name="city.id"/></div>
        <div style="margin-top: 10px">上师：<select id="UserAddTeacher" name="teacher.id"/></div>
    </form>
</div>
