<head>
<title>Keycloak Account Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}
/* Style the header */
header {
  background-color: #139DC9;
  padding: 8px;
  text-align: center;
  font-size: 12px;
  color: white;
}
/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 20%;
   /* only for demonstration, should be removed */
  background: #FFFFFF;
  padding: 20px;
}
/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}
article {
  float: left;
  padding: 20px;
  width: 75%;
  height: 300px; /* only for demonstration, should be removed */
}
/* Clear floats after the columns */
section::after {
  content: "";
  display: table;
  clear: both;
}
/* Style the footer */
footer {
  background-color: #777;
  padding: 1px;
  text-align: center;
  color: white;
  height:35px
}
li{
padding-top:5px;
font-size:17px
}
/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}



</style>
</head>
<body style="margin: 0px;">
<header>
  <h2 style=" margin: 0px;">
  <img class="logo" style="margin-right: 100px;margin-top:5px;" src="${url.resourcesPath}/img/Hipaas.jpg" alt="Alfresco" height="30px"; >
  <label><a href="${url.logoutUrl}"  style="margin-left:78%; font-size:14px; color:white ">${msg("doSignOut")}</a></label>
  </h2>
</header>
<section>
  <nav>
    <ul>
      <li><a href="${url.applicationsUrl}">Applications</a></li>
            
    </ul>
  </nav>
  
  <article>
  <#import "template.ftl" as layout>
  <@layout.mainLayout active='account' bodyClass='user'; section>
    <div class="row">
        <div class="col-md-10">
            <h2>${msg("editAccountHtmlTitle")}</h2>
        </div>
        <div class="col-md-2 subtitle">
            <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
        </div>
    </div>

    <form action="${url.accountUrl}" class="form-horizontal" method="post">

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#if !realm.registrationEmailAsUsername>
            <div class="form-group ${messagesPerField.printIfExists('username','has-error')}">
                <div class="col-sm-2 col-md-2">
                    <label for="username" class="control-label">${msg("username")}</label> <#if realm.editUsernameAllowed><span class="required">*</span></#if>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
                </div>
            </div>
        </#if>

        <div class="form-group ${messagesPerField.printIfExists('email','has-error')}">
            <div class="col-sm-2 col-md-2">
            <label for="email" class="control-label">${msg("email")}</label> <span class="required">*</span>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="email" name="email" autofocus value="${(account.email!'')}"/>
            </div>
        </div>

        <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="firstName" class="control-label">${msg("firstName")}</label> <span class="required">*</span>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="firstName" name="firstName" value="${(account.firstName!'')}"/>
            </div>
        </div>

        <div class="form-group ${messagesPerField.printIfExists('lastName','has-error')}">
            <div class="col-sm-2 col-md-2">
                <label for="lastName" class="control-label">${msg("lastName")}</label> <span class="required">*</span>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="lastName" name="lastName" value="${(account.lastName!'')}"/>
            </div>
        </div>

        <div class="form-group">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} registerbtn" name="submitAction" value="Save" >${msg("doSave")}</button>
                    <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} registerbtn" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                </div>
            </div>
        </div>

    </form>
    </@layout.mainLayout>
  </article>
  
</section>
</body>