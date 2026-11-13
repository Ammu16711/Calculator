import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: TipPage()));
}

class TipPage extends StatefulWidget {
  const TipPage({super.key});

  @override
  State<TipPage> createState() => _TipPageState();
}

class _TipPageState extends State<TipPage> {
  double bill = 0;
  double tipPercent = 10;
  int people = 1;

  double get tip => bill * tipPercent / 100;
  double get total => bill + tip;
  double get perPerson => total / people;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter Bill Amount', style: TextStyle(fontSize: 18)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bill amount',
                border: OutlineInputBorder(),
                prefixText: '₹ ',
              ),
              onChanged: (value) {
                setState(() {
                  bill = double.tryParse(value) ?? 0;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              'Tip: ${tipPercent.round()}%',
              style: const TextStyle(fontSize: 18),
            ),
            Slider(
              value: tipPercent,
              min: 0,
              max: 30,
              divisions: 30,
              onChanged: (value) {
                setState(() {
                  tipPercent = value;
                });
              },
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Text('People:', style: TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (people > 1) people--;
                    });
                  },
                ),
                Text('$people', style: const TextStyle(fontSize: 20)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      people++;
                    });
                  },
                ),
              ],
            ),

            const Divider(),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tip Amount: ₹${tip.toStringAsFixed(2)}'),
                    const SizedBox(height: 10),
                    Text('Total Bill: ₹${total.toStringAsFixed(2)}'),
                    const SizedBox(height: 15),
                    Text(
                      'Per Person: ₹${perPerson.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
