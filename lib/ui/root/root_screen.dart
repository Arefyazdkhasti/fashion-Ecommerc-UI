import 'package:fashion_ecommerce/ui/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../light_theme_color.dart';

/* 
This class is the main root screen of the app which implement BottomNavigation
It Also Support stacked bottomnavigation like instagram application
*/
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

const int homeIndex = 0;
const int likedIndex = 1;
const int ordersIndex = 2;
const int profileIndex = 3;

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _likedKey = GlobalKey();
  final GlobalKey<NavigatorState> _ordersKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    likedIndex: _likedKey,
    ordersIndex: _ordersKey,
    profileIndex: _profileKey
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: selectedScreenIndex,
              children: [
                _navigator(_homeKey, homeIndex, const DashBoardScreen()),
                _navigator(
                    _likedKey, likedIndex, const Center(child: Text("LIKED"))),
                _navigator(_ordersKey, ordersIndex,
                    const Center(child: Text("ORDERS"))),
                _navigator(_profileKey, profileIndex,
                    const Center(child: Text("PROFILE"))),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 75,
                decoration: const BoxDecoration(
                  color: LightThemeColor.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavBarItem(
                      CupertinoIcons.house_fill,
                      'Home',
                      homeIndex,
                    ),
                    _buildNavBarItem(
                      CupertinoIcons.heart_solid,
                      'Favorites',
                      likedIndex,
                    ),
                    _buildNavBarItem(
                      CupertinoIcons.bag_fill,
                      'Cart',
                      ordersIndex,
                    ),
                    _buildNavBarItem(
                      CupertinoIcons.person_fill,
                      'Profile',
                      profileIndex,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, int index) {
    final isItemSelected = index == selectedScreenIndex;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _history.remove(selectedScreenIndex);
          _history.add(selectedScreenIndex);
          selectedScreenIndex = index;
        });
      },
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color:
                  isItemSelected ? LightThemeColor.primaryColor : Colors.grey,
            ),
            const SizedBox(height: 8),
            if (isItemSelected)
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: LightThemeColor.primaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                offstage: selectedScreenIndex != index,
                child: child,
              ),
            ),
          );
  }
}


//old approad 
/* class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

const int homeIndex = 0;
const int likedIndex = 1;
const int ordersIndex = 2;
const int profileIndex = 3;

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _likedKey = GlobalKey();
  final GlobalKey<NavigatorState> _ordersKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    likedIndex: _likedKey,
    ordersIndex: _ordersKey,
    profileIndex: _profileKey
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: Stack(
            children: [
              IndexedStack(
                index: selectedScreenIndex,
                children: [
                  _navigator(_homeKey, homeIndex, const DashBoardScreen()),
                  _navigator(_likedKey, likedIndex,
                      const Center(child: Text("LIKED"))),
                  _navigator(_ordersKey, ordersIndex,
                      const Center(child: Text("ORDERS"))),
                  _navigator(
                      _profileKey,
                      profileIndex,
                      const Center(child: Text("PROFILE"))),
                ],
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart_solid),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bag),
                label: 'home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: 'home'),
            ],
            currentIndex: selectedScreenIndex,
            onTap: (selectedIndex) {
              setState(() {
                setState(() {
                  _history.remove(selectedScreenIndex);
                  _history.add(selectedScreenIndex);
                  selectedScreenIndex = selectedIndex;
                });
              });
            },
            unselectedItemColor: Colors.black,
            selectedItemColor: LightThemeColor.primaryColor,
          ),
        ));
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedScreenIndex != index, child: child)));
  }
} */