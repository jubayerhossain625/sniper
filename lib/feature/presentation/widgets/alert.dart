
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void alertMs(BuildContext context,String ms) async {
  // show the loading dialog
  showDialog(
    // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                // The loading indicator
                Container(height: 300,width: MediaQuery.of(context).size.width,
                  child:  Lottie.asset('assets/lottie/lodercat.json'),
                ),
                SizedBox(
                  height: 15,
                ),
                // Some text
                Text(ms)
              ],
            ),
          ),
        );
      });

  // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
  await Future.delayed(const Duration(seconds: 6));
  // Close the dialog programmatically
  Navigator.of(context).pop();
}
