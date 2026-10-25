class User {
  final String id; // В будущем будет UUID от Firebase
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });
}