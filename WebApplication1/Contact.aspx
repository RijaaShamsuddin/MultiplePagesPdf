<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div id="container">
     <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
       </div>
    <asp:HiddenField ID="hdf3" runat="server" Value=""/>
    <asp:Button ID="btnPdf" runat="server" Text="Generate PDF"  OnClientClick="return generateMap(this)" />
        <script type="text/javascript">
   
    function generateMap(btn) {
                
        html2canvas(document.querySelector('#container')).then(canvas => {
                   
            debugger
            var img3 = canvas.toDataURL('image/jpeg');
            var img1 = '<% = Session["hd1"].ToString() %>'
            var img2 = '<% = Session["hd2"].ToString() %>'

            var doc = new jsPDF();
            
            //doc.addImage(img1, 'JPEG', 20, 20, doc.internal.pageSize.getWidth(), doc.internal.pageSize.getHeight());
            //doc.addPage('l', 'a6');
            //doc.addImage(img2, 'JPEG', 20, 20, doc.internal.pageSize.getWidth(), doc.internal.pageSize.getHeight());
            //doc.addPage('2', 'a6');
            //doc.addImage(img3, 'JPEG', 20, 20, doc.internal.pageSize.getWidth(), doc.internal.pageSize.getHeight());

            doc.addImage(img1, 'JPEG', 10, 10, 190, 130);
            doc.addPage('l', 'a4');
            doc.addImage(img2, 'JPEG', 25, 40, 250, 30);
            doc.addPage('l', 'a4');
            doc.addImage(img3, 'JPEG', 25, 40, 250, 40);

            doc.save('a4.pdf');                      
            
        });



        return false;
    }
</script>
</asp:Content>
