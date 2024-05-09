class SaleItems {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? address;
  final String? password;

  SaleItems(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.phone,
      this.password});

  SaleItems.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        email = res['email'],
        address = res['address'],
        phone = res['phone'],
        password = res['password'];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'password': password
    };
  }
}
