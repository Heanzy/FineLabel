//#include "VGG16_bridge.h"
////#include <caffe/caffe.hpp>
////#include <iostream>
////#include <opencv2/core/core.hpp>
////#include <opencv2/highgui/highgui.hpp>
//#include <opencv2/imgproc/imgproc.hpp>
////#include <caffe/net.hpp>
////#include <algorithm>
////#include <iosfwd>
////#include <iomanip>
////#include <memory>
////#include <string>
////#include <utility>
////#include <vector>


//using namespace caffe;
//using std::string;
//using namespace std;


//VGG16::VGG16(const string& model_file, const string& trained_file) {

//  Caffe::set_mode(Caffe::GPU);

//  /* Load the network. */
//  net_.reset(new Net<float>(model_file, TEST));
//  net_->CopyTrainedLayersFrom(trained_file);

//  CHECK_EQ(net_->num_inputs(), 1) << "Network should have exactly one input.";
//  CHECK_EQ(net_->num_outputs(), 1) << "Network should have exactly one output.";

//  Blob<float>* input_layer_a = net_->input_blobs()[0];

//  num_channels_ = input_layer_a->channels();
//  CHECK(num_channels_ == 3 || num_channels_ == 1)
//    << "Input layer should have 1 or 3 channels.";
//  input_geometry_ = cv::Size(input_layer_a->width(), input_layer_a->height());

// }

//std::vector<float> VGG16::featureComputation(const cv::Mat& img) {
//  Blob<float>* input_layer = net_->input_blobs()[0];
//  input_layer->Reshape(1, num_channels_,input_geometry_.height, input_geometry_.width);

//  /* Forward dimension change to all layers. */
//  net_->Reshape();

//  std::vector<cv::Mat> input_channels;
//  WrapInputLayer(&input_channels);

//  Preprocess(img, &input_channels);

//  net_->ForwardPrefilled();

//  /* Copy the output layer to a std::vector */
//  Blob<float>* output_layer = net_->output_blobs()[0];
//  const float* begin = output_layer->cpu_data();
//  const float* end = begin + output_layer->channels();
//  return std::vector<float>(begin, end);
//}


//void VGG16::WrapInputLayer(std::vector<cv::Mat>* input_channels) {
//  Blob<float>* input_layer = net_->input_blobs()[0];

//  int width = input_layer->width();
//  int height = input_layer->height();
//  float* input_data = input_layer->mutable_cpu_data();
//  for (int i = 0; i < input_layer->channels(); ++i) {
//    cv::Mat channel(height, width, CV_32FC1, input_data);
//    input_channels->push_back(channel);
//    input_data += width * height;
//  }
//}


//void VGG16::Preprocess(const cv::Mat& img, std::vector<cv::Mat>* input_channels) {

//  /* Convert the input image to the input image format of the network. */
//  cv::Mat sample;
//  if (img.channels() == 3 && num_channels_ == 1)
//    cv::cvtColor(img, sample, cv::COLOR_BGR2GRAY);
//  else if (img.channels() == 4 && num_channels_ == 1)
//    cv::cvtColor(img, sample, cv::COLOR_BGRA2GRAY);
//  else if (img.channels() == 4 && num_channels_ == 3)
//    cv::cvtColor(img, sample, cv::COLOR_BGRA2BGR);
//  else if (img.channels() == 1 && num_channels_ == 3)
//    cv::cvtColor(img, sample, cv::COLOR_GRAY2BGR);
//  else
//    sample = img;


//  cv::Mat sample_resized;
//  if (sample.size() != input_geometry_)
//    cv::resize(sample, sample_resized, input_geometry_);
//  else
//    sample_resized = sample;

//  cv::split(sample_resized, *input_channels);

//  CHECK(reinterpret_cast<float*>(input_channels->at(0).data)
//        == net_->input_blobs()[0]->cpu_data())
//    << "Input channels are not wrapping the input layer of the network.";
//}





