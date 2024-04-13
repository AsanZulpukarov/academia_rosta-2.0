import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/calendar/presentation/pages/calendar_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/group_page/groups_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_main.dart';
import 'package:academia_rosta_diplom/features/profile/presentation/pages/profile_screen.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/pages/train_%20screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarItem {
  Widget? screen;
  IconData? icon;
  String? label;

  NavBarItem({required this.screen, required this.icon, required this.label});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<NavBarItem> _navBarOptions = [
    NavBarItem(
      screen: GroupsScreen(),
      icon: Icons.group,
      label: "Группы",
    ),
    NavBarItem(
      screen: CalendarScreen(),
      icon: Icons.calendar_month,
      label: "Календарь",
    ),
    NavBarItem(
      screen: TrainScreen(),
      icon: Icons.calculate,
      label: "Тренажер",
    ),
    NavBarItem(
      screen: ProfileScreen(),
      icon: Icons.person,
      label: "Профиль",
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarMain(),
      body: _navBarOptions.elementAt(_selectedIndex).screen,
      bottomNavigationBar: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          border: Border.all(
            color: AppColors.white,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navBarButton(0),
            _navBarButton(1),
            _navBarButton(2),
            _navBarButton(3),
          ],
        ),
      ),
    );
  }

  Widget _navBarButton(int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _navBarOptions.elementAt(index).icon,
              color: index == _selectedIndex
                  ? AppColors.main
                  : AppColors.borderColor,
              size: 30,
            ),
            Text(
              _navBarOptions.elementAt(index).label ?? "",
              style: AppTextStyles.black12.copyWith(
                color: index == _selectedIndex
                    ? AppColors.main
                    : AppColors.borderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
