class User {
  int userId;
  String userName;
  String userAddress;
  String userPhone;
  String userDob;
  String userStatus;
  String userEmail;
  String userPassword;
  String userAvatar;

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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      userName: json['user_name'].toString(),
      userAddress: json['user_address'].toString(),
      userPhone: json['user_phone'].toString(),
      userDob: json['user_dob'].toString(),
      userStatus: json['user_status'].toString(),
      userEmail: json['user_email'].toString(),
      userPassword: json['user_password'].toString(),
      userAvatar: json['user_avatar'].toString(),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_address'] = userAddress;
    data['user_phone'] = userPhone;
    data['user_dob'] = userDob;
    data['user_status'] = userStatus;
    data['user_email'] = userEmail;
    data['user_password'] = userPassword;
    data['user_avatar'] = userAvatar;
    return data;
  }

  int get getUserId => userId;

  set setUserId(int userId) => this.userId = userId;

  String get getUserName => userName;

  set setUserName(String userName) => this.userName = userName;

  String get getUserAddress => userAddress;

  set setUserAddress(String userAddress) => this.userAddress = userAddress;

  String get getUserPhone => userPhone;

  set setUserPhone(String userPhone) => this.userPhone = userPhone;

  String get getUserDob => userDob;

  set setUserDob(String userDob) => this.userDob = userDob;

  String get getUserStatus => userStatus;

  set setUserStatus(String userStatus) => this.userStatus = userStatus;

  String get getUserEmail => userEmail;

  set setUserEmail(String userEmail) => this.userEmail = userEmail;

  String get getUserPassword => userPassword;

  set setUserPassword(String userPassword) => this.userPassword = userPassword;

  String get getUserAvatar => userAvatar;

  set setUserAvatar(String userAvatar) => this.userAvatar = userAvatar;
}
