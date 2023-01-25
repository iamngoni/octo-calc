import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../blocs/calculator/calculator_bloc.dart';

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
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: const Text(
              "Compute Marks",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          body: SafeArea(
            child: BlocConsumer<CalculatorBloc, CalculatorState>(
              listener: (context, state) {
                if (state is CalculatorIdle) {
                  log("Calculator now idle");
                  log("Calculator Operation: ${state.calculatorOperation}");
                  if (state.calculatorOperation != null) {
                    context.notify(
                      message:
                          'Calculator Result: ${state.calculatorOperation?.result} 🎉',
                      backgroundColor: Colors.green,
                    );
                  }
                }

                if (state is Calculating) {
                  context.notify(
                    message: "Calculating 🧮",
                    duration: const Duration(milliseconds: 200),
                    backgroundColor: Colors.green,
                  );
                }
              },
              builder: (context, state) {
                return Container(
                  height: context.height,
                  width: context.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: sx(20),
                    vertical: sy(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: sx(20),
                          vertical: sy(3),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: firstNumberController,
                          decoration: const InputDecoration(
                            hintText: 'First Number',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: sy(10),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: sx(20),
                          vertical: sy(3),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: secondNumberController,
                          decoration: const InputDecoration(
                            hintText: 'Second Number',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: sy(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: allowedOperations
                            .map<Widget>(
                              (String operation) => GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: sx(20),
                                    vertical: sy(5),
                                  ),
                                  decoration: BoxDecoration(
                                    color: operationToUse == operation
                                        ? Colors.blue
                                        : Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Text(
                                    operation,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() => operationToUse = operation);
                                },
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: sy(20),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (state is! CalculatorIdle) {
                            return;
                          }
                          final double? firstNumber =
                              double.tryParse(firstNumberController.text);
                          final double? secondNumber =
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
                            'Calculate',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
