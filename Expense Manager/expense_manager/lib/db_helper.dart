import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'expenses.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE transactions(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, amount TEXT, category TEXT, description TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertTransaction(Map<String, String> transaction) async {
    final db = await database;
    await db.insert(
      'transactions',
      transaction,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, String>>> getTransactions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('transactions');
    return List.generate(maps.length, (i) {
      return {
        'date': maps[i]['date'] as String,
        'amount': maps[i]['amount'] as String,
        'category': maps[i]['category'] as String,
        'description': maps[i]['description'] as String,
      };
    });
  }

  Future<void> deleteTransaction(String category) async {
    final db = await database;
    await db.delete(
      'transactions',
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  Future<void> updateTransaction(
      String oldCategory, Map<String, String> updatedTransaction) async {
    final db = await database;
    await db.update(
      'transactions',
      updatedTransaction,
      where: 'category = ?',
      whereArgs: [oldCategory],
    );
  }
}
