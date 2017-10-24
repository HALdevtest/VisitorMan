using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace VisitorMan
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Page1 : ContentPage
    {
        private CaptureSource _cs = null;

        public Page1()
        {
            InitializeComponent();
        }

        private void btnStartWebcam_Click(object sender, RoutedEventArgs e)
        {
            StartWebcam();
        }

        private void btnStopWebcam_Click(object sender, RoutedEventArgs e)
        {

        }

        void StartWebcam()
        {
            if (CaptureDeviceConfiguration.AllowedDeviceAccess || CaptureDeviceConfiguration.RequestDeviceAccess())
            {

            }
        }
    }
}
