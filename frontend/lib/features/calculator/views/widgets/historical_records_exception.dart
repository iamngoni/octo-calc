import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/historical_records/historical_records_bloc.dart';
import '../../models/app_exception.dart';

class HistoricalRecordsExceptionWidget extends StatelessWidget {
  const HistoricalRecordsExceptionWidget({
    super.key,
    required this.exception,
  });

  final AppException exception;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              exception.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: sy(10),
              ),
            ),
            SizedBox(
              height: sy(10),
            ),
            Text(
              exception.message,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: sy(20),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<HistoricalRecordsBloc>(context)
                    .add(FetchRecords());
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  vertical: sy(10),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
