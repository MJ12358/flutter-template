part of '../error.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    super.key,
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      spacer: const SizedBox(height: Style.spacingXLarge),
      children: <Widget>[
        const _Icon(),
        const _Header(),
        const _Text(),
        _Button(),
        _Card(title: 'Error Details', value: error),
        _Card(title: 'Stack Trace', value: stackTrace),
      ],
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.error_outline,
      size: 64,
      color: Colors.red,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Text(
      'An unexpected error occurred.',
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Please try restarting the app. '
      'If the problem persists, contact support.',
      textAlign: TextAlign.center,
    );
  }
}

class _Button extends StatefulWidget {
  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool _isLoading = false;

  Widget get _indicator => const SizedBox(
        key: ValueKey<String>('indicator'),
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );

  Widget get _text => const Text(
        'Retry',
        key: ValueKey<String>('text'),
      );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () async {
              setState(() => _isLoading = true);
              await Injector.reset();
              // Small delay to ensure the UI updates before restart
              await Future<void>.delayed(Duration(milliseconds: Period.half));
              if (mounted) {
                await main();
                setState(() => _isLoading = false);
              }
            },
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: Period.half),
        child: _isLoading ? _indicator : _text,
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.title,
    this.value,
  });

  final String title;
  final Object? value;

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return const SizedBox.shrink();
    }
    return CustomCard.titled(
      title: Text(title),
      onTap: () async {
        await Clipboard.setData(
          ClipboardData(
            text: value.toString(),
          ),
        );
        if (context.mounted) {
          context.showSnackBar(const Text('Copied to clipboard'));
        }
      },
      child: Text(
        value.toString().trim(),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
