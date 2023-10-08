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
        title: TitleSliverAppBar(themeData: themeData),
        shadowColor: Colors.black26,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SearchTextField(searchController: _searchController),
            )),
      NumberOfPlaces(filteredHotels: _filteredHotels, textStyle: textStyle),
      const SliverToBoxAdapter(
        child: SizedBox(height: 5)),
      ListOfPlaces(
        filteredHotels: _filteredHotels, 
        pricetextStyle: pricetextStyle, 
        ratingTextsyle: ratingTextsyle, 
        bookingButtonStyle: bookingButtonStyle),
    ]);
  }
}

class ListOfPlaces extends StatelessWidget {
  const ListOfPlaces({
    super.key,
    required List<Hotels> filteredHotels,
    required this.pricetextStyle,
    required this.ratingTextsyle,
    required this.bookingButtonStyle,
  }) : _filteredHotels = filteredHotels;

  final List<Hotels> _filteredHotels;
  final TextStyle pricetextStyle;
  final TextStyle ratingTextsyle;
  final ButtonStyle bookingButtonStyle;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
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
                    child: CardImage(
                      hotelsCard: hotelsCard),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: NestedContainer(
                      hotelsCard: hotelsCard, 
                      pricetextStyle: pricetextStyle, 
                      ratingTextsyle: ratingTextsyle, 
                      bookingButtonStyle: bookingButtonStyle),
                  ),
                ],
              ),
              const CategoryFavouriteIconButton(),
              const CardButton(),
            ],
          ),
        );
      },
    );
  }
}

class NestedContainer extends StatelessWidget {
  const NestedContainer({
    super.key,
    required this.hotelsCard,
    required this.pricetextStyle,
    required this.ratingTextsyle,
    required this.bookingButtonStyle,
  });

  final Hotels hotelsCard;
  final TextStyle pricetextStyle;
  final TextStyle ratingTextsyle;
  final ButtonStyle bookingButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.hotelsCard,
  });

  final Hotels hotelsCard;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                const BorderRadius.all(Radius.circular(10))));
  }
}

class NumberOfPlaces extends StatelessWidget {
  const NumberOfPlaces({
    super.key,
    required List<Hotels> filteredHotels,
    required this.textStyle,
  }) : _filteredHotels = filteredHotels;

  final List<Hotels> _filteredHotels;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: TextFormField(
          controller: _searchController,
          decoration: const InputDecoration(
            label:  Text('search'),
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
          prefixIcon: Icon(Icons.search),
          ),
        ),
      );
  }
}

class TitleSliverAppBar extends StatelessWidget {
  const TitleSliverAppBar({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {

    void onPressed() {
      Navigator.pushNamed(context, '/mainscreen');
    }

    return Row(
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
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                context: context, 
                builder: (context) => const Padding(
                  padding:  EdgeInsets.only(top: 80),
                  child: FilteredBottomSheet(),
                  ) 
                  );
            },
            icon: const Icon(Icons.tune,
                color: Color.fromARGB(255, 91, 90, 90))),
      ],
    );
  }
}

class FilteredBottomSheet extends StatefulWidget {
  const FilteredBottomSheet({
    super.key,
  });

  @override
  State<FilteredBottomSheet> createState() => _FilteredBottomSheetState();
}

int? listItem = 0;
List<String?> itemWidgets = <String?>[
  'Ranking',
  'Price',
  'Best value',
];

int? ratingItem = 0;
List<String?> ratingWidgets = <String?>[
  '5',
  '4',
  '3',
  '2',
];

int? classItem = 0;
List<String?> classWidgets = <String?>[
  '5',
  '4',
  '3',
  '2',
];

enum FacilitiesFilter { wife, breakfast, parking, pool, spa, bar }
enum StyleFilter { business, budget, family, romantic, modern, luxury }

class _FilteredBottomSheetState extends State<FilteredBottomSheet> {
  Set<FacilitiesFilter> filters = <FacilitiesFilter>{};
  Set<StyleFilter> styleFilters = <StyleFilter>{};
  

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const applyFilterTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 255, 255, 255));
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                width: double.infinity,
                child: HandleBottomSheet()),
            const SizedBox(
              height: 15,
            ),
            const TitleFilterAndResetBottom(),
            const SizedBox(height: 12),
            const Text(
              'Sort by',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15),
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 10.0,
              children: List<Widget>.generate(
                itemWidgets.length,
                (int index) {
                  return ChoiceChip(
                    selectedColor: const Color(0xFF00C8FF),
                    label: Text(
                      '${itemWidgets[index]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                    selected: listItem == index,
                    onSelected: (bool selected) {
                      setState(() {
                        listItem = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 12),
            const Text(
              'Traveler rating',
              style: TextStyle(fontWeight: FontWeight.w500,
              fontSize: 15),
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 10.0,
              children: List<Widget>.generate(
                ratingWidgets.length,
                (int index) {
                  return ChoiceChip(
                    selectedColor: const Color(0xFF00C8FF),
                    label: Text(
                      '${ratingWidgets[index]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                    selected: ratingItem == index,
                    onSelected: (bool selected) {
                      setState(() {
                        ratingItem = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 12),
            const Text(
              'Hotel class',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 10.0,
              children: List<Widget>.generate(
                classWidgets.length,
                (int index) {
                  return ChoiceChip(
                    selectedColor: const Color(0xFF00C8FF),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${classWidgets[index]}',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, color: Colors.black),
                        ),
                        const SizedBox(width: 2,),
                        const Icon(Icons.star, size: 12,)
                      ],
                    ),
                    selected: classItem == index,
                    onSelected: (bool selected) {
                      setState(() {
                        classItem = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 12),
            const Text(
              'Facilities',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 10.0,
              children: FacilitiesFilter.values.map((FacilitiesFilter exercise) {
                return FilterChip(
                  selectedColor: const Color(0xFF00C8FF),
                  label: Text(exercise.name.replaceFirst(
                    exercise.name[0], exercise.name[0].toUpperCase()),
                    style: const TextStyle(
                        fontWeight: FontWeight.normal),
                    ),
                  selected: filters.contains(exercise),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        filters.add(exercise);
                      } else {
                        filters.remove(exercise);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            const Text(
              'Style',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(height: 5),
            Wrap(
              spacing: 10.0,
              children: StyleFilter.values.map((StyleFilter filter) {
                return FilterChip(
                  selectedColor: const Color(0xFF00C8FF),
                  label: Text(
                    filter.name.replaceFirst(
                      filter.name[0], filter.name[0].toUpperCase()),
                      style: const TextStyle(
                        fontWeight: FontWeight.normal), ),
                  selected: styleFilters.contains(filter),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        styleFilters.add(filter);
                      } else {
                        styleFilters.remove(filter);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            ApplyFilterButton(themeData: themeData, applyFilterTextStyle: applyFilterTextStyle),
          const SizedBox(height: 12),
          ],
        ),
      ]),
    );
  }
}

class ApplyFilterButton extends StatelessWidget {
  const ApplyFilterButton({
    super.key,
    required this.themeData,
    required this.applyFilterTextStyle,
  });

  final ThemeData themeData;
  final TextStyle applyFilterTextStyle;

  @override
  Widget build(BuildContext context) {
    const loginTextStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color.fromARGB(255, 255, 255, 255));
    return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: themeData.elevatedButtonTheme.style,
      onPressed: (){},
      child: const Text(
        'Apply filters',
        style: loginTextStyle,
      ),
    ),
          );
  }
}

class TitleFilterAndResetBottom extends StatelessWidget {
  const TitleFilterAndResetBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Filters',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        GestureDetector(
            onTap: () {
              print('TAP');
            },
            child: const Text(
              'RESET',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black45),
            )),
      ],
    );
  }
}

class HandleBottomSheet extends StatelessWidget {
  const HandleBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 3,
          width: 60,
          color: const Color.fromARGB(221, 180, 180, 180),
        ),
      ],
    );
  }
}

