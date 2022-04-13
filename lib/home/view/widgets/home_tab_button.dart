import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:setask/home/home_items.dart';

class HomeTabButton extends StatelessWidget {
  final int index;
  final HomePages tab;
  final IconData icon;
  final Function onTap;
  final String text;
  const HomeTabButton({
    Key? key,
    required this.index,
    required this.tab,
    required this.icon,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: tab.index != index ? Colors.grey : Colors.blue,
      onPressed: () {
        HapticFeedback.heavyImpact();
        onTap(tab);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(icon, size: tab.index != index ? 25 : 35),
          const SizedBox(
            height: 5,
          ),
          Text(text),
        ],
      ),
    );
  }
}
