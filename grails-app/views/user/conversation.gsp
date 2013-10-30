<%@ page defaultCodec="HTML" %>
<%@page import="net.kaleidos.directmessagessample.User"%>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
</head>
<body>
    <div>
        <g:link mapping="index">Go back</g:link>
    </div>
    <h2>Hi, ${user.name}</h2>
    <img src="images/avatar/${user.picture}">
    <h2>Your messages with ${otherUser.name} <img src="images/avatar/${otherUser.picture}">:</h2>
    <div>
        <g:each in="${messages}" var="entry">
            <div class="left" style="width:100%; height:100px;">
                <g:if test="${entry.fromId == user.id}">
                    <span class="left"><img src="images/avatar/${user.picture}"></span>
                    <span class="left message-text">
                        <g:formatDate format="yyyy-MM-dd HH:mm" date="${entry.dateCreated}"/>
                        <br />
                        «${entry.text}»
                    </span>
                </g:if>
                <g:else>
                    <span class="left message-text">
                        <g:formatDate format="yyyy-MM-dd HH:mm" date="${entry.dateCreated}"/>
                        <br />
                        «${entry.text}»
                    </span>
                    <span class="left"><img src="images/avatar/${otherUser.picture}"></span>
                </g:else>
            </div>
        </g:each>
    </div>
    <div>
        <g:form mapping="sendMessage" method="post">
            Write a new message:
            <input type="text" name="text">
            <input type="hidden" name="id" value="${otherUser.id}" />
            <input type="submit" value="Send">
        </g:form>
    </div>


</body>
</html>
