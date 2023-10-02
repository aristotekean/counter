import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Counter functions'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    clickCounter = 0;
                  });
                },
                icon: const Icon(Icons.refresh_rounded)),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(clickCounter.toString(),
                style: const TextStyle(
                    fontSize: 150, fontWeight: FontWeight.w100)),
            Text(clickCounter == 1 ? 'Click' : 'Clicks',
                style: const TextStyle(fontSize: 25))
          ],
        )),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtom(
                icon: Icons.refresh_rounded,
                onPressed: () {
                  setState(() {
                    clickCounter = 0;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            CustomButtom(
                icon: Icons.exposure_minus_1,
                onPressed: () {
                  setState(() {
                    if (clickCounter == 0) return;
                    clickCounter--;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            CustomButtom(
                icon: Icons.plus_one,
                onPressed: () {
                  setState(() {
                    clickCounter++;
                  });
                }),
          ],
        ));
  }
}

class CustomButtom extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButtom({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: const StadiumBorder(),
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
