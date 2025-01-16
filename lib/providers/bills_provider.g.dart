// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bills_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllBillsMembersHash() =>
    r'3db296d48de088d1ad357e672c085c9bbc8b02b0';

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

/// See also [getAllBillsMembers].
@ProviderFor(getAllBillsMembers)
const getAllBillsMembersProvider = GetAllBillsMembersFamily();

/// See also [getAllBillsMembers].
class GetAllBillsMembersFamily extends Family<AsyncValue> {
  /// See also [getAllBillsMembers].
  const GetAllBillsMembersFamily();

  /// See also [getAllBillsMembers].
  GetAllBillsMembersProvider call(
    int tahun,
    int workUnitId,
    String search,
    int bulan,
    int perPage,
    int page,
  ) {
    return GetAllBillsMembersProvider(
      tahun,
      workUnitId,
      search,
      bulan,
      perPage,
      page,
    );
  }

  @override
  GetAllBillsMembersProvider getProviderOverride(
    covariant GetAllBillsMembersProvider provider,
  ) {
    return call(
      provider.tahun,
      provider.workUnitId,
      provider.search,
      provider.bulan,
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
  String? get name => r'getAllBillsMembersProvider';
}

/// See also [getAllBillsMembers].
class GetAllBillsMembersProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getAllBillsMembers].
  GetAllBillsMembersProvider(
    int tahun,
    int workUnitId,
    String search,
    int bulan,
    int perPage,
    int page,
  ) : this._internal(
          (ref) => getAllBillsMembers(
            ref as GetAllBillsMembersRef,
            tahun,
            workUnitId,
            search,
            bulan,
            perPage,
            page,
          ),
          from: getAllBillsMembersProvider,
          name: r'getAllBillsMembersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllBillsMembersHash,
          dependencies: GetAllBillsMembersFamily._dependencies,
          allTransitiveDependencies:
              GetAllBillsMembersFamily._allTransitiveDependencies,
          tahun: tahun,
          workUnitId: workUnitId,
          search: search,
          bulan: bulan,
          perPage: perPage,
          page: page,
        );

  GetAllBillsMembersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
    required this.workUnitId,
    required this.search,
    required this.bulan,
    required this.perPage,
    required this.page,
  }) : super.internal();

  final int tahun;
  final int workUnitId;
  final String search;
  final int bulan;
  final int perPage;
  final int page;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(GetAllBillsMembersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllBillsMembersProvider._internal(
        (ref) => create(ref as GetAllBillsMembersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tahun: tahun,
        workUnitId: workUnitId,
        search: search,
        bulan: bulan,
        perPage: perPage,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _GetAllBillsMembersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllBillsMembersProvider &&
        other.tahun == tahun &&
        other.workUnitId == workUnitId &&
        other.search == search &&
        other.bulan == bulan &&
        other.perPage == perPage &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, bulan.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAllBillsMembersRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  int get tahun;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;

  /// The parameter `search` of this provider.
  String get search;

  /// The parameter `bulan` of this provider.
  int get bulan;

  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetAllBillsMembersProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with GetAllBillsMembersRef {
  _GetAllBillsMembersProviderElement(super.provider);

  @override
  int get tahun => (origin as GetAllBillsMembersProvider).tahun;
  @override
  int get workUnitId => (origin as GetAllBillsMembersProvider).workUnitId;
  @override
  String get search => (origin as GetAllBillsMembersProvider).search;
  @override
  int get bulan => (origin as GetAllBillsMembersProvider).bulan;
  @override
  int get perPage => (origin as GetAllBillsMembersProvider).perPage;
  @override
  int get page => (origin as GetAllBillsMembersProvider).page;
}

String _$createMemberTagihanHash() =>
    r'e6f7164c447b2b2a40ceced94b807405f320fe6e';

/// See also [createMemberTagihan].
@ProviderFor(createMemberTagihan)
const createMemberTagihanProvider = CreateMemberTagihanFamily();

/// See also [createMemberTagihan].
class CreateMemberTagihanFamily extends Family<AsyncValue> {
  /// See also [createMemberTagihan].
  const CreateMemberTagihanFamily();

  /// See also [createMemberTagihan].
  CreateMemberTagihanProvider call(
    String tahun,
  ) {
    return CreateMemberTagihanProvider(
      tahun,
    );
  }

  @override
  CreateMemberTagihanProvider getProviderOverride(
    covariant CreateMemberTagihanProvider provider,
  ) {
    return call(
      provider.tahun,
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
  String? get name => r'createMemberTagihanProvider';
}

/// See also [createMemberTagihan].
class CreateMemberTagihanProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [createMemberTagihan].
  CreateMemberTagihanProvider(
    String tahun,
  ) : this._internal(
          (ref) => createMemberTagihan(
            ref as CreateMemberTagihanRef,
            tahun,
          ),
          from: createMemberTagihanProvider,
          name: r'createMemberTagihanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createMemberTagihanHash,
          dependencies: CreateMemberTagihanFamily._dependencies,
          allTransitiveDependencies:
              CreateMemberTagihanFamily._allTransitiveDependencies,
          tahun: tahun,
        );

  CreateMemberTagihanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
  }) : super.internal();

  final String tahun;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(CreateMemberTagihanRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateMemberTagihanProvider._internal(
        (ref) => create(ref as CreateMemberTagihanRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tahun: tahun,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _CreateMemberTagihanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateMemberTagihanProvider && other.tahun == tahun;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateMemberTagihanRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  String get tahun;
}

class _CreateMemberTagihanProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with CreateMemberTagihanRef {
  _CreateMemberTagihanProviderElement(super.provider);

  @override
  String get tahun => (origin as CreateMemberTagihanProvider).tahun;
}

String _$totalPageBillsHash() => r'49b2985c3266048e8490a3f44e3277e2c64d7715';

/// See also [TotalPageBills].
@ProviderFor(TotalPageBills)
final totalPageBillsProvider =
    AutoDisposeNotifierProvider<TotalPageBills, int>.internal(
  TotalPageBills.new,
  name: r'totalPageBillsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalPageBillsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalPageBills = AutoDisposeNotifier<int>;
String _$searchBillsHash() => r'aa7fc576e1257aa5fbd1febd4ceffcd419c46df6';

/// See also [SearchBills].
@ProviderFor(SearchBills)
final searchBillsProvider =
    AutoDisposeNotifierProvider<SearchBills, Map<String, dynamic>>.internal(
  SearchBills.new,
  name: r'searchBillsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchBillsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchBills = AutoDisposeNotifier<Map<String, dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
