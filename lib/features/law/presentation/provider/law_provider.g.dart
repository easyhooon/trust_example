// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'law_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lawRepositoryHash() => r'3636100e86fa06a9eeb67b6f40f31d23b2594a90';

/// See also [lawRepository].
@ProviderFor(lawRepository)
final lawRepositoryProvider = AutoDisposeProvider<LawRepository>.internal(
  lawRepository,
  name: r'lawRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lawRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LawRepositoryRef = AutoDisposeProviderRef<LawRepository>;
String _$lawSearchHash() => r'53dee12554bc831ab9c550230bcfb3bc7af584d1';

/// See also [LawSearch].
@ProviderFor(LawSearch)
final lawSearchProvider =
    AutoDisposeNotifierProvider<
      LawSearch,
      AsyncValue<List<LawSearchResult>>
    >.internal(
      LawSearch.new,
      name: r'lawSearchProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$lawSearchHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LawSearch = AutoDisposeNotifier<AsyncValue<List<LawSearchResult>>>;
String _$lawDetailNotifierHash() => r'17cdb4f72c7063403b60efbdaa606335e46f0f09';

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

abstract class _$LawDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<LawDetail> {
  late final String lawId;

  FutureOr<LawDetail> build(String lawId);
}

/// See also [LawDetailNotifier].
@ProviderFor(LawDetailNotifier)
const lawDetailNotifierProvider = LawDetailNotifierFamily();

/// See also [LawDetailNotifier].
class LawDetailNotifierFamily extends Family<AsyncValue<LawDetail>> {
  /// See also [LawDetailNotifier].
  const LawDetailNotifierFamily();

  /// See also [LawDetailNotifier].
  LawDetailNotifierProvider call(String lawId) {
    return LawDetailNotifierProvider(lawId);
  }

  @override
  LawDetailNotifierProvider getProviderOverride(
    covariant LawDetailNotifierProvider provider,
  ) {
    return call(provider.lawId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lawDetailNotifierProvider';
}

/// See also [LawDetailNotifier].
class LawDetailNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LawDetailNotifier, LawDetail> {
  /// See also [LawDetailNotifier].
  LawDetailNotifierProvider(String lawId)
    : this._internal(
        () => LawDetailNotifier()..lawId = lawId,
        from: lawDetailNotifierProvider,
        name: r'lawDetailNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$lawDetailNotifierHash,
        dependencies: LawDetailNotifierFamily._dependencies,
        allTransitiveDependencies:
            LawDetailNotifierFamily._allTransitiveDependencies,
        lawId: lawId,
      );

  LawDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lawId,
  }) : super.internal();

  final String lawId;

  @override
  FutureOr<LawDetail> runNotifierBuild(covariant LawDetailNotifier notifier) {
    return notifier.build(lawId);
  }

  @override
  Override overrideWith(LawDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: LawDetailNotifierProvider._internal(
        () => create()..lawId = lawId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lawId: lawId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LawDetailNotifier, LawDetail>
  createElement() {
    return _LawDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LawDetailNotifierProvider && other.lawId == lawId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lawId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LawDetailNotifierRef on AutoDisposeAsyncNotifierProviderRef<LawDetail> {
  /// The parameter `lawId` of this provider.
  String get lawId;
}

class _LawDetailNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<LawDetailNotifier, LawDetail>
    with LawDetailNotifierRef {
  _LawDetailNotifierProviderElement(super.provider);

  @override
  String get lawId => (origin as LawDetailNotifierProvider).lawId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
