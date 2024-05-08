// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const ChuvaDart());
}

class ChuvaDart extends StatelessWidget {
  const ChuvaDart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime(2023, 11, 26);
  bool _clicked = false;

  void _changeDate(DateTime newDate) {
    setState(() {
      _currentDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Color.fromARGB(255, 129, 129, 194),
          title: Column(
            children: [
              const Text(
                'Chuva ❤️ Flutter',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const Text(
                'Programação',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(255, 255, 255, 255)),
                height: 40,
                width: 350,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 150, 150, 255)),
                      height: 30,
                      width: 50,
                      child: const Icon(
                        Icons.calendar_month_outlined,
                      ),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    const Text(
                      'Exibindo Todas as atividades',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: const Row(children: [
                  Text(
                    'Nov',
                  ),
                ]),
              ),
              Container(
                  child: const Row(
                children: [
                  Text(
                    '2023',
                  ),
                ],
              )),
              Container(
                child: Row(children: [
                  OutlinedButton(
                    onPressed: () {
                      _changeDate(DateTime(2023, 11, 26));
                    },
                    child: Text(
                      '26',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ]),
              ),
              OutlinedButton(
                onPressed: () {
                  _changeDate(DateTime(2023, 11, 28));
                },
                child: Text(
                  '28',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              if (_currentDate.day == 26)
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _clicked = true;
                      });
                    },
                    child: const Text('Mesa redonda de 07:00 até 08:00')),
              if (_currentDate.day == 28)
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _clicked = true;
                      });
                    },
                    child: const Text('Palestra de 09:30 até 10:00')),
              if (_currentDate.day == 26 && _clicked) const Activity(),
            ],
          ),
        ));
  }
}

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool _favorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Column(children: [
        Text(
          'Activity title',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Text('A Física dos Buracos Negros Supermassivos'),
        const Text('Mesa redonda'),
        const Text('Domingo 07:00h - 08:00h'),
        const Text('Sthepen William Hawking'),
        const Text('Maputo'),
        const Text('Astrofísica e Cosmologia'),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _favorited = !_favorited;
            });
          },
          icon: _favorited
              ? const Icon(Icons.star)
              : const Icon(Icons.star_outline),
          label: Text(
              _favorited ? 'Remover da sua agenda' : 'Adicionar à sua agenda'),
        )
      ]),
    );
  }
}
