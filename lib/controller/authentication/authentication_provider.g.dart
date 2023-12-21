// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProtectedMessageHash() =>
    r'62d826241d2cb93360389baf20310cddf71ac890';

/// See also [getProtectedMessage].
@ProviderFor(getProtectedMessage)
final getProtectedMessageProvider = AutoDisposeFutureProvider<String?>.internal(
  getProtectedMessage,
  name: r'getProtectedMessageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getProtectedMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetProtectedMessageRef = AutoDisposeFutureProviderRef<String?>;
String _$authenticationHash() => r'74512065482a518c9c2d31072e6fdb81c5c5c73a';

/// See also [Authentication].
@ProviderFor(Authentication)
final authenticationProvider =
    NotifierProvider<Authentication, AuthenticationState>.internal(
  Authentication.new,
  name: r'authenticationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Authentication = Notifier<AuthenticationState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
