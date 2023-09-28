import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RestaurantHeadingWidget extends StatelessWidget {
  const RestaurantHeadingWidget({
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
            'Restaurants',
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.zero)),
                onPressed: () {},
                child: const Text('See all')),
          )
        ],
      ),
    ));
  }
}


class ListRestaurantsWidgets extends StatelessWidget {
  const ListRestaurantsWidgets({
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

    const imageBoxDecoration = BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/asset/image/mao.jpg'),
            fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(115, 66, 66, 66),
              blurRadius: 5,
              offset: Offset(1, 1))
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)));

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
                    decoration: imageBoxDecoration),
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

    const textStyle = TextStyle(
      color: Colors.black38, 
      fontSize: 10);
      
    return Center(
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 80,
          width: 190,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                child: Text(
                  'Mao Restaurant',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                  padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                  child: RatingBarWidget()),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  'Places that need to be seen routes adsda asdasd ',
                  overflow: TextOverflow.ellipsis,
                  style: textStyle,
                ),
              ),
            ],
          )),
    );
  }
}

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
      color: Colors.black45, 
      fontSize: 12);

    return Row(
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
        const SizedBox(width: 10),
        // future rating number
        const Text(
          '432',
          style: textStyle,
        ),
      ],
    );
  }
}