import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static show(String message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT
  );
}