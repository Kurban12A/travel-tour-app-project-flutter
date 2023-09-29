import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategoryAppBarWidget extends StatelessWidget {
  const CategoryAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    void onPressed() {
      Navigator.pushNamed(context, '/mainscreen');
    }

    return SliverAppBar(
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
          //TODO(подвинуть стрелку влево),
          IconButton(
              padding: const EdgeInsets.only(right: 10),
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_back)),
          Text(
            'Hotels of City',
            style: themeData.appBarTheme.titleTextStyle,
          ),
          const FavouriteButtonAppBarWidget(),
        ],
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SearchFormWidget(),
        ),
      ),
    );
  }
}

class SearchFormWidget extends StatelessWidget {
  const SearchFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        label: Text('search'),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF00C8FF)),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        floatingLabelStyle: TextStyle(color: Color(0xFF00C8FF)),
        labelStyle: TextStyle(color: Color.fromARGB(255, 226, 221, 221)),
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide:
              BorderSide(color: Color(0xFFE0E0E0), style: BorderStyle.solid),
        ),
      ),
    );
  }
}

class FavouriteButtonAppBarWidget extends StatelessWidget {
  const FavouriteButtonAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent)
      ),
      padding: const EdgeInsets.only(left: 10),
        onPressed: () {},
        icon: const Icon(Icons.favorite,
            color: Color.fromARGB(255, 175, 173, 173)));
  }
}

class CountingPlaces extends StatelessWidget {
  const CountingPlaces({super.key});

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    );

    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('300 places found',
                style: textStyle),
          ],
        ),
      ),
    );
  }
}

class ListHotelsWidgets extends StatelessWidget {
  const ListHotelsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: CardWidget(),
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
    return const Stack(
      children: [
        ImageCardBox(),
        CategoryFavouriteIconButton(),
        MoreCardButton(),
      ],
    );
  }
}

class ImageCardBox extends StatelessWidget {
  const ImageCardBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const imageBoxDecoration = BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/asset/image/Hotel_test.jpg'),
            fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(115, 54, 54, 54),
              blurRadius: 5,
              offset: Offset(2, 2))
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)));

    return Stack(
      alignment: Alignment.bottomCenter, 
      children: [SizedBox(
        height: 250,
        width: double.infinity,
        child: Container(
            decoration: imageBoxDecoration),
      ),
      const CategoryCardWidget(),
    ]);
  }
}

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w900, 
      fontSize: 16);

    final bookingButtonStyle = ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        padding: MaterialStateProperty.all(EdgeInsets.zero));
  
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 90,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1. Grand Hotel Yerevan',
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$127',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Padding(
                  padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                  child: RatingBarWidget()),
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
                        )
                      ),
                  )
                ),
            ],
          )
        ),
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
          '332',
          style: textStyle,
        ),
      ],
    );
  }
}

class CategoryFavouriteIconButton extends StatelessWidget {
  const CategoryFavouriteIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
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

class MoreCardButton extends StatelessWidget {
  const MoreCardButton({super.key});

  @override
  Widget build(BuildContext context) {

    final moreButtonStyle = ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
        padding: MaterialStateProperty.all(EdgeInsets.zero));

    void onPressed () {
      Navigator.pushNamed(context, '/selection_card');
    }

    return SizedBox(
      height: 240,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 16, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 34,
              width: 80,
              child: ElevatedButton(
                  style: moreButtonStyle,
                  onPressed: onPressed,
                  child: const Text(
                    'More',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
