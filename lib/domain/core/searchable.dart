import 'package:dart_extensionz/dart_extensionz.dart';

/// An abstract class representing an item that can be searched.
abstract interface class Searchable {
  /// A list of values that can be searched.
  List<String?> get searchables;
}

extension SearchableExtension on Searchable {
  /// Returns a [Searchable] if any of its fields contain the given [value].
  /// Returns null if [value] is empty or no fields match.
  bool matches(String value) {
    if (value.isEmpty) {
      return false;
    }

    final String v = value.normalizeSpace().toLowerCase();

    return searchables.any((String? field) {
      if (field == null || field.isBlank) {
        return false;
      }
      return field.normalizeSpace().toLowerCase().contains(v);
    });
  }
}

extension SearchablesExtension<T extends Searchable> on List<T> {
  /// Returns a list of [Searchable] items that match the given [value].
  /// If [value] is empty, returns an empty list.
  List<T> search(String value) {
    if (value.isEmpty) {
      return <T>[];
    }

    return where((T e) => e.matches(value)).toList();
  }
}
