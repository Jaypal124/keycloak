<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>


    <#elseif section = "form">
        <div style="margin-right=100px" >
            <center><img class="logo" src="${url.resourcesPath}/img/Hipaas.jpg" alt="Alfresco" height="60px"; ></center>
        </div>
        <div class="box-container">

        <#if realm.password>
            <div>
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                    <input id="username" class="login-field" placeholder="${msg("username")}" type="text" name="username" tabindex="1">
                    <div>
                        <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                    </div>
                <input id="password" class="login-field" placeholder="${msg("password")}" type="password" name="password" tabindex="2">
                <input class="submit" type="submit" value="${msg("doLogIn")}" tabindex="3" style="background-color: #139DC9; color: white;border-color:#139DC9;">
                </form>
            </div>
        </#if>
        <#if social.providers??>
            <p class="para">${msg("selectAlternative")}</p>
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}" style="background-color: #139DC9; color: white;border-color:#139DC9;"/>
                </#list>
            </div>
        </#if>
	
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                   <span class="para">${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    
        <div
            <p class="copyright" style="color:white;margin-right:60px; font-size:15px; font-weight:">© 2021 HiPaaS Software, Inc. All rights reserved.</p>
        </div>
    </#if>

    
</@layout.registrationLayout>
