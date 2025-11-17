import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_k/global/helpers/network_helper.dart';
import 'package:project_k/global/utils/image_list.dart';
import 'package:project_k/global/widgets/custom_ui_button_widget.dart';

class NetworkErrorScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;

  NetworkErrorScreen({super.key, this.arguments});
ValueNotifier<bool> isSelectedValue = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Center(
            child: SvgPicture.asset(ResourseList.networkSVGResource),
          ),
          persistentFooterAlignment: AlignmentDirectional.bottomCenter,
          persistentFooterButtons: [
            CustomUiButtonWidget(
              buttonText: "Custom UI Button",
              //  icon: Icon(Icons.network_check),
              onPressed: () async {
               await checkNetwork(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkNetwork(BuildContext context) async {
     bool networkConnected =
        await NetworkHelper.checkNetworkConnectivity();
    if (networkConnected == true) {
      Navigator.pushNamed(context, '/login');
    } else {
      Navigator.pushNamed(context, '/network-error');
    }
  }
}
