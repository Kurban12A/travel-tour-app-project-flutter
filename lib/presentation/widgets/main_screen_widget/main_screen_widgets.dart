import 'package:flutter/material.dart';

// 28-09-2023 внесены изменения в кнопки 
class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      automaticallyImplyLeading: false,
      snap: true,
      pinned: true,
      floating: true,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,),
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          SelectionCityButton(),
          FavouriteButtonAppBarWidget(),
        ],
      ),
      bottom: PreferredSize(
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
        contentPadding:
            EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
              color: Color(0xFFE0E0E0), style: BorderStyle.solid),
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
        onPressed: () {},
        icon: const Icon(Icons.favorite_border_outlined,
            color: Color.fromARGB(255, 55, 55, 55)));
  }
}

class SelectionCityButton extends StatelessWidget {
  const SelectionCityButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
        fontWeight: FontWeight.bold, 
        color: Color.fromARGB(255, 55, 55, 55));

    final buttonStyle = ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        iconColor: MaterialStateProperty.all(Colors.black));

    return SizedBox(
      height: 25,
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.location_on,
          color: Color.fromARGB(255, 55, 55, 55),
        ),
        label: const Text('Yerevan',
          style: textStyle,
        ),
        style: buttonStyle,
      ),
    );
  }
}


class ElevatedButtonWidgets extends StatelessWidget {
  const ElevatedButtonWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SightsButton(),
            SizedBox(width: 10),
            HotelsButton(),
            SizedBox(width: 10),
            FoodButton(),
          ],
        ),
      ),
    );
  }
}

class FoodButton extends StatelessWidget {
  const FoodButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 255, 255, 255));

    return Expanded(
      child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(10, 10, 10, 10))),
          onPressed: () {
      
          },
          child: const Column(
            children: [
              Icon(
                Icons.local_dining_outlined,
                color: Colors.white,
              ),
              Text(
                'Food',
                style: textStyle,
              ),
            ],
          )),
    );
  }
}

class HotelsButton extends StatelessWidget {
  const HotelsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 255, 255, 255));

    void onPressed () {
      Navigator.pushNamed(context, '/selection_category');
    }

    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.fromLTRB(10, 10, 10, 10))),
          onPressed: onPressed,
          child: const Column(
           children: [
             Icon(
               Icons.location_city_outlined,
               color: Colors.white,
             ),
             Text(
               'Hotels',
               style: textStyle,
             ),
           ],
              )),
    );
  }
}

class SightsButton extends StatelessWidget {
  const SightsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 255, 255, 255));

    return Expanded(
      child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(10, 10, 10, 10))),
          onPressed: () {},
          child: const Column(
            children: [
              Icon(
                Icons.account_balance_outlined,
                color: Colors.white,
              ),
              Text(
                'Sights',
                style: textStyle,
              ),
            ],
          )),
    );
  }
}










