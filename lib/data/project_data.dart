import '../models/project.dart';

class ProjectData {
  static const List<Project> list = [
    Project(
      title: "Seraj - Audio Platform",
      description:
          "A sophisticated audio storytelling ecosystem built with Clean Architecture. Features a robust background audio service (Isolates), smart offline caching (Offline-first approach), and a high-performance immersive UI tailored for bedtime usage.",
      tags: ["Audio Service", "Clean Arch", "Hive Cache", "Dependency Inj."],
      videoPath: "assets/vedio/seraj.mp4",
      githubUrl: "https://github.com/jamalsalem0/-seraj-",
    ),
    Project(
      title: "Ihsan - Islamic Companion",
      description:
          "A comprehensive spiritual utility app engineered with high-precision astronomical algorithms for accurate Prayer Times. Features real-time Qibla tracking using device Sensor Fusion (Magnetometer & Accelerometer), and an offline-first Quran database with optimized search.",
      tags: ["Geo-Location", "Sensors API", "Algorithms", "Local DB"],
      videoPath: "assets/vedio/quran.mp4",
      githubUrl: "https://github.com/jamalsalem0/ihsan",
    ),
    Project(
      title: "ShopEse - E-Commerce",
      description:
          "A full-scale E-Commerce platform engineered for scalability. Features secure Payment Gateway integration (Stripe/Paymob), complex cart & order state management logic, and optimized RESTful API consumption with pagination and search capabilities.",
      tags: ["Payment Gateway", "State Mgmt", "REST API", "Auth & Security"],
      videoPath: "assets/vedio/shop.mp4",
      githubUrl: "https://github.com/jamalsalem0/ShopEase",
    ),
    Project(
      title: "CalorieWise - Health Analytics",
      description:
          "A data-driven health tracking application designed for personal wellness. Features a rich analytics dashboard with interactive charts for visualizing user progress. Implements complex metabolic algorithms to calculate personalized daily goals based on health metrics.",
      tags: [
        "Data Visualization",
        "Health Algorithms",
        "Interactive Charts",
        "Local DB",
      ],
      videoPath: "assets/vedio/calores.mp4",
      githubUrl: "https://github.com/jamalsalem0/CalorieWise",
    ),
  ];
}
