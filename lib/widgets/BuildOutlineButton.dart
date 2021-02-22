import 'package:flutter/material.dart';

class BuildOutlineButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const BuildOutlineButton({
    Key key,
    this.icon,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: SizedBox(
        width: 40,
        height: 32,
        child: OutlineButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(icon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
