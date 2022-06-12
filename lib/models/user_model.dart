class UserModel {
  String email;
  String password;
  String firstName;
  String lastName;
  String photo;
  double wallet;
  String id;
  String mobile;
  String accountNumber;

  UserModel({
    this.email,
    this.firstName,
    this.lastName,
    this.id,
    this.password,
    this.photo,
    this.wallet,
    this.mobile,
    this.accountNumber,
  });
  UserModel.fromJson({String id, Map<String, dynamic> json}) {
    this.email = json['email'] ?? '';
    this.password = json['password'] ?? '';
    this.photo = json['photo'] ?? '';
    this.firstName = json['firstName'] ?? '';
    this.lastName = json['lastName'] ?? '';
    this.wallet = (json['wallet'] ?? 0).toDouble();
    this.id = id;
    this.mobile = json['mobile'] ?? "";
    this.accountNumber = json['accountNumber'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = {};
    data['email'] = this.email;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['photo'] = this.photo;
    data['wallet'] = this.wallet;
    data['mobile'] = this.mobile;
    data['accountNamber'] = this.accountNumber;
    return data;
  }
}
