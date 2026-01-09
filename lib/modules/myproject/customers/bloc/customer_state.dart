part of 'customer_bloc.dart';

class CustomerState {}

final class CustomerInitial extends CustomerState {}

//States for Add Custoemr

final class AddCustomerProcessing extends CustomerState {}

final class AddCustomerSuccess extends CustomerState {
  late final String successMessage;
  AddCustomerSuccess({required this.successMessage});
}

final class AddCustomerFailed extends CustomerState {
  late final String errorMessage;
  AddCustomerFailed({required this.errorMessage});
}

//States for Edit Custoemr

final class EditCustomerProcessing extends CustomerState {}

final class EditCustomerSuccess extends CustomerState {
  late final String successMessage;
  EditCustomerSuccess({required this.successMessage});
}

final class EditCustomerFailed extends CustomerState {
  late final String errorMessage;
  EditCustomerFailed({required this.errorMessage});
}
