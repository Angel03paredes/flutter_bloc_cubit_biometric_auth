part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionalCount;
  const CounterState({this.counter = 10, this.transactionalCount = 0});

  CounterState copyWith({int? counter, int? transactionalCount}) =>
      CounterState(
          counter: counter ?? this.counter,
          transactionalCount: transactionalCount ?? this.transactionalCount);

  @override
  List<Object> get props => [counter, transactionalCount];
}
