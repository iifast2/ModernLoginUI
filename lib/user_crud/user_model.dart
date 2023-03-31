class User {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final int age;

  User({
    this.uid = '',
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
  });


// Also could be called toJson Method
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
    };
  }

  // Also could be called fromJson Method
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      age: map['age'] ?? 0,
    );
  }



}
