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

tbody tr:not(:first-child){
}
/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 12%;
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
  width: 85%;
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

#customers {
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
  font-size: 14px;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
  font-size: 14px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #139DC9;
  color: white;
}
.button {
  background-color: #139DC9; /* Green */
  border: none;
  color: white;
  padding: 15px;
  width: 130px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
  font-size: 16px;
  margin: 3px 2px;
  cursor: pointer;
}

.button2 {border-radius: 4px;}
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

    <div class="row">
        <div class="col-md-10">
            <h2>${msg("applicationsHtmlTitle")}</h2>
        </div>
    </div>

    <form action="${url.applicationsUrl}" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <input type="hidden" id="referrer" name="referrer" value="${stateChecker}">

        <table id="customers">
            <thead>
              <tr>
                <th>${msg("application")}</th>
                <th>${msg("availableRoles")}</th>
                <th>${msg("grantedPermissions")}</th>
                <th>${msg("additionalGrants")}</th>
                <th>${msg("action")}</th>
              </tr>
            </thead>

            <tbody>
              <#list applications.applications as application>
              
              <#if !application.effectiveUrl?has_content>
                <tr>
                    <td>
                        <#if application.effectiveUrl?has_content><a href="${application.effectiveUrl}"></#if>
                            <#if application.client.name?has_content>${advancedMsg(application.client.name)}<#else>${application.client.clientId}</#if>
                        <#if application.effectiveUrl?has_content></a></#if>
                    </td>

                    <td>
                        <#list application.realmRolesAvailable as role>
                            <#if role.description??>${advancedMsg(role.description)}<#else>${advancedMsg(role.name)}</#if>
                            <#if role_has_next>, </#if>
                        </#list>
                        <#list application.resourceRolesAvailable?keys as resource>
                            <#if application.realmRolesAvailable?has_content>, </#if>
                            <#list application.resourceRolesAvailable[resource] as clientRole>
                                <#if clientRole.roleDescription??>${advancedMsg(clientRole.roleDescription)}<#else>${advancedMsg(clientRole.roleName)}</#if>
                                ${msg("inResource")} <strong><#if clientRole.clientName??>${advancedMsg(clientRole.clientName)}<#else>${clientRole.clientId}</#if></strong>
                                <#if clientRole_has_next>, </#if>
                            </#list>
                        </#list>
                    </td>

                    <td>
                        <#if application.client.consentRequired>
                            <#list application.clientScopesGranted as claim>
                                ${advancedMsg(claim)}<#if claim_has_next>, </#if>
                            </#list>
                        <#else>
                            <strong>${msg("fullAccess")}</strong>
                        </#if>
                    </td>

                    <td>
                       <#list application.additionalGrants as grant>
                            ${advancedMsg(grant)}<#if grant_has_next>, </#if>
                        </#list>
                    </td>

                    <td>
                        <#if (application.client.consentRequired && application.clientScopesGranted?has_content) || application.additionalGrants?has_content>
                            <button type='submit' class='${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} button button2' id='revoke-${application.client.clientId}' name='clientId' value="${application.client.id}" style="color: white;background-color:#139DC9;">${msg("revoke")}</button>
                        </#if>
                    </td>
                </tr>

                </#if>
              </#list>
            </tbody>
        </table>
    </form>

</article>