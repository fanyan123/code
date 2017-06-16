<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $('#fbTeacher').filebox({
            buttonText: '选择图片',
            buttonAlign: 'left',
            accept:'image/jpeg',
            width:170
        });
    })
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="fTeacher" enctype="multipart/form-data">
        <div style="margin-top: 20px">上师名<input class="easyui-textbox" data-options="required:true" name="name"></div>
        <div style="margin-top: 10px">头像<input id="fbTeacher" type="text" style="width:150px" name="aaa"></div>
    </form>
</div>
