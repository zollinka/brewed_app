class Brewery{
  String name;
  String address;
  String description;
  String id;

  Brewery(this.id, this.name, this.address, this.description);

  Brewery.fromJson(Map json):
      id = json['id'],
    name = json['name'],
    address = json['address'],
    description = json['description'];

  Map<String, dynamic> toMap() {
    return {
      'breweryId': id,
      'breweryName': name,
      'address': address,
      'description': description
    };
  }
}