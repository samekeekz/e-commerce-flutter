import 'package:flutter/material.dart';
import 'package:minmalecommerce/utils/utils.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const MyButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink.shade400, // replaced gradient with single color
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Utils.getScreenWidth(context) * 0.050 > 30
              ? 20
              : Utils.getScreenWidth(context) * 0.025,
          horizontal: Utils.getScreenWidth(context) * 0.050 > 30
              ? 30
              : Utils.getScreenWidth(context) * 0.050,
        ),
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
