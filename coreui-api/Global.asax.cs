using CoreuiApi.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using Telerik.Reporting.Services.WebApi;

namespace CoreuiApi
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            ReportsControllerConfiguration.RegisterRoutes(GlobalConfiguration.Configuration);         
            ModelBinders.Binders.DefaultBinder = new Csla.Web.Mvc.CslaModelBinder();
        }

        //protected void Application_BeginRequest(object sender, EventArgs e)
        //{
            
        //}

        //protected void Application_AuthenticateRequest(Object sender, EventArgs e)
        //{
           
        //}

        protected void Application_EndRequest(object sender, EventArgs eventArgs)
        {
            //handle json redirects due to forms ticket timeout
            var app = (HttpApplication)sender;
            var httpContext = new HttpContextWrapper(app.Context);
            if (httpContext.Response.StatusCode == 302 && httpContext.Request.IsAjaxRequest())
            {
                httpContext.Response.StatusCode = 401;
                //TODO: produce json result
            }
        }
    }
}
