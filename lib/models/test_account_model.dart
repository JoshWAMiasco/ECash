class TestAccountModel {
  String mobile;
  String email;
  String password;
  TestAccountModel({
    this.email,
    this.password,
    this.mobile,
  });
  TestAccountModel.fromJson(Map<String, dynamic> json) {
    this.mobile = ['mobile'] ?? '';
    this.email = ['email'] ?? '';
    this.password = ['password'] ?? '';
  }
}
