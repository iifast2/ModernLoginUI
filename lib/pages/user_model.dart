class User {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final int age;

  User({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
    };
  }
}
