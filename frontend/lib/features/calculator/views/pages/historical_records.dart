import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/historical_records/historical_records_bloc.dart';
import '../widgets/historical_records_list_view.dart';
import '../widgets/historical_records_exception.dart';
import '../widgets/historical_records_initial_widget.dart';

class HistoricalRecordsPage extends StatelessWidget {
  const HistoricalRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: Text(
              "Historical Calculations",
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
          body: SafeArea(
            child: BlocBuilder<HistoricalRecordsBloc, HistoricalRecordsState>(
                builder: (context, state) {
              late Widget recordsWidget;

              if (state is FetchingHistoricalRecords) {
                recordsWidget = const CupertinoActivityIndicator(
                  color: Colors.black,
                );
              } else if (state is HistoricalRecordsFetched) {
                recordsWidget = HistoricalRecordsListView(
                  operations: state.operations,
                );
              } else if (state is HistoricalRecordsException) {
                recordsWidget = HistoricalRecordsExceptionWidget(
                  exception: state.exception,
                );
              } else {
                recordsWidget = const HistoricalRecordsInitialWidget();
              }

              return Container(
                height: context.height,
                width: context.width,
                padding: EdgeInsets.symmetric(
                  horizontal: sx(20),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: recordsWidget,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
