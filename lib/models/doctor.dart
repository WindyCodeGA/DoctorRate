import 'package:flutter/material.dart';

class DoctorModel {
  String name;
  String image;
  Color imageBox;
  List<String> specialties;
  double score;
  String bio;
  List<CalendarModel> calendar;
  List<TimeModel> time;
  DoctorModel({
    required this.name,
    required this.image,
    required this.imageBox,
    required this.specialties,
    required this.score,
    required this.bio,
    required this.calendar,
    required this.time,
  });

  static List<DoctorModel> getDoctors() {
    List<DoctorModel> doctor = [];
    doctor.add(
      DoctorModel(
        name: "Jenny Wilson",
        image: "assets/images/jenny.png",
        imageBox: const Color.fromRGBO(255, 241, 241, 1),
        specialties: [
          "Cardiology",
          "Neurology,",
          "General Medicine",
          "Pediatrics",
        ],
        score: 4.5,
        bio:
            "Jenny Wilson is a renowned cardiologist with over 10 years of experience in treating heart diseases. She is known for her compassionate care and dedication to her patients.",
        calendar: [
          CalendarModel(dayNumber: 14, dayName: "Mon", isSelected: false),
          CalendarModel(dayNumber: 15, dayName: "Tue", isSelected: false),
          CalendarModel(dayNumber: 16, dayName: "Wed", isSelected: false),
          CalendarModel(dayNumber: 17, dayName: "Thu", isSelected: false),
        ],
        time: [
          TimeModel(time: '09:00 AM', isSelected: true),
          TimeModel(time: '11:00 AM', isSelected: false),
          TimeModel(time: '03:00 PM', isSelected: false),
        ],
      ),
    );

    doctor.add(
      DoctorModel(
        name: "Kristin Watson",
        image: "assets/images/kristin.png",
        imageBox: const Color.fromRGBO(241, 255, 241, 1),
        specialties: [
          "Pediatrics",
          "Dermatology",
          "General Medicine",
          "Endocrinology",
        ],
        score: 4.8,
        bio:
            "Kristin Watson specializes in pediatrics and dermatology, providing expert care for children and skin conditions. Her gentle approach makes her a favorite among young patients.",
        calendar: [
          CalendarModel(dayNumber: 14, dayName: "Mon", isSelected: false),
          CalendarModel(dayNumber: 15, dayName: "Tue", isSelected: false),
          CalendarModel(dayNumber: 16, dayName: "Wed", isSelected: false),
          CalendarModel(dayNumber: 17, dayName: "Thu", isSelected: false),
        ],
        time: [
          TimeModel(time: '09:00 AM', isSelected: true),
          TimeModel(time: '11:00 AM', isSelected: false),
          TimeModel(time: '03:00 PM', isSelected: false),
        ],
      ),
    );

    return doctor;
  }
}

class CalendarModel {
  final int dayNumber;
  final String dayName;
  bool isSelected;
  CalendarModel({
    required this.dayNumber,
    required this.dayName,
    required this.isSelected,
  });
}

class TimeModel {
  final String time;
  bool isSelected;
  TimeModel({required this.time, required this.isSelected});
}
