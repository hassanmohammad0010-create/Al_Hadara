import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/CenterHomePage.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/center_info_page.dart';
import 'package:al_hadara/Hamed/view/pages/SharedPage/bookAppointmentPage.dart';
import 'package:al_hadara/View/App/Sick_Chat_Page.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CenterApp extends StatefulWidget {
  CenterApp({Key? key}) : super(key: key);
  String pageName = 'CenterApp';

  @override
  State<CenterApp> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<CenterApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        endDrawer: const CustomDrawer(),
        appBar: AppBar(
          title: Text(
            "Al Hadara".tr,
            style: const TextStyle(fontFamily: pacifico, fontSize: 28),
          ),
          backgroundColor: constColor,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: const Icon(Icons.business_outlined),
                text: "Center".tr,
              ),
              Tab(
                icon: const Icon(Icons.chat_bubble),
                text: "Appointment".tr,
              ),
              Tab(
                icon: const Icon(Icons.person),
                text: "Personal".tr,
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          CenterHomePage(),
          BookAppointmentPage(),
          CenterInfoPage()
        ]),
      ),
    );
  }
}
