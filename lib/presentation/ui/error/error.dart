// Everything in this view/widget should be as simple as possible,
// since this is only shown when something goes wrong.
// We want to avoid any potential errors in this code
// that would make it impossible to show the error message.
//
// This includes strings,
// which should be hardcoded and not localized,
// since localization requires loading resources which could fail.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extensionz/flutter_extensionz.dart';
import 'package:flutter_template/core/constants.dart';
import 'package:flutter_template/injector/injector.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_themez/flutter_themez.dart';
import 'package:flutter_widgetz/flutter_widgetz.dart';

part 'error_view.dart';
part 'widgets/error_body.dart';
