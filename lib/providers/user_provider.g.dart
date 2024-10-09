// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCurrentUserHash() => r'e3673e4cba4254bfa6a6f2c95de1680f67508545';

/// See also [getCurrentUser].
@ProviderFor(getCurrentUser)
final getCurrentUserProvider = AutoDisposeFutureProvider<User>.internal(
  getCurrentUser,
  name: r'getCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCurrentUserRef = AutoDisposeFutureProviderRef<User>;
String _$getAllUserHash() => r'e60e3048a747ef64f849db10087b15414d1cb34d';

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

typedef GetAllUserRef = AutoDisposeFutureProviderRef<Object?>;
String _$registerUserHash() => r'8b42192bb5e3fcd0452eed0c8d53b0fc42621b63';

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

String _$updateUserHash() => r'4efc33f8ce0edec0f54dc14f6295b4b74abb25ce';

/// See also [updateUser].
@ProviderFor(updateUser)
const updateUserProvider = UpdateUserFamily();

/// See also [updateUser].
class UpdateUserFamily extends Family<AsyncValue> {
  /// See also [updateUser].
  const UpdateUserFamily();

  /// See also [updateUser].
  UpdateUserProvider call(
    String username,
    String password,
  ) {
    return UpdateUserProvider(
      username,
      password,
    );
  }

  @override
  UpdateUserProvider getProviderOverride(
    covariant UpdateUserProvider provider,
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
  String? get name => r'updateUserProvider';
}

/// See also [updateUser].
class UpdateUserProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [updateUser].
  UpdateUserProvider(
    String username,
    String password,
  ) : this._internal(
          (ref) => updateUser(
            ref as UpdateUserRef,
            username,
            password,
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
          username: username,
          password: password,
        );

  UpdateUserProvider._internal(
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
        username: username,
        password: password,
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

mixin UpdateUserRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `password` of this provider.
  String get password;
}

class _UpdateUserProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with UpdateUserRef {
  _UpdateUserProviderElement(super.provider);

  @override
  String get username => (origin as UpdateUserProvider).username;
  @override
  String get password => (origin as UpdateUserProvider).password;
}

String _$deleteUserHash() => r'f6beb70e28719bf97cd137f8eb08702a69ff4ed6';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
