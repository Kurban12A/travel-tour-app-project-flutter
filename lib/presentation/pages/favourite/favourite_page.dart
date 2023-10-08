import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

enum SelectedButton { sights, hotels, food }

class _FavouritePageState extends State<FavouritePage> {
  SelectedButton selectedButton = SelectedButton.sights;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const colorButton =  Color(0xFF00C8FF);
    const textStyle = TextStyle(color: Colors.black45, fontSize: 12);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text('Favourites', style: themeData.appBarTheme.titleTextStyle),
        shadowColor: Colors.black26,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 242, 243, 244),
                    borderRadius: BorderRadius.circular(10)),
                child: SegmentedButton<SelectedButton>(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      side: MaterialStateProperty.all(
                          const BorderSide(width: 0.2, color: Colors.black))),
                  segments: const <ButtonSegment<SelectedButton>>[
                    ButtonSegment<SelectedButton>(
                        value: SelectedButton.sights,
                        label: Text('Sights'),
                        icon: Icon(Icons.account_balance_outlined)),
                    ButtonSegment<SelectedButton>(
                        value: SelectedButton.hotels,
                        label: Text('Hotels'),
                        icon: Icon(Icons.location_city_outlined)),
                    ButtonSegment<SelectedButton>(
                        value: SelectedButton.food,
                        label: Text('Food'),
                        icon: Icon(Icons.local_dining_outlined)),
                  ],
                  selected: <SelectedButton>{selectedButton},
                  onSelectionChanged: (Set<SelectedButton> newselectedButton) {
                    setState(() {
                      selectedButton = newselectedButton.first;
                      colorButton;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemExtent: 180,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color:
                          const Color.fromARGB(31, 64, 64, 64).withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 2))
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: SizedBox(
                          height: double.infinity,
                          child:
                              Image.asset('lib/asset/image/garni_temple.jpg'))),
                  //TODO проверить размеры колонки
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 140,
                                child: Text(
                                  'The Garni Temple',
                                  style: TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              ClipOval(
                                child: Material(
                                  color:
                                      const Color(0xFFEBEBEB), // Button color
                                  child: InkWell(
                                    splashColor: const Color.fromARGB(
                                        255, 227, 222, 222), // Splash color
                                    onTap: () {},
                                    child: const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Icon(
                                          Icons.favorite,
                                          size: 18,
                                          color: Colors.red,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              RatingBar.builder(
                                itemSize: 14,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.circle,
                                  color: Color(0xFF00C8FF),
                                ),
                                onRatingUpdate: (rating) {
                                  //TODO delete print
                                  print(rating);
                                },
                              ),
                              const SizedBox(width: 10,),
                              // future rating number
                              const Text(
                                '332',
                                style: textStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Text(
                            maxLines: 3,
                            'The Garni Temple, dedicated to the ancient Armenian sun god Mithra (Mihr), is the only preserved monument of the Roman era in the entire region.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
