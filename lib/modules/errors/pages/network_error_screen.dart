import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_k/global/helpers/image_resource_helper.dart';
import 'package:project_k/global/helpers/network_helper.dart';
import 'package:project_k/global/widgets/elevated_button_widget.dart';

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
            ElevatedButtonWidget(
              buttonText: "Check Internet",
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
    );
  }
}
