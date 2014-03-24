<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script>
$(function(){
    $('table').on('mouseover', 'tr', function(){
        $(this).css({
            'background-color': '#DBE9FF'
        });
    }).on('mouseout', 'tr', function(){
        $(this).css({
            'background-color': '#FFFFFF'
        });
    }).on('click', 'td', function(){
        $(this).parent().children().css({
            'background-color': '#FFFFFF'
        });

        $(this).css({
            'background-color': '#7DAFFF'
        });
    });
});
</script>

    </head>
    <body><center>
<h1><i><font color="3399CC">Oracle Cloud Data Migration</font></i></h1></center>
<hr/>
<table border="1" width="1000">
<tr>
<td><a href="Select.jsp" target="body">Select</a></td>
<td><a href="upload.jsp" target="body">Upload</a></td>
<td><a href="reviewmapping.jsp" target="body">Review Mapping</a></td>
<td><a href="confirmation.jsp" target="body">Confirmation</a></td>
</tr>
</table>
<hr>

<table>

</table>
</body>
</html>