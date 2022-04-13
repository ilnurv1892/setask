import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SeBottomAppBarButton extends StatelessWidget {
  const SeBottomAppBarButton({Key? key, required this.onTap}) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 10,
          key: const Key('homeView_add_task'),
          onPressed: () {
            HapticFeedback.selectionClick();
            onTap();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
