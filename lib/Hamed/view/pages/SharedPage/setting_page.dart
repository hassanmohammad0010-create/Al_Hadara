import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/arrowBackButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/setting_button.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            // color: Colors.yellow,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 170,
                    color: mainColor,
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        Positioned(
                            left: 15,
                            top: 15,
                            child: ArrowBackButton(
                              blue: false,
                            ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: (MediaQuery.of(context).size.width / 2) - 100,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: shadow,
                            image: DecorationImage(
                                image: AssetImage('lib/assets/pngegg (4).png')),
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Al Hadara",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SettingButton(
            label: 'Edit Info',
          ),
          SettingButton(
            label: 'Book Appointmet',
          ),
          SettingButton(
            label: 'Archive',
          ),
          SettingButton(
            label: 'Change password',
          ),
          SettingButton(
            label: 'Lunguage',
          ),
          SettingButton(
            label: 'logout',
          ),
        ],
      ),
    );
  }
}
