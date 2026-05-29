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
    3474085575,
    2874095326,
    168882087,
    770051689,
    2141249853,
    406163142,
    1976086057,
    1669154773,
    2377608953,
    3899449078,
  ];

  static const List<int> _envieddatamyApiKey = <int>[
    3474085622,
    2874095340,
    168882068,
    770051677,
    2141249800,
    406163184,
    1976086046,
    1669154797,
    2377608896,
    3899449030,
  ];

  static final String myApiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddatamyApiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatamyApiKey[i] ^ _enviedkeymyApiKey[i]),
  );
}
