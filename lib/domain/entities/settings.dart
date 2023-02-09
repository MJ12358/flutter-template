import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  const Settings({
    String? id,
    bool? needsWelcome,
    bool? darkMode,
    int? primaryColor,
    int? secondaryColor,
  })  : id = id ?? '0',
        needsWelcome = needsWelcome ?? true,
        darkMode = darkMode ?? false,
        primaryColor = primaryColor ?? 0xFF2196F3,
        secondaryColor = secondaryColor ?? 0xFFDE690C;

  final String id;
  final bool needsWelcome;
  final bool darkMode;
  final int primaryColor;
  final int secondaryColor;

  @override
  List<Object> get props => <Object>[
        id,
        needsWelcome,
        darkMode,
        primaryColor,
        secondaryColor,
      ];

  @override
  String toString() {
    return 'Settings(id: $id)';
  }

  Settings copyWith({
    String? id,
    bool? needsWelcome,
    bool? darkMode,
    int? primaryColor,
    int? secondaryColor,
  }) {
    return Settings(
      id: id ?? this.id,
      needsWelcome: needsWelcome ?? this.needsWelcome,
      darkMode: darkMode ?? this.darkMode,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }
}
