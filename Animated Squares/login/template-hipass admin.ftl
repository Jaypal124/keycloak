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
        .container {
            display: flex;
            flex-direction: row;
        }
        .left {
            width: 70%;
            background-color: #139DC9;
        }
        .right {
            background-color: white;
            width: 30%;
        }
    .Hipaas_logo {
    width: 300px;
    height: 100px;
    position: absolute;
    left: 50%;
    margin-top: 50%;
    margin-left: -150px;}
    
    .para{
  
    position: sticky;
    left: 5%;
    text-align: center;
    color: white;
}
    </style>
   
    
</head>

	<body>
        <#nested "header">

         <div class="container">
        <div class="login-content left">
         <center><img class="HiPaaS_logo" src="${url.resourcesPath}/img/HiPaaS_logo.png" alt="Alfresco" style="height:100px; width:300px;"></center>
         <p class="para">HiPaaS is a HIPAA compliant microservices-based Healthcare cloud platform to enable EHR integration, resolve interoperability issues, <br />
            simplify healthcare standards and aggregate healthcare data
        </p>
         </div>
        <div class="login-content right">
            

            <div class="box" style="margin-top:30%">
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
        </div> 
	</body>
</html>
</#macro>
