import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/domain/entities/settings.dart';
import 'package:flutter_template/domain/repositories/settings_repository.dart';
import 'package:flutter_template/presentation/ui/settings/settings.dart';
import 'package:flutter_template/presentation/widgets/navigation/bottom_navigation.dart';
import 'package:flutter_template/presentation/widgets/navigation/side_navigation.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

part 'app_view.dart';
part 'bloc/app_bloc.dart';
part 'bloc/app_state.dart';
