import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class ClinicBox extends StatelessWidget {
  const ClinicBox({
    super.key,
    required this.clinicName,
    this.add = false,
    this.image,
    this.onTap,
    required this.onLongPress,
  });
  final String clinicName;
  final bool add;
  final String? image;
  final VoidCallback? onTap;
  final VoidCallback onLongPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: onTap,
        onLongPress: add
            ? null
            : () {
                onLongPress();
              },
        child: Container(
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      image == null ? 'assets/istockphoto.jpg' : image!,
                    ),
                    fit: BoxFit.cover,
                    opacity: add ? 0 : 1,
                  ),
                  color: Colors.white,
                  // color: add ? Colors.white : mainColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 1,
                      color: add ? mainColor : Color.fromARGB(53, 0, 0, 0),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: add ? Icon(Icons.add, color: mainColor, size: 28) : null,
              ),
              SizedBox(width: 8),
              add
                  ? SizedBox()
                  : Text(
                      clinicName,
                      style: TextStyle(
                        // shadows: [Shadow(blurRadius: 2, offset: Offset(5, 5))],
                        fontSize: 18,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
