import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:project_k/global/helpers/network_helper.dart';
import 'package:project_k/global/utils/image_list.dart';
import 'package:project_k/global/widgets/background_widget.dart';
import 'package:project_k/global/widgets/my_custom_app_bar.dart';
import 'package:project_k/modules/myproject/auth/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  LoginScreen({super.key, this.arguments});

  final ValueNotifier<BannerAd?> _bannerAd = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: NetworkHelper.checkNetworkConnectivity(),
      builder: (context, snapshot) {
        return FutureBuilder(
          future: _loadAd(),
          builder: (context, asyncSnapshot) {
            return BackgroundWidget(
              image: DecorationImage(
                image: AssetImage(ResourseList.backgroundImageResource),
                fit: BoxFit.cover,
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: MyCustomAppBar(
                  automaticallyImplyLeading: false,
                  titleText:
                      (arguments != null && arguments!.containsKey('title'))
                      ? arguments!['title']
                      : "Login",
                ),
                body: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: BackgroundWidget(
                      colors: [Color(0x99EEAECA), Color(0x9994BBE9)],
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      child: SizedBox(width: 1.sw, child: LoginFormWidget()),
                    ),
                  ),
                ),
                // bottomNavigationBar: ValueListenableBuilder(
                //   valueListenable: _bannerAd,
                //   builder: (_, bannerAdValue, child) {
                //     if (bannerAdValue != null) {
                //       return Align(
                //         alignment: Alignment.bottomCenter,
                //         child: SafeArea(
                //           child: SizedBox(
                //             width: bannerAdValue.size.width.toDouble(),
                //             height: bannerAdValue.size.height.toDouble(),
                //             child: AdWidget(ad: bannerAdValue),
                //           ),
                //         ),
                //       );
                //     }
                //     return SizedBox.fromSize();
                //   },
                // ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _loadAd() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      1.sw.truncate(),
    );

    if (size == null) {
      // Unable to get width of anchored banner.
      return;
    }
    String adUnitIdValue = dotenv.get('BANNER_AD_UNIT_ID');
    BannerAd(
      adUnitId: adUnitIdValue,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          // Called when an ad is successfully received.
          debugPrint("Ad was loaded.");
          _bannerAd.value = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          // Called when an ad request failed.
          debugPrint("Ad failed to load with error: $err");
          ad.dispose();
        },
      ),
    ).load();
  }
}
