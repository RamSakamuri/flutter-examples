import 'dart:async';

main() {
  performTasks();
}

void performTasks() {
  task1();

  var task2Result = task2();

  task4(task2Result);

  task2Result.then((capturedResultFromTask2) {

    print("inside then got the result of task2() as: " + capturedResultFromTask2);

    task3(capturedResultFromTask2);

  });

  task3a();
}

void task1() {
  print("task 1");
}

Future task2() async {
  Duration duration = Duration(seconds: 3);
  String result;
  await Future.delayed(duration, () {
    result = "Task 2 data";
    print("in task 2");
  });
  print('from task2... $result');
  return result;
}

void task3(String data) {
  print('data from task3 $data');
}

void task3a() {
  print('task 3a');
}

void task4(Future futureData) {
  futureData.then((data) {
    print('data from task4 $data');
  });
}
