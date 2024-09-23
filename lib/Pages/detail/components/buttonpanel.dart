import 'package:flutter/material.dart';
import '../../../Common/colors/color.dart';

class Button_Panel extends StatelessWidget {
  final VoidCallback onclick;
  final String title;
  final bool isDisabled;  // Menambahkan parameter baru untuk cek apakah tombol di-disable

  Button_Panel({
    super.key,
    required this.onclick,
    required this.title,
    this.isDisabled = false,  // Default value adalah false
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return ElevatedButton(
      onPressed: isDisabled
          ? null
          : () {
        if (isDisabled) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Perhatian"),
              content: Text("Stok atau jumlah produk tidak tersedia."),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        } else {
          onclick();
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isDisabled ? Colors.grey : ColorValue.kPrimary,
        ),
        minimumSize: MaterialStateProperty.all(Size(width * 0.85, height * 0.065)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
