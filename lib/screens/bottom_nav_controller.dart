import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/const/AppColors.dart';
import 'package:interview_task/screens/bottom_nav_pages/account.dart';
import 'package:interview_task/screens/bottom_nav_pages/home_pages/main_home_page.dart';
import 'package:interview_task/screens/bottom_nav_pages/saved.dart';
import 'package:interview_task/screens/bottom_nav_pages/search.dart';
import 'package:interview_task/screens/bottom_nav_pages/time.dart';

import '../widgets/big_text.dart';
import '../widgets/small_text.dart';


class BottomNavController extends StatefulWidget {
  const BottomNavController({Key? key}) : super(key: key);

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  final _pages = [
    //HomeScreens(),
    const MainHomePage(),
    const SearchScreens(),

    const SavedScreens(),
    const TimerScreens(),
    const AccountScreens(),

  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.nav_background_color,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.deep_orange,
          unselectedItemColor: AppColors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer_outlined),
              label: "Time",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Account",
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                                color: Colors.deepOrange,
                                text: "Dhanmondi",
                                size: 18),
                            SmallText(color: Colors.black, text: "Dhaka")
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notification_add_outlined,
                              color: Colors.deepOrange,
                            ))
                      ],
                    ),
                  ),
                  // body
                ),
                SizedBox(
                  height: 8.h,
                ),
                _pages[_currentIndex],
              ],
            ),
          ),
        )
        //_pages[_currentIndex],
        );
  }
}
