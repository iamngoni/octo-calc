import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/calculator/blocs/calculator/calculator_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final List<String> allowedOperations = ['+', '-', '*', '/', '%', '//'];

  String? operationToUse;
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          body: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
              vertical: sy(20),
            ),
            child: Column(
              children: [
                TextField(
                  controller: firstNumberController,
                  decoration: const InputDecoration(
                    hintText: 'First Number',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: sy(10),
                ),
                TextField(
                  controller: secondNumberController,
                  decoration: const InputDecoration(
                    hintText: 'Second Number',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: sy(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: allowedOperations
                      .map<Widget>(
                        (String operation) => GestureDetector(
                          child: Container(
                            color: operationToUse == operation
                                ? Colors.blue
                                : Colors.transparent,
                            child: Text(operation),
                          ),
                          onTap: () {
                            setState(() => operationToUse = operation);
                          },
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: sy(10),
                ),
                BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                    late Widget buttonWidget;

                    if (state is Calculating) {
                      buttonWidget = const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    } else {
                      buttonWidget = const Text('Calculate');
                    }

                    return MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (state is! CalculatorIdle) {
                          return;
                        }
                        double? firstNumber =
                            double.tryParse(firstNumberController.text);
                        double? secondNumber =
                            double.tryParse(secondNumberController.text);

                        if (firstNumber == null || secondNumber == null) {
                          context.notify(
                            message: 'Check provided values',
                            isError: true,
                          );
                          return;
                        }

                        if (operationToUse == null) {
                          context.notify(
                            message: 'Choose operation',
                            isError: true,
                          );
                          return;
                        }

                        BlocProvider.of<CalculatorBloc>(context).add(
                          Calculate(
                            firstNumber: firstNumber,
                            secondNumber: secondNumber,
                            operation: operationToUse!,
                          ),
                        );
                      },
                      child: const Text('Calculate'),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
