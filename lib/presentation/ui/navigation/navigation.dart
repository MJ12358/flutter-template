import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/entities/shared_prefs.dart';
import 'package:flutter_template/domain/repositories/shared_prefs_repository.dart';
import 'package:flutter_template/presentation/extensions/localization_extension.dart';

part 'bloc/navigation_bloc.dart';
part 'bloc/navigation_state.dart';
part 'navigation.g.dart';
part 'navigation_items.dart';
part 'widgets/bottom_navigation.dart';
part 'widgets/side_navigation.dart';
