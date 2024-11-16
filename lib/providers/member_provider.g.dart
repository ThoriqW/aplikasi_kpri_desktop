// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addMemberHash() => r'434c8bbbcb97e5d47d6a71fefa673ad7e2f37675';

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

/// See also [addMember].
@ProviderFor(addMember)
const addMemberProvider = AddMemberFamily();

/// See also [addMember].
class AddMemberFamily extends Family<AsyncValue> {
  /// See also [addMember].
  const AddMemberFamily();

  /// See also [addMember].
  AddMemberProvider call(
    String fullName,
    String nik,
    String nomorAnggota,
    String noHp,
    String address,
    DateTime? dateOfBirth,
    int workUnitId,
  ) {
    return AddMemberProvider(
      fullName,
      nik,
      nomorAnggota,
      noHp,
      address,
      dateOfBirth,
      workUnitId,
    );
  }

  @override
  AddMemberProvider getProviderOverride(
    covariant AddMemberProvider provider,
  ) {
    return call(
      provider.fullName,
      provider.nik,
      provider.nomorAnggota,
      provider.noHp,
      provider.address,
      provider.dateOfBirth,
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
  String? get name => r'addMemberProvider';
}

/// See also [addMember].
class AddMemberProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [addMember].
  AddMemberProvider(
    String fullName,
    String nik,
    String nomorAnggota,
    String noHp,
    String address,
    DateTime? dateOfBirth,
    int workUnitId,
  ) : this._internal(
          (ref) => addMember(
            ref as AddMemberRef,
            fullName,
            nik,
            nomorAnggota,
            noHp,
            address,
            dateOfBirth,
            workUnitId,
          ),
          from: addMemberProvider,
          name: r'addMemberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addMemberHash,
          dependencies: AddMemberFamily._dependencies,
          allTransitiveDependencies: AddMemberFamily._allTransitiveDependencies,
          fullName: fullName,
          nik: nik,
          nomorAnggota: nomorAnggota,
          noHp: noHp,
          address: address,
          dateOfBirth: dateOfBirth,
          workUnitId: workUnitId,
        );

  AddMemberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fullName,
    required this.nik,
    required this.nomorAnggota,
    required this.noHp,
    required this.address,
    required this.dateOfBirth,
    required this.workUnitId,
  }) : super.internal();

  final String fullName;
  final String nik;
  final String nomorAnggota;
  final String noHp;
  final String address;
  final DateTime? dateOfBirth;
  final int workUnitId;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(AddMemberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddMemberProvider._internal(
        (ref) => create(ref as AddMemberRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fullName: fullName,
        nik: nik,
        nomorAnggota: nomorAnggota,
        noHp: noHp,
        address: address,
        dateOfBirth: dateOfBirth,
        workUnitId: workUnitId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _AddMemberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddMemberProvider &&
        other.fullName == fullName &&
        other.nik == nik &&
        other.nomorAnggota == nomorAnggota &&
        other.noHp == noHp &&
        other.address == address &&
        other.dateOfBirth == dateOfBirth &&
        other.workUnitId == workUnitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fullName.hashCode);
    hash = _SystemHash.combine(hash, nik.hashCode);
    hash = _SystemHash.combine(hash, nomorAnggota.hashCode);
    hash = _SystemHash.combine(hash, noHp.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, dateOfBirth.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `fullName` of this provider.
  String get fullName;

  /// The parameter `nik` of this provider.
  String get nik;

  /// The parameter `nomorAnggota` of this provider.
  String get nomorAnggota;

  /// The parameter `noHp` of this provider.
  String get noHp;

  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `dateOfBirth` of this provider.
  DateTime? get dateOfBirth;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;
}

class _AddMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with AddMemberRef {
  _AddMemberProviderElement(super.provider);

  @override
  String get fullName => (origin as AddMemberProvider).fullName;
  @override
  String get nik => (origin as AddMemberProvider).nik;
  @override
  String get nomorAnggota => (origin as AddMemberProvider).nomorAnggota;
  @override
  String get noHp => (origin as AddMemberProvider).noHp;
  @override
  String get address => (origin as AddMemberProvider).address;
  @override
  DateTime? get dateOfBirth => (origin as AddMemberProvider).dateOfBirth;
  @override
  int get workUnitId => (origin as AddMemberProvider).workUnitId;
}

String _$getAllMemberHash() => r'e73c4188b25ecdb052215446e5b6f08e0d7102c4';

/// See also [getAllMember].
@ProviderFor(getAllMember)
final getAllMemberProvider = AutoDisposeFutureProvider<Object?>.internal(
  getAllMember,
  name: r'getAllMemberProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllMemberHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllMemberRef = AutoDisposeFutureProviderRef<Object?>;
String _$getMemberHash() => r'4b3980105a6816515aeb9f501bda6e3ec4663c6b';

/// See also [getMember].
@ProviderFor(getMember)
const getMemberProvider = GetMemberFamily();

/// See also [getMember].
class GetMemberFamily extends Family<AsyncValue> {
  /// See also [getMember].
  const GetMemberFamily();

  /// See also [getMember].
  GetMemberProvider call(
    String id,
  ) {
    return GetMemberProvider(
      id,
    );
  }

  @override
  GetMemberProvider getProviderOverride(
    covariant GetMemberProvider provider,
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
  String? get name => r'getMemberProvider';
}

/// See also [getMember].
class GetMemberProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getMember].
  GetMemberProvider(
    String id,
  ) : this._internal(
          (ref) => getMember(
            ref as GetMemberRef,
            id,
          ),
          from: getMemberProvider,
          name: r'getMemberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMemberHash,
          dependencies: GetMemberFamily._dependencies,
          allTransitiveDependencies: GetMemberFamily._allTransitiveDependencies,
          id: id,
        );

  GetMemberProvider._internal(
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
    FutureOr<Object?> Function(GetMemberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMemberProvider._internal(
        (ref) => create(ref as GetMemberRef),
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
    return _GetMemberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMemberProvider && other.id == id;
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
mixin GetMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with GetMemberRef {
  _GetMemberProviderElement(super.provider);

  @override
  String get id => (origin as GetMemberProvider).id;
}

String _$updateMemberHash() => r'f1b368e022e372cf3b71da21594215f503bd0708';

/// See also [updateMember].
@ProviderFor(updateMember)
const updateMemberProvider = UpdateMemberFamily();

/// See also [updateMember].
class UpdateMemberFamily extends Family<AsyncValue> {
  /// See also [updateMember].
  const UpdateMemberFamily();

  /// See also [updateMember].
  UpdateMemberProvider call(
    String id,
    String fullName,
    String nik,
    String nomorAnggota,
    String noHp,
    String address,
    DateTime? dateOfBirth,
    int workUnitId,
  ) {
    return UpdateMemberProvider(
      id,
      fullName,
      nik,
      nomorAnggota,
      noHp,
      address,
      dateOfBirth,
      workUnitId,
    );
  }

  @override
  UpdateMemberProvider getProviderOverride(
    covariant UpdateMemberProvider provider,
  ) {
    return call(
      provider.id,
      provider.fullName,
      provider.nik,
      provider.nomorAnggota,
      provider.noHp,
      provider.address,
      provider.dateOfBirth,
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
  String? get name => r'updateMemberProvider';
}

/// See also [updateMember].
class UpdateMemberProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateMember].
  UpdateMemberProvider(
    String id,
    String fullName,
    String nik,
    String nomorAnggota,
    String noHp,
    String address,
    DateTime? dateOfBirth,
    int workUnitId,
  ) : this._internal(
          (ref) => updateMember(
            ref as UpdateMemberRef,
            id,
            fullName,
            nik,
            nomorAnggota,
            noHp,
            address,
            dateOfBirth,
            workUnitId,
          ),
          from: updateMemberProvider,
          name: r'updateMemberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMemberHash,
          dependencies: UpdateMemberFamily._dependencies,
          allTransitiveDependencies:
              UpdateMemberFamily._allTransitiveDependencies,
          id: id,
          fullName: fullName,
          nik: nik,
          nomorAnggota: nomorAnggota,
          noHp: noHp,
          address: address,
          dateOfBirth: dateOfBirth,
          workUnitId: workUnitId,
        );

  UpdateMemberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.fullName,
    required this.nik,
    required this.nomorAnggota,
    required this.noHp,
    required this.address,
    required this.dateOfBirth,
    required this.workUnitId,
  }) : super.internal();

  final String id;
  final String fullName;
  final String nik;
  final String nomorAnggota;
  final String noHp;
  final String address;
  final DateTime? dateOfBirth;
  final int workUnitId;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UpdateMemberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateMemberProvider._internal(
        (ref) => create(ref as UpdateMemberRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        fullName: fullName,
        nik: nik,
        nomorAnggota: nomorAnggota,
        noHp: noHp,
        address: address,
        dateOfBirth: dateOfBirth,
        workUnitId: workUnitId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UpdateMemberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateMemberProvider &&
        other.id == id &&
        other.fullName == fullName &&
        other.nik == nik &&
        other.nomorAnggota == nomorAnggota &&
        other.noHp == noHp &&
        other.address == address &&
        other.dateOfBirth == dateOfBirth &&
        other.workUnitId == workUnitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, fullName.hashCode);
    hash = _SystemHash.combine(hash, nik.hashCode);
    hash = _SystemHash.combine(hash, nomorAnggota.hashCode);
    hash = _SystemHash.combine(hash, noHp.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, dateOfBirth.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `fullName` of this provider.
  String get fullName;

  /// The parameter `nik` of this provider.
  String get nik;

  /// The parameter `nomorAnggota` of this provider.
  String get nomorAnggota;

  /// The parameter `noHp` of this provider.
  String get noHp;

  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `dateOfBirth` of this provider.
  DateTime? get dateOfBirth;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;
}

class _UpdateMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with UpdateMemberRef {
  _UpdateMemberProviderElement(super.provider);

  @override
  String get id => (origin as UpdateMemberProvider).id;
  @override
  String get fullName => (origin as UpdateMemberProvider).fullName;
  @override
  String get nik => (origin as UpdateMemberProvider).nik;
  @override
  String get nomorAnggota => (origin as UpdateMemberProvider).nomorAnggota;
  @override
  String get noHp => (origin as UpdateMemberProvider).noHp;
  @override
  String get address => (origin as UpdateMemberProvider).address;
  @override
  DateTime? get dateOfBirth => (origin as UpdateMemberProvider).dateOfBirth;
  @override
  int get workUnitId => (origin as UpdateMemberProvider).workUnitId;
}

String _$deleteMemberHash() => r'8862cb2d120315a0a0b51a4cd48e77df9e8cfe35';

/// See also [deleteMember].
@ProviderFor(deleteMember)
const deleteMemberProvider = DeleteMemberFamily();

/// See also [deleteMember].
class DeleteMemberFamily extends Family<AsyncValue> {
  /// See also [deleteMember].
  const DeleteMemberFamily();

  /// See also [deleteMember].
  DeleteMemberProvider call(
    String id,
  ) {
    return DeleteMemberProvider(
      id,
    );
  }

  @override
  DeleteMemberProvider getProviderOverride(
    covariant DeleteMemberProvider provider,
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
  String? get name => r'deleteMemberProvider';
}

/// See also [deleteMember].
class DeleteMemberProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [deleteMember].
  DeleteMemberProvider(
    String id,
  ) : this._internal(
          (ref) => deleteMember(
            ref as DeleteMemberRef,
            id,
          ),
          from: deleteMemberProvider,
          name: r'deleteMemberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteMemberHash,
          dependencies: DeleteMemberFamily._dependencies,
          allTransitiveDependencies:
              DeleteMemberFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteMemberProvider._internal(
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
    FutureOr<Object?> Function(DeleteMemberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteMemberProvider._internal(
        (ref) => create(ref as DeleteMemberRef),
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
    return _DeleteMemberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteMemberProvider && other.id == id;
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
mixin DeleteMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DeleteMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with DeleteMemberRef {
  _DeleteMemberProviderElement(super.provider);

  @override
  String get id => (origin as DeleteMemberProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
