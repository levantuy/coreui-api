using CoreuiApi.Security;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Security;

namespace CoreuiApi.Filters
{
    public class AddChallengeOnUnauthorizedResult : IHttpActionResult
    {
        public AddChallengeOnUnauthorizedResult(AuthenticationHeaderValue challenge, IHttpActionResult innerResult)
        {
            Challenge = challenge;
            InnerResult = innerResult;
        }

        public AuthenticationHeaderValue Challenge { get; }

        public IHttpActionResult InnerResult { get; }

        public async Task<HttpResponseMessage> ExecuteAsync(CancellationToken cancellationToken)
        {
            if (Csla.ApplicationContext.User != null && Csla.ApplicationContext.User.Identity.IsAuthenticated)
            {
                var cache = MemoryCacher.GetValue(Csla.ApplicationContext.User.Identity.Name);
                if(cache.IsSuccess)
                {
                    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(cache.Respone.ToString());
                    FormsIdentity id = new FormsIdentity(ticket);
                    Csla.ApplicationContext.User = new CoreuiApi.Security.Principal(id.Name, id.Ticket.UserData);
                }                
            }

            HttpResponseMessage response = await InnerResult.ExecuteAsync(cancellationToken); 

            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                // Only add one challenge per authentication scheme.
                if (response.Headers.WwwAuthenticate.All(h => h.Scheme != Challenge.Scheme))
                {
                    response.Headers.WwwAuthenticate.Add(Challenge);
                    response.Content = new StringContent("{\"StatusCode\":401, \"error\":\"Token không hợp lệ\"}", System.Text.Encoding.UTF8, "application/json");
                }
            } 

            return response;
        }
    }
}