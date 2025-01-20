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
    r'a95f60aa7d7c26b8c6e15e930f4c8d9abeba2f17';

/// See also [createMemberTagihan].
@ProviderFor(createMemberTagihan)
const createMemberTagihanProvider = CreateMemberTagihanFamily();

/// See also [createMemberTagihan].
class CreateMemberTagihanFamily extends Family<AsyncValue> {
  /// See also [createMemberTagihan].
  const CreateMemberTagihanFamily();

  /// See also [createMemberTagihan].
  CreateMemberTagihanProvider call(
    int tahun,
    int bulan,
  ) {
    return CreateMemberTagihanProvider(
      tahun,
      bulan,
    );
  }

  @override
  CreateMemberTagihanProvider getProviderOverride(
    covariant CreateMemberTagihanProvider provider,
  ) {
    return call(
      provider.tahun,
      provider.bulan,
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
    int tahun,
    int bulan,
  ) : this._internal(
          (ref) => createMemberTagihan(
            ref as CreateMemberTagihanRef,
            tahun,
            bulan,
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
          bulan: bulan,
        );

  CreateMemberTagihanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
    required this.bulan,
  }) : super.internal();

  final int tahun;
  final int bulan;

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
        bulan: bulan,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _CreateMemberTagihanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateMemberTagihanProvider &&
        other.tahun == tahun &&
        other.bulan == bulan;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, bulan.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateMemberTagihanRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  int get tahun;

  /// The parameter `bulan` of this provider.
  int get bulan;
}

class _CreateMemberTagihanProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with CreateMemberTagihanRef {
  _CreateMemberTagihanProviderElement(super.provider);

  @override
  int get tahun => (origin as CreateMemberTagihanProvider).tahun;
  @override
  int get bulan => (origin as CreateMemberTagihanProvider).bulan;
}

String _$updateMemberTagihanHash() =>
    r'7f0ba89b0b35668fcd2126fc816ba7158d2d98fc';

/// See also [updateMemberTagihan].
@ProviderFor(updateMemberTagihan)
const updateMemberTagihanProvider = UpdateMemberTagihanFamily();

/// See also [updateMemberTagihan].
class UpdateMemberTagihanFamily extends Family<AsyncValue> {
  /// See also [updateMemberTagihan].
  const UpdateMemberTagihanFamily();

  /// See also [updateMemberTagihan].
  UpdateMemberTagihanProvider call(
    int tahun,
    int bulan,
    Map<String, dynamic> updateTagihanObject,
  ) {
    return UpdateMemberTagihanProvider(
      tahun,
      bulan,
      updateTagihanObject,
    );
  }

  @override
  UpdateMemberTagihanProvider getProviderOverride(
    covariant UpdateMemberTagihanProvider provider,
  ) {
    return call(
      provider.tahun,
      provider.bulan,
      provider.updateTagihanObject,
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
  String? get name => r'updateMemberTagihanProvider';
}

/// See also [updateMemberTagihan].
class UpdateMemberTagihanProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateMemberTagihan].
  UpdateMemberTagihanProvider(
    int tahun,
    int bulan,
    Map<String, dynamic> updateTagihanObject,
  ) : this._internal(
          (ref) => updateMemberTagihan(
            ref as UpdateMemberTagihanRef,
            tahun,
            bulan,
            updateTagihanObject,
          ),
          from: updateMemberTagihanProvider,
          name: r'updateMemberTagihanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMemberTagihanHash,
          dependencies: UpdateMemberTagihanFamily._dependencies,
          allTransitiveDependencies:
              UpdateMemberTagihanFamily._allTransitiveDependencies,
          tahun: tahun,
          bulan: bulan,
          updateTagihanObject: updateTagihanObject,
        );

  UpdateMemberTagihanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
    required this.bulan,
    required this.updateTagihanObject,
  }) : super.internal();

  final int tahun;
  final int bulan;
  final Map<String, dynamic> updateTagihanObject;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UpdateMemberTagihanRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateMemberTagihanProvider._internal(
        (ref) => create(ref as UpdateMemberTagihanRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tahun: tahun,
        bulan: bulan,
        updateTagihanObject: updateTagihanObject,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UpdateMemberTagihanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateMemberTagihanProvider &&
        other.tahun == tahun &&
        other.bulan == bulan &&
        other.updateTagihanObject == updateTagihanObject;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, bulan.hashCode);
    hash = _SystemHash.combine(hash, updateTagihanObject.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateMemberTagihanRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  int get tahun;

  /// The parameter `bulan` of this provider.
  int get bulan;

  /// The parameter `updateTagihanObject` of this provider.
  Map<String, dynamic> get updateTagihanObject;
}

class _UpdateMemberTagihanProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with UpdateMemberTagihanRef {
  _UpdateMemberTagihanProviderElement(super.provider);

  @override
  int get tahun => (origin as UpdateMemberTagihanProvider).tahun;
  @override
  int get bulan => (origin as UpdateMemberTagihanProvider).bulan;
  @override
  Map<String, dynamic> get updateTagihanObject =>
      (origin as UpdateMemberTagihanProvider).updateTagihanObject;
}

String _$deleteMemberTagihanHash() =>
    r'3afe3a42e7afda9a99d1ec5c6796618244ea616f';

/// See also [deleteMemberTagihan].
@ProviderFor(deleteMemberTagihan)
const deleteMemberTagihanProvider = DeleteMemberTagihanFamily();

/// See also [deleteMemberTagihan].
class DeleteMemberTagihanFamily extends Family<AsyncValue> {
  /// See also [deleteMemberTagihan].
  const DeleteMemberTagihanFamily();

  /// See also [deleteMemberTagihan].
  DeleteMemberTagihanProvider call(
    String id,
    String tahun,
    String bulan,
  ) {
    return DeleteMemberTagihanProvider(
      id,
      tahun,
      bulan,
    );
  }

  @override
  DeleteMemberTagihanProvider getProviderOverride(
    covariant DeleteMemberTagihanProvider provider,
  ) {
    return call(
      provider.id,
      provider.tahun,
      provider.bulan,
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
  String? get name => r'deleteMemberTagihanProvider';
}

/// See also [deleteMemberTagihan].
class DeleteMemberTagihanProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [deleteMemberTagihan].
  DeleteMemberTagihanProvider(
    String id,
    String tahun,
    String bulan,
  ) : this._internal(
          (ref) => deleteMemberTagihan(
            ref as DeleteMemberTagihanRef,
            id,
            tahun,
            bulan,
          ),
          from: deleteMemberTagihanProvider,
          name: r'deleteMemberTagihanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteMemberTagihanHash,
          dependencies: DeleteMemberTagihanFamily._dependencies,
          allTransitiveDependencies:
              DeleteMemberTagihanFamily._allTransitiveDependencies,
          id: id,
          tahun: tahun,
          bulan: bulan,
        );

  DeleteMemberTagihanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.tahun,
    required this.bulan,
  }) : super.internal();

  final String id;
  final String tahun;
  final String bulan;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(DeleteMemberTagihanRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteMemberTagihanProvider._internal(
        (ref) => create(ref as DeleteMemberTagihanRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        tahun: tahun,
        bulan: bulan,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _DeleteMemberTagihanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteMemberTagihanProvider &&
        other.id == id &&
        other.tahun == tahun &&
        other.bulan == bulan;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, bulan.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteMemberTagihanRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `tahun` of this provider.
  String get tahun;

  /// The parameter `bulan` of this provider.
  String get bulan;
}

class _DeleteMemberTagihanProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with DeleteMemberTagihanRef {
  _DeleteMemberTagihanProviderElement(super.provider);

  @override
  String get id => (origin as DeleteMemberTagihanProvider).id;
  @override
  String get tahun => (origin as DeleteMemberTagihanProvider).tahun;
  @override
  String get bulan => (origin as DeleteMemberTagihanProvider).bulan;
}

String _$transferMemberTagihanHash() =>
    r'e9c3d9c1ddc53fbefd620ddb8ce820cef98bc8e9';

/// See also [transferMemberTagihan].
@ProviderFor(transferMemberTagihan)
const transferMemberTagihanProvider = TransferMemberTagihanFamily();

/// See also [transferMemberTagihan].
class TransferMemberTagihanFamily extends Family<AsyncValue> {
  /// See also [transferMemberTagihan].
  const TransferMemberTagihanFamily();

  /// See also [transferMemberTagihan].
  TransferMemberTagihanProvider call(
    String id,
    String tahun,
    String workUnitId,
    String bulan,
  ) {
    return TransferMemberTagihanProvider(
      id,
      tahun,
      workUnitId,
      bulan,
    );
  }

  @override
  TransferMemberTagihanProvider getProviderOverride(
    covariant TransferMemberTagihanProvider provider,
  ) {
    return call(
      provider.id,
      provider.tahun,
      provider.workUnitId,
      provider.bulan,
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
  String? get name => r'transferMemberTagihanProvider';
}

/// See also [transferMemberTagihan].
class TransferMemberTagihanProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [transferMemberTagihan].
  TransferMemberTagihanProvider(
    String id,
    String tahun,
    String workUnitId,
    String bulan,
  ) : this._internal(
          (ref) => transferMemberTagihan(
            ref as TransferMemberTagihanRef,
            id,
            tahun,
            workUnitId,
            bulan,
          ),
          from: transferMemberTagihanProvider,
          name: r'transferMemberTagihanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transferMemberTagihanHash,
          dependencies: TransferMemberTagihanFamily._dependencies,
          allTransitiveDependencies:
              TransferMemberTagihanFamily._allTransitiveDependencies,
          id: id,
          tahun: tahun,
          workUnitId: workUnitId,
          bulan: bulan,
        );

  TransferMemberTagihanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.tahun,
    required this.workUnitId,
    required this.bulan,
  }) : super.internal();

  final String id;
  final String tahun;
  final String workUnitId;
  final String bulan;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(TransferMemberTagihanRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransferMemberTagihanProvider._internal(
        (ref) => create(ref as TransferMemberTagihanRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        tahun: tahun,
        workUnitId: workUnitId,
        bulan: bulan,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _TransferMemberTagihanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransferMemberTagihanProvider &&
        other.id == id &&
        other.tahun == tahun &&
        other.workUnitId == workUnitId &&
        other.bulan == bulan;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);
    hash = _SystemHash.combine(hash, bulan.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransferMemberTagihanRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `tahun` of this provider.
  String get tahun;

  /// The parameter `workUnitId` of this provider.
  String get workUnitId;

  /// The parameter `bulan` of this provider.
  String get bulan;
}

class _TransferMemberTagihanProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with TransferMemberTagihanRef {
  _TransferMemberTagihanProviderElement(super.provider);

  @override
  String get id => (origin as TransferMemberTagihanProvider).id;
  @override
  String get tahun => (origin as TransferMemberTagihanProvider).tahun;
  @override
  String get workUnitId => (origin as TransferMemberTagihanProvider).workUnitId;
  @override
  String get bulan => (origin as TransferMemberTagihanProvider).bulan;
}

String _$updateTahunBulanTagihanHash() =>
    r'45d3613d61982a4550c88a91ad44b9822f42cfdf';

/// See also [updateTahunBulanTagihan].
@ProviderFor(updateTahunBulanTagihan)
const updateTahunBulanTagihanProvider = UpdateTahunBulanTagihanFamily();

/// See also [updateTahunBulanTagihan].
class UpdateTahunBulanTagihanFamily extends Family<AsyncValue> {
  /// See also [updateTahunBulanTagihan].
  const UpdateTahunBulanTagihanFamily();

  /// See also [updateTahunBulanTagihan].
  UpdateTahunBulanTagihanProvider call(
    String tahun,
    String newTahun,
    String bulan,
    String newBulan,
  ) {
    return UpdateTahunBulanTagihanProvider(
      tahun,
      newTahun,
      bulan,
      newBulan,
    );
  }

  @override
  UpdateTahunBulanTagihanProvider getProviderOverride(
    covariant UpdateTahunBulanTagihanProvider provider,
  ) {
    return call(
      provider.tahun,
      provider.newTahun,
      provider.bulan,
      provider.newBulan,
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
  String? get name => r'updateTahunBulanTagihanProvider';
}

/// See also [updateTahunBulanTagihan].
class UpdateTahunBulanTagihanProvider
    extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateTahunBulanTagihan].
  UpdateTahunBulanTagihanProvider(
    String tahun,
    String newTahun,
    String bulan,
    String newBulan,
  ) : this._internal(
          (ref) => updateTahunBulanTagihan(
            ref as UpdateTahunBulanTagihanRef,
            tahun,
            newTahun,
            bulan,
            newBulan,
          ),
          from: updateTahunBulanTagihanProvider,
          name: r'updateTahunBulanTagihanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateTahunBulanTagihanHash,
          dependencies: UpdateTahunBulanTagihanFamily._dependencies,
          allTransitiveDependencies:
              UpdateTahunBulanTagihanFamily._allTransitiveDependencies,
          tahun: tahun,
          newTahun: newTahun,
          bulan: bulan,
          newBulan: newBulan,
        );

  UpdateTahunBulanTagihanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
    required this.newTahun,
    required this.bulan,
    required this.newBulan,
  }) : super.internal();

  final String tahun;
  final String newTahun;
  final String bulan;
  final String newBulan;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UpdateTahunBulanTagihanRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateTahunBulanTagihanProvider._internal(
        (ref) => create(ref as UpdateTahunBulanTagihanRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tahun: tahun,
        newTahun: newTahun,
        bulan: bulan,
        newBulan: newBulan,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UpdateTahunBulanTagihanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateTahunBulanTagihanProvider &&
        other.tahun == tahun &&
        other.newTahun == newTahun &&
        other.bulan == bulan &&
        other.newBulan == newBulan;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, newTahun.hashCode);
    hash = _SystemHash.combine(hash, bulan.hashCode);
    hash = _SystemHash.combine(hash, newBulan.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateTahunBulanTagihanRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  String get tahun;

  /// The parameter `newTahun` of this provider.
  String get newTahun;

  /// The parameter `bulan` of this provider.
  String get bulan;

  /// The parameter `newBulan` of this provider.
  String get newBulan;
}

class _UpdateTahunBulanTagihanProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with UpdateTahunBulanTagihanRef {
  _UpdateTahunBulanTagihanProviderElement(super.provider);

  @override
  String get tahun => (origin as UpdateTahunBulanTagihanProvider).tahun;
  @override
  String get newTahun => (origin as UpdateTahunBulanTagihanProvider).newTahun;
  @override
  String get bulan => (origin as UpdateTahunBulanTagihanProvider).bulan;
  @override
  String get newBulan => (origin as UpdateTahunBulanTagihanProvider).newBulan;
}

String _$deleteBulanTagihanHash() =>
    r'6e1c029b6c0188c5ff3c99e1a7f57e35f1f853c9';

/// See also [deleteBulanTagihan].
@ProviderFor(deleteBulanTagihan)
const deleteBulanTagihanProvider = DeleteBulanTagihanFamily();

/// See also [deleteBulanTagihan].
class DeleteBulanTagihanFamily extends Family<AsyncValue> {
  /// See also [deleteBulanTagihan].
  const DeleteBulanTagihanFamily();

  /// See also [deleteBulanTagihan].
  DeleteBulanTagihanProvider call(
    String tahun,
    String bulan,
  ) {
    return DeleteBulanTagihanProvider(
      tahun,
      bulan,
    );
  }

  @override
  DeleteBulanTagihanProvider getProviderOverride(
    covariant DeleteBulanTagihanProvider provider,
  ) {
    return call(
      provider.tahun,
      provider.bulan,
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
  String? get name => r'deleteBulanTagihanProvider';
}

/// See also [deleteBulanTagihan].
class DeleteBulanTagihanProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [deleteBulanTagihan].
  DeleteBulanTagihanProvider(
    String tahun,
    String bulan,
  ) : this._internal(
          (ref) => deleteBulanTagihan(
            ref as DeleteBulanTagihanRef,
            tahun,
            bulan,
          ),
          from: deleteBulanTagihanProvider,
          name: r'deleteBulanTagihanProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteBulanTagihanHash,
          dependencies: DeleteBulanTagihanFamily._dependencies,
          allTransitiveDependencies:
              DeleteBulanTagihanFamily._allTransitiveDependencies,
          tahun: tahun,
          bulan: bulan,
        );

  DeleteBulanTagihanProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
    required this.bulan,
  }) : super.internal();

  final String tahun;
  final String bulan;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(DeleteBulanTagihanRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteBulanTagihanProvider._internal(
        (ref) => create(ref as DeleteBulanTagihanRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tahun: tahun,
        bulan: bulan,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _DeleteBulanTagihanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteBulanTagihanProvider &&
        other.tahun == tahun &&
        other.bulan == bulan;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, bulan.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteBulanTagihanRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  String get tahun;

  /// The parameter `bulan` of this provider.
  String get bulan;
}

class _DeleteBulanTagihanProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with DeleteBulanTagihanRef {
  _DeleteBulanTagihanProviderElement(super.provider);

  @override
  String get tahun => (origin as DeleteBulanTagihanProvider).tahun;
  @override
  String get bulan => (origin as DeleteBulanTagihanProvider).bulan;
}

String _$totalPageBillsHash() => r'b1973e2b8c66abf7a711b84a31ece2d701477d11';

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
String _$searchBillsHash() => r'fccddd520f5fa22b7e7699f12bbf4b6f081dbd60';

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
String _$dataMemberTagihanNotifierHash() =>
    r'4bc43d691a750a38afb2c65a337525898c6611c7';

/// See also [DataMemberTagihanNotifier].
@ProviderFor(DataMemberTagihanNotifier)
final dataMemberTagihanNotifierProvider = AutoDisposeNotifierProvider<
    DataMemberTagihanNotifier, Map<String, dynamic>>.internal(
  DataMemberTagihanNotifier.new,
  name: r'dataMemberTagihanNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dataMemberTagihanNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataMemberTagihanNotifier = AutoDisposeNotifier<Map<String, dynamic>>;
String _$dataTransferMemberTagihanNotifierHash() =>
    r'cd011f0ec7bddfe7d1ac8be2f53ab042c104b1b2';

/// See also [DataTransferMemberTagihanNotifier].
@ProviderFor(DataTransferMemberTagihanNotifier)
final dataTransferMemberTagihanNotifierProvider = AutoDisposeNotifierProvider<
    DataTransferMemberTagihanNotifier, Map<String, dynamic>>.internal(
  DataTransferMemberTagihanNotifier.new,
  name: r'dataTransferMemberTagihanNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dataTransferMemberTagihanNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataTransferMemberTagihanNotifier
    = AutoDisposeNotifier<Map<String, dynamic>>;
String _$tagihanModeNotifierHash() =>
    r'80d5631a4c718006b6fd40b2d1885a96a9a3273d';

/// See also [TagihanModeNotifier].
@ProviderFor(TagihanModeNotifier)
final tagihanModeNotifierProvider =
    AutoDisposeNotifierProvider<TagihanModeNotifier, TagihanMode>.internal(
  TagihanModeNotifier.new,
  name: r'tagihanModeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tagihanModeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TagihanModeNotifier = AutoDisposeNotifier<TagihanMode>;
String _$editTagihanNotifierHash() =>
    r'eea2046a88e6a41a373674dca71203a6c258cb83';

/// See also [EditTagihanNotifier].
@ProviderFor(EditTagihanNotifier)
final editTagihanNotifierProvider = AutoDisposeNotifierProvider<
    EditTagihanNotifier, Map<String, dynamic>>.internal(
  EditTagihanNotifier.new,
  name: r'editTagihanNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editTagihanNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditTagihanNotifier = AutoDisposeNotifier<Map<String, dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
