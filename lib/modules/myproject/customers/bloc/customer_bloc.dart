import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
 FirebaseFirestore firestore = FirebaseFirestore.instance;

  CustomerBloc() : super(CustomerInitial()) {
    on<AddCustomerEvent>(_addCustomerMethod);
    on<EditustomerEvent>(_editCustomerMethod);
  }

  FutureOr<void> _addCustomerMethod(
    AddCustomerEvent event,
    Emitter<CustomerState> emit,
  ) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
          .add({
            'full_name': event.fullNameData, // John Doe
            'email': event.emailData, // Stokes and Sons
            'phone': event.phoneData // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
  }

  FutureOr<void> _editCustomerMethod(
    EditustomerEvent event,
    Emitter<CustomerState> emit,
  ) {
    // TODO: implement event handler
  }
}
