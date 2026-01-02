class ProjectModel {
  final String title;
  final String description;
  final List<String> tags;
  final String videoPath;
  final String githubUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.videoPath,
    required this.githubUrl,
  });
}
