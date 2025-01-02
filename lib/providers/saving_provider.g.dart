// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllSavingMembersHash() =>
    r'ee0500f33140b54889d15bdd4b19cb745f5c50b1';

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
    String tahun,
    int workUnitId,
    String search,
  ) {
    return GetAllSavingMembersProvider(
      tahun,
      workUnitId,
      search,
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
    String tahun,
    int workUnitId,
    String search,
  ) : this._internal(
          (ref) => getAllSavingMembers(
            ref as GetAllSavingMembersRef,
            tahun,
            workUnitId,
            search,
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
  }) : super.internal();

  final String tahun;
  final int workUnitId;
  final String search;

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
        other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllSavingMembersRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  String get tahun;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;

  /// The parameter `search` of this provider.
  String get search;
}

class _GetAllSavingMembersProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with GetAllSavingMembersRef {
  _GetAllSavingMembersProviderElement(super.provider);

  @override
  String get tahun => (origin as GetAllSavingMembersProvider).tahun;
  @override
  int get workUnitId => (origin as GetAllSavingMembersProvider).workUnitId;
  @override
  String get search => (origin as GetAllSavingMembersProvider).search;
}

String _$createMemberSavingsHash() =>
    r'c8ad19599e0ada000e46a36e3ae6ab1fd1df83e2';

/// See also [createMemberSavings].
@ProviderFor(createMemberSavings)
const createMemberSavingsProvider = CreateMemberSavingsFamily();

/// See also [createMemberSavings].
class CreateMemberSavingsFamily extends Family<AsyncValue> {
  /// See also [createMemberSavings].
  const CreateMemberSavingsFamily();

  /// See also [createMemberSavings].
  CreateMemberSavingsProvider call(
    String tahun,
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
    String tahun,
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

  final String tahun;

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

mixin CreateMemberSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  String get tahun;
}

class _CreateMemberSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with CreateMemberSavingsRef {
  _CreateMemberSavingsProviderElement(super.provider);

  @override
  String get tahun => (origin as CreateMemberSavingsProvider).tahun;
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

String _$addMemberSavingsHash() => r'62aa881596b01b15b39f0c930b94e75c0cbe949b';

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
    String tahun,
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
    String tahun,
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
  final String tahun;

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

mixin AddMemberSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `memberId` of this provider.
  String get memberId;

  /// The parameter `tahun` of this provider.
  String get tahun;
}

class _AddMemberSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with AddMemberSavingsRef {
  _AddMemberSavingsProviderElement(super.provider);

  @override
  String get memberId => (origin as AddMemberSavingsProvider).memberId;
  @override
  String get tahun => (origin as AddMemberSavingsProvider).tahun;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
