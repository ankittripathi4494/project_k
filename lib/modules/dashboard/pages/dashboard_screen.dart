import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_k/global/helpers/secure_session_helper.dart';
import 'package:project_k/global/widgets/appbar_widget.dart';
import 'package:project_k/global/widgets/custom_bottom_navigation_bar_widget.dart';
import 'package:project_k/global/widgets/drawer_widget.dart';

class DashboardScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  DashboardScreen({super.key, this.arguments});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
        ElevatedButton(onPressed: () {}, child: Text("Button 2")),
      ],
    );
  }
}
