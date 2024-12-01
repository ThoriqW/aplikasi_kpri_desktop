// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateProfileHash() => r'6580df754d7d87d5cffdd96aad3f04f1017371f3';

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

/// See also [updateProfile].
@ProviderFor(updateProfile)
const updateProfileProvider = UpdateProfileFamily();

/// See also [updateProfile].
class UpdateProfileFamily extends Family<AsyncValue> {
  /// See also [updateProfile].
  const UpdateProfileFamily();

  /// See also [updateProfile].
  UpdateProfileProvider call(
    String? fullName,
    String? nik,
    String? noHp,
    String? address,
    DateTime? dateOfBirth,
  ) {
    return UpdateProfileProvider(
      fullName,
      nik,
      noHp,
      address,
      dateOfBirth,
    );
  }

  @override
  UpdateProfileProvider getProviderOverride(
    covariant UpdateProfileProvider provider,
  ) {
    return call(
      provider.fullName,
      provider.nik,
      provider.noHp,
      provider.address,
      provider.dateOfBirth,
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
  String? get name => r'updateProfileProvider';
}

/// See also [updateProfile].
class UpdateProfileProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateProfile].
  UpdateProfileProvider(
    String? fullName,
    String? nik,
    String? noHp,
    String? address,
    DateTime? dateOfBirth,
  ) : this._internal(
          (ref) => updateProfile(
            ref as UpdateProfileRef,
            fullName,
            nik,
            noHp,
            address,
            dateOfBirth,
          ),
          from: updateProfileProvider,
          name: r'updateProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateProfileHash,
          dependencies: UpdateProfileFamily._dependencies,
          allTransitiveDependencies:
              UpdateProfileFamily._allTransitiveDependencies,
          fullName: fullName,
          nik: nik,
          noHp: noHp,
          address: address,
          dateOfBirth: dateOfBirth,
        );

  UpdateProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fullName,
    required this.nik,
    required this.noHp,
    required this.address,
    required this.dateOfBirth,
  }) : super.internal();

  final String? fullName;
  final String? nik;
  final String? noHp;
  final String? address;
  final DateTime? dateOfBirth;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UpdateProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateProfileProvider._internal(
        (ref) => create(ref as UpdateProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fullName: fullName,
        nik: nik,
        noHp: noHp,
        address: address,
        dateOfBirth: dateOfBirth,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UpdateProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProfileProvider &&
        other.fullName == fullName &&
        other.nik == nik &&
        other.noHp == noHp &&
        other.address == address &&
        other.dateOfBirth == dateOfBirth;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fullName.hashCode);
    hash = _SystemHash.combine(hash, nik.hashCode);
    hash = _SystemHash.combine(hash, noHp.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, dateOfBirth.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateProfileRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `fullName` of this provider.
  String? get fullName;

  /// The parameter `nik` of this provider.
  String? get nik;

  /// The parameter `noHp` of this provider.
  String? get noHp;

  /// The parameter `address` of this provider.
  String? get address;

  /// The parameter `dateOfBirth` of this provider.
  DateTime? get dateOfBirth;
}

class _UpdateProfileProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with UpdateProfileRef {
  _UpdateProfileProviderElement(super.provider);

  @override
  String? get fullName => (origin as UpdateProfileProvider).fullName;
  @override
  String? get nik => (origin as UpdateProfileProvider).nik;
  @override
  String? get noHp => (origin as UpdateProfileProvider).noHp;
  @override
  String? get address => (origin as UpdateProfileProvider).address;
  @override
  DateTime? get dateOfBirth => (origin as UpdateProfileProvider).dateOfBirth;
}

String _$getProfileHash() => r'5347fb3a9ded3873faea45f834b36fb48710dbf6';

/// See also [getProfile].
@ProviderFor(getProfile)
final getProfileProvider = AutoDisposeFutureProvider<Object?>.internal(
  getProfile,
  name: r'getProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProfileRef = AutoDisposeFutureProviderRef<Object?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
