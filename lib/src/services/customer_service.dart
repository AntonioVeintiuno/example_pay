import 'package:example_pay/src/models/customer.dart';
import 'package:example_pay/src/services/open_pay_base_service.dart';
import 'package:example_pay/src/utils/openpay_client.dart';

class CustomerService extends OpenPayBaseService<Customer,Customer> {
  OpenPayClient _client;

  CustomerService(OpenPayClient httpClient) : super(httpClient);

  @override
  String get resourceName => "customers";

  // Future<Customer> createCustomer(Customer entity, {String endpoint = null})  {
  //   endpoint = getEndpoint();
  //   endpoint+="/cards";
  //   return create(entity, endpoint:endpoint);
  // }
}