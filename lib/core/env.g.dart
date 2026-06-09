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
    3440920659,
    2806820577,
    454908172,
    2447686452,
    2786679975,
    1518603141,
    3316424291,
    2317583785,
    4115252657,
    3800638198,
  ];

  static const List<int> _envieddatamyApiKey = <int>[
    3440920674,
    2806820563,
    454908223,
    2447686400,
    2786679954,
    1518603187,
    3316424276,
    2317583761,
    4115252616,
    3800638150,
  ];

  static final String myApiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatamyApiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatamyApiKey[i] ^ _enviedkeymyApiKey[i]),
  );
}
