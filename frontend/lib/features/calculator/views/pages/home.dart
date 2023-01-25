import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import 'calculator.dart';

class CalculatorHome extends StatelessWidget {
  const CalculatorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: const Text(
              "Home",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                DrawerHeader(
                  child: Icon(
                    Icons.calculate,
                    size: sy(50),
                  ),
                ),
                ListTile(
                  title: const Text("Compute Marks"),
                  onTap: () {
                    context.goTo(
                      page: const CalculatorPage(),
                    );
                  },
                ),
                const ListTile(
                  title: Text("Historical Calculations"),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Container(
              height: context.height,
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
              ),
            ),
          ),
        );
      },
    );
  }
}
