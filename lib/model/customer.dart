class Customer{
  int? id;
  String? name;
  String? address;
  int? age;
  Customer({this.id,this.name,this.address,this.age});
  factory Customer.valueFromJson(Map<String,dynamic> json){
    return Customer(
      id: json["id"] as int,
      name: json["name"] as String,
      address: json["address"] as String,
      age: json["age"] as int
    );
  }
  @override
  String toString(){
    return "id: $id, name:$name, address:$address, age: $age";
  }
}