/// base Routes
abstract class AppRoutePath {}

///
class AppHomePath extends AppRoutePath {}

///
class AppSettingsPath extends AppRoutePath {}

///
class AppCreditPath extends AppRoutePath {}

///
class AppDetailsPath extends AppRoutePath {
  ///
  AppDetailsPath({required this.id});
  final int id;
}
