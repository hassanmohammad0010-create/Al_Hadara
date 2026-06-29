import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Function/Shered/deletAlert.dart';
import 'package:flutter/material.dart';

class LabAndServiceBox extends StatelessWidget {
  const LabAndServiceBox({
    super.key,
    required this.name,
    required this.id,
    this.add = false,
    required this.onTap,
    required this.onTapIcon,
  });
  final String name;
  final bool add;
  final int id;
  final VoidCallback onTap;
  final VoidCallback onTapIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        // onTap: () => (onTap),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 0, top: 0),
          // width: width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Color.fromARGB(255, 4, 241, 201), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.normal,
                spreadRadius: 1,
                color: add ? mainColor : Color.fromARGB(66, 0, 0, 0),
                blurRadius: 10,
              ),
            ],
          ),
          child: add
              ? Center(child: Icon(Icons.add, color: mainColor))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        // color: add ? mainColor : Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteAlert("Laboratory", id, onTapIcon);
                      },
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
