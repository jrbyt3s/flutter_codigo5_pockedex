import 'package:flutter/material.dart';

class ItemTypeWidget extends StatelessWidget {
  String type;
  ItemTypeWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2.0),
      margin: EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.30),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Text(
        type,
        style: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
