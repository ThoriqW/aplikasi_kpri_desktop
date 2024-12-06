// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addMemberHash() => r'81845c4b4bffd55b2ecf7486811170b76555cb57';

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
    String fullname,
    String nik,
    String nomorAnggota,
    String noHp,
    String address,
    DateTime? dateOfBirth,
    String email,
    String gender,
    String religion,
    String jabatan,
    String pangkat,
    String nip,
    DateTime? startDate,
    DateTime? endDate,
    int workUnitId,
  ) {
    return AddMemberProvider(
      fullname,
      nik,
      nomorAnggota,
      noHp,
      address,
      dateOfBirth,
      email,
      gender,
      religion,
      jabatan,
      pangkat,
      nip,
      startDate,
      endDate,
      workUnitId,
    );
  }

  @override
  AddMemberProvider getProviderOverride(
    covariant AddMemberProvider provider,
  ) {
    return call(
      provider.fullname,
      provider.nik,
      provider.nomorAnggota,
      provider.noHp,
      provider.address,
      provider.dateOfBirth,
      provider.email,
      provider.gender,
      provider.religion,
      provider.jabatan,
      provider.pangkat,
      provider.nip,
      provider.startDate,
      provider.endDate,
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
    String fullname,
    String nik,
    String nomorAnggota,
    String noHp,
    String address,
    DateTime? dateOfBirth,
    String email,
    String gender,
    String religion,
    String jabatan,
    String pangkat,
    String nip,
    DateTime? startDate,
    DateTime? endDate,
    int workUnitId,
  ) : this._internal(
          (ref) => addMember(
            ref as AddMemberRef,
            fullname,
            nik,
            nomorAnggota,
            noHp,
            address,
            dateOfBirth,
            email,
            gender,
            religion,
            jabatan,
            pangkat,
            nip,
            startDate,
            endDate,
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
          fullname: fullname,
          nik: nik,
          nomorAnggota: nomorAnggota,
          noHp: noHp,
          address: address,
          dateOfBirth: dateOfBirth,
          email: email,
          gender: gender,
          religion: religion,
          jabatan: jabatan,
          pangkat: pangkat,
          nip: nip,
          startDate: startDate,
          endDate: endDate,
          workUnitId: workUnitId,
        );

  AddMemberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fullname,
    required this.nik,
    required this.nomorAnggota,
    required this.noHp,
    required this.address,
    required this.dateOfBirth,
    required this.email,
    required this.gender,
    required this.religion,
    required this.jabatan,
    required this.pangkat,
    required this.nip,
    required this.startDate,
    required this.endDate,
    required this.workUnitId,
  }) : super.internal();

  final String fullname;
  final String nik;
  final String nomorAnggota;
  final String noHp;
  final String address;
  final DateTime? dateOfBirth;
  final String email;
  final String gender;
  final String religion;
  final String jabatan;
  final String pangkat;
  final String nip;
  final DateTime? startDate;
  final DateTime? endDate;
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
        fullname: fullname,
        nik: nik,
        nomorAnggota: nomorAnggota,
        noHp: noHp,
        address: address,
        dateOfBirth: dateOfBirth,
        email: email,
        gender: gender,
        religion: religion,
        jabatan: jabatan,
        pangkat: pangkat,
        nip: nip,
        startDate: startDate,
        endDate: endDate,
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
        other.fullname == fullname &&
        other.nik == nik &&
        other.nomorAnggota == nomorAnggota &&
        other.noHp == noHp &&
        other.address == address &&
        other.dateOfBirth == dateOfBirth &&
        other.email == email &&
        other.gender == gender &&
        other.religion == religion &&
        other.jabatan == jabatan &&
        other.pangkat == pangkat &&
        other.nip == nip &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.workUnitId == workUnitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fullname.hashCode);
    hash = _SystemHash.combine(hash, nik.hashCode);
    hash = _SystemHash.combine(hash, nomorAnggota.hashCode);
    hash = _SystemHash.combine(hash, noHp.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, dateOfBirth.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, gender.hashCode);
    hash = _SystemHash.combine(hash, religion.hashCode);
    hash = _SystemHash.combine(hash, jabatan.hashCode);
    hash = _SystemHash.combine(hash, pangkat.hashCode);
    hash = _SystemHash.combine(hash, nip.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `fullname` of this provider.
  String get fullname;

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

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `gender` of this provider.
  String get gender;

  /// The parameter `religion` of this provider.
  String get religion;

  /// The parameter `jabatan` of this provider.
  String get jabatan;

  /// The parameter `pangkat` of this provider.
  String get pangkat;

  /// The parameter `nip` of this provider.
  String get nip;

  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;
}

class _AddMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with AddMemberRef {
  _AddMemberProviderElement(super.provider);

  @override
  String get fullname => (origin as AddMemberProvider).fullname;
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
  String get email => (origin as AddMemberProvider).email;
  @override
  String get gender => (origin as AddMemberProvider).gender;
  @override
  String get religion => (origin as AddMemberProvider).religion;
  @override
  String get jabatan => (origin as AddMemberProvider).jabatan;
  @override
  String get pangkat => (origin as AddMemberProvider).pangkat;
  @override
  String get nip => (origin as AddMemberProvider).nip;
  @override
  DateTime? get startDate => (origin as AddMemberProvider).startDate;
  @override
  DateTime? get endDate => (origin as AddMemberProvider).endDate;
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
String _$getMemberHash() => r'a16b567e00c5ccab446f43e7e6ef48b39d124eea';

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

String _$updateMemberHash() => r'a9b57e2be4709af82eca9c4ee539074563f33005';

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
    String fullname,
    String nik,
    String nomorAnggota,
    String noHp,
    String address,
    DateTime? dateOfBirth,
    String email,
    String gender,
    String religion,
    String jabatan,
    String pangkat,
    String nip,
    int isActive,
    DateTime? startDate,
    DateTime? endDate,
    int workUnitId,
  ) {
    return UpdateMemberProvider(
      id,
      fullname,
      nik,
      nomorAnggota,
      noHp,
      address,
      dateOfBirth,
      email,
      gender,
      religion,
      jabatan,
      pangkat,
      nip,
      isActive,
      startDate,
      endDate,
      workUnitId,
    );
  }

  @override
  UpdateMemberProvider getProviderOverride(
    covariant UpdateMemberProvider provider,
  ) {
    return call(
      provider.id,
      provider.fullname,
      provider.nik,
      provider.nomorAnggota,
      provider.noHp,
      provider.address,
      provider.dateOfBirth,
      provider.email,
      provider.gender,
      provider.religion,
      provider.jabatan,
      provider.pangkat,
      provider.nip,
      provider.isActive,
      provider.startDate,
      provider.endDate,
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
    String fullname,
    String nik,
    String nomorAnggota,
    String noHp,
    String address,
    DateTime? dateOfBirth,
    String email,
    String gender,
    String religion,
    String jabatan,
    String pangkat,
    String nip,
    int isActive,
    DateTime? startDate,
    DateTime? endDate,
    int workUnitId,
  ) : this._internal(
          (ref) => updateMember(
            ref as UpdateMemberRef,
            id,
            fullname,
            nik,
            nomorAnggota,
            noHp,
            address,
            dateOfBirth,
            email,
            gender,
            religion,
            jabatan,
            pangkat,
            nip,
            isActive,
            startDate,
            endDate,
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
          fullname: fullname,
          nik: nik,
          nomorAnggota: nomorAnggota,
          noHp: noHp,
          address: address,
          dateOfBirth: dateOfBirth,
          email: email,
          gender: gender,
          religion: religion,
          jabatan: jabatan,
          pangkat: pangkat,
          nip: nip,
          isActive: isActive,
          startDate: startDate,
          endDate: endDate,
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
    required this.fullname,
    required this.nik,
    required this.nomorAnggota,
    required this.noHp,
    required this.address,
    required this.dateOfBirth,
    required this.email,
    required this.gender,
    required this.religion,
    required this.jabatan,
    required this.pangkat,
    required this.nip,
    required this.isActive,
    required this.startDate,
    required this.endDate,
    required this.workUnitId,
  }) : super.internal();

  final String id;
  final String fullname;
  final String nik;
  final String nomorAnggota;
  final String noHp;
  final String address;
  final DateTime? dateOfBirth;
  final String email;
  final String gender;
  final String religion;
  final String jabatan;
  final String pangkat;
  final String nip;
  final int isActive;
  final DateTime? startDate;
  final DateTime? endDate;
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
        fullname: fullname,
        nik: nik,
        nomorAnggota: nomorAnggota,
        noHp: noHp,
        address: address,
        dateOfBirth: dateOfBirth,
        email: email,
        gender: gender,
        religion: religion,
        jabatan: jabatan,
        pangkat: pangkat,
        nip: nip,
        isActive: isActive,
        startDate: startDate,
        endDate: endDate,
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
        other.fullname == fullname &&
        other.nik == nik &&
        other.nomorAnggota == nomorAnggota &&
        other.noHp == noHp &&
        other.address == address &&
        other.dateOfBirth == dateOfBirth &&
        other.email == email &&
        other.gender == gender &&
        other.religion == religion &&
        other.jabatan == jabatan &&
        other.pangkat == pangkat &&
        other.nip == nip &&
        other.isActive == isActive &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.workUnitId == workUnitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, fullname.hashCode);
    hash = _SystemHash.combine(hash, nik.hashCode);
    hash = _SystemHash.combine(hash, nomorAnggota.hashCode);
    hash = _SystemHash.combine(hash, noHp.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, dateOfBirth.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, gender.hashCode);
    hash = _SystemHash.combine(hash, religion.hashCode);
    hash = _SystemHash.combine(hash, jabatan.hashCode);
    hash = _SystemHash.combine(hash, pangkat.hashCode);
    hash = _SystemHash.combine(hash, nip.hashCode);
    hash = _SystemHash.combine(hash, isActive.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `fullname` of this provider.
  String get fullname;

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

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `gender` of this provider.
  String get gender;

  /// The parameter `religion` of this provider.
  String get religion;

  /// The parameter `jabatan` of this provider.
  String get jabatan;

  /// The parameter `pangkat` of this provider.
  String get pangkat;

  /// The parameter `nip` of this provider.
  String get nip;

  /// The parameter `isActive` of this provider.
  int get isActive;

  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;
}

class _UpdateMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with UpdateMemberRef {
  _UpdateMemberProviderElement(super.provider);

  @override
  String get id => (origin as UpdateMemberProvider).id;
  @override
  String get fullname => (origin as UpdateMemberProvider).fullname;
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
  String get email => (origin as UpdateMemberProvider).email;
  @override
  String get gender => (origin as UpdateMemberProvider).gender;
  @override
  String get religion => (origin as UpdateMemberProvider).religion;
  @override
  String get jabatan => (origin as UpdateMemberProvider).jabatan;
  @override
  String get pangkat => (origin as UpdateMemberProvider).pangkat;
  @override
  String get nip => (origin as UpdateMemberProvider).nip;
  @override
  int get isActive => (origin as UpdateMemberProvider).isActive;
  @override
  DateTime? get startDate => (origin as UpdateMemberProvider).startDate;
  @override
  DateTime? get endDate => (origin as UpdateMemberProvider).endDate;
  @override
  int get workUnitId => (origin as UpdateMemberProvider).workUnitId;
}

String _$deleteMemberHash() => r'9651d1aa621c81ffed929d8e639a9cf9a07bd8f8';

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
