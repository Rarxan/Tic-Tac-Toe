<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <link href="static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
    <title>Tic-Tac-Toe</title>
    <style>

        h1.animated-title {
            margin: 0 0 10px 0;
            font-size: 48px;
            letter-spacing: 4px;
            font-weight: 800;
            text-align: center;
            background: linear-gradient(90deg, #ff6b6b, #4dd0e1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
    </style>
</head>
<body>
<h1 class="color-title">Tic-Tac-Toe</h1>

<table>
    <tr>
        <td onclick="window.location='/logic?click=0'" class="<c:choose>
            <c:when test='${data.get(0) == Sign.CROSS}'>x</c:when>
            <c:when test='${data.get(0) == Sign.NOUGHT}'>o</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>">${data.get(0).getSign()}</td>
        <td onclick="window.location='/logic?click=1'" class="<c:choose>
            <c:when test='${data.get(1) == Sign.CROSS}'>x</c:when>
            <c:when test='${data.get(1) == Sign.NOUGHT}'>o</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>">${data.get(1).getSign()}</td>
        <td onclick="window.location='/logic?click=2'" class="<c:choose>
            <c:when test='${data.get(2) == Sign.CROSS}'>x</c:when>
            <c:when test='${data.get(2) == Sign.NOUGHT}'>o</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>">${data.get(2).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=3'" class="<c:choose>
            <c:when test='${data.get(3) == Sign.CROSS}'>x</c:when>
            <c:when test='${data.get(3) == Sign.NOUGHT}'>o</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>">${data.get(3).getSign()}</td>
        <td onclick="window.location='/logic?click=4'" class="<c:choose>
            <c:when test='${data.get(4) == Sign.CROSS}'>x</c:when>
            <c:when test='${data.get(4) == Sign.NOUGHT}'>o</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>">${data.get(4).getSign()}</td>
        <td onclick="window.location='/logic?click=5'" class="<c:choose>
            <c:when test='${data.get(5) == Sign.CROSS}'>x</c:when>
            <c:when test='${data.get(5) == Sign.NOUGHT}'>o</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>">${data.get(5).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=6'" class="<c:choose>
            <c:when test='${data.get(6) == Sign.CROSS}'>x</c:when>
            <c:when test='${data.get(6) == Sign.NOUGHT}'>o</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>">${data.get(6).getSign()}</td>
        <td onclick="window.location='/logic?click=7'" class="<c:choose>
            <c:when test='${data.get(7) == Sign.CROSS}'>x</c:when>
            <c:when test='${data.get(7) == Sign.NOUGHT}'>o</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>">${data.get(7).getSign()}</td>
        <td onclick="window.location='/logic?click=8'" class="<c:choose>
            <c:when test='${data.get(8) == Sign.CROSS}'>x</c:when>
            <c:when test='${data.get(8) == Sign.NOUGHT}'>o</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>">${data.get(8).getSign()}</td>
    </tr>
</table>

<hr>
<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

<c:if test="${winner == CROSSES}">
    <h1 class="message win-x">CROSSES WIN!</h1>
    <button class="restart" onclick="restart()">Start again</button>
</c:if>
<c:if test="${winner == NOUGHTS}">
    <h1 class="message win-o">NOUGHTS WIN!</h1>
    <button class="restart" onclick="restart()">Start again</button>
</c:if>
<c:if test="${draw}">
    <h1 class="message draw">IT'S A DRAW</h1>
    <button class="restart" onclick="restart()">Start again</button>
</c:if>

<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>

</body>
</html>
