// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllSavingMembersHash() =>
    r'4094cefe124fa6aef56bda1e2a43578d32beca23';

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
    String year,
  ) {
    return GetAllSavingMembersProvider(
      year,
    );
  }

  @override
  GetAllSavingMembersProvider getProviderOverride(
    covariant GetAllSavingMembersProvider provider,
  ) {
    return call(
      provider.year,
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
    String year,
  ) : this._internal(
          (ref) => getAllSavingMembers(
            ref as GetAllSavingMembersRef,
            year,
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
          year: year,
        );

  GetAllSavingMembersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
  }) : super.internal();

  final String year;

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
        year: year,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _GetAllSavingMembersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllSavingMembersProvider && other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAllSavingMembersRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `year` of this provider.
  String get year;
}

class _GetAllSavingMembersProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with GetAllSavingMembersRef {
  _GetAllSavingMembersProviderElement(super.provider);

  @override
  String get year => (origin as GetAllSavingMembersProvider).year;
}

String _$createMemberSavingsHash() =>
    r'fe16061cac995de8a9b643e29a53df81d248852e';

/// See also [createMemberSavings].
@ProviderFor(createMemberSavings)
const createMemberSavingsProvider = CreateMemberSavingsFamily();

/// See also [createMemberSavings].
class CreateMemberSavingsFamily extends Family<AsyncValue> {
  /// See also [createMemberSavings].
  const CreateMemberSavingsFamily();

  /// See also [createMemberSavings].
  CreateMemberSavingsProvider call(
    String year,
  ) {
    return CreateMemberSavingsProvider(
      year,
    );
  }

  @override
  CreateMemberSavingsProvider getProviderOverride(
    covariant CreateMemberSavingsProvider provider,
  ) {
    return call(
      provider.year,
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
    String year,
  ) : this._internal(
          (ref) => createMemberSavings(
            ref as CreateMemberSavingsRef,
            year,
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
          year: year,
        );

  CreateMemberSavingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
  }) : super.internal();

  final String year;

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
        year: year,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _CreateMemberSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateMemberSavingsProvider && other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateMemberSavingsRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `year` of this provider.
  String get year;
}

class _CreateMemberSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with CreateMemberSavingsRef {
  _CreateMemberSavingsProviderElement(super.provider);

  @override
  String get year => (origin as CreateMemberSavingsProvider).year;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
