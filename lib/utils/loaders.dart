import 'package:flutter/material.dart';

import 'package:get/get.dart';

showloadingIndicators() {
  Get.dialog(
      const Center(child: RepaintBoundary(child: CircularProgressIndicator())));
}

hideLoading() {
  if (Get.isDialogOpen!) {
    Get.back();
  }
}
