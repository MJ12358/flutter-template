// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: .env
final class _Env {
  static const List<int> _enviedkeymyApiKey = <int>[
    2565557932,
    4278992387,
    520383103,
    1102256921,
    2129398136,
    162569119,
    1331842610,
    755824717,
    3556835484,
    905585868,
  ];

  static const List<int> _envieddatamyApiKey = <int>[
    2565557917,
    4278992433,
    520383052,
    1102256941,
    2129398093,
    162569129,
    1331842565,
    755824757,
    3556835493,
    905585916,
  ];

  static final String myApiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatamyApiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatamyApiKey[i] ^ _enviedkeymyApiKey[i]),
  );
}
