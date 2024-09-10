import 'package:fl_calculadora/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets.dart';

class ResultsLabels extends StatelessWidget {
  const ResultsLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state.operation == '') {
          return MainResult(text: state.mathResult);
        }

        return Column(
          children: [
            SubResult(text: state.firstNumber),
            SubResult(text: state.operation),
            SubResult(text: state.secondNumber),
            const LineSeparator(),
            MainResult(text: state.mathResult)
          ],
        );
      },
    );
  }
}
