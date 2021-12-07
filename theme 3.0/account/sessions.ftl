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
  <label  style="margin-left:78%; font-size:14px">Sign out</label>
  </h2>
</header>
<section>
  <nav>
    <ul>
      <li><a href="${url.accountUrl}">Account</a></li>
      <li><a href="${url.totpUrl}">Authenticator</a></li>
      <li><a href="${url.sessionsUrl}">Sessions</a></li>
      <li><a href="${url.applicationsUrl}">Applications</a></li>
            <li><a href="#">MyResources</a></li>
    </ul>
  </nav>
  <article>

    <div class="row">
        <div class="col-md-10">
            <h2>${msg("sessionsHtmlTitle")}</h2>
        </div>
    </div>

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <td>${msg("ip")}</td>
            <td>${msg("started")}</td>
            <td>${msg("lastAccess")}</td>
            <td>${msg("expires")}</td>
            <td>${msg("clients")}</td>
        </tr>
        </thead>

        <tbody>
        <#list sessions.sessions as session>
            <tr>
                <td>${session.ipAddress}</td>
                <td>${session.started?datetime}</td>
                <td>${session.lastAccess?datetime}</td>
                <td>${session.expires?datetime}</td>
                <td>
                    <#list session.clients as client>
                        ${client}<br/>
                    </#list>
                </td>
            </tr>
        </#list>
        </tbody>

    </table>

    <form action="${url.sessionsUrl}" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <button id="logout-all-sessions" class="btn btn-default">${msg("doLogOutAllSessions")}</button>
    </form>
</article>

