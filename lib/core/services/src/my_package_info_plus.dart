part of services;

/// Flavors.
enum Flavor {
  /// Flavor develop.
  dev,

  /// Flavor stag.
  stg,

  /// Flavor prod.
  prod,
}

/// Base class.
class MyPackageInfoPlus {
  /// GetAppName.
  Future<String> getAppName() async {
    final packageInfo = await _info();
    if (packageInfo == null) {
      log.w('getAppName = null');

      return '';
    }

    return packageInfo.appName;
  }

  /// GetBuildNumber.
  Future<String> getBuildNumber() async {
    final packageInfo = await _info();
    if (packageInfo == null) {
      log.w('getBuildNumber = null');

      return '';
    }

    return packageInfo.buildNumber;
  }

  /// GetCurrentFlavor example >>> if endsWith('dev').
  Future<Flavor> getCurrentFlavor() async {
    final packageName = await getPackageName();
    if (packageName.endsWith('dev')) {
      return Flavor.dev;
    } else if (packageName.endsWith('stg')) {
      return Flavor.stg;
    } else {
      return Flavor.prod;
    }
  }

  /// GetPackageName.
  Future<String> getPackageName() async {
    final packageInfo = await _info();
    if (packageInfo == null) {
      log.w('getPackageName = null');

      return '';
    }

    return packageInfo.packageName;
  }

  /// GetVersionNumber.
  Future<String> getVersionNumber() async {
    final packageInfo = await _info();
    if (packageInfo == null) {
      log.w('getVersionNumber = null');

      return '';
    }

    return packageInfo.version;
  }

  Future<PackageInfo?> _info() async {
    PackageInfo? packageInfo;
    try {
      packageInfo = await PackageInfo.fromPlatform();
    } catch (e) {
      logger.e(e);
      packageInfo = null;
    }

    return packageInfo;
  }
}
