import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final listBtns = [
    'C',
    '*',
    '/',
    '<-',
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '*',
    '%',
    '0',
    '.',
    '='
  ];
  final Function btnTapHandler;
  GridViewWidget({
    super.key,
    required this.btnTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns
        crossAxisSpacing: 5,
        mainAxisSpacing: 5, // Vertical spacing between items
        childAspectRatio: 0.9,
      ),
      itemCount: listBtns.length,
      itemBuilder: (context, index) {
        return GridItem(
          item: listBtns[index],
          btnTapHandler: btnTapHandler,
        );
      },
    );
  }
}

class GridItem extends StatelessWidget {
  final String item;
  final Function btnTapHandler;
  const GridItem({super.key, required this.item, required this.btnTapHandler});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        btnTapHandler(item);
      },
      child: Card(
        color: const Color.fromARGB(255, 17, 163, 165),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            item,
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 28),
          ),
        ),
      ),
    );
  }
}
