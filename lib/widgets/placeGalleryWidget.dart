import 'package:flutter/material.dart';
import 'package:responsive_app/data/places.dart';
import 'package:responsive_app/widgets/gridItemWidget.dart';

class Placegallerywidget extends StatelessWidget {
  const Placegallerywidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: allPlaces
            .map<Widget>((place) => Griditemwidget(place: place))
            .toList(),
      ),
    );
  }
}
