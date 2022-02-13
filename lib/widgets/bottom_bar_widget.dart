import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 55,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.home_filled,
                      color: Color(0xFFFFD810),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.bookmark_outline),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 55,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_outline,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.person_outline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
