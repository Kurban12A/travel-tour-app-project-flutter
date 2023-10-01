import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../widgets/selection_category_widget/selection_category_widget.dart';

class Hotels {
  final String image;
  final String title;
  final String price;
  final String rating;

  Hotels({
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  });
}

class SelectionCategory extends StatefulWidget {
  const SelectionCategory({super.key});

  @override
  State<SelectionCategory> createState() => _SelectionCategoryState();
}

class _SelectionCategoryState extends State<SelectionCategory> {
  var _selectedPageIndex = 0;
  final _pageController = PageController();
  final _searchController = TextEditingController();
  var _filteredHotels = <Hotels>[];
  // заглущка список отелей
  final hotelsList = [
    Hotels(
        image: 'lib/asset/image/Hotel_test.jpg',
        title: 'Grand Hotel Yerevan',
        price: '\$127',
        rating: '332'),
    Hotels(
        image: 'lib/asset/image/ani_plaza.jpg',
        title: 'Ani Plaza',
        price: '\$300',
        rating: '1332'),
    Hotels(
        image: 'lib/asset/image/hotel-courtyard-entrance.jpg',
        title: 'Hotel Hayat Inn',
        price: '\$427',
        rating: '2332'),
    Hotels(
        image: 'lib/asset/image/Hotel_test.jpg',
        title: 'Grand Hotel Yerevan',
        price: '\$237',
        rating: '32'),
    Hotels(
        image: 'lib/asset/image/hotel-courtyard-entrance.jpg',
        title: 'Hotel Hayat Inn',
        price: '\$427',
        rating: '2332'),
  ];

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

  // поиск отелей
  void _search() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredHotels = hotelsList.where((Hotels hotels) {
        return hotels.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredHotels = hotelsList;
    }
    // обязательно надо обновить состояние
    setState(() {});
  }
  
  @override
  void initState() {
    super.initState();
    // сразу вызывается наш метод, и все элемента отображаются
    // без взаимодействия с полем поиска
    _filteredHotels = hotelsList;
    // добавляем слушателя для контроллера
    _searchController.addListener(_search);
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const textStyle = TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    );
    const pricetextStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 16);

    const ratingTextsyle = TextStyle(color: Colors.black45, fontSize: 12);

    final bookingButtonStyle = ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        padding: MaterialStateProperty.all(EdgeInsets.zero));

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
              icon: Icon(Icons.explore), 
              label: 'Explore'),
            BottomNavigationBarItem(
              icon: Icon(Icons.search), 
              label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite), 
              label: 'Favorites'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), 
              label: 'Profle'),
          ]),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          // переход по вкладкам в ботом баре и отображение нужной
          setState(() {
            _selectedPageIndex = value;
          });
        },
        children: [
          ListHotelsWidgets(
              themeData: themeData,
              searchController: _searchController,
              textStyle: textStyle,
              filteredHotels: _filteredHotels,
              pricetextStyle: pricetextStyle,
              ratingTextsyle: ratingTextsyle,
              bookingButtonStyle: bookingButtonStyle,),
          // Заглушки для вкладок
          const Scaffold(
            body: Center(
              child: Text('Search'),
            ),
          ),
          const Scaffold(
              body: Center(
            child: Text('Favorites'),
          )),
          const Scaffold(
              body: Center(
            child: Text('Profile'),
          )),
        ],
      ),
    );
  }
}

class ListHotelsWidgets extends StatelessWidget {
  const ListHotelsWidgets({
    super.key,
    required this.themeData,
    required TextEditingController searchController,
    required this.textStyle,
    required List<Hotels> filteredHotels,
    required this.pricetextStyle,
    required this.ratingTextsyle,
    required this.bookingButtonStyle,
  })  : _searchController = searchController,
        _filteredHotels = filteredHotels;

  final ThemeData themeData;
  final TextEditingController _searchController;
  final TextStyle textStyle;
  final List<Hotels> _filteredHotels;
  final TextStyle pricetextStyle;
  final TextStyle ratingTextsyle;
  final ButtonStyle bookingButtonStyle;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    );

    void onPressed() {
      Navigator.pushNamed(context, '/mainscreen');
    }

    return CustomScrollView(
      slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        snap: true,
        pinned: true,
        floating: true,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: const FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                padding: const EdgeInsets.only(right: 10),
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_back)),
            Text(
              'Hotels of City',
              style: themeData.appBarTheme.titleTextStyle,
            ),
            IconButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                padding: const EdgeInsets.only(left: 10),
                onPressed: () {},
                icon: const Icon(Icons.favorite,
                    color: Color.fromARGB(255, 175, 173, 173))),
          ],
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextFormField(
                controller: _searchController,
                decoration: const InputDecoration(
                  label: Text('search'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00C8FF)),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  floatingLabelStyle: TextStyle(color: Color(0xFF00C8FF)),
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
                  isCollapsed: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                        color: Color(0xFFE0E0E0), style: BorderStyle.solid),
                  ),
                ),
              ),
            )),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${_filteredHotels.length} places found', 
              style: textStyle),
            ],
          ),
        ),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 5)),
      SliverList.builder(
        itemCount: _filteredHotels.length,
        itemBuilder: (context, index) {
          final hotelsCard = _filteredHotels[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(hotelsCard.image),
                                  fit: BoxFit.cover),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(115, 54, 54, 54),
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 90,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 185,
                                      child: Text(
                                        hotelsCard.title,
                                        style: const TextStyle(fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      hotelsCard.price,
                                      style: pricetextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                child: Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 14,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.circle,
                                        color: Color(0xFF00C8FF),
                                      ),
                                      onRatingUpdate: (rating) {
                                        //TODO delete print
                                        print(rating);
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    // future rating number
                                    Text(
                                      hotelsCard.rating,
                                      style: ratingTextsyle,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 15,
                                  child: TextButton(
                                    style: bookingButtonStyle,
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Text('Booking.com'),
                                        SizedBox(width: 5),
                                        Icon(size: 16, Icons.launch),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                const CategoryFavouriteIconButton(),
                const CardButton(),
              ],
            ),
          );
        },
      ),
    ]);
  }
}
