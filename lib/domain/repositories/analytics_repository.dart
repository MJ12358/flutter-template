import 'package:flutter_template/domain/enums/auth_provider.dart';

abstract class AnalyticsRepository {
  void logAppOpen();
  void logException({
    Object? details,
    StackTrace? stackTrace,
  });
  void logLogin({
    required AuthProvider provider,
  });
  void logLogout();
}
