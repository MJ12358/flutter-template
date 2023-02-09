import 'package:flutter_template/domain/usecases/usecase.dart';

extension UseCaseResultsExtension on List<UseCaseResult<dynamic>> {
  bool get hasError => any((UseCaseResult<dynamic> r) => r.hasError);

  String? get errorMessage =>
      firstWhere((UseCaseResult<dynamic> r) => r.hasError).errorMessage;
}
