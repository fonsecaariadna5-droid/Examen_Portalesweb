import 'package:flutter/material.dart';
import '../models/maintenance_order.dart';

class OrderCard extends StatelessWidget {
  final MaintenanceOrder order;
  final VoidCallback onDelete;

  const OrderCard({
    super.key,
    required this.order,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text('${order.id} - ${order.area}'),
        subtitle: Text(
            'Técnico: ${order.technician}\nPrioridad: ${order.priority}'),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
