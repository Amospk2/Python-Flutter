class User {
  final int id;
  final String name;
  final String username;
  final String password;
  final String email;
  // ignore: non_constant_identifier_names
  final String created_on;



  User({required this.id, required this.name, required this.username, required this.password, required this.email, required this.created_on});


  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      created_on: map['created_on'] as String,
    );
  }


}
