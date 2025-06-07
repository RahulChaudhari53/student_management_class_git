// helper/service class that your data sources (like BatchLocalDataSource)
// will call to actually interact with Hive.

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_management/app/constant/hive_table_constant.dart';
import 'package:student_management/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management/features/course/data/model/course_hive_model.dart';

class HiveService {
  Future<void> init() async {
    //Initialize the database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}student_management_class.db';

    Hive.init(path);

    // Register Adapters
    Hive.registerAdapter(BatchHiveModelAdapter());
    Hive.registerAdapter(CourseHiveModelAdapter());
  }

  // ============================================ BATCH QUERIES ============================================
  Future<void> createBatch(BatchHiveModel batch) async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    await box.put(batch.batchId, batch);
  }

  Future<List<BatchHiveModel>> getAllBatches() async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    var batches = box.values.toList();
    return batches;
  }

  Future<void> deleteBatch(String batchId) async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    await box.delete(batchId);
  }

  // ============================================ COURSE QUERIES ============================================
  Future<void> createCourse(CourseHiveModel course) async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    await box.put(course.courseId, course);
  }

  Future<List<CourseHiveModel>> getAllCourses() async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    var courses = box.values.toList();
    return courses;
  }

  Future<void> deleteCourse(String courseId) async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    await box.delete(courseId);
  }
}
