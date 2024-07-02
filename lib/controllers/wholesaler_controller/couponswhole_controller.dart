

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:canine/models/wholesalerModel/couponModel.dart';

import 'package:canine/utils/api_helper.dart';
import 'package:canine/utils/constants.dart';

class CouponsWholeController extends GetxController {

 TextEditingController couponTextController =TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

String? couponcode;
String? coupontitle;
String? maxAmount;
String? minAmout;
String? totalcoupon;
 void onInit() {
    super.onInit();
    init();
  }


  void updatecode(String code,String title,String miniamount,String maxamount){
 couponcode = code;
coupontitle= title;
minAmout=miniamount;
maxAmount = maxamount;
// totalcoupon = 
couponTextController.text == couponcode;

update();
print("Coupon${couponcode}${maxAmount}");
  }
    String getUserCouponUrl =
      '${Constants.GET_USER_COUPON}';
 WholeCouponModel? wholecouponmodel;
  bool  couponLoaded = false;
  
  @override
 Future<void> init() async {
    try {
      // coupon
      wholecouponmodel = WholeCouponModel.fromJson(
          await ApiHelper.getApi(getUserCouponUrl));
          
      print(getUserCouponUrl);
      couponLoaded = true;
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
    }}
  
  



}