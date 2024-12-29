// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllSavingMembersHash() =>
    r'3665379185a807b6f83e584119e9e144ec8e4539';

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
  ) {
    return GetAllSavingMembersProvider(
      tahun,
      workUnitId,
    );
  }

  @override
  GetAllSavingMembersProvider getProviderOverride(
    covariant GetAllSavingMembersProvider provider,
  ) {
    return call(
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
  String? get name => r'getAllSavingMembersProvider';
}

/// See also [getAllSavingMembers].
class GetAllSavingMembersProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getAllSavingMembers].
  GetAllSavingMembersProvider(
    String tahun,
    int workUnitId,
  ) : this._internal(
          (ref) => getAllSavingMembers(
            ref as GetAllSavingMembersRef,
            tahun,
            workUnitId,
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
  }) : super.internal();

  final String tahun;
  final int workUnitId;

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
        other.workUnitId == workUnitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tahun.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAllSavingMembersRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `tahun` of this provider.
  String get tahun;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;
}

class _GetAllSavingMembersProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with GetAllSavingMembersRef {
  _GetAllSavingMembersProviderElement(super.provider);

  @override
  String get tahun => (origin as GetAllSavingMembersProvider).tahun;
  @override
  int get workUnitId => (origin as GetAllSavingMembersProvider).workUnitId;
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'edc2c0284d67d63fcc0b6a85a7061fd0252fbfad';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
