class StudentCourse {
  final int courseid;
  final String coursecode;
  final String batch;
  final String starttime;
  final String endtime;
  final String location;
  final String classroom;

  StudentCourse(
      {required this.courseid,
      required this.coursecode,
      required this.batch,
      required this.starttime,
      required this.endtime,
      required this.location,
      required this.classroom});

  factory StudentCourse.fromJson(Map<String, dynamic> json) {
    return StudentCourse(
      batch: json['batch'],
      classroom: json['classroom'],
      courseid: json['course_id'],
      endtime: json['end_time'], 
      location: json['location'], 
      coursecode: json['course_code'], 
      starttime: json['start_time'],
    );
  }
}
