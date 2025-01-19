// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_units_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllWorkUnitsHash() => r'e71c0c7d1c2c029f3cef8ea86694216a25b17925';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getAllWorkUnits].
@ProviderFor(getAllWorkUnits)
const getAllWorkUnitsProvider = GetAllWorkUnitsFamily();

/// See also [getAllWorkUnits].
class GetAllWorkUnitsFamily extends Family<AsyncValue> {
  /// See also [getAllWorkUnits].
  const GetAllWorkUnitsFamily();

  /// See also [getAllWorkUnits].
  GetAllWorkUnitsProvider call(
    String search,
    int perPage,
    int page,
  ) {
    return GetAllWorkUnitsProvider(
      search,
      perPage,
      page,
    );
  }

  @override
  GetAllWorkUnitsProvider getProviderOverride(
    covariant GetAllWorkUnitsProvider provider,
  ) {
    return call(
      provider.search,
      provider.perPage,
      provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getAllWorkUnitsProvider';
}

/// See also [getAllWorkUnits].
class GetAllWorkUnitsProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getAllWorkUnits].
  GetAllWorkUnitsProvider(
    String search,
    int perPage,
    int page,
  ) : this._internal(
          (ref) => getAllWorkUnits(
            ref as GetAllWorkUnitsRef,
            search,
            perPage,
            page,
          ),
          from: getAllWorkUnitsProvider,
          name: r'getAllWorkUnitsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllWorkUnitsHash,
          dependencies: GetAllWorkUnitsFamily._dependencies,
          allTransitiveDependencies:
              GetAllWorkUnitsFamily._allTransitiveDependencies,
          search: search,
          perPage: perPage,
          page: page,
        );

  GetAllWorkUnitsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
    required this.perPage,
    required this.page,
  }) : super.internal();

  final String search;
  final int perPage;
  final int page;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(GetAllWorkUnitsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllWorkUnitsProvider._internal(
        (ref) => create(ref as GetAllWorkUnitsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
        perPage: perPage,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _GetAllWorkUnitsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllWorkUnitsProvider &&
        other.search == search &&
        other.perPage == perPage &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAllWorkUnitsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `search` of this provider.
  String get search;

  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetAllWorkUnitsProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with GetAllWorkUnitsRef {
  _GetAllWorkUnitsProviderElement(super.provider);

  @override
  String get search => (origin as GetAllWorkUnitsProvider).search;
  @override
  int get perPage => (origin as GetAllWorkUnitsProvider).perPage;
  @override
  int get page => (origin as GetAllWorkUnitsProvider).page;
}

String _$getWorkUnitHash() => r'5e2735dc4b28f950f55ab44732dfcd00c71cd29c';

/// See also [getWorkUnit].
@ProviderFor(getWorkUnit)
const getWorkUnitProvider = GetWorkUnitFamily();

/// See also [getWorkUnit].
class GetWorkUnitFamily extends Family<AsyncValue> {
  /// See also [getWorkUnit].
  const GetWorkUnitFamily();

  /// See also [getWorkUnit].
  GetWorkUnitProvider call(
    String id,
  ) {
    return GetWorkUnitProvider(
      id,
    );
  }

  @override
  GetWorkUnitProvider getProviderOverride(
    covariant GetWorkUnitProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getWorkUnitProvider';
}

/// See also [getWorkUnit].
class GetWorkUnitProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getWorkUnit].
  GetWorkUnitProvider(
    String id,
  ) : this._internal(
          (ref) => getWorkUnit(
            ref as GetWorkUnitRef,
            id,
          ),
          from: getWorkUnitProvider,
          name: r'getWorkUnitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWorkUnitHash,
          dependencies: GetWorkUnitFamily._dependencies,
          allTransitiveDependencies:
              GetWorkUnitFamily._allTransitiveDependencies,
          id: id,
        );

  GetWorkUnitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(GetWorkUnitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWorkUnitProvider._internal(
        (ref) => create(ref as GetWorkUnitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _GetWorkUnitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWorkUnitProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetWorkUnitRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetWorkUnitProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with GetWorkUnitRef {
  _GetWorkUnitProviderElement(super.provider);

  @override
  String get id => (origin as GetWorkUnitProvider).id;
}

String _$addWorkUnitHash() => r'd0aaf18f9562d2c748479c60cfdbba15c8c9ec18';

/// See also [addWorkUnit].
@ProviderFor(addWorkUnit)
const addWorkUnitProvider = AddWorkUnitFamily();

/// See also [addWorkUnit].
class AddWorkUnitFamily extends Family<AsyncValue> {
  /// See also [addWorkUnit].
  const AddWorkUnitFamily();

  /// See also [addWorkUnit].
  AddWorkUnitProvider call(
    String namaWorkUnit,
    String kodeWorkUnit,
  ) {
    return AddWorkUnitProvider(
      namaWorkUnit,
      kodeWorkUnit,
    );
  }

  @override
  AddWorkUnitProvider getProviderOverride(
    covariant AddWorkUnitProvider provider,
  ) {
    return call(
      provider.namaWorkUnit,
      provider.kodeWorkUnit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addWorkUnitProvider';
}

/// See also [addWorkUnit].
class AddWorkUnitProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [addWorkUnit].
  AddWorkUnitProvider(
    String namaWorkUnit,
    String kodeWorkUnit,
  ) : this._internal(
          (ref) => addWorkUnit(
            ref as AddWorkUnitRef,
            namaWorkUnit,
            kodeWorkUnit,
          ),
          from: addWorkUnitProvider,
          name: r'addWorkUnitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addWorkUnitHash,
          dependencies: AddWorkUnitFamily._dependencies,
          allTransitiveDependencies:
              AddWorkUnitFamily._allTransitiveDependencies,
          namaWorkUnit: namaWorkUnit,
          kodeWorkUnit: kodeWorkUnit,
        );

  AddWorkUnitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.namaWorkUnit,
    required this.kodeWorkUnit,
  }) : super.internal();

  final String namaWorkUnit;
  final String kodeWorkUnit;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(AddWorkUnitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddWorkUnitProvider._internal(
        (ref) => create(ref as AddWorkUnitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        namaWorkUnit: namaWorkUnit,
        kodeWorkUnit: kodeWorkUnit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _AddWorkUnitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddWorkUnitProvider &&
        other.namaWorkUnit == namaWorkUnit &&
        other.kodeWorkUnit == kodeWorkUnit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, namaWorkUnit.hashCode);
    hash = _SystemHash.combine(hash, kodeWorkUnit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddWorkUnitRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `namaWorkUnit` of this provider.
  String get namaWorkUnit;

  /// The parameter `kodeWorkUnit` of this provider.
  String get kodeWorkUnit;
}

class _AddWorkUnitProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with AddWorkUnitRef {
  _AddWorkUnitProviderElement(super.provider);

  @override
  String get namaWorkUnit => (origin as AddWorkUnitProvider).namaWorkUnit;
  @override
  String get kodeWorkUnit => (origin as AddWorkUnitProvider).kodeWorkUnit;
}

String _$updateWorkUnitHash() => r'15223ae245985540b84a82661a194869d1763ae2';

/// See also [updateWorkUnit].
@ProviderFor(updateWorkUnit)
const updateWorkUnitProvider = UpdateWorkUnitFamily();

/// See also [updateWorkUnit].
class UpdateWorkUnitFamily extends Family<AsyncValue> {
  /// See also [updateWorkUnit].
  const UpdateWorkUnitFamily();

  /// See also [updateWorkUnit].
  UpdateWorkUnitProvider call(
    String id,
    String namaWorkUnit,
    String kodeWorkUnit,
  ) {
    return UpdateWorkUnitProvider(
      id,
      namaWorkUnit,
      kodeWorkUnit,
    );
  }

  @override
  UpdateWorkUnitProvider getProviderOverride(
    covariant UpdateWorkUnitProvider provider,
  ) {
    return call(
      provider.id,
      provider.namaWorkUnit,
      provider.kodeWorkUnit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateWorkUnitProvider';
}

/// See also [updateWorkUnit].
class UpdateWorkUnitProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateWorkUnit].
  UpdateWorkUnitProvider(
    String id,
    String namaWorkUnit,
    String kodeWorkUnit,
  ) : this._internal(
          (ref) => updateWorkUnit(
            ref as UpdateWorkUnitRef,
            id,
            namaWorkUnit,
            kodeWorkUnit,
          ),
          from: updateWorkUnitProvider,
          name: r'updateWorkUnitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateWorkUnitHash,
          dependencies: UpdateWorkUnitFamily._dependencies,
          allTransitiveDependencies:
              UpdateWorkUnitFamily._allTransitiveDependencies,
          id: id,
          namaWorkUnit: namaWorkUnit,
          kodeWorkUnit: kodeWorkUnit,
        );

  UpdateWorkUnitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.namaWorkUnit,
    required this.kodeWorkUnit,
  }) : super.internal();

  final String id;
  final String namaWorkUnit;
  final String kodeWorkUnit;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UpdateWorkUnitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateWorkUnitProvider._internal(
        (ref) => create(ref as UpdateWorkUnitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        namaWorkUnit: namaWorkUnit,
        kodeWorkUnit: kodeWorkUnit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UpdateWorkUnitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateWorkUnitProvider &&
        other.id == id &&
        other.namaWorkUnit == namaWorkUnit &&
        other.kodeWorkUnit == kodeWorkUnit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, namaWorkUnit.hashCode);
    hash = _SystemHash.combine(hash, kodeWorkUnit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateWorkUnitRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `namaWorkUnit` of this provider.
  String get namaWorkUnit;

  /// The parameter `kodeWorkUnit` of this provider.
  String get kodeWorkUnit;
}

class _UpdateWorkUnitProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with UpdateWorkUnitRef {
  _UpdateWorkUnitProviderElement(super.provider);

  @override
  String get id => (origin as UpdateWorkUnitProvider).id;
  @override
  String get namaWorkUnit => (origin as UpdateWorkUnitProvider).namaWorkUnit;
  @override
  String get kodeWorkUnit => (origin as UpdateWorkUnitProvider).kodeWorkUnit;
}

String _$deleteWorkUnitHash() => r'd9e8ce2adbba4cb3620015c81526910eefb2227c';

/// See also [deleteWorkUnit].
@ProviderFor(deleteWorkUnit)
const deleteWorkUnitProvider = DeleteWorkUnitFamily();

/// See also [deleteWorkUnit].
class DeleteWorkUnitFamily extends Family<AsyncValue> {
  /// See also [deleteWorkUnit].
  const DeleteWorkUnitFamily();

  /// See also [deleteWorkUnit].
  DeleteWorkUnitProvider call(
    String id,
  ) {
    return DeleteWorkUnitProvider(
      id,
    );
  }

  @override
  DeleteWorkUnitProvider getProviderOverride(
    covariant DeleteWorkUnitProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteWorkUnitProvider';
}

/// See also [deleteWorkUnit].
class DeleteWorkUnitProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [deleteWorkUnit].
  DeleteWorkUnitProvider(
    String id,
  ) : this._internal(
          (ref) => deleteWorkUnit(
            ref as DeleteWorkUnitRef,
            id,
          ),
          from: deleteWorkUnitProvider,
          name: r'deleteWorkUnitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteWorkUnitHash,
          dependencies: DeleteWorkUnitFamily._dependencies,
          allTransitiveDependencies:
              DeleteWorkUnitFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteWorkUnitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(DeleteWorkUnitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteWorkUnitProvider._internal(
        (ref) => create(ref as DeleteWorkUnitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _DeleteWorkUnitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteWorkUnitProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteWorkUnitRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DeleteWorkUnitProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with DeleteWorkUnitRef {
  _DeleteWorkUnitProviderElement(super.provider);

  @override
  String get id => (origin as DeleteWorkUnitProvider).id;
}

String _$getDropDownWorkUnitHash() =>
    r'40093737d489baceac8048e2d162597bc57ae3ed';

/// See also [getDropDownWorkUnit].
@ProviderFor(getDropDownWorkUnit)
final getDropDownWorkUnitProvider = AutoDisposeFutureProvider<Object?>.internal(
  getDropDownWorkUnit,
  name: r'getDropDownWorkUnitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDropDownWorkUnitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetDropDownWorkUnitRef = AutoDisposeFutureProviderRef<Object?>;
String _$totalPageWorkUnitsHash() =>
    r'fdde12d5cfb1e2b564bdd4e6b84b0aa86ad79972';

/// See also [TotalPageWorkUnits].
@ProviderFor(TotalPageWorkUnits)
final totalPageWorkUnitsProvider =
    AutoDisposeNotifierProvider<TotalPageWorkUnits, int>.internal(
  TotalPageWorkUnits.new,
  name: r'totalPageWorkUnitsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalPageWorkUnitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalPageWorkUnits = AutoDisposeNotifier<int>;
String _$searchWorkUnitHash() => r'59a7a181e952badeed6ce2101bbfa2442be1970d';

/// See also [SearchWorkUnit].
@ProviderFor(SearchWorkUnit)
final searchWorkUnitProvider =
    AutoDisposeNotifierProvider<SearchWorkUnit, Map<String, dynamic>>.internal(
  SearchWorkUnit.new,
  name: r'searchWorkUnitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchWorkUnitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchWorkUnit = AutoDisposeNotifier<Map<String, dynamic>>;
String _$idDropDownWorkUnitNotifierHash() =>
    r'ceeadbfc19cc5a38dfa422884889d63245a129e3';

/// See also [IdDropDownWorkUnitNotifier].
@ProviderFor(IdDropDownWorkUnitNotifier)
final idDropDownWorkUnitNotifierProvider =
    AutoDisposeNotifierProvider<IdDropDownWorkUnitNotifier, int>.internal(
  IdDropDownWorkUnitNotifier.new,
  name: r'idDropDownWorkUnitNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$idDropDownWorkUnitNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IdDropDownWorkUnitNotifier = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
