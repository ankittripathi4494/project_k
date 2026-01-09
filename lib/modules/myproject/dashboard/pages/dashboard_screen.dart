import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:logger/logger.dart';
import 'package:project_k/global/helpers/location_helper.dart';
import 'package:project_k/global/helpers/log_helper.dart';
import 'package:project_k/global/helpers/secure_session_helper.dart';
import 'package:project_k/global/widgets/appbar_widget.dart';
import 'package:project_k/global/widgets/custom_bottom_navigation_bar_widget.dart';
import 'package:project_k/global/widgets/drawer_widget.dart';

class DashboardScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  DashboardScreen({super.key, this.arguments});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    requestNotificationPermisssion();
    super.initState();
  }

  requestNotificationPermisssion() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return 'Granted';
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      return 'Provisional';
    } else {
      return 'Denied';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar.appBarWidgetV1(
        titleText: "Dashboard Screen",

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              SecureSessionHelper().removeAll();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      drawer: DrawerWidget.getDrawer(context),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(title: Text("Item $index"));
        },
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBarWidget(selectedIndex: 0),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Text("Button 1"),
        ),
        ElevatedButton(
          onPressed: () {
            LocationHandler.getCurrentPosition().then((c) {
              Logger().d(
                "Current Postion is \n Latitude:- ${c?.latitude}, Longitude:- ${c?.longitude}",
              );
              showCupertinoModalPopup(
                context: context,
                builder: (context) => FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(
                      c?.latitude ?? 0,
                      c?.longitude ?? 0,
                    ), // Center the map over London, UK
                    initialZoom: 20,
                  ),
                  children: [
                    TileLayer(
                      // Bring your own tiles
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                      userAgentPackageName:
                          "com.cromac.project_k", // Add your app identifier
                      // And many more recommended properties!
                    ),
                  ],
                ),
              );
            });
          },
          child: Text("Button 2"),
        ),
      ],
    );
  }
}
