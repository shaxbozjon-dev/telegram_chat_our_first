class User {
  String number;
  String name;
  String _password;
  String get password => _password;

  User({
    required this.number,
    required this.name,
    required String password,
  }) : _password = password;

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
      'password': _password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      number: map['number'] ?? '',
      name: map['name'] ?? '',
      password: map['password'] ?? '',
    );
  }

  @override
  String toString() =>
      'User(number: $number, name: $name, password: $password)';
}
