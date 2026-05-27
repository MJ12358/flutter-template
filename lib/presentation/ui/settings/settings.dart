import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/entities/shared_prefs.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';
import 'package:flutter_template/domain/repositories/shared_prefs_repository.dart';
import 'package:flutter_template/injector/injector.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';
import 'package:rxdart/rxdart.dart' show Rx;

part 'bloc/settings_bloc.dart';
part 'bloc/settings_state.dart';
part 'settings.g.dart';
part 'settings_view.dart';
part 'widgets/settings_body.dart';
part 'widgets/settings_common_section.dart';
part 'widgets/settings_legal_section.dart';
