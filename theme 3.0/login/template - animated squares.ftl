<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title><#nested "title"></title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>

<style>
/* ----------------------------------------------------------------------------------------------- */
@keyframes animate {
    0%{
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
    }
    100%{
        transform: translateY(-1000px) rotate(720deg);
        opacity: 0;
        border-radius: 50%;
    }
}

.background {
    position: fixed;
    width: 100vw;
    height: 100vh;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    background: #525aff;
    overflow: hidden;
}
.background li {
    position: absolute;
    display: block;
    list-style: none;
    width: 20px;
    height: 20px;
    background: rgba(255, 255, 255, 0.2);
    animation: animate 9s linear infinite;
}




.background li:nth-child(0) {
    left: 36%;
    width: 220px;
    height: 220px;
    bottom: -220px;
    animation-delay: 1s;
}
.background li:nth-child(1) {
    left: 36%;
    width: 215px;
    height: 215px;
    bottom: -215px;
    animation-delay: 2s;
}
.background li:nth-child(2) {
    left: 84%;
    width: 202px;
    height: 202px;
    bottom: -202px;
    animation-delay: 6s;
}
.background li:nth-child(3) {
    left: 8%;
    width: 152px;
    height: 152px;
    bottom: -152px;
    animation-delay: 15s;
}
.background li:nth-child(4) {
    left: 63%;
    width: 228px;
    height: 228px;
    bottom: -228px;
    animation-delay: 18s;
}
.background li:nth-child(5) {
    left: 10%;
    width: 216px;
    height: 216px;
    bottom: -216px;
    animation-delay: 13s;
}
.background li:nth-child(6) {
    left: 17%;
    width: 188px;
    height: 188px;
    bottom: -188px;
    animation-delay: 17s;
}
.background li:nth-child(7) {
    left: 87%;
    width: 174px;
    height: 174px;
    bottom: -174px;
    animation-delay: 9s;
}
.background li:nth-child(8) {
    left: 12%;
    width: 175px;
    height: 175px;
    bottom: -175px;
    animation-delay: 2s;
}
.background li:nth-child(9) {
    left: 70%;
    width: 198px;
    height: 198px;
    bottom: -198px;
    animation-delay: 33s;
}
.background li:nth-child(10) {
    left: 31%;
    width: 211px;
    height: 211px;
    bottom: -211px;
    animation-delay: 39s;
}
</style>


</head>

	<body>
        <#nested "header">
<ul class="background">
   <li></li>
   <li></li>
   <li></li>
   <li></li>
   <li></li>
   <li></li>
   <li></li>
   <li></li>
   <li></li>
   <li></li>
   <li></li>


        <div class="login-content" style="background:#139DC9;">

            <div class="box">
        <#if displayMessage && message?has_content>
        <div class="alert alert-${message.type}">
             <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
             <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
             <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
             <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
             <span class="message-text">${message.summary?no_esc}</span>
        </div>
        </#if>
        <#nested "form">
            </div> 
        </div>
        </ul>
	</body>
</html>
</#macro>
