import 'package:get/get.dart';

class Validarot {
  emailValidate(String email) {
    if (email.isEmpty) {
      return 'Field is required'.tr;
    } else if (!GetUtils.isEmail(email) || !email.endsWith('@gmail.com')) {
      return 'Failed email'.tr;
    } else if (email.length < 5) {
      return 'Email can not be less than 5'.tr;
    } else if (email.length > 30) {
      return 'Email can not be greter than 30'.tr;
    } else {
      return null;
    }
  }

  passwordValidator(String password) {
    if (password.isEmpty) {
      return 'Field is required'.tr;
    } else if (password.length < 6) {
      return "Password can't be less 6 character".tr;
    } else if (password.length > 20) {
      return "Password can't not be greter than 20".tr;
    }
    return null;
  }

  nameValidator(String name) {
    if (name.isEmpty) {
      return 'Field is required'.tr;
    } else if (!GetUtils.isUsername(name)) {
      return 'Failed name'.tr;
    } else if (name.length < 3) {
      return 'name can not be less than 3'.tr;
    } else {
      return null;
    }
  }

  personalData(String experince) {
    if (experince.isEmpty) {
      return 'Field is required'.tr;
    } else {
      return null;
    }
  }

  numberValidation(String experince) {
    if (experince.isEmpty) {
      return 'Field is required'.tr;
    } else if (experince.length < 10) {
      return 'Please enter 10 number';
    }
  }

  generalValidation(String data) {
    if (data.isEmpty) {
      return 'Field is required'.tr;
    } else {
      return null;
    }
  }
}
