import 'package:al_hadara/Controller/Shared/Swap_Buttom_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomSwapButtom extends StatelessWidget {
  CustomSwapButtom({super.key});
  SwapButtomController swapButtomController = Get.put(SwapButtomController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwapButtomController>(builder: (swapButtomController) {
      return GestureDetector(
        onTap: () {
          swapButtomController.click();
          if (swapButtomController.isToggled) {
            print("Dark mode");
          } else {
            print("Light mode");
          }
          // widget.onToggled(isToggled);
        },
        // onPanEnd: (b) {
        //   swapButtomController.click();
        //   print('object2');
        //   // widget.onToggled(isToggled);
        // },
        child: AnimatedContainer(
          height: swapButtomController.size,
          width: swapButtomController.size * 2,
          padding: EdgeInsets.all(swapButtomController.innerPadding),
          alignment: swapButtomController.isToggled
              ? Alignment.centerLeft
              : Alignment.centerRight,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: swapButtomController.isToggled
                ? Colors.blue.shade100
                : Colors.grey.shade300,
          ),
          child: Container(
            width: swapButtomController.size -
                swapButtomController.innerPadding * 2,
            height: swapButtomController.size -
                swapButtomController.innerPadding * 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: swapButtomController.isToggled
                  ? Colors.blue.shade600
                  : Colors.grey.shade500,
            ),
          ),
        ),
      );
    });
  }
}
