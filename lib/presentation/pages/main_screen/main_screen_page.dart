// главный экран
import 'package:flutter/material.dart';
import '../../widgets/main_screen_widget/list_hotels/main_screem_third_list.dart';
import '../../widgets/main_screen_widget/list_most_interesting/main_screen_first_list.dart';
import '../../widgets/main_screen_widget/list_restaurants/main_screen_second_list.dart';
import '../../widgets/main_screen_widget/main_screen_widgets.dart';
import '../favourite/favourite_page.dart';
import '../profile/profile_page.dart';
import '../search/seacrh_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedPageIndex = 0;
  // контроллер для вызова страницы
  final _pageController = PageController();

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
                  label: 'Favourites'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person), 
                  label: 'Profile'),
            ],
          ),
        body: PageView(
          controller: _pageController,
          // проверяем какая вкладка выбрана при скроле вправо страницы
          onPageChanged: (value) {
            setState(() {
              _selectedPageIndex = value;
            });
          },
          children: const [
            MainCustomScrollView(),
            // Заглушки для вкладок
            SearchPage(),
            FavouritePage(),
            ProfilePage(),
            ])
        
        );
  }

  // отслиживаем состояние по нажатию на иконку в ботомбаре
  void _onTap(int index) {
    // в условии указываем, что если выбранная вкладка = индексу то делаем ранний выход.
    // таким образом мы не обновляем стейт если вкладка уже выбрана
    if (_selectedPageIndex == index) return;
    setState(() {
      _selectedPageIndex = index;
      // анимация при переключении вкладок
      _pageController.animateToPage(
        index,
        duration: const Duration(microseconds: 350),
        curve: Curves.linear,
        );
    });
  }
}

class MainCustomScrollView extends StatelessWidget {
  const MainCustomScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBarWidget(),
        SliverToBoxAdapter(child: SizedBox(height: 5)),
        ElevatedButtonWidgets(),
        SliverToBoxAdapter(child: SizedBox(height: 5)),
        MostInterestingHeadingWidget(),
        ListInterestingPlacesWidgets(),
        RestaurantHeadingWidget(),
        ListRestaurantsWidgets(),
        HotelsHeadingWidget(),
        ListHotelsWidget(),
      ],
      
    );
  }
}


