<%@ Page Language="C#" %>

<%
    HttpFileCollection files = HttpContext.Current.Request.Files;

    for (int index = 0; index < files.Count; index++)
    {
        HttpPostedFile uploadfile = files[index];

        uploadfile.SaveAs(Server.MapPath(".") + "\\upload\\" + uploadfile.FileName);
    }

    HttpContext.Current.Response.Write("Upload successfully!");



%>