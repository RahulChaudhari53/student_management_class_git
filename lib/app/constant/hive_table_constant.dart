// in hive box ~ tables
// to define ID's and box that hive needs

class HiveTableConstant {
  HiveTableConstant._(); // private constructor to prevent accidental instantiation.

  static const int studentTableId = 0; // used by Hive’s TypeAdapter to register that specific data type.
  static const String studentBox = 'studentBox';

  static const int batchTableId = 1;
  static const String batchBox = 'batchBox';

  static const int courseTableId = 2;
  static const String courseBox = 'courseBox';
}

//  What is a Hive TypeAdapter?
// In Hive, if you want to store complex objects (like your BatchEntity or StudentEntity) instead of 
// just primitive types (int, String), you need to serialize (convert) them into a format that Hive can 
// store and retrieve later.

// A TypeAdapter is like a small piece of code that:
// Converts your Dart object into binary (for storing in Hive).
// Converts the binary back into your Dart object (when reading from Hive).
// 👉 Think of it like a translator between your object and the Hive database.