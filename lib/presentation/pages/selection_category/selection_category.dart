import 'package:flutter/material.dart';
import '../../widgets/selection_category_widget/selection_category_widget.dart';

class SelectionCategory extends StatefulWidget {
  const SelectionCategory({super.key});

  @override
  State<SelectionCategory> createState() => _SelectionCategoryState();
}

class _SelectionCategoryState extends State<SelectionCategory> {
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
      body: const CustomScrollView(slivers: [
        CategoryAppBarWidget(),
        CountingPlaces(),
        SliverToBoxAdapter(child: SizedBox(height: 5)),
        ListHotelsWidgets(),
      ]),
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
    
}

