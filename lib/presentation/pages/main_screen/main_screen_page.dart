// главный экран
import 'package:flutter/material.dart';
import '../../widgets/main_screen_widget/list_hotels/main_screem_third_list.dart';
import '../../widgets/main_screen_widget/list_most_interesting/main_screen_first_list.dart';
import '../../widgets/main_screen_widget/list_restaurants/main_screen_second_list.dart';
import '../../widgets/main_screen_widget/main_screen_widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          currentIndex: _selectedPageIndex,
          onTap: _onTap,
          selectedItemColor: themeData.primaryColor,
          unselectedItemColor: themeData.hintColor,
          selectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore), 
                  label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search), 
                  label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite), 
                  label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person), 
                  label: 'Profle'),
          ]),
        body: const CustomScrollView(
          slivers: [
            SliverAppBarWidget(),
            SliverToBoxAdapter(child: SizedBox(height: 5)),
            ElevatedButtonWidgets(),
            SliverToBoxAdapter(child: SizedBox(height: 5)),
            MostInterestingWidgets(),
            ListInterestingPlacesWidgets(),
            RestaurantsWidgets(),
            ListRestaurantsWidgets(),
            HotelsWidgets(),
            ListHotelsWidgets(),
            
          ],
        ));
  }

  // отслиживаем состояние по нажатию на иконку в ботомбаре
  void _onTap(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}


