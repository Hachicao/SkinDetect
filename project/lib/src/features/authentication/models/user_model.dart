class User {
  String userId;
  String userName;
  String? userAddress;
  String? userPhone;
  String? userDob;
  String? userStatus;
  String userEmail;
  String userPassword;
  String? userAvatar;
  String firstName;
  String lastName;
  String gender;
  String dateJoined;
  // int isActive;

  User({
    required this.userId,
    required this.userName,
    required this.userAddress,
    required this.userPhone,
    required this.userDob,
    required this.userStatus,
    required this.userEmail,
    required this.userPassword,
    required this.userAvatar,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dateJoined,
    // required this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'].toString(),
      userName: json['user_name'].toString(),
      userAddress: json['user_address'].toString(),
      userPhone: json['user_phone'].toString(),
      userDob: json['user_dob'].toString(),
      userStatus: json['user_status'].toString(),
      userEmail: json['user_email'].toString(),
      userPassword: json['user_password'].toString(),
      userAvatar: json['user_avatar'],
      firstName: json['first_name'].toString(),
      lastName: json['last_name'].toString(),
      gender: json['gender'].toString(),
      dateJoined: json['date_joined'].toString(),
      // isActive: json['is_active'],
    );
  }

  get name => null;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_address'] = userAddress;
    data['user_phone'] = userPhone;
    data['user_dob'] = userDob;
    data['user_status'] = userStatus;
    data['user_email'] = userEmail;
    data['user_password'] = userPassword;
    data['user_avatar'] = userAvatar;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['date_joined'] = dateJoined;
    // data['is_active'] = isActive;
    return data;
  }

  String getFullName() {
    return "$firstName $lastName";
  }
}
