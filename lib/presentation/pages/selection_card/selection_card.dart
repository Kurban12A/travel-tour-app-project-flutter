import 'package:flutter/material.dart';
import '../../widgets/selection_card_widgets/selection_card_widgets.dart';

class SelectionCard extends StatefulWidget {
  const SelectionCard({super.key});

  @override
  State<SelectionCard> createState() => _SelectionCardState();
}

class _SelectionCardState extends State<SelectionCard> {
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
        CardAppBarWidget(),
        SliverToBoxAdapter(child: SizedBox(height: 15)),
        InformationAboutCard(),
      ]),
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
    
}
