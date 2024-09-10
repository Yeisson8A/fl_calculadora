part of 'calculator_bloc.dart';

final class CalculatorState {
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operation;

  CalculatorState({
    this.mathResult = '0', 
    this.firstNumber = '0', 
    this.secondNumber = '0', 
    this.operation = ''
  });

  initialize() => CalculatorState(
    mathResult: '0',
    firstNumber: '0',
    secondNumber: '0',
    operation: ''
  );

  CalculatorState copyWith({
    String? mathResult,
    String? firstNumber,
    String? secondNumber,
    String? operation
  }) => CalculatorState(
    mathResult: mathResult ?? this.mathResult,
    firstNumber: firstNumber ?? this.firstNumber,
    secondNumber: secondNumber ?? this.secondNumber,
    operation: operation ?? this.operation
  );
}
