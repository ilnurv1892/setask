import 'package:flutter/material.dart';

class SeBottomAppBarButton extends StatelessWidget {
  const SeBottomAppBarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
      // child: IconButton(
      //   icon: const Icon(Icons.add),
      // ),
    );
  }
}
