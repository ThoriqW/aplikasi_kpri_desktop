// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllSavingMembersHash() =>
    r'8b0cdd1847ce9f702f1957e46981053b70fc45dd';

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

/// See also [getAllSavingMembers].
@ProviderFor(getAllSavingMembers)
const getAllSavingMembersProvider = GetAllSavingMembersFamily();

/// See also [getAllSavingMembers].
class GetAllSavingMembersFamily extends Family<AsyncValue> {
  /// See also [getAllSavingMembers].
  const GetAllSavingMembersFamily();

  /// See also [getAllSavingMembers].
  GetAllSavingMembersProvider call(
    int tahun,
    int workUnitId,
    String search,
    int perPage,
    int page,
  ) {
    return GetAllSavingMembersProvider(
      tahun,
      workUnitId,
      search,
      perPage,
      page,
    );
  }

  @override
  GetAllSavingMembersProvider getProviderOverride(
    covariant GetAllSavingMembersProvider provider,
  ) {
    return call(
      provider.tahun,
      provider.workUnitId,
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
  String? get name => r'getAllSavingMembersProvider';
}

/// See also [getAllSavingMembers].
class GetAllSavingMembersProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getAllSavingMembers].
  GetAllSavingMembersProvider(
    int tahun,
    int workUnitId,
    String search,
    int perPage,
    int page,
  ) : this._internal(
          (ref) => getAllSavingMembers(
            ref as GetAllSavingMembersRef,
            tahun,
            workUnitId,
            search,
            perPage,
            page,
          ),
          from: getAllSavingMembersProvider,
          name: r'getAllSavingMembersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllSavingMembersHash,
          dependencies: GetAllSavingMembersFamily._dependencies,
          allTransitiveDependencies:
              GetAllSavingMembersFamily._allTransitiveDependencies,
          tahun: tahun,
          workUnitId: workUnitId,
          search: search,
          perPage: perPage,
          page: page,
        );

  GetAllSavingMembersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
    required this.workUnitId,
    required this.search,
    required this.perPage,
    required this.page,
  }) : super.internal();

  final int tahun;
  final int workUnitId;
  final String search;
  final int perPage;
  final int page;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(GetAllSavingMembersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllSavingMembersProvider._internal(
        (ref) => create(ref as GetAllSavingMembersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tahun: tahun,
        workUnitId: workUnitId,
        search: search,
        perPage: perPage,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _GetAllSavingMembersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllSavingMembersProvider &&
        other.tahun == tahun &&
        other.workUnitId == workUnitId &&
        other.search == search &&
        other.perPage == perPage &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAllSavingMembersRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  int get tahun;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;

  /// The parameter `search` of this provider.
  String get search;

  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetAllSavingMembersProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with GetAllSavingMembersRef {
  _GetAllSavingMembersProviderElement(super.provider);

  @override
  int get tahun => (origin as GetAllSavingMembersProvider).tahun;
  @override
  int get workUnitId => (origin as GetAllSavingMembersProvider).workUnitId;
  @override
  String get search => (origin as GetAllSavingMembersProvider).search;
  @override
  int get perPage => (origin as GetAllSavingMembersProvider).perPage;
  @override
  int get page => (origin as GetAllSavingMembersProvider).page;
}

String _$createMemberSavingsHash() =>
    r'3ce05546837279477d3c4ad91d46c7d07044eb32';

/// See also [createMemberSavings].
@ProviderFor(createMemberSavings)
const createMemberSavingsProvider = CreateMemberSavingsFamily();

/// See also [createMemberSavings].
class CreateMemberSavingsFamily extends Family<AsyncValue> {
  /// See also [createMemberSavings].
  const CreateMemberSavingsFamily();

  /// See also [createMemberSavings].
  CreateMemberSavingsProvider call(
    int tahun,
  ) {
    return CreateMemberSavingsProvider(
      tahun,
    );
  }

  @override
  CreateMemberSavingsProvider getProviderOverride(
    covariant CreateMemberSavingsProvider provider,
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
  String? get name => r'createMemberSavingsProvider';
}

/// See also [createMemberSavings].
class CreateMemberSavingsProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [createMemberSavings].
  CreateMemberSavingsProvider(
    int tahun,
  ) : this._internal(
          (ref) => createMemberSavings(
            ref as CreateMemberSavingsRef,
            tahun,
          ),
          from: createMemberSavingsProvider,
          name: r'createMemberSavingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createMemberSavingsHash,
          dependencies: CreateMemberSavingsFamily._dependencies,
          allTransitiveDependencies:
              CreateMemberSavingsFamily._allTransitiveDependencies,
          tahun: tahun,
        );

  CreateMemberSavingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
  }) : super.internal();

  final int tahun;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(CreateMemberSavingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateMemberSavingsProvider._internal(
        (ref) => create(ref as CreateMemberSavingsRef),
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
    return _CreateMemberSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateMemberSavingsProvider && other.tahun == tahun;
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
mixin CreateMemberSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  int get tahun;
}

class _CreateMemberSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with CreateMemberSavingsRef {
  _CreateMemberSavingsProviderElement(super.provider);

  @override
  int get tahun => (origin as CreateMemberSavingsProvider).tahun;
}

String _$addMemberSavingsHash() => r'fb73fc551414949be1f41b22fd11258636f58173';

/// See also [addMemberSavings].
@ProviderFor(addMemberSavings)
const addMemberSavingsProvider = AddMemberSavingsFamily();

/// See also [addMemberSavings].
class AddMemberSavingsFamily extends Family<AsyncValue> {
  /// See also [addMemberSavings].
  const AddMemberSavingsFamily();

  /// See also [addMemberSavings].
  AddMemberSavingsProvider call(
    String memberId,
    int tahun,
  ) {
    return AddMemberSavingsProvider(
      memberId,
      tahun,
    );
  }

  @override
  AddMemberSavingsProvider getProviderOverride(
    covariant AddMemberSavingsProvider provider,
  ) {
    return call(
      provider.memberId,
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
  String? get name => r'addMemberSavingsProvider';
}

/// See also [addMemberSavings].
class AddMemberSavingsProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [addMemberSavings].
  AddMemberSavingsProvider(
    String memberId,
    int tahun,
  ) : this._internal(
          (ref) => addMemberSavings(
            ref as AddMemberSavingsRef,
            memberId,
            tahun,
          ),
          from: addMemberSavingsProvider,
          name: r'addMemberSavingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addMemberSavingsHash,
          dependencies: AddMemberSavingsFamily._dependencies,
          allTransitiveDependencies:
              AddMemberSavingsFamily._allTransitiveDependencies,
          memberId: memberId,
          tahun: tahun,
        );

  AddMemberSavingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.memberId,
    required this.tahun,
  }) : super.internal();

  final String memberId;
  final int tahun;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(AddMemberSavingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddMemberSavingsProvider._internal(
        (ref) => create(ref as AddMemberSavingsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        memberId: memberId,
        tahun: tahun,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _AddMemberSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddMemberSavingsProvider &&
        other.memberId == memberId &&
        other.tahun == tahun;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, memberId.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddMemberSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `memberId` of this provider.
  String get memberId;

  /// The parameter `tahun` of this provider.
  int get tahun;
}

class _AddMemberSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with AddMemberSavingsRef {
  _AddMemberSavingsProviderElement(super.provider);

  @override
  String get memberId => (origin as AddMemberSavingsProvider).memberId;
  @override
  int get tahun => (origin as AddMemberSavingsProvider).tahun;
}

String _$deleteMemberSavingsHash() =>
    r'dc31ba1a0a58df0851185659f3f604b167504b66';

/// See also [deleteMemberSavings].
@ProviderFor(deleteMemberSavings)
const deleteMemberSavingsProvider = DeleteMemberSavingsFamily();

/// See also [deleteMemberSavings].
class DeleteMemberSavingsFamily extends Family<AsyncValue> {
  /// See also [deleteMemberSavings].
  const DeleteMemberSavingsFamily();

  /// See also [deleteMemberSavings].
  DeleteMemberSavingsProvider call(
    String id,
    String tahun,
  ) {
    return DeleteMemberSavingsProvider(
      id,
      tahun,
    );
  }

  @override
  DeleteMemberSavingsProvider getProviderOverride(
    covariant DeleteMemberSavingsProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'deleteMemberSavingsProvider';
}

/// See also [deleteMemberSavings].
class DeleteMemberSavingsProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [deleteMemberSavings].
  DeleteMemberSavingsProvider(
    String id,
    String tahun,
  ) : this._internal(
          (ref) => deleteMemberSavings(
            ref as DeleteMemberSavingsRef,
            id,
            tahun,
          ),
          from: deleteMemberSavingsProvider,
          name: r'deleteMemberSavingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteMemberSavingsHash,
          dependencies: DeleteMemberSavingsFamily._dependencies,
          allTransitiveDependencies:
              DeleteMemberSavingsFamily._allTransitiveDependencies,
          id: id,
          tahun: tahun,
        );

  DeleteMemberSavingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.tahun,
  }) : super.internal();

  final String id;
  final String tahun;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(DeleteMemberSavingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteMemberSavingsProvider._internal(
        (ref) => create(ref as DeleteMemberSavingsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        tahun: tahun,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _DeleteMemberSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteMemberSavingsProvider &&
        other.id == id &&
        other.tahun == tahun;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteMemberSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `tahun` of this provider.
  String get tahun;
}

class _DeleteMemberSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with DeleteMemberSavingsRef {
  _DeleteMemberSavingsProviderElement(super.provider);

  @override
  String get id => (origin as DeleteMemberSavingsProvider).id;
  @override
  String get tahun => (origin as DeleteMemberSavingsProvider).tahun;
}

String _$transferMemberSavingsHash() =>
    r'f517dff028facf209869e7ef90eba9b888685777';

/// See also [transferMemberSavings].
@ProviderFor(transferMemberSavings)
const transferMemberSavingsProvider = TransferMemberSavingsFamily();

/// See also [transferMemberSavings].
class TransferMemberSavingsFamily extends Family<AsyncValue> {
  /// See also [transferMemberSavings].
  const TransferMemberSavingsFamily();

  /// See also [transferMemberSavings].
  TransferMemberSavingsProvider call(
    String id,
    String tahun,
    String workUnitId,
  ) {
    return TransferMemberSavingsProvider(
      id,
      tahun,
      workUnitId,
    );
  }

  @override
  TransferMemberSavingsProvider getProviderOverride(
    covariant TransferMemberSavingsProvider provider,
  ) {
    return call(
      provider.id,
      provider.tahun,
      provider.workUnitId,
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
  String? get name => r'transferMemberSavingsProvider';
}

/// See also [transferMemberSavings].
class TransferMemberSavingsProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [transferMemberSavings].
  TransferMemberSavingsProvider(
    String id,
    String tahun,
    String workUnitId,
  ) : this._internal(
          (ref) => transferMemberSavings(
            ref as TransferMemberSavingsRef,
            id,
            tahun,
            workUnitId,
          ),
          from: transferMemberSavingsProvider,
          name: r'transferMemberSavingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transferMemberSavingsHash,
          dependencies: TransferMemberSavingsFamily._dependencies,
          allTransitiveDependencies:
              TransferMemberSavingsFamily._allTransitiveDependencies,
          id: id,
          tahun: tahun,
          workUnitId: workUnitId,
        );

  TransferMemberSavingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.tahun,
    required this.workUnitId,
  }) : super.internal();

  final String id;
  final String tahun;
  final String workUnitId;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(TransferMemberSavingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransferMemberSavingsProvider._internal(
        (ref) => create(ref as TransferMemberSavingsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        tahun: tahun,
        workUnitId: workUnitId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _TransferMemberSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransferMemberSavingsProvider &&
        other.id == id &&
        other.tahun == tahun &&
        other.workUnitId == workUnitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransferMemberSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `tahun` of this provider.
  String get tahun;

  /// The parameter `workUnitId` of this provider.
  String get workUnitId;
}

class _TransferMemberSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with TransferMemberSavingsRef {
  _TransferMemberSavingsProviderElement(super.provider);

  @override
  String get id => (origin as TransferMemberSavingsProvider).id;
  @override
  String get tahun => (origin as TransferMemberSavingsProvider).tahun;
  @override
  String get workUnitId => (origin as TransferMemberSavingsProvider).workUnitId;
}

String _$deleteTahunSavingsHash() =>
    r'5d0637d6ce9aa8f022fa058bc06091889e806c97';

/// See also [deleteTahunSavings].
@ProviderFor(deleteTahunSavings)
const deleteTahunSavingsProvider = DeleteTahunSavingsFamily();

/// See also [deleteTahunSavings].
class DeleteTahunSavingsFamily extends Family<AsyncValue> {
  /// See also [deleteTahunSavings].
  const DeleteTahunSavingsFamily();

  /// See also [deleteTahunSavings].
  DeleteTahunSavingsProvider call(
    String tahun,
  ) {
    return DeleteTahunSavingsProvider(
      tahun,
    );
  }

  @override
  DeleteTahunSavingsProvider getProviderOverride(
    covariant DeleteTahunSavingsProvider provider,
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
  String? get name => r'deleteTahunSavingsProvider';
}

/// See also [deleteTahunSavings].
class DeleteTahunSavingsProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [deleteTahunSavings].
  DeleteTahunSavingsProvider(
    String tahun,
  ) : this._internal(
          (ref) => deleteTahunSavings(
            ref as DeleteTahunSavingsRef,
            tahun,
          ),
          from: deleteTahunSavingsProvider,
          name: r'deleteTahunSavingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteTahunSavingsHash,
          dependencies: DeleteTahunSavingsFamily._dependencies,
          allTransitiveDependencies:
              DeleteTahunSavingsFamily._allTransitiveDependencies,
          tahun: tahun,
        );

  DeleteTahunSavingsProvider._internal(
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
    FutureOr<Object?> Function(DeleteTahunSavingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteTahunSavingsProvider._internal(
        (ref) => create(ref as DeleteTahunSavingsRef),
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
    return _DeleteTahunSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteTahunSavingsProvider && other.tahun == tahun;
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
mixin DeleteTahunSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  String get tahun;
}

class _DeleteTahunSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with DeleteTahunSavingsRef {
  _DeleteTahunSavingsProviderElement(super.provider);

  @override
  String get tahun => (origin as DeleteTahunSavingsProvider).tahun;
}

String _$updateTahunSavingsHash() =>
    r'b1b4273ec67d8c2b2ddee801f91e1e38a92c742c';

/// See also [updateTahunSavings].
@ProviderFor(updateTahunSavings)
const updateTahunSavingsProvider = UpdateTahunSavingsFamily();

/// See also [updateTahunSavings].
class UpdateTahunSavingsFamily extends Family<AsyncValue> {
  /// See also [updateTahunSavings].
  const UpdateTahunSavingsFamily();

  /// See also [updateTahunSavings].
  UpdateTahunSavingsProvider call(
    String tahun,
    String newTahun,
  ) {
    return UpdateTahunSavingsProvider(
      tahun,
      newTahun,
    );
  }

  @override
  UpdateTahunSavingsProvider getProviderOverride(
    covariant UpdateTahunSavingsProvider provider,
  ) {
    return call(
      provider.tahun,
      provider.newTahun,
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
  String? get name => r'updateTahunSavingsProvider';
}

/// See also [updateTahunSavings].
class UpdateTahunSavingsProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateTahunSavings].
  UpdateTahunSavingsProvider(
    String tahun,
    String newTahun,
  ) : this._internal(
          (ref) => updateTahunSavings(
            ref as UpdateTahunSavingsRef,
            tahun,
            newTahun,
          ),
          from: updateTahunSavingsProvider,
          name: r'updateTahunSavingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateTahunSavingsHash,
          dependencies: UpdateTahunSavingsFamily._dependencies,
          allTransitiveDependencies:
              UpdateTahunSavingsFamily._allTransitiveDependencies,
          tahun: tahun,
          newTahun: newTahun,
        );

  UpdateTahunSavingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
    required this.newTahun,
  }) : super.internal();

  final String tahun;
  final String newTahun;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UpdateTahunSavingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateTahunSavingsProvider._internal(
        (ref) => create(ref as UpdateTahunSavingsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tahun: tahun,
        newTahun: newTahun,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UpdateTahunSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateTahunSavingsProvider &&
        other.tahun == tahun &&
        other.newTahun == newTahun;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, newTahun.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateTahunSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  String get tahun;

  /// The parameter `newTahun` of this provider.
  String get newTahun;
}

class _UpdateTahunSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with UpdateTahunSavingsRef {
  _UpdateTahunSavingsProviderElement(super.provider);

  @override
  String get tahun => (origin as UpdateTahunSavingsProvider).tahun;
  @override
  String get newTahun => (origin as UpdateTahunSavingsProvider).newTahun;
}

String _$updateMemberSavingsHash() =>
    r'a7bc658bf7aef193a4116edb9a65df6cc0d21eaf';

/// See also [updateMemberSavings].
@ProviderFor(updateMemberSavings)
const updateMemberSavingsProvider = UpdateMemberSavingsFamily();

/// See also [updateMemberSavings].
class UpdateMemberSavingsFamily extends Family<AsyncValue> {
  /// See also [updateMemberSavings].
  const UpdateMemberSavingsFamily();

  /// See also [updateMemberSavings].
  UpdateMemberSavingsProvider call(
    int tahun,
    int workUnitId,
    Map<String, Map<String, dynamic>> updateSavingsObject,
  ) {
    return UpdateMemberSavingsProvider(
      tahun,
      workUnitId,
      updateSavingsObject,
    );
  }

  @override
  UpdateMemberSavingsProvider getProviderOverride(
    covariant UpdateMemberSavingsProvider provider,
  ) {
    return call(
      provider.tahun,
      provider.workUnitId,
      provider.updateSavingsObject,
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
  String? get name => r'updateMemberSavingsProvider';
}

/// See also [updateMemberSavings].
class UpdateMemberSavingsProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateMemberSavings].
  UpdateMemberSavingsProvider(
    int tahun,
    int workUnitId,
    Map<String, Map<String, dynamic>> updateSavingsObject,
  ) : this._internal(
          (ref) => updateMemberSavings(
            ref as UpdateMemberSavingsRef,
            tahun,
            workUnitId,
            updateSavingsObject,
          ),
          from: updateMemberSavingsProvider,
          name: r'updateMemberSavingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMemberSavingsHash,
          dependencies: UpdateMemberSavingsFamily._dependencies,
          allTransitiveDependencies:
              UpdateMemberSavingsFamily._allTransitiveDependencies,
          tahun: tahun,
          workUnitId: workUnitId,
          updateSavingsObject: updateSavingsObject,
        );

  UpdateMemberSavingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tahun,
    required this.workUnitId,
    required this.updateSavingsObject,
  }) : super.internal();

  final int tahun;
  final int workUnitId;
  final Map<String, Map<String, dynamic>> updateSavingsObject;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UpdateMemberSavingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateMemberSavingsProvider._internal(
        (ref) => create(ref as UpdateMemberSavingsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tahun: tahun,
        workUnitId: workUnitId,
        updateSavingsObject: updateSavingsObject,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UpdateMemberSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateMemberSavingsProvider &&
        other.tahun == tahun &&
        other.workUnitId == workUnitId &&
        other.updateSavingsObject == updateSavingsObject;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);
    hash = _SystemHash.combine(hash, updateSavingsObject.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateMemberSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  int get tahun;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;

  /// The parameter `updateSavingsObject` of this provider.
  Map<String, Map<String, dynamic>> get updateSavingsObject;
}

class _UpdateMemberSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with UpdateMemberSavingsRef {
  _UpdateMemberSavingsProviderElement(super.provider);

  @override
  int get tahun => (origin as UpdateMemberSavingsProvider).tahun;
  @override
  int get workUnitId => (origin as UpdateMemberSavingsProvider).workUnitId;
  @override
  Map<String, Map<String, dynamic>> get updateSavingsObject =>
      (origin as UpdateMemberSavingsProvider).updateSavingsObject;
}

String _$updateSavingObjectHash() =>
    r'd07ec7df32678b86cf44088bd1a9deac6376e757';

/// See also [UpdateSavingObject].
@ProviderFor(UpdateSavingObject)
final updateSavingObjectProvider = AutoDisposeNotifierProvider<
    UpdateSavingObject, Map<String, Map<String, dynamic>>>.internal(
  UpdateSavingObject.new,
  name: r'updateSavingObjectProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateSavingObjectHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpdateSavingObject
    = AutoDisposeNotifier<Map<String, Map<String, dynamic>>>;
String _$searchSavingsHash() => r'46ecb2bd0d39777526d368c9f90c9b38782653df';

/// See also [SearchSavings].
@ProviderFor(SearchSavings)
final searchSavingsProvider =
    AutoDisposeNotifierProvider<SearchSavings, Map<String, dynamic>>.internal(
  SearchSavings.new,
  name: r'searchSavingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchSavingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchSavings = AutoDisposeNotifier<Map<String, dynamic>>;
String _$totalPageSavingsHash() => r'b0aee3c6df697004b7eb0fb09bd27c40a7c0df55';

/// See also [TotalPageSavings].
@ProviderFor(TotalPageSavings)
final totalPageSavingsProvider =
    AutoDisposeNotifierProvider<TotalPageSavings, int>.internal(
  TotalPageSavings.new,
  name: r'totalPageSavingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalPageSavingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalPageSavings = AutoDisposeNotifier<int>;
String _$dataTransferMemberSavingsNotifierHash() =>
    r'aaaae97bea6d2279a9049d14af70196ae6fe6ac6';

/// See also [DataTransferMemberSavingsNotifier].
@ProviderFor(DataTransferMemberSavingsNotifier)
final dataTransferMemberSavingsNotifierProvider = AutoDisposeNotifierProvider<
    DataTransferMemberSavingsNotifier, Map<String, dynamic>>.internal(
  DataTransferMemberSavingsNotifier.new,
  name: r'dataTransferMemberSavingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dataTransferMemberSavingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataTransferMemberSavingsNotifier
    = AutoDisposeNotifier<Map<String, dynamic>>;
String _$savingModeNotifierHash() =>
    r'8413798cb4a00172babd03111bc61692e3d98aac';

/// See also [SavingModeNotifier].
@ProviderFor(SavingModeNotifier)
final savingModeNotifierProvider =
    AutoDisposeNotifierProvider<SavingModeNotifier, SavingMode>.internal(
  SavingModeNotifier.new,
  name: r'savingModeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savingModeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SavingModeNotifier = AutoDisposeNotifier<SavingMode>;
String _$idMemberSavingsNotifierHash() =>
    r'b2832c857ab1fc3b90b3ee57a36dfd1009160cf6';

/// See also [IdMemberSavingsNotifier].
@ProviderFor(IdMemberSavingsNotifier)
final idMemberSavingsNotifierProvider =
    AutoDisposeNotifierProvider<IdMemberSavingsNotifier, int>.internal(
  IdMemberSavingsNotifier.new,
  name: r'idMemberSavingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$idMemberSavingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IdMemberSavingsNotifier = AutoDisposeNotifier<int>;
String _$editSavingsNotifierHash() =>
    r'0b36b341c11311e9824eecbd7496e1ea844974e2';

/// See also [EditSavingsNotifier].
@ProviderFor(EditSavingsNotifier)
final editSavingsNotifierProvider =
    AutoDisposeNotifierProvider<EditSavingsNotifier, int>.internal(
  EditSavingsNotifier.new,
  name: r'editSavingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editSavingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditSavingsNotifier = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
