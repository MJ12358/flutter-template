// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'navigation.dart';

class NavigationStateMapper extends ClassMapperBase<NavigationState> {
  NavigationStateMapper._();

  static NavigationStateMapper? _instance;
  static NavigationStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NavigationStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NavigationState';

  static List<int> _$stack(NavigationState v) => v.stack;
  static const Field<NavigationState, List<int>> _f$stack = Field(
    'stack',
    _$stack,
    opt: true,
    def: const <int>[0],
  );
  static int _$revision(NavigationState v) => v.revision;
  static const Field<NavigationState, int> _f$revision = Field(
    'revision',
    _$revision,
    opt: true,
    def: 0,
  );
  static Object? _$scrollEvent(NavigationState v) => v.scrollEvent;
  static const Field<NavigationState, Object> _f$scrollEvent = Field(
    'scrollEvent',
    _$scrollEvent,
    key: r'scroll_event',
    opt: true,
  );
  static NavigationItem? _$scrollTarget(NavigationState v) => v.scrollTarget;
  static const Field<NavigationState, NavigationItem> _f$scrollTarget = Field(
    'scrollTarget',
    _$scrollTarget,
    key: r'scroll_target',
    opt: true,
  );

  @override
  final MappableFields<NavigationState> fields = const {
    #stack: _f$stack,
    #revision: _f$revision,
    #scrollEvent: _f$scrollEvent,
    #scrollTarget: _f$scrollTarget,
  };

  static NavigationState _instantiate(DecodingData data) {
    return NavigationState(
      stack: data.dec(_f$stack),
      revision: data.dec(_f$revision),
      scrollEvent: data.dec(_f$scrollEvent),
      scrollTarget: data.dec(_f$scrollTarget),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NavigationState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NavigationState>(map);
  }

  static NavigationState fromJson(String json) {
    return ensureInitialized().decodeJson<NavigationState>(json);
  }
}

mixin NavigationStateMappable {
  String toJson() {
    return NavigationStateMapper.ensureInitialized()
        .encodeJson<NavigationState>(this as NavigationState);
  }

  Map<String, dynamic> toMap() {
    return NavigationStateMapper.ensureInitialized().encodeMap<NavigationState>(
      this as NavigationState,
    );
  }

  NavigationStateCopyWith<NavigationState, NavigationState, NavigationState>
  get copyWith =>
      _NavigationStateCopyWithImpl<NavigationState, NavigationState>(
        this as NavigationState,
        $identity,
        $identity,
      );
  @override
  bool operator ==(Object other) {
    return NavigationStateMapper.ensureInitialized().equalsValue(
      this as NavigationState,
      other,
    );
  }

  @override
  int get hashCode {
    return NavigationStateMapper.ensureInitialized().hashValue(
      this as NavigationState,
    );
  }
}

extension NavigationStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NavigationState, $Out> {
  NavigationStateCopyWith<$R, NavigationState, $Out> get $asNavigationState =>
      $base.as((v, t, t2) => _NavigationStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NavigationStateCopyWith<$R, $In extends NavigationState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get stack;
  $R call({
    List<int>? stack,
    int? revision,
    Object? scrollEvent,
    NavigationItem? scrollTarget,
  });
  NavigationStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NavigationStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NavigationState, $Out>
    implements NavigationStateCopyWith<$R, NavigationState, $Out> {
  _NavigationStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NavigationState> $mapper =
      NavigationStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get stack => ListCopyWith(
    $value.stack,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(stack: v),
  );
  @override
  $R call({
    List<int>? stack,
    int? revision,
    Object? scrollEvent = $none,
    Object? scrollTarget = $none,
  }) => $apply(
    FieldCopyWithData({
      if (stack != null) #stack: stack,
      if (revision != null) #revision: revision,
      if (scrollEvent != $none) #scrollEvent: scrollEvent,
      if (scrollTarget != $none) #scrollTarget: scrollTarget,
    }),
  );
  @override
  NavigationState $make(CopyWithData data) => NavigationState(
    stack: data.get(#stack, or: $value.stack),
    revision: data.get(#revision, or: $value.revision),
    scrollEvent: data.get(#scrollEvent, or: $value.scrollEvent),
    scrollTarget: data.get(#scrollTarget, or: $value.scrollTarget),
  );

  @override
  NavigationStateCopyWith<$R2, NavigationState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NavigationStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

