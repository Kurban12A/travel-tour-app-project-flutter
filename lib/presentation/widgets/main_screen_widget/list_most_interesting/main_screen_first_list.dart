import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class MostInterestingWidgets extends StatelessWidget {
  const MostInterestingWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'The most interesting',
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.zero)),
                onPressed: () {},
                child: const Text('See all', style: TextStyle())),
          )
        ],
      ),
    ));
  }
}


class ListInterestingPlacesWidgets extends StatelessWidget {
  const ListInterestingPlacesWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          // box backgound card
          height: 290,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const SizedBox(
                width: 220,
                child: CardWidget(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        surfaceTintColor: Colors.white,
        elevation: 2.0,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Stack(
          children: [
            Center(
              // box image
              child: SizedBox(
                height: 270,
                width: 200,
                child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('lib/asset/image/garni_temple.jpg'),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(115, 66, 66, 66),
                              blurRadius: 5,
                              offset: Offset(1, 1))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                HeadinCardgWidget(), 
                SizedBox(height: 12)],
            ),
            const FavouriteButtonWidget(),
          ],
        ));
  }
}

class FavouriteButtonWidget extends StatelessWidget {
  const FavouriteButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: ClipOval(
            child: Material(
              color: const Color(0xFF00C8FF), // Button color
              child: InkWell(
                splashColor:
                    const Color.fromARGB(255, 227, 222, 222), // Splash color
                onTap: () {},
                child: const SizedBox(
                    width: 28,
                    height: 28,
                    child: Icon(
                      Icons.favorite,
                      size: 18,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeadinCardgWidget extends StatelessWidget {
  const HeadinCardgWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 80,
          width: 190,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                child: Text(
                  'Zvartnots Temple',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.circle,
                          color: Color(0xFF00C8FF),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(width: 10),
                      // future rating number
                      const Text(
                        '3,432',
                        style: TextStyle(color: Colors.black45, fontSize: 12),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Places that need to be seen routes adsda asdasd ',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black38, fontSize: 10),
                ),
              ),
            ],
          )),
    );
  }
}