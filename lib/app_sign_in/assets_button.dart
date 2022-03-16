import 'package:flutter/material.dart';
import 'package:time_trackers_app/common_widgets/custome_raised_button.dart';

class AssetsButton extends StatelessWidget {
  // immutable Widget so we use final
  // properties unchangable
  final String assetName;
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  // make the constructor take named atteributes
  AssetsButton({
    // Required Parameters
    @required this.assetName,
    @required this.text,
    // optional Named Parameters
    this.onPressed,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRaisedButton(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(assetName),
        Text(
          text,
          style: TextStyle(fontSize: 16.0, color: textColor),
        ),
        // this child to Center the Text inside the Row
        Opacity(opacity: 0.0, child: Image.asset(assetName)),
      ]),
      onPressed: onPressed,
      color: color,
      borderRadius: 4.0,
    );
  }
}
