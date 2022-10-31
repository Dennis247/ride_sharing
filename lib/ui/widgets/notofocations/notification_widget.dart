import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ride_sharing/core/utils/colors.dart';

class NotificationWidgets {
  static showSucessfulSnackBar(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
      ),
      duration: const Duration(seconds: 8),
      elevation: 2.0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.fromARGB(255, 12, 156, 12),

      //  backgroundColor: (Colors.black12),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showErrorSnackBar(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
      ),
      duration: const Duration(seconds: 8),
      elevation: 2.0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.fromARGB(255, 179, 15, 50),

      //  backgroundColor: (Colors.black12),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
