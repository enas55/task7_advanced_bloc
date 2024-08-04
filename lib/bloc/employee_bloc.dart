import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task7_advanced_block/models/employee.dart';
import 'package:task7_advanced_block/repoistory/employee_repoistory.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepoistory _employeeRepoistory;
  EmployeeBloc(this._employeeRepoistory) : super(EmployeeLoadingState()) {
    on<LoadEmployeeEvent>(loadEmployee);
  }

  FutureOr<void> loadEmployee(
      LoadEmployeeEvent event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoadingState());
    await _employeeRepoistory.getEmployees().then((emp) {
      emit(EmployeeLoadedState(emp));
    }).catchError((e) {
      emit(EmployeeErrorState(e));
    });
  }
}
