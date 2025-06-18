import 'package:flutter/material.dart';
import 'package:responsive_app/colors/colors.dart';
import 'package:responsive_app/models/place.dart';
import 'package:responsive_app/widgets/placeDetailWidget.dart';

class Detailpage extends StatelessWidget {
  final Place place;
  const Detailpage({super.key, required this.place});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(place.subtitle),
          backgroundColor:kPrimaryColor,
          centerTitle: true,
        ),
        body: Placedetailwidget(place: place),
      );
}
