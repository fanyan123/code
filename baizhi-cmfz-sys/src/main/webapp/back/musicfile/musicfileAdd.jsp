<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $('#fbMusicfile').filebox({
            buttonText: '选择文件',
            buttonAlign: 'left',
            accept:"audio/mpeg",
            width:180,
        });


        $('#musicfile_sel').combobox({
            width:175,
            required:true,
            multiple:false,
            url:'${pageContext.request.contextPath}/music/queryAll1',
            valueField:'id',
            textField:'title',
            value:'请选择'
        })
    });
</script>
<div style="text-align: center">
    <form method="post"  id="fMusicfile" enctype="multipart/form-data">
        <div style="margin-top: 20px"> 添加文件<input id="fbMusicfile" type="text" style="width:150px" name="aaa"></div>
        <div style="margin-top: 15px">标题名：<input class="easyui-textbox" data-options="required:true" name="title"></div>
        <div style="margin-top: 15px">所属专辑：<select id="musicfile_sel" name="music.id"></select></div>
    </form>
</div>
