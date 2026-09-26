<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<!DOCTYPE html>


<html>


<head runat="server">


<title>
CareTask Login
</title>


<link 
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">


<link 
href="Content/medical-style.css"
rel="stylesheet">


</head>



<body>



<form id="form1" runat="server">


<div class="login-page">



<div class="login-card">



<div class="login-title">

🏥 CareTask

</div>



<p class="text-center text-muted mb-4">

Hospital Task Management System

</p>




<label>

Username

</label>


<asp:TextBox

ID="txtUsername"

runat="server"

CssClass="form-control mb-3">

</asp:TextBox>




<label>

Password

</label>



<asp:TextBox

ID="txtPassword"

TextMode="Password"

runat="server"

CssClass="form-control mb-4">

</asp:TextBox>




<asp:Button

ID="btnLogin"

runat="server"

Text="Login"

CssClass="btn btn-primary w-100"

OnClick="btnLogin_Click"

/>



<br/><br/>



<asp:Label

ID="lblMessage"

runat="server"

ForeColor="Red">

</asp:Label>



</div>


</div>



</form>


</body>


</html>