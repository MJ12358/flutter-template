part of 'error.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScaffold(
        top: true,
        body: CustomSingleChildScrollView(
          padding: const EdgeInsets.all(Style.spacingMedium),
          child: ErrorBody(
            error: error,
            stackTrace: stackTrace,
          ),
        ),
      ),
      theme: FlutterThemez().light(),
    );
  }
}
