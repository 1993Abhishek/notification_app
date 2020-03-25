class UserLoginModel {
  String _userLoginID;
  String _userLoginPassword;
  int _id;
  String _email;
  int _userRoleId;
  String _firstName;
  String _lastName;
  String _name;
  String _phone;
  int _loginStatus;
  int _isVerified;
  String _profileImage;
  String _latitude;
  String _longitude;
  String _address;
  String _city;
  int _districtId;
  int _isBlocked;
  String _userRoleName;
  String _imagePath;
  String _accessToken;
  String _profileImagePath;

  UserLoginModel(
      {int responseStatus,
        String responseMessage,
        int id,
        String email,
        int userRoleId,
        String firstName,
        String lastName,
        String name,
        String phone,
        int loginStatus,
        int isVerified,
        String profileImage,
        String latitude,
        String longitude,
        String address,
        String city,
        int districtId,
        int isBlocked,
        String userRoleName,
        String imagePath,
        String accessToken}) {
    this._id = id;
    this._email = email;
    this._userRoleId = userRoleId;
    this._firstName = firstName;
    this._lastName = lastName;
    this._name = name;
    this._phone = phone;
    this._loginStatus = loginStatus;
    this._isVerified = isVerified;
    this._profileImage = profileImage;
    this._latitude = latitude;
    this._longitude = longitude;
    this._address = address;
    this._city = city;
    this._districtId = districtId;
    this._isBlocked = isBlocked;
    this._userRoleName = userRoleName;
    this._imagePath = imagePath;
    this._accessToken = accessToken;
  }

  String get userLoginID => _userLoginID;

  set userLoginID(String value) {
    _userLoginID = value;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get email => _email;

  set email(String email) => _email = email;

  int get userRoleId => _userRoleId;

  set userRoleId(int userRoleId) => _userRoleId = userRoleId;

  String get firstName => _firstName;

  set firstName(String firstName) => _firstName = firstName;

  String get lastName => _lastName;

  set lastName(String lastName) => _lastName = lastName;

  String get name => _name;

  set name(String name) => _name = name;

  String get phone => _phone;

  set phone(String phone) => _phone = phone;

  int get loginStatus => _loginStatus;

  set loginStatus(int loginStatus) => _loginStatus = loginStatus;

  int get isVerified => _isVerified;

  set isVerified(int isVerified) => _isVerified = isVerified;

  String get profileImage => _profileImage;

  set profileImage(String profileImage) => _profileImage = profileImage;

  String get latitude => _latitude;

  set latitude(String latitude) => _latitude = latitude;

  String get longitude => _longitude;

  set longitude(String longitude) => _longitude = longitude;

  String get address => _address;

  set address(String address) => _address = address;

  String get city => _city;

  set city(String city) => _city = city;

  int get districtId => _districtId;

  set districtId(int districtId) => _districtId = districtId;

  int get isBlocked => _isBlocked;

  set isBlocked(int isBlocked) => _isBlocked = isBlocked;

  String get userRoleName => _userRoleName;

  set userRoleName(String userRoleName) => _userRoleName = userRoleName;

  String get imagePath => _imagePath;

  set imagePath(String imagePath) => _imagePath = imagePath;

  String get accessToken => _accessToken;

  set accessToken(String accessToken) => _accessToken = accessToken;

  String get userLoginPassword => _userLoginPassword;

  set userLoginPassword(String value) {
    _userLoginPassword = value;
  }


  String get profileImagePath => _profileImagePath;

  set profileImagePath(String value) {
    _profileImagePath = value;
  }

  setUserModelData(UserLoginModel model) {
    _id = model.id;
    _email = model.email;
    _userRoleId = model.userRoleId;
    _firstName = model.firstName;
    _lastName = model.lastName;
    _name = model.name;
    _phone = model.phone;
    _loginStatus = model.loginStatus;
    _isVerified = model.isVerified;
    _profileImage = model.profileImage;
    _latitude = model.latitude;
    _longitude = model.longitude;
    _address = model.address;
    _city = model.city;
    _districtId = model.districtId;
    _isBlocked = model.isBlocked;
    _userRoleName = model.userRoleName;
    _imagePath = model.imagePath;
    _accessToken = model.accessToken;
    _profileImagePath = model.profileImagePath;
  }

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _email = json['email'];
    _userRoleId = json['user_role_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _name = json['name'];
    _phone = json['phone'];
    _loginStatus = json['login_status'];
    _isVerified = json['is_verified'];
    _profileImage = json['profile_image'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _address = json['address'];
    _city = json['city'];
    _districtId = json['district_id'];
    _isBlocked = json['is_blocked'];
    _userRoleName = json['user_role_name'];
    _imagePath = json['image_path'];
    _accessToken = json['access_token'];
    _profileImagePath = json['profile_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['email'] = this._email;
    data['user_role_id'] = this._userRoleId;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['name'] = this._name;
    data['phone'] = this._phone;
    data['login_status'] = this._loginStatus;
    data['is_verified'] = this._isVerified;
    data['profile_image'] = this._profileImage;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    data['address'] = this._address;
    data['city'] = this._city;
    data['district_id'] = this._districtId;
    data['is_blocked'] = this._isBlocked;
    data['user_role_name'] = this._userRoleName;
    data['image_path'] = this._imagePath;
    data['access_token'] = this._accessToken;
    data['profile_image_path'] = this._profileImagePath;
    return data;
  }

  @override
  String toString() {
    return 'UserLoginModel{_userLoginID: $_userLoginID, _userLoginPassword: $_userLoginPassword, _id: $_id, _email: $_email, _userRoleId: $_userRoleId, _firstName: $_firstName, _lastName: $_lastName, _name: $_name, _phone: $_phone, _loginStatus: $_loginStatus, _isVerified: $_isVerified, _profileImage: $_profileImage, _latitude: $_latitude, _longitude: $_longitude, _address: $_address, _city: $_city, _districtId: $_districtId, _isBlocked: $_isBlocked, _userRoleName: $_userRoleName, _imagePath: $_imagePath, _accessToken: $_accessToken, _profileImagePath: $_profileImagePath}';
  }


}
