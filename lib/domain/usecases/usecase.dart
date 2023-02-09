import 'package:equatable/equatable.dart';

abstract class UseCase<Params, Result> {
  Future<Result> call(Params params);
}

abstract class UseCaseParams extends Equatable {
  const UseCaseParams();

  @override
  List<Object> get props => <Object>[];
}

abstract class UseCaseResult<T> extends Equatable {
  const UseCaseResult({
    this.value,
    required this.errorMessage,
  });

  final T? value;
  final String? errorMessage;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  @override
  List<Object?> get props => <Object?>[
        value,
        errorMessage,
      ];
}
