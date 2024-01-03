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

  // Create
  Customer newCustomer = Customer(name: "John Doe", address: "123 Main St", age: 25);
  Customer createdCustomer = await customerService.createCustomer(newCustomer);
  print("Created Customer: $createdCustomer");

  // Update
  int customerIdToUpdate = 1; // Assume you have an existing customer with ID 1
  Customer existingCustomer = await customerService.findCustomerById(customerIdToUpdate);

  if (existingCustomer.id != null) {
    existingCustomer.name = "Updated Name";
    existingCustomer.address = "Updated Address";
    existingCustomer.age = 30;

    Customer updatedCustomer = await customerService.updateCustomer(existingCustomer.id!, existingCustomer);
    print("Updated Customer: $updatedCustomer");
  } else {
    print("Customer with ID $customerIdToUpdate not found.");
  }

  // Delete
  int customerIdToDelete = 2; // Assume you have an existing customer with ID 2
  await customerService.deleteCustomer(customerIdToDelete);
  print("Customer with ID $customerIdToDelete deleted.");


}
