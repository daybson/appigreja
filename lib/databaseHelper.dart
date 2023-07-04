//import 'package:rpg3dit/model/especializacao.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'NVI.sqlite';
  static Directory? directory;
  static String databasePath = "";
  static String fileDatabaseDir = "";
  static bool exists = false;

  final String bkpName = 'bkpFichas';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  static final version = 1;
  static bool backinup = false;

  Future<Database> get database async {
    if (_database != null && _database!.isOpen) {
      return _database!;
    }

    databasePath = await getDatabasesPath();
    fileDatabaseDir = join(databasePath, _databaseName);
    _database = await openDatabase(
      fileDatabaseDir,
      version: version,
      onConfigure: onConfigure,
      onCreate: (db, version) {
        //return db.execute('CREATE TABLE book(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
      },
      readOnly: false,
      singleInstance: true,
    );
    return _database!;
  }

  Future onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

//--------------------------------------------------

  Future<void> loadDatabase(int databaseVersion) async {
    if (databaseVersion == -1) {
//      var deleted = await DatabaseHelper.deleteCurrentDatabaseCopy();
//      if (deleted) {
        await DatabaseHelper.copyDatabase();
  //    }
    }
    return Future.value();
  }

  static Future<File> copyDatabase() async {
    databasePath = await getDatabasesPath();
    fileDatabaseDir = join(databasePath, _databaseName);

    await File(fileDatabaseDir).create(recursive: true);
    var data = await rootBundle.load(join("assets/databases", _databaseName));
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    return await File(fileDatabaseDir).writeAsBytes(bytes, flush: true);
  }

  static Future<bool> deleteCurrentDatabaseCopy() async {
    databasePath = await getDatabasesPath();
    fileDatabaseDir = join(databasePath, _databaseName);
    exists = await databaseExists(fileDatabaseDir);
    //var journalFile = fileDatabaseDir + '-journal';

    if (exists) {
      try {
        await File(fileDatabaseDir).delete(recursive: true);
        return Future.value(true);
      } catch (e) {
        return Future.value(false);
      }
    }
    return Future.value(true);
  }
}
