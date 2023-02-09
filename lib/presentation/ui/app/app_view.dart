import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_bloc/presentation/ui/app/app.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listenWhen: (AppState previous, AppState current) {
        return previous.status != current.status;
      },
      listener: (BuildContext context, AppState state) {
        if (state.status == AppStatus.failure) {
          print('Do/show something on failure.');
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text('Welcome to your app'),
        ),
      ),
    );
  }
}
