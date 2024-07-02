import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:canine/models/usersModel/allventeryModel.dart';
import 'package:canine/utils/api_helper.dart';
import 'package:canine/utils/constants.dart';

class AllVeterinaryController extends GetxController{



// my veterniary

  String getUserVeterniaryUrl =
      '${Constants.GET_USER_VETERNIARY}';
  AllVeterinaryModel? allveterniarymodel;
  bool allveterniaryLoaded = false;

  
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    try {
      // veterniary
      allveterniarymodel = AllVeterinaryModel.fromJson(
          await ApiHelper.getApi(getUserVeterniaryUrl));
      print(getUserVeterniaryUrl);
      allveterniaryLoaded = true;
      update();
    } catch (e) {
      print('Error: $e');
     // Get.snackbar(
      //   'Error',
      //   'An error occurred: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }

  }
}