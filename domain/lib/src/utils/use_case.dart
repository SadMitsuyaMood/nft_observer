import 'package:core/core.dart';

abstract class UseCase<OutputT, InputT> {
  OutputT execute(InputT payload);
}

abstract class FutureUseCase<OutputT, InputT> {
  Future<OutputT> execute(InputT payload);
}

abstract class StreamUseCase<OutputT, InputT> {
  Stream<OutputT> execute(InputT payload);
}

class NoPayload extends Equatable {
  const NoPayload();

  @override
  List<Object> get props => <Object>[];
}
