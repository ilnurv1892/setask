import 'package:flutter/widgets.dart';
import 'package:setask/app/bloc/app_bloc.dart';
import 'package:setask/home/view/home_page.dart';
import 'package:setask/registration/sign_in/view/login_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
