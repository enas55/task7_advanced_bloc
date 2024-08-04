import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_advanced_block/bloc/employee_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<EmployeeBloc>().add(LoadEmployeeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Block Test'),
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is EmployeeErrorState) {
            return Center(
              child: Text('Employees: ${state.error}'),
            );
          }

          if (state is EmployeeLoadedState) {
            return ListView.builder(
                itemCount: state.employees.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        state.employees[index].name?.first ?? 'No Name Found'),
                    subtitle: Text(
                        state.employees[index].address?.city ?? 'Not found'),
                  );
                });
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<EmployeeBloc>().add(LoadEmployeeEvent()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
