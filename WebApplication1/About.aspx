<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="container">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
        </div>
    <asp:HiddenField ID="hdf2" runat="server" Value=""/>
    <asp:Button OnClick="Unnamed_Click" ID="Unnamed" Text="Next" runat="server"  OnClientClick=" return generateMap(this)"  />

    <script type="text/javascript">
   
    function generateMap(btn) {
        
        var done = false;
        var success = false;

        html2canvas(document.querySelector('#container')).then(canvas => {
                      debugger  
            var png = canvas.toDataURL('image/jpeg');
            document.querySelector('#<%= hdf2.ClientID %>').value = png;

            done = true;
            success = true;
            
        });

        var v = setInterval(function () {
            if (done) {
                clearInterval(v);
                if (success) {                    
                    __doPostBack(btn.name, "");
                } else {
                    console.log('error');
                }
            }
        }, 1000)


        return false;
    }
</script>
</asp:Content>
