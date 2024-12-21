// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCurrentUserHash() => r'32ec4476f10b80df0cff4ccabf8581c56865545d';

/// See also [getCurrentUser].
@ProviderFor(getCurrentUser)
final getCurrentUserProvider = AutoDisposeFutureProvider<Object?>.internal(
  getCurrentUser,
  name: r'getCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCurrentUserRef = AutoDisposeFutureProviderRef<Object?>;
String _$updateCurrentUserHash() => r'1ab21e132258c2abdb17e941dd7bb0f19b9b418b';

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

/// See also [updateCurrentUser].
@ProviderFor(updateCurrentUser)
const updateCurrentUserProvider = UpdateCurrentUserFamily();

/// See also [updateCurrentUser].
class UpdateCurrentUserFamily extends Family<AsyncValue> {
  /// See also [updateCurrentUser].
  const UpdateCurrentUserFamily();

  /// See also [updateCurrentUser].
  UpdateCurrentUserProvider call(
    String username,
    String? password,
    String namaLengkap,
    String nik,
    String email,
    String noHp,
    String alamat,
    DateTime? dateOfBirth,
    String jenisKelamin,
    String agama,
  ) {
    return UpdateCurrentUserProvider(
      username,
      password,
      namaLengkap,
      nik,
      email,
      noHp,
      alamat,
      dateOfBirth,
      jenisKelamin,
      agama,
    );
  }

  @override
  UpdateCurrentUserProvider getProviderOverride(
    covariant UpdateCurrentUserProvider provider,
  ) {
    return call(
      provider.username,
      provider.password,
      provider.namaLengkap,
      provider.nik,
      provider.email,
      provider.noHp,
      provider.alamat,
      provider.dateOfBirth,
      provider.jenisKelamin,
      provider.agama,
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
  String? get name => r'updateCurrentUserProvider';
}

/// See also [updateCurrentUser].
class UpdateCurrentUserProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateCurrentUser].
  UpdateCurrentUserProvider(
    String username,
    String? password,
    String namaLengkap,
    String nik,
    String email,
    String noHp,
    String alamat,
    DateTime? dateOfBirth,
    String jenisKelamin,
    String agama,
  ) : this._internal(
          (ref) => updateCurrentUser(
            ref as UpdateCurrentUserRef,
            username,
            password,
            namaLengkap,
            nik,
            email,
            noHp,
            alamat,
            dateOfBirth,
            jenisKelamin,
            agama,
          ),
          from: updateCurrentUserProvider,
          name: r'updateCurrentUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCurrentUserHash,
          dependencies: UpdateCurrentUserFamily._dependencies,
          allTransitiveDependencies:
              UpdateCurrentUserFamily._allTransitiveDependencies,
          username: username,
          password: password,
          namaLengkap: namaLengkap,
          nik: nik,
          email: email,
          noHp: noHp,
          alamat: alamat,
          dateOfBirth: dateOfBirth,
          jenisKelamin: jenisKelamin,
          agama: agama,
        );

  UpdateCurrentUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.password,
    required this.namaLengkap,
    required this.nik,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.dateOfBirth,
    required this.jenisKelamin,
    required this.agama,
  }) : super.internal();

  final String username;
  final String? password;
  final String namaLengkap;
  final String nik;
  final String email;
  final String noHp;
  final String alamat;
  final DateTime? dateOfBirth;
  final String jenisKelamin;
  final String agama;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UpdateCurrentUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCurrentUserProvider._internal(
        (ref) => create(ref as UpdateCurrentUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        password: password,
        namaLengkap: namaLengkap,
        nik: nik,
        email: email,
        noHp: noHp,
        alamat: alamat,
        dateOfBirth: dateOfBirth,
        jenisKelamin: jenisKelamin,
        agama: agama,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UpdateCurrentUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCurrentUserProvider &&
        other.username == username &&
        other.password == password &&
        other.namaLengkap == namaLengkap &&
        other.nik == nik &&
        other.email == email &&
        other.noHp == noHp &&
        other.alamat == alamat &&
        other.dateOfBirth == dateOfBirth &&
        other.jenisKelamin == jenisKelamin &&
        other.agama == agama;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, namaLengkap.hashCode);
    hash = _SystemHash.combine(hash, nik.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, noHp.hashCode);
    hash = _SystemHash.combine(hash, alamat.hashCode);
    hash = _SystemHash.combine(hash, dateOfBirth.hashCode);
    hash = _SystemHash.combine(hash, jenisKelamin.hashCode);
    hash = _SystemHash.combine(hash, agama.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateCurrentUserRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `password` of this provider.
  String? get password;

  /// The parameter `namaLengkap` of this provider.
  String get namaLengkap;

  /// The parameter `nik` of this provider.
  String get nik;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `noHp` of this provider.
  String get noHp;

  /// The parameter `alamat` of this provider.
  String get alamat;

  /// The parameter `dateOfBirth` of this provider.
  DateTime? get dateOfBirth;

  /// The parameter `jenisKelamin` of this provider.
  String get jenisKelamin;

  /// The parameter `agama` of this provider.
  String get agama;
}

class _UpdateCurrentUserProviderElement
    extends AutoDisposeFutureProviderElement<Object?>
    with UpdateCurrentUserRef {
  _UpdateCurrentUserProviderElement(super.provider);

  @override
  String get username => (origin as UpdateCurrentUserProvider).username;
  @override
  String? get password => (origin as UpdateCurrentUserProvider).password;
  @override
  String get namaLengkap => (origin as UpdateCurrentUserProvider).namaLengkap;
  @override
  String get nik => (origin as UpdateCurrentUserProvider).nik;
  @override
  String get email => (origin as UpdateCurrentUserProvider).email;
  @override
  String get noHp => (origin as UpdateCurrentUserProvider).noHp;
  @override
  String get alamat => (origin as UpdateCurrentUserProvider).alamat;
  @override
  DateTime? get dateOfBirth =>
      (origin as UpdateCurrentUserProvider).dateOfBirth;
  @override
  String get jenisKelamin => (origin as UpdateCurrentUserProvider).jenisKelamin;
  @override
  String get agama => (origin as UpdateCurrentUserProvider).agama;
}

String _$getAllUserHash() => r'd3b09d766323ae2df40fa3d40e2a15e589ffdf64';

/// See also [getAllUser].
@ProviderFor(getAllUser)
final getAllUserProvider = AutoDisposeFutureProvider<Object?>.internal(
  getAllUser,
  name: r'getAllUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllUserRef = AutoDisposeFutureProviderRef<Object?>;
String _$getUserHash() => r'f9d9fef786dee951a16044a8866eeb4fa99e1847';

/// See also [getUser].
@ProviderFor(getUser)
const getUserProvider = GetUserFamily();

/// See also [getUser].
class GetUserFamily extends Family<AsyncValue> {
  /// See also [getUser].
  const GetUserFamily();

  /// See also [getUser].
  GetUserProvider call(
    String id,
  ) {
    return GetUserProvider(
      id,
    );
  }

  @override
  GetUserProvider getProviderOverride(
    covariant GetUserProvider provider,
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
  String? get name => r'getUserProvider';
}

/// See also [getUser].
class GetUserProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [getUser].
  GetUserProvider(
    String id,
  ) : this._internal(
          (ref) => getUser(
            ref as GetUserRef,
            id,
          ),
          from: getUserProvider,
          name: r'getUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserHash,
          dependencies: GetUserFamily._dependencies,
          allTransitiveDependencies: GetUserFamily._allTransitiveDependencies,
          id: id,
        );

  GetUserProvider._internal(
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
    FutureOr<Object?> Function(GetUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserProvider._internal(
        (ref) => create(ref as GetUserRef),
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
    return _GetUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProvider && other.id == id;
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
mixin GetUserRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetUserProviderElement extends AutoDisposeFutureProviderElement<Object?>
    with GetUserRef {
  _GetUserProviderElement(super.provider);

  @override
  String get id => (origin as GetUserProvider).id;
}

String _$registerUserHash() => r'd12abf0288d1f7d9e53488a9355f76b4ec224065';

/// See also [registerUser].
@ProviderFor(registerUser)
const registerUserProvider = RegisterUserFamily();

/// See also [registerUser].
class RegisterUserFamily extends Family<AsyncValue> {
  /// See also [registerUser].
  const RegisterUserFamily();

  /// See also [registerUser].
  RegisterUserProvider call(
    String username,
    String password,
  ) {
    return RegisterUserProvider(
      username,
      password,
    );
  }

  @override
  RegisterUserProvider getProviderOverride(
    covariant RegisterUserProvider provider,
  ) {
    return call(
      provider.username,
      provider.password,
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
  String? get name => r'registerUserProvider';
}

/// See also [registerUser].
class RegisterUserProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [registerUser].
  RegisterUserProvider(
    String username,
    String password,
  ) : this._internal(
          (ref) => registerUser(
            ref as RegisterUserRef,
            username,
            password,
          ),
          from: registerUserProvider,
          name: r'registerUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registerUserHash,
          dependencies: RegisterUserFamily._dependencies,
          allTransitiveDependencies:
              RegisterUserFamily._allTransitiveDependencies,
          username: username,
          password: password,
        );

  RegisterUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.password,
  }) : super.internal();

  final String username;
  final String password;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(RegisterUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterUserProvider._internal(
        (ref) => create(ref as RegisterUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _RegisterUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterUserProvider &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RegisterUserRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `password` of this provider.
  String get password;
}

class _RegisterUserProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with RegisterUserRef {
  _RegisterUserProviderElement(super.provider);

  @override
  String get username => (origin as RegisterUserProvider).username;
  @override
  String get password => (origin as RegisterUserProvider).password;
}

String _$updateUserHash() => r'd23c8649a04ab3256ce25a20ba7d743b35d42627';

/// See also [updateUser].
@ProviderFor(updateUser)
const updateUserProvider = UpdateUserFamily();

/// See also [updateUser].
class UpdateUserFamily extends Family<AsyncValue> {
  /// See also [updateUser].
  const UpdateUserFamily();

  /// See also [updateUser].
  UpdateUserProvider call(
    String id,
    String username,
    String? password,
    String namaLengkap,
    String nik,
    String email,
    String noHp,
    String alamat,
    DateTime? dateOfBirth,
    String jenisKelamin,
    String agama,
  ) {
    return UpdateUserProvider(
      id,
      username,
      password,
      namaLengkap,
      nik,
      email,
      noHp,
      alamat,
      dateOfBirth,
      jenisKelamin,
      agama,
    );
  }

  @override
  UpdateUserProvider getProviderOverride(
    covariant UpdateUserProvider provider,
  ) {
    return call(
      provider.id,
      provider.username,
      provider.password,
      provider.namaLengkap,
      provider.nik,
      provider.email,
      provider.noHp,
      provider.alamat,
      provider.dateOfBirth,
      provider.jenisKelamin,
      provider.agama,
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
  String? get name => r'updateUserProvider';
}

/// See also [updateUser].
class UpdateUserProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateUser].
  UpdateUserProvider(
    String id,
    String username,
    String? password,
    String namaLengkap,
    String nik,
    String email,
    String noHp,
    String alamat,
    DateTime? dateOfBirth,
    String jenisKelamin,
    String agama,
  ) : this._internal(
          (ref) => updateUser(
            ref as UpdateUserRef,
            id,
            username,
            password,
            namaLengkap,
            nik,
            email,
            noHp,
            alamat,
            dateOfBirth,
            jenisKelamin,
            agama,
          ),
          from: updateUserProvider,
          name: r'updateUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateUserHash,
          dependencies: UpdateUserFamily._dependencies,
          allTransitiveDependencies:
              UpdateUserFamily._allTransitiveDependencies,
          id: id,
          username: username,
          password: password,
          namaLengkap: namaLengkap,
          nik: nik,
          email: email,
          noHp: noHp,
          alamat: alamat,
          dateOfBirth: dateOfBirth,
          jenisKelamin: jenisKelamin,
          agama: agama,
        );

  UpdateUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.username,
    required this.password,
    required this.namaLengkap,
    required this.nik,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.dateOfBirth,
    required this.jenisKelamin,
    required this.agama,
  }) : super.internal();

  final String id;
  final String username;
  final String? password;
  final String namaLengkap;
  final String nik;
  final String email;
  final String noHp;
  final String alamat;
  final DateTime? dateOfBirth;
  final String jenisKelamin;
  final String agama;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UpdateUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateUserProvider._internal(
        (ref) => create(ref as UpdateUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        username: username,
        password: password,
        namaLengkap: namaLengkap,
        nik: nik,
        email: email,
        noHp: noHp,
        alamat: alamat,
        dateOfBirth: dateOfBirth,
        jenisKelamin: jenisKelamin,
        agama: agama,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UpdateUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateUserProvider &&
        other.id == id &&
        other.username == username &&
        other.password == password &&
        other.namaLengkap == namaLengkap &&
        other.nik == nik &&
        other.email == email &&
        other.noHp == noHp &&
        other.alamat == alamat &&
        other.dateOfBirth == dateOfBirth &&
        other.jenisKelamin == jenisKelamin &&
        other.agama == agama;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, namaLengkap.hashCode);
    hash = _SystemHash.combine(hash, nik.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, noHp.hashCode);
    hash = _SystemHash.combine(hash, alamat.hashCode);
    hash = _SystemHash.combine(hash, dateOfBirth.hashCode);
    hash = _SystemHash.combine(hash, jenisKelamin.hashCode);
    hash = _SystemHash.combine(hash, agama.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateUserRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `password` of this provider.
  String? get password;

  /// The parameter `namaLengkap` of this provider.
  String get namaLengkap;

  /// The parameter `nik` of this provider.
  String get nik;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `noHp` of this provider.
  String get noHp;

  /// The parameter `alamat` of this provider.
  String get alamat;

  /// The parameter `dateOfBirth` of this provider.
  DateTime? get dateOfBirth;

  /// The parameter `jenisKelamin` of this provider.
  String get jenisKelamin;

  /// The parameter `agama` of this provider.
  String get agama;
}

class _UpdateUserProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with UpdateUserRef {
  _UpdateUserProviderElement(super.provider);

  @override
  String get id => (origin as UpdateUserProvider).id;
  @override
  String get username => (origin as UpdateUserProvider).username;
  @override
  String? get password => (origin as UpdateUserProvider).password;
  @override
  String get namaLengkap => (origin as UpdateUserProvider).namaLengkap;
  @override
  String get nik => (origin as UpdateUserProvider).nik;
  @override
  String get email => (origin as UpdateUserProvider).email;
  @override
  String get noHp => (origin as UpdateUserProvider).noHp;
  @override
  String get alamat => (origin as UpdateUserProvider).alamat;
  @override
  DateTime? get dateOfBirth => (origin as UpdateUserProvider).dateOfBirth;
  @override
  String get jenisKelamin => (origin as UpdateUserProvider).jenisKelamin;
  @override
  String get agama => (origin as UpdateUserProvider).agama;
}

String _$deleteUserHash() => r'20d3c1520c0ab9a557df6b2ce1573a8ceaed8632';

/// See also [deleteUser].
@ProviderFor(deleteUser)
const deleteUserProvider = DeleteUserFamily();

/// See also [deleteUser].
class DeleteUserFamily extends Family<AsyncValue> {
  /// See also [deleteUser].
  const DeleteUserFamily();

  /// See also [deleteUser].
  DeleteUserProvider call(
    String id,
  ) {
    return DeleteUserProvider(
      id,
    );
  }

  @override
  DeleteUserProvider getProviderOverride(
    covariant DeleteUserProvider provider,
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
  String? get name => r'deleteUserProvider';
}

/// See also [deleteUser].
class DeleteUserProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [deleteUser].
  DeleteUserProvider(
    String id,
  ) : this._internal(
          (ref) => deleteUser(
            ref as DeleteUserRef,
            id,
          ),
          from: deleteUserProvider,
          name: r'deleteUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteUserHash,
          dependencies: DeleteUserFamily._dependencies,
          allTransitiveDependencies:
              DeleteUserFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteUserProvider._internal(
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
    FutureOr<Object?> Function(DeleteUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteUserProvider._internal(
        (ref) => create(ref as DeleteUserRef),
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
    return _DeleteUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteUserProvider && other.id == id;
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
mixin DeleteUserRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DeleteUserProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with DeleteUserRef {
  _DeleteUserProviderElement(super.provider);

  @override
  String get id => (origin as DeleteUserProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
