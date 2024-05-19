class Customer {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? address;

  Customer({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
  });

  Customer.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        email = res['email'],
        address = res['address'],
        phone = res['phone'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
    };
  }
}
