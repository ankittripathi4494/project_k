import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:project_k/firebase_options.dart';
import 'package:project_k/global/helpers/firebase_bootstraper.dart';
import 'package:project_k/global/helpers/secure_session_helper.dart';
import 'package:project_k/my_project_application.dart';
import 'package:project_k/my_voipcall_application.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // SessionHelper().init();
  SecureSessionHelper().init();
  MobileAds.instance.initialize();
  notificationService.init();
  try {
    await dotenv.load(fileName: "lib/.env");
  } catch (e) {
    print(e.toString());
  }

  print("Android :- ${dotenv.get('ANDROID_CLIENT_ID')}");
  FirebaseBootstraper.ensureInitialized();

  String voipOrProjectData = dotenv.get('VOIP_OR_PROJECT');
  if (voipOrProjectData.toLowerCase().trim() == 'voip'.toLowerCase().trim()) {
    runApp(MyVoipCallApplication()); //
  } else {
    runApp(MyProjectApplication()); //
  }
}
