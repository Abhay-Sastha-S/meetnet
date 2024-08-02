// File: lib/user.dart

class User {
  final String name;
  final String profession;
  final String university;
  final List<String> photoUrls; // Changed from a single photoUrl to a list
  final Map<String, String> socialMedia;

  User({
    required this.name,
    required this.profession,
    required this.university,
    required this.photoUrls,
    required this.socialMedia,
  });
}
