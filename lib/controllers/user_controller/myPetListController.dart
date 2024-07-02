import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:canine/models/usersModel/GetPetModel.dart';
import 'package:canine/utils/api_helper.dart';
import 'package:canine/utils/constants.dart';

class UserMyPetListController extends GetxController {
  final storage = GetStorage();
  var userID;
  @override
  void onInit() {
    init();
    userID = storage.read('id');
    super.onInit();
  }

  void clearFields() {
    petListModel = null;
    update();
  }

  GetPetModel? petListModel;
  String getPetUrl = Constants.GET_PET_USER;
  bool showLoading = false;

  // int? userid = 1;
  Future<void> init() async {
    showLoading = true;
    update();
    try {
      // pet list
      petListModel =
          GetPetModel.fromJson(await ApiHelper.getApi(getPetUrl + "${storage.read('id')}"));
      // print(getPetUrl + "${userid}");
      // notificationLoaded = true;
      update();
     //Get.back();
    } catch (e) {
      print('Error: $e');
      // Get.snackbar(
      //   'Error',
      //   'Unable to Load Pets: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    }

    showLoading = false;
    update();
  }
}