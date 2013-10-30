<%@ page defaultCodec="HTML" %>
<%@page import="net.kaleidos.directmessagessample.User"%>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
</head>
<body>
    <h2>Hi, ${user.name}</h2>
    <img src="images/avatar/${user.picture}">
    <h2>Your conversations:</h2>
    <div>
        <g:each in="${messages}" var="entry">
            <div class="left" style="width:100%; height:100px;">
                <span class="left message-text">
                    <g:if test="${entry.fromId == user.id}">
                        <g:set var="userMessage" value="${User.get(entry.toId)}" />
                        You said:
                    </g:if>
                    <g:else>
                        <g:if test="${! entry.readed}">[NEW]&nbsp;</g:if>
                        <g:set var="userMessage" value="${User.get(entry.fromId)}" />
                        ${userMessage.name} said:
                    </g:else>
                    <br />
                    «${entry.text}»
                    <br />
                    <g:formatDate format="yyyy-MM-dd HH:mm" date="${entry.dateCreated}"/>
                </span>
                <span class="left"><img src="images/avatar/${userMessage.picture}"></span>
                <span class="left"><g:link mapping="conversation" params="[id:userMessage.id]"><img src="images/arrow.png" /></g:link></span>

            </div>
        </g:each>
    </div>


</body>
</html>
