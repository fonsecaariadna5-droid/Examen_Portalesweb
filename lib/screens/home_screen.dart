import 'package:flutter/material.dart';
import '../models/maintenance_order.dart';
import '../widgets/order_form.dart';
import '../widgets/order_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MaintenanceOrder> _orders = [];

  void _addOrder(MaintenanceOrder order) {
    setState(() {
      _orders.add(order);
    });
  }

  void _deleteOrder(MaintenanceOrder order) {
    setState(() {
      _orders.remove(order);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Órdenes de Mantenimiento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            OrderForm(onSubmit: _addOrder),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  return OrderCard(
                    order: _orders[index],
                    onDelete: () => _deleteOrder(_orders[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 