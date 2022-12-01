class Attendance {
  final String name;
  final int percentage;

  Attendance({required this.name, required this.percentage});
  
  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(name: json['name'], percentage: json['percentage']);
  }
}
