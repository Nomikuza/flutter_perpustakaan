import 'package:flutter/material.dart';

class EmoticonFace extends StatelessWidget {
  final icon;

  const EmoticonFace({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(18),
      child: Center(
        child: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
      ),
    );
  }
}
