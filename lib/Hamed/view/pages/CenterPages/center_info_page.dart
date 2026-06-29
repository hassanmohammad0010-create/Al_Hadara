import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Controller/centerController/center_info_controller.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/functionalButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/namedDivider.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/update_center_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

class CenterInfoPage extends StatelessWidget {
  CenterInfoPage({super.key});

  final CenterInfoController centerInfoController = Get.put(
    CenterInfoController(),
  );

  @override
  Widget build(BuildContext context) {
    centerInfoController.getCenterInfo();

    return Scaffold(
      body: GetBuilder<CenterInfoController>(
        builder: (centerInfoController) => centerInfoController.centerModel ==
                null
            ? Container(
                height: MediaQuery.of(context).size.height,
                child: Center(child: CircularProgressIndicator()),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Container(
                            height: 170,
                            width: MediaQuery.of(context).size.width,
                            color: mainColor,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'lib/assets/pngegg (5).png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          centerInfoController.centerModel!.name.split(' ')[0],
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on, color: mainColor),
                                SizedBox(width: 10),
                                Text(
                                  centerInfoController.centerModel!.location
                                      .split(',')[0],
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.date_range, color: mainColor),
                                SizedBox(width: 10),
                                Text(
                                  centerInfoController.centerModel!.startDay,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryTextColor,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  centerInfoController.centerModel!.endDay,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.timelapse_rounded, color: mainColor),
                                SizedBox(width: 10),
                                Text(
                                  centerInfoController.centerModel!.startTime,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryTextColor,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  centerInfoController.centerModel!.endTime,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FunctionalButton(
                      text: 'edit info',
                      width: 400,
                      height: 40,
                      textSize: 20,
                      onTap: () => {
                        if (centerInfoController.centerModel != null)
                          {
                            Get.to(
                              UpdateCenterInfo(
                                centerModel: centerInfoController.centerModel!,
                              ),
                            ),
                          },
                      },
                    ),
                    SizedBox(height: 10),
                    NamedDivider(name: 'Sections'),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'there is ${5} clinic,you can see all of them and edit from the home page ',
                            style: TextStyle(
                              // fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
