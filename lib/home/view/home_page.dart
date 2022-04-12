import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setask/app/bloc/app_bloc.dart';
import 'package:setask/home/cubit/home_navigation_cubit.dart';
import 'package:setask/home/home_items.dart';
import 'package:setask/home/view/incoming_screen.dart';
import 'package:setask/home/view/outgoing_screen.dart';
import 'package:setask/home/view/profile_screen.dart';
import 'package:setask/home/view/team_screen.dart';
import 'package:setask/home/view/widgets/bottom_bar_button.dart';
import 'package:setask/home/view/widgets/bottom_bar_notch.dart';
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

    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocProvider(
        create: (context) => HomeNavigationCubit(),
        child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
            extendBodyBehindAppBar: true,
            extendBody: true,
            floatingActionButton: const SeBottomAppBarButton(),
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
            bottomNavigationBar: BlocBuilder<HomeNavigationCubit, HomeNavigationState>(builder: (context, state) {
              return BottomAppBar(
                shape: SeBottomBarNotch(),

                child: SizedBox(
                  height: 90,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("data"),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                    ],
                  ),
                ),

                //   currentIndex: state.index,
                //   items: const [
                //     BottomNavigationBarItem(
                //       icon: Icon(
                //         Icons.home,
                //       ),
                //       label: 'Home',
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(Icons.task),
                //       label: 'Incoming',
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(Icons.task),
                //       label: 'Outgoing',
                //     ),
                //     BottomNavigationBarItem(
                //       icon: Icon(
                //         Icons.person,
                //       ),
                //       label: 'Profile',
                //     ),
                //   ],
                //   onTap: (index) {
                //     if (index == 0) {
                //       BlocProvider.of<HomeNavigationCubit>(context).getNavBarItem(HomePages.home);
                //     } else if (index == 1) {
                //       BlocProvider.of<HomeNavigationCubit>(context).getNavBarItem(HomePages.incoming);
                //     } else if (index == 2) {
                //       BlocProvider.of<HomeNavigationCubit>(context).getNavBarItem(HomePages.outgoing);
                //     } else if (index == 3) {
                //       BlocProvider.of<HomeNavigationCubit>(context).getNavBarItem(HomePages.profile);
                //     }
                //   },
                // );
                // },
                //     )
                //     body: BlocBuilder<HomeNavigationCubit, HomeNavigationState>(builder: (context, state) {
                //       if (state.navbarItem == HomePages.home) {
                //         return TeamScreen();
                //       } else if (state.navbarItem == HomePages.incoming) {
                //         return IncomingScreen();
                //       } else if (state.navbarItem == HomePages.outgoing) {
                //         return OutgoingScreen();
                //       } else if (state.navbarItem == HomePages.profile) {
                //         return ProfileScreen();
                //       }
                //       return Container();
                //     }),
              );
            })));
  }
}
