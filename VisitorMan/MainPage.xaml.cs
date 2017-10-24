using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Effects;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Collections.ObjectModel;
using System.IO;
using System.Configuration;
using System.ServiceModel.DomainServices.Client;
using System.ComponentModel.DataAnnotations;
using ImageTools.Helpers;
using ImageTools.IO.Png;
using ImageTools.IO.Jpeg;
using ImageTools.Controls;

namespace VisitorMan
{
    public partial class MainPage : UserControl
    {
        ImageBrush ib;
        CaptureSource source;
        private WriteableBitmap _capimage;
        public WriteableBitmap CapturedImage
        {
            get 
            {              
                return _capimage; 
            }
            set { _capimage = value; }
        }

        public MainPage()
        {
            InitializeComponent();
        }

        void source_CaptureImageCompleted(object sender, CaptureImageCompletedEventArgs e)
        {
            ib.ImageSource = e.Result;
            CapturedImage = e.Result;                    
        }       

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.Filter = "PNG files (*.PNG)|*.png|All Files (*.*)|*.*";
            var enc = new PngEncoder();
            if ((bool)sfd.ShowDialog())
            {
                Stream stream = sfd.OpenFile();
                var image = Imager.ToImg(CapturedImage);
                enc.Encode(image, stream);
                stream.Close();
            }
        }

        private void btnActivate_Click(object sender, RoutedEventArgs e)
        {
            source = new CaptureSource();
            VideoCaptureDevice vcd = CaptureDeviceConfiguration.GetDefaultVideoCaptureDevice();
            source.VideoCaptureDevice = vcd;
            VideoBrush vb = new VideoBrush();
            ib = new ImageBrush();
            vb.SetSource(source);
            rectangle1.Fill = vb;
            rectangle2.Fill = ib;

            if (CaptureDeviceConfiguration.RequestDeviceAccess())
            {
                source.Start();
            }
        }

        private void btnFreeze_Click(object sender, RoutedEventArgs e)
        {
            source.CaptureImageCompleted += new EventHandler<CaptureImageCompletedEventArgs>(source_CaptureImageCompleted);
            source.CaptureImageAsync();
        }
    }
}
