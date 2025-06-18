import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_app/colors/colors.dart';
import 'package:responsive_app/models/place.dart';

class Placedetailwidget extends StatelessWidget {
  final Place place;

  const Placedetailwidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final fontsize = MediaQuery.of(context).size.width * 0.025;

    return ListView(
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(24)),
          child: Image.asset(
            place.image,
            height: 320,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        buildTile(fontsize),
        const SizedBox(height: 8),
        buildButtons(kPrimaryColor),
        const SizedBox(height: 16),
        buildDescription(fontsize),
      ],
    );
  }

  Widget buildTile(double fontsize) => Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  place.title,
                  minFontSize: 18,
                  maxFontSize: 32,
                  style: TextStyle(
                    fontSize: fontsize + 2,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                AutoSizeText(
                  place.subtitle,
                  minFontSize: 12,
                  maxFontSize: 20,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: fontsize,
                  ),
                ),
              ],
            )),
            const Icon(Icons.star, color: Colors.amber, size: 28),
            const SizedBox(width: 8),
            Text(
              "4.8",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontsize,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      );

  Widget buildButtons(Color color) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton(color, Icons.call, 'CALL'),
            buildButton(color, Icons.near_me, 'ROUTE'),
            buildButton(color, Icons.share, 'SHARE'),
          ],
        ),
      );

  Widget buildButton(Color color, IconData icon, String label) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.4),
            child: Icon(icon, color: color),
            radius: 22,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
                fontSize: 13, color: color, fontWeight: FontWeight.w600),
          ),
        ],
      );

  Widget buildDescription(double fontsize) => Padding(
        padding: const EdgeInsets.all(23),
        child: AutoSizeText(
          place.description,
          minFontSize: 13,
          maxFontSize: 22,
          style: TextStyle(
            fontSize: fontsize,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      );
}
