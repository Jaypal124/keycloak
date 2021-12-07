<#import "template-grant.ftl" as layout>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<@layout.registrationLayout bodyClass="oauth"; section>



    <div class="container" style="margin-top:150px;" >
  
  

  <div role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content" style="height:300px; width:650px">
	  

    <#if section = "form">


        <div ><br>
            <center><h3>${msg("oauthGrantRequest")}</h3></center>
            <ul>
                <#if oauth.clientScopesRequested??>
                    <#list oauth.clientScopesRequested as clientScope>
                        <li >
                            <span>${advancedMsg(clientScope.consentScreenText)}</span>
                        </li>
                    </#list>
                </#if>
            </ul>
            <form class="form-actions" action="${url.oauthAction}" method="POST" style="margin-top:25px">
                <input type="hidden" name="code" value="${oauth.code}">
                <div >
                    <div id="kc-form-options">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                        </div>
                    </div>

                    <div id="kc-form-buttons" style="margin-left:25px; margin-top:20px">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            

                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} button" name="accept" id="kc-login" type="submit" value="${msg("doYes")}" tabindex="3" >
							<input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} button1" name="cancel" id="kc-cancel" type="submit" value="${msg("doNo")}"style="margin-left:10px"/>
                        </div>
                        <div style="margin-top:15px">
                        <p style="font-size:12px;">To Understand fully how HiPaaS will your data, please read the app's <a href="https://www.hipaas.com/">Privacy Policy</a> and <a href="https://www.hipaas.com/">Tearms and Conditions.</a></p>
                        </div>
                    </div>
                </div>
            </form>
        </div>
   </#if>
    </div>
    </div>
    </div>
    </div>

</@layout.registrationLayout>
