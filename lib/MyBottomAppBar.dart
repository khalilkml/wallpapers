import 'package:flutter/material.dart';


class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => onTap(0),
            color: currentIndex == 0 ? Theme.of(context).primaryColor : null,
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => onTap(1),
            color: currentIndex == 1 ? Theme.of(context).primaryColor : null,
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => onTap(2),
            color: currentIndex == 2 ? Theme.of(context).primaryColor : null,
          ),
          IconButton(
            icon: const Icon(Icons.upload),
            onPressed: () => onTap(3),
            color: currentIndex == 3 ? Theme.of(context).primaryColor : null,
          ),
        ],
      ),
    );
  }
}