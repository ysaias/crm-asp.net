<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestMail.aspx.cs" Inherits="TestMail" %>

<!DOCTYPE html>

<html >
<head runat="server">
<meta charset= "utf-8">
    <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" > 
        <link href="../App_Themes/Default/A.bootstrap.min.css" type="text/css" rel="stylesheet" />
        <link href="../App_Themes/Default/B.style.css" type="text/css" rel="stylesheet" />
        <link href="../App_Themes/Default/css/fontawesome-all.min.css" type="text/css" rel="stylesheet" />
        <link href="../estilo/css/StyleActividad.css" rel="stylesheet"/>

</head>
<body>
    <form id="form1" runat="server" >
        <asp:Button ID="btn" runat="server" Text="Enviar" OnClick="btn_Click" />

         <asp:Button ID="btnDate" runat="server" value="enviar" Text="Fecha" OnClick="btn_ClickDate" />

            <div class="row">
                 <div class="col-md-6 themed-grid-col">
                      <div class="fecha">
                        <asp:TextBox ID="from_date" runat="server" placeholder="From" type="date" value="2019-12-01"
                            min="2018-01-01" max="2030-12-31"></asp:TextBox>
                      </div>
                      <div class="hora">
                        <asp:TextBox ID="from_time" type="time" name="hora" runat="server"
                            value="09:45:00" max="22:30:00" min="07:00:00" step="1"></asp:TextBox> 

                     </div>
                 </div>
                
            </div>


         
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />

     
	
      
	



    </form>

      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
