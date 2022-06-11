import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_card/app/common/utils/utils.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, this.errorMessage = ""}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Error',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 6.h),
              Text(errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600])),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () => SmartDialog.dismiss(),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
