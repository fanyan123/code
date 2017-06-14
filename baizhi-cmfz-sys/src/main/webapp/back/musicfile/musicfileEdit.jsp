
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/musicfile/queryById',{"id":"${param.id}"},function (musicfile) {
            $('#idMusicfile').val(musicfile.id);
            $('#nameMusicfile').textbox({
                value:musicfile.name,
            });
            $('#titleMusicfile').textbox({
                value:musicfile.title,
            });
            $('#sizeMusicfile').textbox({
                value:musicfile.size,
            });
            $.post("${pageContext.request.contextPath}/music/queryAll1",function(music1){
                $.each(music1,function (i,music) {
                    var $option = $('<option></option>');
                    $option.prop("value",music.id).prop("text",music.title);
                    if(musicfile.music.id==music.id){
                        $option.prop("selected",true) ;
                    }
                    $('#musicfile_sel').append($option);
                });
                $('#musicfile_sel').combobox({
                    width:175,
                    required:true,
                    multiple:false,
                })
            },"JSON");
        },'JSON');

    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ffMusicfile">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="idMusicfile" name="id"></div>
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="nameMusicfile" name="name"></div>
        <div style="margin-top: 30px">标题：<input class="easyui-textbox" data-options="required:true" id="titleMusicfile" name="title" ></div>
        <div style="margin-top: 30px">文件大小：<input class="easyui-textbox" data-options="required:true" id="sizeMusicfile" name="size" readonly="readonly"></div>
        <div style="margin-top: 30px">所属专辑：<select id="musicfile_sel" name="music.id"></select></div>
    </form>
</div>
