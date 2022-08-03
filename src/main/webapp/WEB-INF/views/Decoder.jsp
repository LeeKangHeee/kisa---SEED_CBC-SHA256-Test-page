<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<form name="Form" action="/DecTest/action">
    <table>
        <tr>
            <td>암호문</td>
            <td><input type="text" name="enc" value="${enc}" style="width:400px;height:100px;font-size:15px;"/></td>
        </tr>
        <tr>
            <td>평문</td>
            <td><input type="text" name="plain" value="${plain}" style="width:400px;height:100px;font-size:15px;"/></td>
        </tr>
    </table>
    <input type="submit" value="복호화" />
    <a href="/">홈으로</a>
</form>
</body>
</html>
