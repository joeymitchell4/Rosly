using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Rosly.Startup))]
namespace Rosly
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
