// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'customer_bloc.dart';

class CustomerEvent {}

//Create
class AddCustomerEvent extends CustomerEvent {
  late final String fullNameData;
  late final String emailData;
  late final String phoneData;
  AddCustomerEvent({
    required this.fullNameData,
    required this.emailData,
    required this.phoneData,
  });
}

//Update
class EditustomerEvent extends CustomerEvent {
  late final String fullNameData;
  late final String emailData;
  late final String phoneData;
  EditustomerEvent({
    required this.fullNameData,
    required this.emailData,
    required this.phoneData,
  });
}
// Read

