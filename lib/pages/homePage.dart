import "package:flutter/material.dart";
import "package:responsive_app/colors/colors.dart";
import "package:responsive_app/widgets/drawerWidget.dart";
import "package:responsive_app/widgets/placeGalleryWidget.dart";
import "package:responsive_app/widgets/responsiveWidget.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsivewidget.isMobile(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fantasy Routes"),
        backgroundColor: kPrimaryColor,
      ),
      drawer: isMobile ? const Drawer(child: Drawerwidget()) : null,
      body: Responsivewidget(
          mobile: buildMobile(),
          tablet: buildTablet(),
          desktop: buildDesktop()),
    );
  }

  Widget buildMobile() => const Placegallerywidget();

  Widget buildTablet() => const Row(
        children: [
          Expanded(
            flex: 2,
            child: Drawerwidget(),
          ),
          Expanded(
            flex: 5,
            child: Placegallerywidget(),
          ),
        ],
      );
  Widget buildDesktop() => Row(
        children: const [
          Expanded(
            flex: 2,
            child: Drawerwidget(),
          ),
          Expanded(
            flex: 5,
            child: Placegallerywidget(),
          ),
        ],
      );
}
