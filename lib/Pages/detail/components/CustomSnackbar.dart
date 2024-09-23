import 'package:flutter/material.dart';

Future   <void> showCustomSnackbar(BuildContext context, String title, String message) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.error, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.redAccent, // Warna latar belakang
      duration: Duration(seconds: 3), // Durasi tampilan
      behavior: SnackBarBehavior.floating, // Agar Snackbar melayang
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {
          // Aksi ketika tombol OK ditekan
        },
      ),
    ),
  );
}
