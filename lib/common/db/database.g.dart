// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorWordDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WordDatabaseBuilder databaseBuilder(String name) =>
      _$WordDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WordDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$WordDatabaseBuilder(null);
}

class _$WordDatabaseBuilder {
  _$WordDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$WordDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$WordDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<WordDatabase> build() async {
    final database = _$WordDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$WordDatabase extends WordDatabase {
  _$WordDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WordDao _wordDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WordDetails` (`id` INTEGER, `headWord` TEXT, `pronunciation` TEXT, `spillingAdvice` TEXT, `partOfSpeech` TEXT, `definition` TEXT, `wordBuilding` TEXT, `extraInformation` TEXT, `sup` TEXT, `endingOfWordChanged` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE INDEX `index_WordDetails_headWord` ON `WordDetails` (`headWord`)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  WordDao get wordDao {
    return _wordDaoInstance ??= _$WordDao(database, changeListener);
  }
}

class _$WordDao extends WordDao {
  _$WordDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _wordDetailsMapper = (Map<String, dynamic> row) => WordDetails(
      row['id'] as int,
      row['headWord'] as String,
      row['pronunciation'] as String,
      row['spillingAdvice'] as String,
      row['partOfSpeech'] as String,
      row['definition'] as String,
      row['wordBuilding'] as String,
      row['extraInformation'] as String,
      row['sup'] as String,
      row['endingOfWordChanged'] as String);

  @override
  Future<List<WordDetails>> getAllHeadWords() async {
    return _queryAdapter.queryList('SELECT id, headWord FROM WordDetails',
        mapper: _wordDetailsMapper);
  }

  @override
  Future<List<WordDetails>> getWordsByIds(List<int> ids) async {
    final valueList1 = ids.map((value) => "'$value'").join(', ');
    return _queryAdapter.queryList(
        'SELECT * FROM WordDetails where id in ($valueList1)',
        mapper: _wordDetailsMapper);
  }

  @override
  Future<List<WordDetails>> findWords(String fuzzy) async {
    return _queryAdapter.queryList(
        'SELECT * FROM WordDetails where headWord like ?',
        arguments: <dynamic>[fuzzy],
        mapper: _wordDetailsMapper);
  }
}
