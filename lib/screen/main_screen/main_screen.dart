import 'package:carclenx/constant/assets.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int bottomSelectedIndex = 0;
  late PageController pageController;
  int selectedIndex = 0;

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    bottomSelectedIndex = index;
    pageController
      ..animateToPage(
        index,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutExpo,
      )
      ..keepPage;
  }

  @override
  void initState() {
    pageController = PageController(
      initialPage: selectedIndex,
    );
    super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                IconAssets.home,
                height: 28,
                width: 28,
                color: selectedIndex == 0
                    ? const Color(0xFFD42828)
                    : const Color(0xFFB0ADAD),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                IconAssets.share,
                height: 28,
                width: 28,
                color: selectedIndex == 1
                    ? const Color(0xFFD42828)
                    : const Color(0xFFB0ADAD),
              ),
              label: 'Share',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                IconAssets.profile,
                height: 28,
                width: 28,
                color: selectedIndex == 2
                    ? const Color(0xFFD42828)
                    : const Color(0xFFB0ADAD),
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                IconAssets.history,
                height: 28,
                width: 28,
                color: selectedIndex == 3
                    ? const Color(0xFFD42828)
                    : const Color(0xFFB0ADAD),
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                IconAssets.coin,
                height: 28,
                width: 28,
                color: selectedIndex == 4
                    ? const Color(0xFFD42828)
                    : const Color(0xFFB0ADAD),
              ),
              label: 'Coin',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,

          elevation: 16,
        ),
      ),
      backgroundColor: Colors.white,
      body: PageView(
          controller: pageController,
          physics: const RangeMaintainingScrollPhysics(),
          onPageChanged: (index) {
            pageChanged(index);
          },
          children: <Widget>[
            Home(),
            Item(context: context,title: "Share screen"),
            Item(context: context,title: "Profile Screen"),
            Item(context: context,title: "History Screen"),
            Item(context: context,title: "Coin Screen"),

          ]),
    );
  }
  Widget Item({BuildContext? context,String? title}){
    return Center(child: Text(title ?? 'null',style: TextStyle(fontSize: 24),),);
  }
}
