// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_units_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllWorkUnitsHash() => r'903c714b1dc4177c45648aa25a518d02d192667d';

/// See also [getAllWorkUnits].
@ProviderFor(getAllWorkUnits)
final getAllWorkUnitsProvider = AutoDisposeFutureProvider<Object?>.internal(
  getAllWorkUnits,
  name: r'getAllWorkUnitsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllWorkUnitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllWorkUnitsRef = AutoDisposeFutureProviderRef<Object?>;
String _$getWorkUnitHash() => r'0d23c1ec2c65e8277d600b65115d456ea1c37e78';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
