import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:canine/models/cityModel.dart';
import 'package:canine/utils/api_helper.dart';
import 'package:canine/utils/constants.dart';
import 'package:canine/models/cityModel.dart' as cityFile;

class SalesLocationController extends GetxController {
  bool isDelivered = true;
  final List<String> cancellationReasons = [
    // 'Damaged Product',
    'Late Delivery',
    'Changed My Mind',
    'Other',
  ];
  final List<String> returnReasons = [
    'low Quality',
    'Wrong Product',
    // 'Damaged',
    'Other',
  ];
  String? selectedValue;
  updaeSelectedValue(String val) {
    selectedValue = val;
    update();
  }

  String? otherReason;
  updateOtherReason(String? val) {
    otherReason = val;
    update();
  }

  String? selectedReason;
  updateSelectedReason(String? val) {
    selectedReason = val;
    update();
  }
}
