class User {
  //final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final int age;

  User({
    //required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      //'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      //uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
    );
  }
}