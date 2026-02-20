import 'package:flutter/material.dart';
import '../models/maintenance_order.dart';

class OrderForm extends StatefulWidget {
  final Function(MaintenanceOrder) onSubmit;

  const OrderForm({super.key, required this.onSubmit});

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _techController = TextEditingController();
  final _areaController = TextEditingController();
  final _descController = TextEditingController();

  String _priority = 'Media';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final order = MaintenanceOrder(
        id: _idController.text,
        technician: _techController.text,
        area: _areaController.text,
        priority: _priority,
        description: _descController.text,
      );

      widget.onSubmit(order);

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(labelText: 'ID Orden'),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: _techController,
                decoration: const InputDecoration(labelText: 'Técnico'),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                controller: _areaController,
                decoration: const InputDecoration(labelText: 'Área/Equipo'),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              DropdownButtonFormField<String>(
                value: _priority,
                items: ['Alta', 'Media', 'Baja']
                    .map((p) => DropdownMenuItem(
                          value: p,
                          child: Text(p),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _priority = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Prioridad'),
              ),
              TextFormField(
                controller: _descController,
                decoration:
                    const InputDecoration(labelText: 'Descripción'),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Registrar Orden'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
