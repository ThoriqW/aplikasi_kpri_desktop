// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addMemberHash() => r'1627467d3129f8d46c71860fd215915a40586f5d';

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
    String namaLengkap,
    String nik,
    String nomorAnggota,
    String noHp,
    String alamat,
    DateTime? dateOfBirth,
    String email,
    String jenisKelamin,
    String agama,
    String jabatan,
    String pangkat,
    String nip,
    DateTime? tanggalMasuk,
    int workUnitId,
    int status,
  ) {
    return AddMemberProvider(
      namaLengkap,
      nik,
      nomorAnggota,
      noHp,
      alamat,
      dateOfBirth,
      email,
      jenisKelamin,
      agama,
      jabatan,
      pangkat,
      nip,
      tanggalMasuk,
      workUnitId,
      status,
    );
  }

  @override
  AddMemberProvider getProviderOverride(
    covariant AddMemberProvider provider,
  ) {
    return call(
      provider.namaLengkap,
      provider.nik,
      provider.nomorAnggota,
      provider.noHp,
      provider.alamat,
      provider.dateOfBirth,
      provider.email,
      provider.jenisKelamin,
      provider.agama,
      provider.jabatan,
      provider.pangkat,
      provider.nip,
      provider.tanggalMasuk,
      provider.workUnitId,
      provider.status,
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
    String namaLengkap,
    String nik,
    String nomorAnggota,
    String noHp,
    String alamat,
    DateTime? dateOfBirth,
    String email,
    String jenisKelamin,
    String agama,
    String jabatan,
    String pangkat,
    String nip,
    DateTime? tanggalMasuk,
    int workUnitId,
    int status,
  ) : this._internal(
          (ref) => addMember(
            ref as AddMemberRef,
            namaLengkap,
            nik,
            nomorAnggota,
            noHp,
            alamat,
            dateOfBirth,
            email,
            jenisKelamin,
            agama,
            jabatan,
            pangkat,
            nip,
            tanggalMasuk,
            workUnitId,
            status,
          ),
          from: addMemberProvider,
          name: r'addMemberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addMemberHash,
          dependencies: AddMemberFamily._dependencies,
          allTransitiveDependencies: AddMemberFamily._allTransitiveDependencies,
          namaLengkap: namaLengkap,
          nik: nik,
          nomorAnggota: nomorAnggota,
          noHp: noHp,
          alamat: alamat,
          dateOfBirth: dateOfBirth,
          email: email,
          jenisKelamin: jenisKelamin,
          agama: agama,
          jabatan: jabatan,
          pangkat: pangkat,
          nip: nip,
          tanggalMasuk: tanggalMasuk,
          workUnitId: workUnitId,
          status: status,
        );

  AddMemberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.namaLengkap,
    required this.nik,
    required this.nomorAnggota,
    required this.noHp,
    required this.alamat,
    required this.dateOfBirth,
    required this.email,
    required this.jenisKelamin,
    required this.agama,
    required this.jabatan,
    required this.pangkat,
    required this.nip,
    required this.tanggalMasuk,
    required this.workUnitId,
    required this.status,
  }) : super.internal();

  final String namaLengkap;
  final String nik;
  final String nomorAnggota;
  final String noHp;
  final String alamat;
  final DateTime? dateOfBirth;
  final String email;
  final String jenisKelamin;
  final String agama;
  final String jabatan;
  final String pangkat;
  final String nip;
  final DateTime? tanggalMasuk;
  final int workUnitId;
  final int status;

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
        namaLengkap: namaLengkap,
        nik: nik,
        nomorAnggota: nomorAnggota,
        noHp: noHp,
        alamat: alamat,
        dateOfBirth: dateOfBirth,
        email: email,
        jenisKelamin: jenisKelamin,
        agama: agama,
        jabatan: jabatan,
        pangkat: pangkat,
        nip: nip,
        tanggalMasuk: tanggalMasuk,
        workUnitId: workUnitId,
        status: status,
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
        other.namaLengkap == namaLengkap &&
        other.nik == nik &&
        other.nomorAnggota == nomorAnggota &&
        other.noHp == noHp &&
        other.alamat == alamat &&
        other.dateOfBirth == dateOfBirth &&
        other.email == email &&
        other.jenisKelamin == jenisKelamin &&
        other.agama == agama &&
        other.jabatan == jabatan &&
        other.pangkat == pangkat &&
        other.nip == nip &&
        other.tanggalMasuk == tanggalMasuk &&
        other.workUnitId == workUnitId &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, namaLengkap.hashCode);
    hash = _SystemHash.combine(hash, nik.hashCode);
    hash = _SystemHash.combine(hash, nomorAnggota.hashCode);
    hash = _SystemHash.combine(hash, noHp.hashCode);
    hash = _SystemHash.combine(hash, alamat.hashCode);
    hash = _SystemHash.combine(hash, dateOfBirth.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, jenisKelamin.hashCode);
    hash = _SystemHash.combine(hash, agama.hashCode);
    hash = _SystemHash.combine(hash, jabatan.hashCode);
    hash = _SystemHash.combine(hash, pangkat.hashCode);
    hash = _SystemHash.combine(hash, nip.hashCode);
    hash = _SystemHash.combine(hash, tanggalMasuk.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `namaLengkap` of this provider.
  String get namaLengkap;

  /// The parameter `nik` of this provider.
  String get nik;

  /// The parameter `nomorAnggota` of this provider.
  String get nomorAnggota;

  /// The parameter `noHp` of this provider.
  String get noHp;

  /// The parameter `alamat` of this provider.
  String get alamat;

  /// The parameter `dateOfBirth` of this provider.
  DateTime? get dateOfBirth;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `jenisKelamin` of this provider.
  String get jenisKelamin;

  /// The parameter `agama` of this provider.
  String get agama;

  /// The parameter `jabatan` of this provider.
  String get jabatan;

  /// The parameter `pangkat` of this provider.
  String get pangkat;

  /// The parameter `nip` of this provider.
  String get nip;

  /// The parameter `tanggalMasuk` of this provider.
  DateTime? get tanggalMasuk;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;

  /// The parameter `status` of this provider.
  int get status;
}

class _AddMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with AddMemberRef {
  _AddMemberProviderElement(super.provider);

  @override
  String get namaLengkap => (origin as AddMemberProvider).namaLengkap;
  @override
  String get nik => (origin as AddMemberProvider).nik;
  @override
  String get nomorAnggota => (origin as AddMemberProvider).nomorAnggota;
  @override
  String get noHp => (origin as AddMemberProvider).noHp;
  @override
  String get alamat => (origin as AddMemberProvider).alamat;
  @override
  DateTime? get dateOfBirth => (origin as AddMemberProvider).dateOfBirth;
  @override
  String get email => (origin as AddMemberProvider).email;
  @override
  String get jenisKelamin => (origin as AddMemberProvider).jenisKelamin;
  @override
  String get agama => (origin as AddMemberProvider).agama;
  @override
  String get jabatan => (origin as AddMemberProvider).jabatan;
  @override
  String get pangkat => (origin as AddMemberProvider).pangkat;
  @override
  String get nip => (origin as AddMemberProvider).nip;
  @override
  DateTime? get tanggalMasuk => (origin as AddMemberProvider).tanggalMasuk;
  @override
  int get workUnitId => (origin as AddMemberProvider).workUnitId;
  @override
  int get status => (origin as AddMemberProvider).status;
}

String _$getAllMemberHash() => r'36c508198129346ab8c1a0d13a7ac9e04380f4ec';

/// See also [getAllMember].
@ProviderFor(getAllMember)
const getAllMemberProvider = GetAllMemberFamily();

/// See also [getAllMember].
class GetAllMemberFamily extends Family<AsyncValue> {
  /// See also [getAllMember].
  const GetAllMemberFamily();

  /// See also [getAllMember].
  GetAllMemberProvider call(
    String search,
    int workUnitId,
    String status,
    int perPage,
    int page,
  ) {
    return GetAllMemberProvider(
      search,
      workUnitId,
      status,
      perPage,
      page,
    );
  }

  @override
  GetAllMemberProvider getProviderOverride(
    covariant GetAllMemberProvider provider,
  ) {
    return call(
      provider.search,
      provider.workUnitId,
      provider.status,
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
  String? get name => r'getAllMemberProvider';
}

/// See also [getAllMember].
class GetAllMemberProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getAllMember].
  GetAllMemberProvider(
    String search,
    int workUnitId,
    String status,
    int perPage,
    int page,
  ) : this._internal(
          (ref) => getAllMember(
            ref as GetAllMemberRef,
            search,
            workUnitId,
            status,
            perPage,
            page,
          ),
          from: getAllMemberProvider,
          name: r'getAllMemberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllMemberHash,
          dependencies: GetAllMemberFamily._dependencies,
          allTransitiveDependencies:
              GetAllMemberFamily._allTransitiveDependencies,
          search: search,
          workUnitId: workUnitId,
          status: status,
          perPage: perPage,
          page: page,
        );

  GetAllMemberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
    required this.workUnitId,
    required this.status,
    required this.perPage,
    required this.page,
  }) : super.internal();

  final String search;
  final int workUnitId;
  final String status;
  final int perPage;
  final int page;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(GetAllMemberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllMemberProvider._internal(
        (ref) => create(ref as GetAllMemberRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
        workUnitId: workUnitId,
        status: status,
        perPage: perPage,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _GetAllMemberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllMemberProvider &&
        other.search == search &&
        other.workUnitId == workUnitId &&
        other.status == status &&
        other.perPage == perPage &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAllMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `search` of this provider.
  String get search;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;

  /// The parameter `status` of this provider.
  String get status;

  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `page` of this provider.
  int get page;
}

class _GetAllMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with GetAllMemberRef {
  _GetAllMemberProviderElement(super.provider);

  @override
  String get search => (origin as GetAllMemberProvider).search;
  @override
  int get workUnitId => (origin as GetAllMemberProvider).workUnitId;
  @override
  String get status => (origin as GetAllMemberProvider).status;
  @override
  int get perPage => (origin as GetAllMemberProvider).perPage;
  @override
  int get page => (origin as GetAllMemberProvider).page;
}

String _$getMemberHash() => r'a54925ebce3057d680ddfb1c5677beed079b5de4';

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

String _$updateMemberHash() => r'8329ceafc00dd777fbafefe1bde9e5f7a835793d';

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
    String namaLengkap,
    String nik,
    String nomorAnggota,
    String noHp,
    String alamat,
    DateTime? dateOfBirth,
    String email,
    String jenisKelamin,
    String agama,
    String nip,
    DateTime? tanggalMasuk,
    DateTime? tanggalKeluar,
    int workUnitId,
    int status,
  ) {
    return UpdateMemberProvider(
      id,
      namaLengkap,
      nik,
      nomorAnggota,
      noHp,
      alamat,
      dateOfBirth,
      email,
      jenisKelamin,
      agama,
      nip,
      tanggalMasuk,
      tanggalKeluar,
      workUnitId,
      status,
    );
  }

  @override
  UpdateMemberProvider getProviderOverride(
    covariant UpdateMemberProvider provider,
  ) {
    return call(
      provider.id,
      provider.namaLengkap,
      provider.nik,
      provider.nomorAnggota,
      provider.noHp,
      provider.alamat,
      provider.dateOfBirth,
      provider.email,
      provider.jenisKelamin,
      provider.agama,
      provider.nip,
      provider.tanggalMasuk,
      provider.tanggalKeluar,
      provider.workUnitId,
      provider.status,
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
    String namaLengkap,
    String nik,
    String nomorAnggota,
    String noHp,
    String alamat,
    DateTime? dateOfBirth,
    String email,
    String jenisKelamin,
    String agama,
    String nip,
    DateTime? tanggalMasuk,
    DateTime? tanggalKeluar,
    int workUnitId,
    int status,
  ) : this._internal(
          (ref) => updateMember(
            ref as UpdateMemberRef,
            id,
            namaLengkap,
            nik,
            nomorAnggota,
            noHp,
            alamat,
            dateOfBirth,
            email,
            jenisKelamin,
            agama,
            nip,
            tanggalMasuk,
            tanggalKeluar,
            workUnitId,
            status,
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
          namaLengkap: namaLengkap,
          nik: nik,
          nomorAnggota: nomorAnggota,
          noHp: noHp,
          alamat: alamat,
          dateOfBirth: dateOfBirth,
          email: email,
          jenisKelamin: jenisKelamin,
          agama: agama,
          nip: nip,
          tanggalMasuk: tanggalMasuk,
          tanggalKeluar: tanggalKeluar,
          workUnitId: workUnitId,
          status: status,
        );

  UpdateMemberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.namaLengkap,
    required this.nik,
    required this.nomorAnggota,
    required this.noHp,
    required this.alamat,
    required this.dateOfBirth,
    required this.email,
    required this.jenisKelamin,
    required this.agama,
    required this.nip,
    required this.tanggalMasuk,
    required this.tanggalKeluar,
    required this.workUnitId,
    required this.status,
  }) : super.internal();

  final String id;
  final String namaLengkap;
  final String nik;
  final String nomorAnggota;
  final String noHp;
  final String alamat;
  final DateTime? dateOfBirth;
  final String email;
  final String jenisKelamin;
  final String agama;
  final String nip;
  final DateTime? tanggalMasuk;
  final DateTime? tanggalKeluar;
  final int workUnitId;
  final int status;

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
        namaLengkap: namaLengkap,
        nik: nik,
        nomorAnggota: nomorAnggota,
        noHp: noHp,
        alamat: alamat,
        dateOfBirth: dateOfBirth,
        email: email,
        jenisKelamin: jenisKelamin,
        agama: agama,
        nip: nip,
        tanggalMasuk: tanggalMasuk,
        tanggalKeluar: tanggalKeluar,
        workUnitId: workUnitId,
        status: status,
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
        other.namaLengkap == namaLengkap &&
        other.nik == nik &&
        other.nomorAnggota == nomorAnggota &&
        other.noHp == noHp &&
        other.alamat == alamat &&
        other.dateOfBirth == dateOfBirth &&
        other.email == email &&
        other.jenisKelamin == jenisKelamin &&
        other.agama == agama &&
        other.nip == nip &&
        other.tanggalMasuk == tanggalMasuk &&
        other.tanggalKeluar == tanggalKeluar &&
        other.workUnitId == workUnitId &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, namaLengkap.hashCode);
    hash = _SystemHash.combine(hash, nik.hashCode);
    hash = _SystemHash.combine(hash, nomorAnggota.hashCode);
    hash = _SystemHash.combine(hash, noHp.hashCode);
    hash = _SystemHash.combine(hash, alamat.hashCode);
    hash = _SystemHash.combine(hash, dateOfBirth.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, jenisKelamin.hashCode);
    hash = _SystemHash.combine(hash, agama.hashCode);
    hash = _SystemHash.combine(hash, nip.hashCode);
    hash = _SystemHash.combine(hash, tanggalMasuk.hashCode);
    hash = _SystemHash.combine(hash, tanggalKeluar.hashCode);
    hash = _SystemHash.combine(hash, workUnitId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `namaLengkap` of this provider.
  String get namaLengkap;

  /// The parameter `nik` of this provider.
  String get nik;

  /// The parameter `nomorAnggota` of this provider.
  String get nomorAnggota;

  /// The parameter `noHp` of this provider.
  String get noHp;

  /// The parameter `alamat` of this provider.
  String get alamat;

  /// The parameter `dateOfBirth` of this provider.
  DateTime? get dateOfBirth;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `jenisKelamin` of this provider.
  String get jenisKelamin;

  /// The parameter `agama` of this provider.
  String get agama;

  /// The parameter `nip` of this provider.
  String get nip;

  /// The parameter `tanggalMasuk` of this provider.
  DateTime? get tanggalMasuk;

  /// The parameter `tanggalKeluar` of this provider.
  DateTime? get tanggalKeluar;

  /// The parameter `workUnitId` of this provider.
  int get workUnitId;

  /// The parameter `status` of this provider.
  int get status;
}

class _UpdateMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with UpdateMemberRef {
  _UpdateMemberProviderElement(super.provider);

  @override
  String get id => (origin as UpdateMemberProvider).id;
  @override
  String get namaLengkap => (origin as UpdateMemberProvider).namaLengkap;
  @override
  String get nik => (origin as UpdateMemberProvider).nik;
  @override
  String get nomorAnggota => (origin as UpdateMemberProvider).nomorAnggota;
  @override
  String get noHp => (origin as UpdateMemberProvider).noHp;
  @override
  String get alamat => (origin as UpdateMemberProvider).alamat;
  @override
  DateTime? get dateOfBirth => (origin as UpdateMemberProvider).dateOfBirth;
  @override
  String get email => (origin as UpdateMemberProvider).email;
  @override
  String get jenisKelamin => (origin as UpdateMemberProvider).jenisKelamin;
  @override
  String get agama => (origin as UpdateMemberProvider).agama;
  @override
  String get nip => (origin as UpdateMemberProvider).nip;
  @override
  DateTime? get tanggalMasuk => (origin as UpdateMemberProvider).tanggalMasuk;
  @override
  DateTime? get tanggalKeluar => (origin as UpdateMemberProvider).tanggalKeluar;
  @override
  int get workUnitId => (origin as UpdateMemberProvider).workUnitId;
  @override
  int get status => (origin as UpdateMemberProvider).status;
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

String _$resetPasswordMemberHash() =>
    r'0b5976bbe9fb64368b2912f35989343b559fdd70';

/// See also [resetPasswordMember].
@ProviderFor(resetPasswordMember)
const resetPasswordMemberProvider = ResetPasswordMemberFamily();

/// See also [resetPasswordMember].
class ResetPasswordMemberFamily extends Family<AsyncValue> {
  /// See also [resetPasswordMember].
  const ResetPasswordMemberFamily();

  /// See also [resetPasswordMember].
  ResetPasswordMemberProvider call(
    String id,
  ) {
    return ResetPasswordMemberProvider(
      id,
    );
  }

  @override
  ResetPasswordMemberProvider getProviderOverride(
    covariant ResetPasswordMemberProvider provider,
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
  String? get name => r'resetPasswordMemberProvider';
}

/// See also [resetPasswordMember].
class ResetPasswordMemberProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [resetPasswordMember].
  ResetPasswordMemberProvider(
    String id,
  ) : this._internal(
          (ref) => resetPasswordMember(
            ref as ResetPasswordMemberRef,
            id,
          ),
          from: resetPasswordMemberProvider,
          name: r'resetPasswordMemberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resetPasswordMemberHash,
          dependencies: ResetPasswordMemberFamily._dependencies,
          allTransitiveDependencies:
              ResetPasswordMemberFamily._allTransitiveDependencies,
          id: id,
        );

  ResetPasswordMemberProvider._internal(
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
    FutureOr<Object?> Function(ResetPasswordMemberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResetPasswordMemberProvider._internal(
        (ref) => create(ref as ResetPasswordMemberRef),
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
    return _ResetPasswordMemberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResetPasswordMemberProvider && other.id == id;
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
mixin ResetPasswordMemberRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ResetPasswordMemberProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with ResetPasswordMemberRef {
  _ResetPasswordMemberProviderElement(super.provider);

  @override
  String get id => (origin as ResetPasswordMemberProvider).id;
}

String _$getDropDownMemberHash() => r'638122e430a0b4072e0b137d38624879fbbfcd1d';

/// See also [getDropDownMember].
@ProviderFor(getDropDownMember)
final getDropDownMemberProvider = AutoDisposeFutureProvider<Object?>.internal(
  getDropDownMember,
  name: r'getDropDownMemberProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDropDownMemberHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetDropDownMemberRef = AutoDisposeFutureProviderRef<Object?>;
String _$totalPageMemberHash() => r'bf35a5bcd8749654d6722976e731606d629ca14e';

/// See also [TotalPageMember].
@ProviderFor(TotalPageMember)
final totalPageMemberProvider =
    AutoDisposeNotifierProvider<TotalPageMember, int>.internal(
  TotalPageMember.new,
  name: r'totalPageMemberProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalPageMemberHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalPageMember = AutoDisposeNotifier<int>;
String _$searchMemberHash() => r'5d7ba27a23e1b080751cf95da02797699b2f474f';

/// See also [SearchMember].
@ProviderFor(SearchMember)
final searchMemberProvider =
    AutoDisposeNotifierProvider<SearchMember, Map<String, dynamic>>.internal(
  SearchMember.new,
  name: r'searchMemberProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchMemberHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchMember = AutoDisposeNotifier<Map<String, dynamic>>;
String _$memberModeNotifierHash() =>
    r'9eff80b7a79d069b799e8c4ef77a489f1597e334';

/// See also [MemberModeNotifier].
@ProviderFor(MemberModeNotifier)
final memberModeNotifierProvider =
    AutoDisposeNotifierProvider<MemberModeNotifier, MemberMode>.internal(
  MemberModeNotifier.new,
  name: r'memberModeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$memberModeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MemberModeNotifier = AutoDisposeNotifier<MemberMode>;
String _$idMemberNotifierHash() => r'9b9d28a98cf4b112742db76cfa81ed62a7e796e4';

/// See also [IdMemberNotifier].
@ProviderFor(IdMemberNotifier)
final idMemberNotifierProvider =
    AutoDisposeNotifierProvider<IdMemberNotifier, int>.internal(
  IdMemberNotifier.new,
  name: r'idMemberNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$idMemberNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IdMemberNotifier = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
