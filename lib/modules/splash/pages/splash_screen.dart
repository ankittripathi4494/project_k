import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_k/global/helpers/network_helper.dart';
import 'package:project_k/global/utils/image_list.dart';

class SplashScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  SplashScreen({super.key, this.arguments});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // LifeCycle ->
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      redirectMethod();
    });
    super.initState();
  }

  Future<void> redirectMethod() async {
    bool networkConnected = await NetworkHelper.checkNetworkConnectivity();
    if (networkConnected == true) {
      Navigator.pushNamed(context, '/login', arguments: {'title': 'Login'});
    } else {
      Navigator.pushNamed(context, '/network-error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(ResourseList.logoSVGResource),
        ),
      ),
    );
  }
}
