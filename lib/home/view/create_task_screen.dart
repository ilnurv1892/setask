import 'package:flutter/material.dart';
import 'package:setask/home/view/widgets/bottom_bar_button.dart';

class SeCreateTask extends StatelessWidget {
  const SeCreateTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SeBottomAppBarButton(
          onTap: () {},
        ));
  }
}
