import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:task7_advanced_block/models/employee.dart';

class EmployeeRepoistory {
  Future<List<Employee>> getEmployees() async {
    try {
      var result = await rootBundle.loadString('assets/employees.json');
      var employees = json.decode(result);
      return List<Employee>.from(
          employees.map((json) => Employee.fromJson(json)).toList());
    } catch (e) {
      rethrow;
    }
  }
}
