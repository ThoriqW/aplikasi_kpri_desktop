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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllWorkUnitsRef = AutoDisposeFutureProviderRef<Object?>;
String _$addWorkUnitHash() => r'ac0cf35433c5c87daece2cebfd564d02b9957ca1';

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
  ) {
    return AddWorkUnitProvider(
      namaWorkUnit,
    );
  }

  @override
  AddWorkUnitProvider getProviderOverride(
    covariant AddWorkUnitProvider provider,
  ) {
    return call(
      provider.namaWorkUnit,
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
  ) : this._internal(
          (ref) => addWorkUnit(
            ref as AddWorkUnitRef,
            namaWorkUnit,
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
        );

  AddWorkUnitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.namaWorkUnit,
  }) : super.internal();

  final String namaWorkUnit;

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
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _AddWorkUnitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddWorkUnitProvider && other.namaWorkUnit == namaWorkUnit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, namaWorkUnit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddWorkUnitRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `namaWorkUnit` of this provider.
  String get namaWorkUnit;
}

class _AddWorkUnitProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with AddWorkUnitRef {
  _AddWorkUnitProviderElement(super.provider);

  @override
  String get namaWorkUnit => (origin as AddWorkUnitProvider).namaWorkUnit;
}

String _$deleteWorkUnitHash() => r'b5c9f6946bb08f85c6ce41fafd6acca42e775632';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
