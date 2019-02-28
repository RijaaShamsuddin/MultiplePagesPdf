using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

using System.Text;

namespace WebApplication1
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPdf_Click(object sender, EventArgs e)
        {
            var hd3 = hdf3.Value;
            var hd1 = Session["hd1"].ToString();
            var hd2 = Session["hd2"].ToString();

            //byte[] a1 = Convert.FromBase64String(hd1);
            //byte[] a2 = Convert.FromBase64String(hd2);
            //byte[] a3 = Convert.FromBase64String(hd3);

            //byte[] rv = new byte[a1.Length + a2.Length + a3.Length];
            //System.Buffer.BlockCopy(a1, 0, rv, 0, a1.Length);
            //System.Buffer.BlockCopy(a2, 0, rv, a1.Length, a2.Length);
            //System.Buffer.BlockCopy(a3, 0, rv, a1.Length + a2.Length, a3.Length);            



            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=print.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            sw.Write("<img src=\"" + hd1 + "\" alt=\"\" />");

            //hw.AddAttribute(HtmlTextWriterAttribute.Src, hd1);
            //hw.AddAttribute(HtmlTextWriterAttribute.Alt, "");
            //hw.RenderBeginTag(HtmlTextWriterTag.Img);


            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 10f);
            HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            htmlParser.Parse(sr);
            pdfDoc.Close();

            Response.Write(pdfDoc);
            Response.End();


        }



        //private void GeneratePDF(string path, string fileName, bool download, params string[] text)
        //{
        //    var document = new Document();
        //    try
        //    {
        //        if (download)
        //        {
        //            PdfWriter.GetInstance(document, Response.OutputStream);
        //        }

        //        StringBuilder strB = new StringBuilder();
        //        foreach (var item in text)
        //        {
        //            strB.Append(item);
        //        }

        //        using(TextReader sReader = new StringReader(strB.ToString()))
        //        {
        //            List<IElement> list = HTMLWorker.ParseToList(sReader, new StyleSheet());

        //        }

        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //}
    }
}