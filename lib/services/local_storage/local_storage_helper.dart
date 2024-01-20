import 'dart:async';

import 'package:lojang_test/features/quotes/quote.dart';
import 'package:lojang_test/features/videos/video.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/articles/article.dart';
import '../../support/constants.dart';

class LocalStorageDb {
  static const String dbName = 'my_database.db';

  String get _articlesTableQuery {
    return '''
      CREATE TABLE ${Constants.articlesTable}(
        id INTEGER PRIMARY KEY,
        text TEXT,
        title TEXT,
        image_url TEXT,
        author_name TEXT,
        url TEXT
      )
    ''';
  }

  String get _videosTableQuery {
    return '''
      CREATE TABLE ${Constants.videosTable}(
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        url2 TEXT,
        aws_url TEXT,
        image_url TEXT
      )
    ''';
  }

  String get _quotesTableQuery {
    return 'CREATE TABLE ${Constants.quotesTable}(id INTEGER PRIMARY KEY,text TEXT,author TEXT)';
  }

  Future<Database> _initializeDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      version: 2,
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute(_articlesTableQuery);
    await db.execute(_videosTableQuery);
    await db.execute(_quotesTableQuery);
  }

  Future<void> _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    await db.execute(_articlesTableQuery);
    await db.execute(_videosTableQuery);
    await db.execute(_quotesTableQuery);
  }

  Future<void> saveData({List<Article>? articles, List<Quote>? quotes, List<Video>? videos}) async {
    final Database db = await _initializeDatabase();
    final batch = db.batch();

    if (articles != null) {
      for (final article in articles) {
        batch.insert(Constants.articlesTable, article.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
      }

      await batch.commit(noResult: true);
      return;
    }

    if (quotes != null) {
      for (final quote in quotes) {
        batch.insert(Constants.quotesTable, quote.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
      }

      await batch.commit(noResult: true);
      return;
    }

    for (final video in videos!) {
      batch.insert(Constants.videosTable, video.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
  }

  Future<List<Map<String, dynamic>>> retrieveData({required String tableName}) async {
    final Database db = await _initializeDatabase();

    if (tableName == Constants.articlesTable) {
      final List<Map<String, dynamic>> result = await db.query(Constants.articlesTable);
      return result;
    }

    if (tableName == Constants.quotesTable) {
      final List<Map<String, dynamic>> result = await db.query(Constants.quotesTable);
      return result;
    }

    final List<Map<String, dynamic>> result = await db.query(Constants.videosTable);
    return result;
  }
}
