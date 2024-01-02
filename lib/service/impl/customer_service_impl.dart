import 'dart:convert';

import 'package:demo/model/customer.dart';
import 'package:demo/service/customer_service.dart';
import 'package:http/http.dart' as http;

class CustomerServiceImpl implements CustomerService{
  final String baseUrl = "http://localhost:8080/api/v1/customer";

  @override
  Future<Customer> findCustomerById(int id) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/getDetail/$id"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Customer.valueFromJson(data);

      } else {
        print('Error: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print(e);
    }

    // Trả về một giá trị mặc định (có thể là null hoặc một đối tượng Customer mặc định)
    return Customer();
  }


  @override
  Future<List<Customer>> getAllCustomer() async {
   try{
     final response = await http.get(Uri.parse("$baseUrl/getAll"));
     if(response.statusCode==200){
       var data = jsonDecode(response.body) as List;
       return data.map((item)=>Customer.valueFromJson(item)).toList();
     }

   }catch(e){
     print(e);
   }
   return <Customer>[];
  }

}