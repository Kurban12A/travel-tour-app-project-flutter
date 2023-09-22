import 'package:flutter/material.dart';


class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      snap: true,
      pinned: true,
      floating: true,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,),
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
          padding: EdgeInsets.fromLTRB(16, 0, 16, 15),
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
    return SizedBox(
      height: 25,
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.location_on,
          color: Color.fromARGB(255, 55, 55, 55),
        ),
        label: const Text(
          'Yerevan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 55, 55, 55),
          ),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            iconColor: MaterialStateProperty.all(Colors.black)),
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
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(15, 15, 15, 15))),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.account_balance_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sights',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                )),
            ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(15, 15, 15, 15))),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.location_city_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Hotels',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                )),
            ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(20, 15, 20, 15))),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.local_dining_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Food',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}










