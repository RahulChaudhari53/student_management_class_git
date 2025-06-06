import 'package:student_management/core/network/hive_service.dart';
import 'package:student_management/features/course/data/data_source/course_data_source.dart';
import 'package:student_management/features/course/data/model/course_hive_model.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';

class CourseLocalDataSource implements ICourseDataSource {
  final HiveService hiveService;

  const CourseLocalDataSource(this.hiveService);
  @override
  Future<void> createCourse(CourseEntity course) async {
    try {
      await hiveService.createCourse(CourseHiveModel.fromEntity(course));
    } catch (e) {
      throw Exception("failed to create a course : $e");
    }
  }

  @override
  Future<void> deleteCourse(String courseId) async {
    try {
      await hiveService.deleteCourse(courseId);
    } catch (e) {
      throw Exception("failed to : $e");
    }
  }

  @override
  Future<List<CourseEntity>> getAllCourses() async {
    try {
      List<CourseHiveModel> courseModels = await hiveService.getAllCourses();
      return CourseHiveModel.toEntityList(courseModels);
    } catch (e) {
      throw Exception("failed to : $e");
    }
  }
}
