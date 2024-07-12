abstract class Searchable {
  List<Object?> get fields;
}

extension on Searchable {
  Searchable? search(String value) {
    final String _value = value.trim().toLowerCase();
    for (final Object? field in fields) {
      if (field != null) {
        if (field.toString().toLowerCase().contains(_value)) {
          return this;
        }
      }
    }
    return null;
  }
}

extension SearchablesExtension<T extends Searchable> on List<T> {
  List<T> search(String value) {
    final List<T> results = <T>[];

    for (final T searchable in this) {
      final T? s = searchable.search(value) as T?;
      if (s != null) {
        results.add(s);
      }
    }

    return results;
  }
}
