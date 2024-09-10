part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorEvent {}

// Resetear
class ResetAC extends CalculatorEvent {}

// Agregar un número
class AddNumber extends CalculatorEvent {
  final String number;

  AddNumber(this.number);
}

// Cambiar signo (+) o (-)
class ChangeNegativePositive extends CalculatorEvent {}

// Borrar último digito
class DeleteLastEntry extends CalculatorEvent {}

// Agregar signo de operación
class OperationEntry extends CalculatorEvent {
  final String operation;

  OperationEntry(this.operation);
}

// Realizar operación
class CalculateResult extends CalculatorEvent {}

// Agregar punto separador
class AddSeparatorDot extends CalculatorEvent {}