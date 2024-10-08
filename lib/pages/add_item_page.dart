import 'package:flutter/material.dart';
import 'package:project_name/models/item_class.dart';

class AddItemPage extends StatefulWidget {
  final Function(ItemClass) onItemAdded;

  const AddItemPage({super.key, required this.onItemAdded});

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController imgLinkController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    imgLinkController.dispose();
    priceController.dispose();
    brandController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить товар'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: imgLinkController,
              decoration:
                  const InputDecoration(labelText: 'Ссылка на изображение'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Цена'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: brandController,
              decoration: const InputDecoration(labelText: 'Бренд'),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Название'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Описание'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newItem = ItemClass(
                  DateTime.now().millisecondsSinceEpoch,
                  imgLinkController.text,
                  int.parse(priceController.text),
                  brandController.text,
                  titleController.text,
                  descriptionController.text,
                );
                widget.onItemAdded(newItem);
                Navigator.pop(context);
              },
              child: const Text('Добавить товар'),
            ),
          ],
        ),
      ),
    );
  }
}
