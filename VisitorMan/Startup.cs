using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VisitorMan.Startup))]
namespace VisitorMan
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
           ConfigureAuth(app);
        }
    }
}
