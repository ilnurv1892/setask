import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setask/app/bloc/app_bloc.dart';
import 'package:setask/home/cubit/home_navigation_cubit.dart';
import 'package:setask/home/home_items.dart';
import 'package:setask/home/view/create_task_screen.dart';
import 'package:setask/home/view/incoming_screen.dart';
import 'package:setask/home/view/outgoing_screen.dart';
import 'package:setask/home/view/profile_screen.dart';
import 'package:setask/home/view/team_screen.dart';
import 'package:setask/home/view/widgets/bottom_bar_button.dart';
import 'package:setask/home/view/widgets/bottom_bar_notch.dart';
import 'package:setask/home/view/widgets/home_tab_button.dart';
import 'package:setask/settings/cubit/locale_cubit.dart';
import 'package:setask/l10n/l10n.dart';
import 'package:setask/settings/cubit/theme_cubit.dart';
import 'package:setask/settings/settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
        create: (context) => HomeNavigationCubit(),
        child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            extendBodyBehindAppBar: true,
            extendBody: true,
            floatingActionButton: SeBottomAppBarButton(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => const SeCreateTask()),
              ),
            ),
            appBar: AppBar(
              title: Text(l10n.home_title),
              actions: <Widget>[
                IconButton(
                  key: const Key('homePage_logout_iconButton'),
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
                ),
                IconButton(
                  key: const Key('homePage_settings_iconButton'),
                  icon: const Icon(Icons.settings),
                  onPressed: () => Navigator.of(context)
                      .push(Settings.route(context.read<LocaleCubit>(), context.read<ThemeCubit>())),
                )
              ],
            ),
            body: BlocBuilder<HomeNavigationCubit, HomeNavigationState>(
              builder: (context, state) {
                return IndexedStack(index: state.index, children: const [
                  TeamScreen(),
                  IncomingScreen(),
                  OutgoingScreen(),
                  ProfileScreen(),
                ]);
              },
            ),
            bottomNavigationBar: BottomAppBar(
              shape: SeBottomBarNotch(),
              child: BlocBuilder<HomeNavigationCubit, HomeNavigationState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HomeTabButton(
                          icon: Icons.home,
                          index: state.index,
                          tab: HomePages.home,
                          text: context.l10n.bottom_bar_home,
                          onTap: (_) => context.read<HomeNavigationCubit>().getNavBarItem(_),
                        ),
                        HomeTabButton(
                          icon: Icons.task,
                          index: state.index,
                          tab: HomePages.incoming,
                          text: context.l10n.incoming,
                          onTap: (_) => context.read<HomeNavigationCubit>().getNavBarItem(_),
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        HomeTabButton(
                          icon: Icons.task,
                          index: state.index,
                          tab: HomePages.outgoing,
                          text: context.l10n.outgoing,
                          onTap: (_) => context.read<HomeNavigationCubit>().getNavBarItem(_),
                        ),
                        HomeTabButton(
                          icon: Icons.person,
                          index: state.index,
                          tab: HomePages.profile,
                          text: context.l10n.profile,
                          onTap: (_) => context.read<HomeNavigationCubit>().getNavBarItem(_),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )));
  }
}
