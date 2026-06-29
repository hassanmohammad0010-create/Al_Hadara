import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Function/Shered/custom_alert.dart';
import 'package:al_hadara/Hamed/Function/Shered/deletAlert.dart';
import 'package:al_hadara/Hamed/Function/Shered/handel_fun.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class DoctorShowBox extends StatelessWidget {
  const DoctorShowBox({
    super.key,
    required this.name,
    required this.specialty,
    required this.id,
    this.image,
    this.onDeleteSuccess,
    this.futureFun,
    this.onTap,
    this.add = false,
  });
  final int id;
  final String name;
  final String? specialty;
  final String? image;
  final bool add;
  final Function()? onTap;
  final Callback? onDeleteSuccess;
  final Future<int> Function()? futureFun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 2,
                    // color: Color.fromARGB(66, 0, 0, 0),
                    color: Color.fromARGB(66, 0, 0, 0),
                    blurRadius: 12,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            image == null ? 'assets/istockphoto.jpg' : image!,
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              specialty == null ? 'null' : specialty!,
                              style: TextStyle(
                                fontSize: 20,
                                color: secondaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: add
                  ? IconButton(
                      onPressed: () {
                        if (futureFun != null) {
                          handleWithLoading(futureFun!, () {
                            customAlert("added");
                          });
                        }
                      },
                      icon: Icon(Icons.add_box, color: mainColor, size: 30),
                    )
                  : IconButton(
                      onPressed: () {
                        deleteAlert('Doctor', id, onDeleteSuccess);
                      },
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: mainColor,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
