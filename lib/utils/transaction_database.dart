import 'dart:developer';

import 'package:path/path.dart';
import 'package:pos_bfc/utils/constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pos_bfc/models/transaction_model.dart';

class TransactionDatabaseHelper {
  TransactionDatabaseHelper._privateConstructor();

  static final TransactionDatabaseHelper instance =
      TransactionDatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'transactions_database.db');

    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  static const String tableTransactions = 'transactions';
  static const String columnId = 'id';
  static const String columnTotal = 'total';
  static const String columnTimestamp = 'timestamp';
  static const String columnItems = 'items';

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableTransactions (
        $transactionColumnId INTEGER PRIMARY KEY,        
        $transactionColumnName TEXT NOT NULL,
        $transactionColumnQuantity INTEGER NOT NULL,
        $transactionColumnPrice REAL NOT NULL,
        $transactionColumnImage TEXT NOT NULL,
        $transactionColumSubtotalPerItem REAL NOT NULL
      )
    ''');
  }

  Future insert(TransactionModel transactionModel) async {
    final db = await database;

    return await db.insert(
      tableTransactions,
      transactionModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TransactionModel>> query() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableTransactions);
    return List.generate(maps.length, (i) {
      return TransactionModel(
          id: maps[i][transactionColumnId],
          name: maps[i][transactionColumnName],
          quantity: maps[i][transactionColumnQuantity],
          price: maps[i][transactionColumnPrice].round(),
          image: maps[i][transactionColumnImage],
          subtotalPerItem: maps[i][transactionColumSubtotalPerItem].round());
    });
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(tableTransactions,
        where: '$transactionColumnId = ?', whereArgs: [id]);
  }
}
