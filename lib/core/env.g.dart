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
    508473137,
    3513960001,
    1961113614,
    1440084003,
    3920929479,
    799046850,
    4221077466,
    4084672119,
    2389005743,
    1475627209,
  ];

  static const List<int> _envieddatamyApiKey = <int>[
    508473088,
    3513960051,
    1961113661,
    1440083991,
    3920929522,
    799046900,
    4221077485,
    4084672079,
    2389005718,
    1475627257,
  ];

  static final String myApiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatamyApiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatamyApiKey[i] ^ _enviedkeymyApiKey[i]),
  );
}
