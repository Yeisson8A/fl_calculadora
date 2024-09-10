import 'package:fl_calculadora/bloc/calculator/calculator_bloc.dart';
import 'package:flutter/material.dart';
import '../enums/operator_enum.dart';
import '../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
   
  const CalculatorScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Instancia del bloc
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric( horizontal: 20 ),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const ResultsLabels(),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton( 
                    text: 'AC',
                    bgColor: const Color(0xffA5A5A5 ),
                    onPressed: () => calculatorBloc.add(ResetAC()),
                  ),
                  CalcButton( 
                    text: '+/-',
                    bgColor: const Color(0xffA5A5A5 ),
                    onPressed: () => calculatorBloc.add(ChangeNegativePositive()),
                  ),
                  CalcButton( 
                    text: 'del',
                    bgColor: const Color(0xffA5A5A5 ),
                    onPressed: () => calculatorBloc.add(DeleteLastEntry()),
                  ),
                  CalcButton( 
                    text: OperatorEnum.division.value,
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntry(OperatorEnum.division.value)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton( 
                    text: '7',
                    onPressed: () => calculatorBloc.add(AddNumber('7')),
                  ),
                  CalcButton( 
                    text: '8',
                    onPressed: () => calculatorBloc.add(AddNumber('8')),
                  ),
                  CalcButton( 
                    text: '9',
                    onPressed: () => calculatorBloc.add(AddNumber('9')),
                  ),
                  CalcButton( 
                    text: OperatorEnum.multiplication.value,
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntry(OperatorEnum.multiplication.value)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton( 
                    text: '4', 
                    onPressed: () => calculatorBloc.add(AddNumber('4')),
                  ),
                  CalcButton( 
                    text: '5', 
                    onPressed: () => calculatorBloc.add(AddNumber('5')),
                  ),
                  CalcButton( 
                    text: '6', 
                    onPressed: () => calculatorBloc.add(AddNumber('6')),
                  ),
                  CalcButton( 
                    text: OperatorEnum.subtraction.value,
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntry(OperatorEnum.subtraction.value)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton( 
                    text: '1', 
                    onPressed: () => calculatorBloc.add(AddNumber('1')),
                  ),
                  CalcButton( 
                    text: '2', 
                    onPressed: () => calculatorBloc.add(AddNumber('2')),
                  ),
                  CalcButton( 
                    text: '3', 
                    onPressed: () => calculatorBloc.add(AddNumber('3')),
                  ),
                  CalcButton(
                    text: OperatorEnum.addition.value,  
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(OperationEntry(OperatorEnum.addition.value)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton( 
                    text: '0', 
                    big: true,
                    onPressed: () => calculatorBloc.add(AddNumber('0')),
                  ),
                  CalcButton( 
                    text: '.', 
                    onPressed: () => calculatorBloc.add(AddSeparatorDot()),
                  ),
                  CalcButton( 
                    text: '=',
                    bgColor: const Color(0xffF0A23B ),
                    onPressed: () => calculatorBloc.add(CalculateResult()),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
   );
  }
}