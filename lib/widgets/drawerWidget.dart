import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_app/colors/colors.dart';
import 'package:responsive_app/data/stats.dart';
import 'package:responsive_app/data/places.dart';
import 'package:responsive_app/widgets/gridItemWidget.dart';
import 'package:responsive_app/models/place.dart';

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fontsize = MediaQuery.of(context).size.width * 0.018;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          buildHeader(fontsize),
          const Divider(thickness: 1, height: 0),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: allStates.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) =>
                  buildMenuItem(context, index, fontsize),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(double fontsize) => DrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryColor, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          image: const DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            image: ExactAssetImage('images/1.jpg'),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: AutoSizeText(
            "FAIRYTAIL",
            minFontSize: 22,
            maxFontSize: 30,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontsize + 4,
              color: Colors.white,
              letterSpacing: 2,
              shadows: [
                Shadow(
                  color: Colors.black54,
                  offset: Offset(1, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem(BuildContext context, int index, double fontsize) =>
      ListTile(
        leading: Icon(Icons.location_city_rounded, color: kPrimaryColor),
        title: AutoSizeText(
          allStates[index],
          minFontSize: 18,
          maxFontSize: 28,
          style: TextStyle(
            fontSize: fontsize,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        hoverColor: Colors.pink.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SubPlacesPage(stateName: allStates[index]),
            ),
          );
        },
      );
}

// Add this widget at the end of the file or in a separate file
class SubPlacesPage extends StatelessWidget {
  final String stateName;
  const SubPlacesPage({super.key, required this.stateName});

  @override
  Widget build(BuildContext context) {
    final List<Place> places = statePlaces[stateName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('$stateName Places'),
        backgroundColor: kPrimaryColor,
      ),
      body: places.isEmpty
          ? const Center(child: Text('No places found for this state.'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: places.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) =>
                  Griditemwidget(place: places[index]),
            ),
    );
  }
}
