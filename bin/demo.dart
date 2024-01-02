// import 'package:demo/demo.dart' as demo;

import 'package:demo/model/customer.dart';
import 'package:demo/service/customer_service.dart';
import 'package:demo/service/impl/customer_service_impl.dart';

void main(List<String> arguments) async {

  var list =[1,2,3];
  var list1=[4,5,6];
  var list2 = list+list1;
  print("list2 $list2");
  //call api
  CustomerService customerService = CustomerServiceImpl();
  List<Customer> customers = await customerService.getAllCustomer();
  print("customer $customers");
  Customer cus = await customerService.findCustomerById(1);
  print("cus $cus");


}
