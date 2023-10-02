import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardAppBarWidget extends StatelessWidget {
  const CardAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      snap: false,
      pinned: false,
      floating: false,
      foregroundColor: Colors.white,
      actions: <Widget>[
        FavouriteAppBarIconButton(),
      ],
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax, background: ImageAppBar()),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: SizedBox(),
      ),
    );
  }
}

class ImageAppBar extends StatelessWidget {
  const ImageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const imageBoxDecoration = BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/asset/image/Hotel_test.jpg'),
            fit: BoxFit.cover));

    return Container(
      decoration: imageBoxDecoration,
    );
  }
}

class FavouriteAppBarIconButton extends StatelessWidget {
  const FavouriteAppBarIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const splashColor = Color.fromARGB(255, 227, 222, 222);
    const iconColor = Colors.white;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ClipOval(
        child: Material(
          color: themeData.primaryColor, // Button color
          child: InkWell(
            splashColor: splashColor, // Splash color
            onTap: () {},
            child: const SizedBox(
                width: 28,
                height: 28,
                child: Icon(
                  Icons.favorite,
                  size: 18,
                  color: iconColor,
                )),
          ),
        ),
      ),
    );
  }
}

class InformationAboutCard extends StatelessWidget {
  const InformationAboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = ThemeData(
        textTheme: const TextTheme(titleLarge: TextStyle(fontSize: 18)));
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleCardWidget(textTheme: textTheme),
            const SizedBox(height: 10),
            const LocationButtonWidget(),
            const SizedBox(height: 15),
            const RatingBarAndBookingWidgets(),
            const SizedBox(height: 10),
            const Divider(color: Colors.black12),
            const SizedBox(height: 5),
            const AboutPlaceTextWidget(),
            const SizedBox(height: 20),
            const Facilities(),
            const SizedBox(height: 10),
            const FacilitiesInformation(),
            const Divider(color: Colors.black12),
            const SizedBox(height: 10),
            const BookNowButton(),
            const SizedBox(height: 20),
            const Location(),
            const SizedBox(height: 10),
            const LocationButtonWidget(),
            const SizedBox(height: 10),
            const GoogleMapWidget(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class AboutPlaceTextWidget extends StatelessWidget {
  const AboutPlaceTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: textStyle,
        ),
        SizedBox(height: 5),
        ExpandedTextWidget(
          text:
              'Residence La Marina is a great choice for travelers to Pontida. This is a good value for money, comfort and convenience, family atmosphere and services designed to make your stay here very pleasant? family atmosphere and services designed to make your stay here very pleasant Residence La Marina is a great choice for travelers to Pontida. This is a good value for money, comfort and convenience',
        )
      ],
    );
  }
}

class RatingBarAndBookingWidgets extends StatelessWidget {
  const RatingBarAndBookingWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black45, fontSize: 12);

    final buttonStyle = ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        padding: MaterialStateProperty.all(EdgeInsets.zero));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar.builder(
          itemSize: 14,
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => const Icon(
            Icons.circle,
            color: Color(0xFF00C8FF),
          ),
          onRatingUpdate: (rating) {
            //TODO delete print
            print(rating);
          },
        ),

        // future rating number
        const Text(
          '332',
          style: textStyle,
        ),
        //TODO Надо исправить расстояние и проверить на разных устройствах
        const SizedBox(width: 80),
        SizedBox(
          height: 15,
          child: TextButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Row(
                children: [
                  Text('Booking.com'),
                  SizedBox(width: 5),
                  Icon(size: 16, Icons.launch),
                ],
              )),
        ),
      ],
    );
  }
}

class LocationButtonWidget extends StatelessWidget {
  const LocationButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 159, 158, 158));

    final buttonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      iconColor: MaterialStateProperty.all(Colors.black),
    );

    const iconColor = Color.fromARGB(255, 159, 158, 158);

    return Row(
      children: [
        SizedBox(
          height: 20,
          child: TextButton.icon(
            label: const Text(
              'Amiryan str, 2, Yerevan, 0100, Armenia',
              style: textStyle,
            ),
            style: buttonStyle,
            onPressed: () {},
            icon: const Icon(
              Icons.location_on,
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }
}

class TitleCardWidget extends StatelessWidget {
  const TitleCardWidget({
    super.key,
    required this.textTheme,
  });

  final ThemeData textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            width: 200,
            child: Text('Holiday Inn Yerevan - Republic Square, an IHG Hotel',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.textTheme.titleLarge),
          ),
        ),
        Text('\$127', style: textTheme.textTheme.titleLarge),
      ],
    );
  }
}

class Facilities extends StatelessWidget {
  const Facilities({super.key});

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
      fontSize: 16, 
      fontWeight: FontWeight.w500);

    return const Row(
      children: [
        Text(
          'Facilities',
          style: textStyle,
        ),
      ],
    );
  }
}

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
      fontSize: 16, 
      fontWeight: FontWeight.w500);

    return const Row(
      children: [
        Text(
          'Location',
          style: textStyle,
        ),
      ],
    );
  }
}

class FacilitiesInformation extends StatelessWidget {
  const FacilitiesInformation({super.key});

  @override
  Widget build(BuildContext context) {

    const iconBoxDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFFE8EFFF));

    const textStyle = TextStyle(
      fontWeight: FontWeight.w300);

    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: 60,
                      decoration: iconBoxDecoration,
                      child: const Icon(
                        Icons.wifi,
                        size: 30,
                      ),
                    ),
                  )),
              const SizedBox(
                width: 80,
                child: Text(
                  'Free Wi-Fi',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// раскрывающийся текст
class ExpandedTextWidget extends StatefulWidget {
  final String text;
  const ExpandedTextWidget({super.key, required this.text});

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  String? firstHalf;
  String? secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    //TODO вернуться и изменить логику отбора длины строки
    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      firstHalf = widget.text.substring(201, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
    );

    final themeData = Theme.of(context);

    return Container(
        child: secondHalf?.length == ''
            ? Text(
                widget.text,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      style: textStyle,
                      flag ? firstHalf! : widget.text),
                  InkWell(
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          'Read more',
                          style: TextStyle(color: themeData.primaryColor),
                        ),
                        Icon(
                          flag
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          color: themeData.primaryColor,
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}

class BookNowButton extends StatelessWidget {
  const BookNowButton({super.key});

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color.fromARGB(255, 255, 255, 255));

    final themeData = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: themeData.elevatedButtonTheme.style,
        onPressed: () {},
        child: const Text(
          'Book now',
          style: textStyle,
        ),
      ),
    );
  }
}

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context) {

    const imageDecorationBox = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
            image: AssetImage('lib/asset/image/Google_maps.jpg'),
            fit: BoxFit.cover));

    return Container(
      height: 200,
      width: double.infinity,
      decoration: imageDecorationBox,
    );
  }
}
