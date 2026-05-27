import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/entities/shared_prefs.dart';
import 'package:flutter_template/domain/repositories/shared_prefs_repository.dart';
import 'package:flutter_template/injector/injector.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

part 'bloc/welcome_bloc.dart';
part 'bloc/welcome_state.dart';
part 'welcome.g.dart';
part 'welcome_view.dart';
part 'widgets/welcome_body.dart';
