import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/historical_records/historical_records_bloc.dart';
import 'calculator.dart';
import 'historical_records.dart';

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
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: sy(12),
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
                ListTile(
                  title: const Text("Historical Calculations"),
                  onTap: () {
                    context.goTo(
                      page: const HistoricalRecordsPage(),
                    );
                  },
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calculate,
                    size: sy(70),
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Text(
                    "Practical Assessment",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
