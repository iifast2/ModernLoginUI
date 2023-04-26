enum UserRole {
  admin,
  trainer,
  contentManager,
  user
}

class User {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final int age;
  UserRole role; // new field to store the user's role

  User({
    this.uid = '',
    required this.email,
    required this.firstName,
    required this.lastName,
    this.age = 0, // default value for age
    //required this.age,
    this.role = UserRole.user, // default role is "user"
  });

  // toJson and fromJson methods

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'role': role.toString(), // store the role as a string
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      age: map['age'] ?? 0,
      role: UserRole.values.firstWhere(
              (e) => e.toString() == map['role'], orElse: () => UserRole.user), // get the role from the string value
    );
  }

  String getRole() {
    return role.toString().split('.').last;
  }


}







