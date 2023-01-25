import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/historical_records/historical_records_bloc.dart';
import '../../models/calculator_operation.dart';

class HistoricalRecordsListView extends StatelessWidget {
  const HistoricalRecordsListView({
    super.key,
    required this.operations,
  });

  final List<CalculatorOperation> operations;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<HistoricalRecordsBloc>(context).add(FetchRecords());
          },
          child: ListView.builder(
            itemCount: operations.length,
            itemBuilder: (context, index) {
              final CalculatorOperation operation = operations[index];
              return ListTile(
                title: Text(operation.toString()),
                subtitle: Text(operation.createdAt.readableDateTime),
                trailing: Text(
                  operation.result.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: sy(15),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
