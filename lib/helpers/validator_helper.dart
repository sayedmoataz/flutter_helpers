import 'package:get/get.dart';

class Validators {
  static validationMobile(String data) {
    if (data.isEmpty || data == '') {
      return 'The field is required'.tr;
    } else if (data.length < 8) {
      return 'The phone number must be greater than 8 digits';
    }
  }

  static validationNull(String data) {
    if (data.isEmpty || data == '') {
      return 'The field is required'.tr;
    }
  }

  static isEmail(String? email) {
    if (GetUtils.isNull(email) || email!.isEmpty) {
      return "The field is required.".tr;
    }
    if (!GetUtils.isEmail(email)) {
      return 'mail is incorrect.'.tr;
    }
  }

  static isLinkUrl(String? email) {
    if (GetUtils.isNull(email) || email!.isEmpty) {
      return "The field is required.".tr;
    }
    if (!GetUtils.isURL(email)) {
      return 'Url is incorrect.'.tr;
    }
  }
}
