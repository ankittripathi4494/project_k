import 'package:duration_button/duration_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_k/global/helpers/network_helper.dart';
import 'package:project_k/global/utils/image_list.dart';

class SplashScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  SplashScreen({super.key, this.arguments});

  Future<bool> data = NetworkHelper.checkNetworkConnectivity();
  Stream<User?> currentUser = FirebaseAuth.instance.authStateChanges();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: data,
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: currentUser,
          builder: (context, asyncSnapshot) {
            return PopScope(
              canPop: false,
              child: Scaffold(
                body: Center(
                  child: SvgPicture.asset(ResourseList.logoSVGResource),
                ),
                floatingActionButton: DurationButton(
                  onPressed: () {},
                  duration: Duration(seconds: 2),
                  onComplete: () {
                    if (snapshot.hasError) {
                      Navigator.pushNamed(context, '/network-error');
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data == true) {
                        if (asyncSnapshot.data == null) {
                          Navigator.pushNamed(
                            context,
                            '/login',
                            arguments: {'title': 'Login'},
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            '/dashboard',
                            arguments: {'title': 'Dashboard Screen'},
                          );
                        }
                      } else {
                        Navigator.pushNamed(context, '/network-error');
                      }
                    }
                  },
                  child: SizedBox.shrink(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
