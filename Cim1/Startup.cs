using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Cim1.Startup))]
namespace Cim1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
