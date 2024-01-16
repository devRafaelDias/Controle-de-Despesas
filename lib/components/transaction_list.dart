import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function(String) onRemove;
  const TransactionList(this.transaction, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constrains) {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Nenhuma Transação Cadastrada',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: constrains.maxHeight * 0.6,
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/images/wall.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (ctx, index) {
              final tr = transaction[index];
              return Card(
                color: const Color.fromARGB(255, 253, 239, 255),
                shadowColor: Colors.deepPurple,
                elevation: 3,
                margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                        child: Text(
                          '${tr.value}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: const TextStyle(
                      fontFamily: 'Gotham',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: MediaQuery.of(context).size.width < 400 ? TextButton(
                    child: const Icon(Icons.delete_forever),
                    onPressed: () => onRemove(tr.id),
                  ) : IconButton(
                    icon: const Icon(Icons.delete),
                    
                    onPressed: () => onRemove(tr.id),
                    color: Colors.redAccent,
                  ),
                ),
              );
            },
          );
  }
}
