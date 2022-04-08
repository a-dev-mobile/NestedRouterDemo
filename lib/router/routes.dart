// Routes
abstract class BookRoutePath {}

class BooksListPath extends BookRoutePath {}

class BooksSettingsPath extends BookRoutePath {}

class BooksDetailsPath extends BookRoutePath {
  BooksDetailsPath(this.id);
  final int id;

}
