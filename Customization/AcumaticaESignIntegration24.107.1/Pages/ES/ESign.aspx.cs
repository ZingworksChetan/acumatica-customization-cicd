using System;
using System.Web;
using AcumaticaESign;
using PX.Data;

namespace AcumaticaESign.Pages
{
    public partial class ESign : System.Web.UI.Page
    {
        public string error;

        protected void Page_Load(object sender, EventArgs e)
        {
            var code = Request.QueryString["code"];
            var state = Request.QueryString["state"];
            var apiAccess = Request.QueryString["api_access_point"];
            if (code != null && state != null)
            {
                HttpContext context = HttpContext.Current;
                var graph = PXGraph.CreateInstance<ESignAccountEntry>();

                var accountId = int.Parse(GetAccoundId(state));

                graph.RefreshCurrentSetup(accountId);
                
                // For OAuth v1, query string parameter api_access_point is saved with SetAdobeApiUrl method call
                // For OAuth v2, there is no query string parameter, access point is saved from CreateAccessToken body response
                if (!string.IsNullOrWhiteSpace(apiAccess))
                {
                    graph.SetAdobeApiUrl(apiAccess);
                }
                
                graph.GetAccessToken(code);

                // After OAuth handshake; display success message, refresh eSign accounts page in main frame and close adobe login popup.
                string redirectUrl = Request.GetWebsiteAuthority().GetLeftPart(UriPartial.Authority) + ResolveUrl("~/Pages/ES/ES301000.aspx");
                string successMessage = PXMessages.LocalizeNoPrefix(Messages.ConnectionSuccess);
                context.Response.Clear();
                context.Response.Write("<script>");
                context.Response.Write(string.Format("alert('{0}');", successMessage));
                context.Response.Write(string.Format("window.open('{0}','{1}');", redirectUrl, "main"));
                context.Response.Write("window.close();");
                context.Response.Write("</script>");
                context.Response.Cache.SetNoStore();
                context.Response.Cache.SetNoServerCaching();
                context.Response.End();
            }
            else if (Request.QueryString["error_description"] != null)
            {
                error = Request.QueryString["error_description"];
            }

        }

        private static string GetAccoundId(string state)
        {
            var charLocation = state.IndexOf("_", StringComparison.Ordinal);

            return charLocation > 0 ? state.Substring(0, charLocation) : string.Empty;
        }
    }
}