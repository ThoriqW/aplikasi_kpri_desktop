// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createFixedSettingHash() =>
    r'ffe3137e23244298d92265569c9eeffb9990afe0';

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

/// See also [createFixedSetting].
@ProviderFor(createFixedSetting)
const createFixedSettingProvider = CreateFixedSettingFamily();

/// See also [createFixedSetting].
class CreateFixedSettingFamily extends Family<AsyncValue> {
  /// See also [createFixedSetting].
  const CreateFixedSettingFamily();

  /// See also [createFixedSetting].
  CreateFixedSettingProvider call(
    String nama,
    String nilai,
    String deskripsi,
  ) {
    return CreateFixedSettingProvider(
      nama,
      nilai,
      deskripsi,
    );
  }

  @override
  CreateFixedSettingProvider getProviderOverride(
    covariant CreateFixedSettingProvider provider,
  ) {
    return call(
      provider.nama,
      provider.nilai,
      provider.deskripsi,
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
  String? get name => r'createFixedSettingProvider';
}

/// See also [createFixedSetting].
class CreateFixedSettingProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [createFixedSetting].
  CreateFixedSettingProvider(
    String nama,
    String nilai,
    String deskripsi,
  ) : this._internal(
          (ref) => createFixedSetting(
            ref as CreateFixedSettingRef,
            nama,
            nilai,
            deskripsi,
          ),
          from: createFixedSettingProvider,
          name: r'createFixedSettingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createFixedSettingHash,
          dependencies: CreateFixedSettingFamily._dependencies,
          allTransitiveDependencies:
              CreateFixedSettingFamily._allTransitiveDependencies,
          nama: nama,
          nilai: nilai,
          deskripsi: deskripsi,
        );

  CreateFixedSettingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nama,
    required this.nilai,
    required this.deskripsi,
  }) : super.internal();

  final String nama;
  final String nilai;
  final String deskripsi;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(CreateFixedSettingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateFixedSettingProvider._internal(
        (ref) => create(ref as CreateFixedSettingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nama: nama,
        nilai: nilai,
        deskripsi: deskripsi,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _CreateFixedSettingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateFixedSettingProvider &&
        other.nama == nama &&
        other.nilai == nilai &&
        other.deskripsi == deskripsi;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nama.hashCode);
    hash = _SystemHash.combine(hash, nilai.hashCode);
    hash = _SystemHash.combine(hash, deskripsi.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateFixedSettingRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `nama` of this provider.
  String get nama;

  /// The parameter `nilai` of this provider.
  String get nilai;

  /// The parameter `deskripsi` of this provider.
  String get deskripsi;
}

class _CreateFixedSettingProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with CreateFixedSettingRef {
  _CreateFixedSettingProviderElement(super.provider);

  @override
  String get nama => (origin as CreateFixedSettingProvider).nama;
  @override
  String get nilai => (origin as CreateFixedSettingProvider).nilai;
  @override
  String get deskripsi => (origin as CreateFixedSettingProvider).deskripsi;
}

String _$getAllFixedSettingHash() =>
    r'ab7f4acbbf2a3024192be40ea9f767ab48a04ed9';

/// See also [getAllFixedSetting].
@ProviderFor(getAllFixedSetting)
const getAllFixedSettingProvider = GetAllFixedSettingFamily();

/// See also [getAllFixedSetting].
class GetAllFixedSettingFamily extends Family<AsyncValue> {
  /// See also [getAllFixedSetting].
  const GetAllFixedSettingFamily();

  /// See also [getAllFixedSetting].
  GetAllFixedSettingProvider call(
    String search,
    int perPage,
    int page,
  ) {
    return GetAllFixedSettingProvider(
      search,
      perPage,
      page,
    );
  }

  @override
  GetAllFixedSettingProvider getProviderOverride(
    covariant GetAllFixedSettingProvider provider,
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
  String? get name => r'getAllFixedSettingProvider';
}

/// See also [getAllFixedSetting].
class GetAllFixedSettingProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getAllFixedSetting].
  GetAllFixedSettingProvider(
    String search,
    int perPage,
    int page,
  ) : this._internal(
          (ref) => getAllFixedSetting(
            ref as GetAllFixedSettingRef,
            search,
            perPage,
            page,
          ),
          from: getAllFixedSettingProvider,
          name: r'getAllFixedSettingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllFixedSettingHash,
          dependencies: GetAllFixedSettingFamily._dependencies,
          allTransitiveDependencies:
              GetAllFixedSettingFamily._allTransitiveDependencies,
          search: search,
          perPage: perPage,
          page: page,
        );

  GetAllFixedSettingProvider._internal(
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
    FutureOr<Object?> Function(GetAllFixedSettingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllFixedSettingProvider._internal(
        (ref) => create(ref as GetAllFixedSettingRef),
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
    return _GetAllFixedSettingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllFixedSettingProvider &&
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
mixin GetAllFixedSettingRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `search` of this provider.
  String get search;

  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetAllFixedSettingProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with GetAllFixedSettingRef {
  _GetAllFixedSettingProviderElement(super.provider);

  @override
  String get search => (origin as GetAllFixedSettingProvider).search;
  @override
  int get perPage => (origin as GetAllFixedSettingProvider).perPage;
  @override
  int get page => (origin as GetAllFixedSettingProvider).page;
}

String _$deleteFixedSettingHash() =>
    r'5ee8bb5dcf1a5f76957149fd85ef200c1eb53343';

/// See also [deleteFixedSetting].
@ProviderFor(deleteFixedSetting)
const deleteFixedSettingProvider = DeleteFixedSettingFamily();

/// See also [deleteFixedSetting].
class DeleteFixedSettingFamily extends Family<AsyncValue> {
  /// See also [deleteFixedSetting].
  const DeleteFixedSettingFamily();

  /// See also [deleteFixedSetting].
  DeleteFixedSettingProvider call(
    String id,
  ) {
    return DeleteFixedSettingProvider(
      id,
    );
  }

  @override
  DeleteFixedSettingProvider getProviderOverride(
    covariant DeleteFixedSettingProvider provider,
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
  String? get name => r'deleteFixedSettingProvider';
}

/// See also [deleteFixedSetting].
class DeleteFixedSettingProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [deleteFixedSetting].
  DeleteFixedSettingProvider(
    String id,
  ) : this._internal(
          (ref) => deleteFixedSetting(
            ref as DeleteFixedSettingRef,
            id,
          ),
          from: deleteFixedSettingProvider,
          name: r'deleteFixedSettingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteFixedSettingHash,
          dependencies: DeleteFixedSettingFamily._dependencies,
          allTransitiveDependencies:
              DeleteFixedSettingFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteFixedSettingProvider._internal(
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
    FutureOr<Object?> Function(DeleteFixedSettingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteFixedSettingProvider._internal(
        (ref) => create(ref as DeleteFixedSettingRef),
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
    return _DeleteFixedSettingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteFixedSettingProvider && other.id == id;
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
mixin DeleteFixedSettingRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DeleteFixedSettingProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with DeleteFixedSettingRef {
  _DeleteFixedSettingProviderElement(super.provider);

  @override
  String get id => (origin as DeleteFixedSettingProvider).id;
}

String _$getFixedSettingHash() => r'186c0c35146f00d8b29d25e29fe231358795987c';

/// See also [getFixedSetting].
@ProviderFor(getFixedSetting)
const getFixedSettingProvider = GetFixedSettingFamily();

/// See also [getFixedSetting].
class GetFixedSettingFamily extends Family<AsyncValue> {
  /// See also [getFixedSetting].
  const GetFixedSettingFamily();

  /// See also [getFixedSetting].
  GetFixedSettingProvider call(
    String id,
  ) {
    return GetFixedSettingProvider(
      id,
    );
  }

  @override
  GetFixedSettingProvider getProviderOverride(
    covariant GetFixedSettingProvider provider,
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
  String? get name => r'getFixedSettingProvider';
}

/// See also [getFixedSetting].
class GetFixedSettingProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getFixedSetting].
  GetFixedSettingProvider(
    String id,
  ) : this._internal(
          (ref) => getFixedSetting(
            ref as GetFixedSettingRef,
            id,
          ),
          from: getFixedSettingProvider,
          name: r'getFixedSettingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFixedSettingHash,
          dependencies: GetFixedSettingFamily._dependencies,
          allTransitiveDependencies:
              GetFixedSettingFamily._allTransitiveDependencies,
          id: id,
        );

  GetFixedSettingProvider._internal(
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
    FutureOr<Object?> Function(GetFixedSettingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetFixedSettingProvider._internal(
        (ref) => create(ref as GetFixedSettingRef),
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
    return _GetFixedSettingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFixedSettingProvider && other.id == id;
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
mixin GetFixedSettingRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetFixedSettingProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with GetFixedSettingRef {
  _GetFixedSettingProviderElement(super.provider);

  @override
  String get id => (origin as GetFixedSettingProvider).id;
}

String _$settingModeNotifierHash() =>
    r'b9dd8e5daec06a2dbf90c2655b2c5af7d2c87204';

/// See also [SettingModeNotifier].
@ProviderFor(SettingModeNotifier)
final settingModeNotifierProvider =
    AutoDisposeNotifierProvider<SettingModeNotifier, SettingMode>.internal(
  SettingModeNotifier.new,
  name: r'settingModeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingModeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingModeNotifier = AutoDisposeNotifier<SettingMode>;
String _$totalFixedSettingHash() => r'3559706308412ef1460aecab2f980ff87375e53a';

/// See also [TotalFixedSetting].
@ProviderFor(TotalFixedSetting)
final totalFixedSettingProvider =
    AutoDisposeNotifierProvider<TotalFixedSetting, int>.internal(
  TotalFixedSetting.new,
  name: r'totalFixedSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalFixedSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalFixedSetting = AutoDisposeNotifier<int>;
String _$searchFixedSettingHash() =>
    r'83bf4ba41b00a9273dd5a355bbc041e37154efd3';

/// See also [SearchFixedSetting].
@ProviderFor(SearchFixedSetting)
final searchFixedSettingProvider = AutoDisposeNotifierProvider<
    SearchFixedSetting, Map<String, dynamic>>.internal(
  SearchFixedSetting.new,
  name: r'searchFixedSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchFixedSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchFixedSetting = AutoDisposeNotifier<Map<String, dynamic>>;
String _$idFixedSettingHash() => r'a492e065731776724b2ed839cf116d08e2a9993d';

/// See also [IdFixedSetting].
@ProviderFor(IdFixedSetting)
final idFixedSettingProvider =
    AutoDisposeNotifierProvider<IdFixedSetting, int>.internal(
  IdFixedSetting.new,
  name: r'idFixedSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$idFixedSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IdFixedSetting = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
