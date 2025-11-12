import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_k/global/helpers/image_resource_helper.dart';
import 'package:project_k/global/helpers/network_helper.dart';
import 'package:project_k/global/widgets/automatic_button_widget.dart';
import 'package:project_k/global/widgets/custom_ui_button_widget.dart';
import 'package:project_k/global/widgets/elevated_button_widget.dart';
import 'package:project_k/global/widgets/filled_button_widget.dart';
import 'package:project_k/global/widgets/outlined_button_widget.dart';
import 'package:project_k/global/widgets/text_button_widget.dart';

class NetworkErrorScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  NetworkErrorScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Center(
            child: SvgPicture.asset(ImageResourseHelper.networkSVGResource),
          ),
          persistentFooterAlignment: AlignmentDirectional.bottomCenter,
          persistentFooterButtons: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AutomaticButtonWidget(
                    taskWaitDuration: Duration(seconds: 5),
                    //  icon: Icon(Icons.network_check),
                    task: () async {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("hello")));
                    },
                    
                  ),
                  CustomUiButtonWidget(
                    buttonText: "Custom UI Button",
                    //  icon: Icon(Icons.network_check),
                    onPressed: () async {
                      bool networkConnected =
                          await NetworkHelper.checkNetworkConnectivity();
                      if (networkConnected == true) {
                        Navigator.pushNamed(context, '/dashboard');
                      } else {
                        Navigator.pushNamed(context, '/network-error');
                      }
                    },
                  ),
                  TextButtonWidget(
                    buttonText: "Text Button",
                    //  icon: Icon(Icons.network_check),
                    onPressed: () async {
                      bool networkConnected =
                          await NetworkHelper.checkNetworkConnectivity();
                      if (networkConnected == true) {
                        Navigator.pushNamed(context, '/dashboard');
                      } else {
                        Navigator.pushNamed(context, '/network-error');
                      }
                    },
                  ),
                  ElevatedButtonWidget(
                    buttonText: "Elevated Button",
                    //  icon: Icon(Icons.network_check),
                    onPressed: () async {
                      bool networkConnected =
                          await NetworkHelper.checkNetworkConnectivity();
                      if (networkConnected == true) {
                        Navigator.pushNamed(context, '/dashboard');
                      } else {
                        Navigator.pushNamed(context, '/network-error');
                      }
                    },
                  ),
                  FilledButtonWidget(
                    buttonText: "Filled Button",
                    //  icon: Icon(Icons.network_check),
                    onPressed: () async {
                      bool networkConnected =
                          await NetworkHelper.checkNetworkConnectivity();
                      if (networkConnected == true) {
                        Navigator.pushNamed(context, '/dashboard');
                      } else {
                        Navigator.pushNamed(context, '/network-error');
                      }
                    },
                  ),
                  OutlinedButtonWidget(
                    buttonText: "Outlined Button",
                    //  icon: Icon(Icons.network_check),
                    onPressed: () async {
                      bool networkConnected =
                          await NetworkHelper.checkNetworkConnectivity();
                      if (networkConnected == true) {
                        Navigator.pushNamed(context, '/dashboard');
                      } else {
                        Navigator.pushNamed(context, '/network-error');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
