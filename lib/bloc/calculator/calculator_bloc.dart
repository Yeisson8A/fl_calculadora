import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../enums/operator_enum.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<CalculatorEvent>((event, emit) {
      // Resetear
      if (event is ResetAC) {
        emit(state.initialize());
      }
      // Agregar un número
      else if (event is AddNumber) {
        emit(state.copyWith(mathResult: state.mathResult == '0' ? event.number : state.mathResult + event.number));
      }
      // Cambiar signo (+) o (-)
      else if (event is ChangeNegativePositive) {
        emit(state.copyWith(mathResult: state.mathResult.contains('-') 
                            ? state.mathResult.replaceFirst('-', '')
                            : '-${state.mathResult}'));
      }
      // Borrar último digito
      else if (event is DeleteLastEntry) {
        emit(state.copyWith(mathResult: (state.mathResult.length > 1 && !state.mathResult.contains('-')) || (state.mathResult.length > 2 && state.mathResult.contains('-'))
                            ? state.mathResult.substring(0, state.mathResult.length -1)
                            : '0'));
      }
      // Agregar signo de operación
      else if (event is OperationEntry) {
        final result = state.mathResult.endsWith('.0') 
                        ? state.mathResult.substring(0, state.mathResult.length -2) 
                        : state.mathResult;
        emit(state.copyWith(firstNumber: result, operation: event.operation, secondNumber: '0', mathResult: '0'));
      }
      // Realizar operación
      else if (event is CalculateResult) {
        if (state.operation.isNotEmpty) {
          emit(state.copyWith(secondNumber: state.mathResult));
          _calculateResult(emit);
        }
      }
      // Agregar punto separador
      else if (event is AddSeparatorDot) {
        if (!state.mathResult.contains('.')) {
          emit(state.copyWith(mathResult: '${state.mathResult}.'));
        }
      }
    });
  }

  void _calculateResult(Emitter<CalculatorState> emit) {
    final num1 = double.parse(state.firstNumber);
    final num2 = double.parse(state.secondNumber);
    final String result;
    final operation = OperatorEnum.values.singleWhere((e) => e.value == state.operation);
    
    switch (operation) {
      case OperatorEnum.addition:
        result = '${num1 + num2}';
        emit(state.copyWith(mathResult: result.endsWith('.0') ? result.substring(0, result.length -2) : result));
        break;
      case OperatorEnum.subtraction:
        result = '${num1 - num2}';
        emit(state.copyWith(mathResult: result.endsWith('.0') ? result.substring(0, result.length -2) : result));
        break;
      case OperatorEnum.multiplication:
        result = '${num1 * num2}';
        emit(state.copyWith(mathResult: result.endsWith('.0') ? result.substring(0, result.length -2) : result));
        break;
      case OperatorEnum.division:
        result = '${num1 / num2}';
        emit(state.copyWith(mathResult: result.endsWith('.0') ? result.substring(0, result.length -2) : result));
        break;
      default:
        emit(state);
        break;
    }
  }
}
