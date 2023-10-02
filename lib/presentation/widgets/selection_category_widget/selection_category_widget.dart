import 'package:flutter/material.dart';

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

class CardButton extends StatelessWidget {
  const CardButton({super.key});

  @override
  Widget build(BuildContext context) {
    final moreButtonStyle = ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
        padding: MaterialStateProperty.all(EdgeInsets.zero));

    void onPressed() {
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
