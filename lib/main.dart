import 'dart:io';

class TaskManager {
  List<Map<String, dynamic>> tasks = [];

  // No Constructor, as Constructor is not necessary in dart-

  void allFeatures() {
    print("\n--- Task Manager ---");
    print("1. Add Task");
    print("2. Update Task");
    print("3. Delete Task");
    print("4. List Tasks");
    print("5. Filter Tasks by Status (not implemented)");
    print("6. Total number of Tasks");
    print("7. Clear all Tasks");
    print("0. Exit");
  }

  void addTask() {
    stdout.write("\nEnter Task Status: ");
    String? status = stdin.readLineSync();

    stdout.write("Enter Task Body: ");
    String? body = stdin.readLineSync();

    tasks.add({
      "Task Status": status,
      "Task Body": body,
      "Task Date": DateTime.now(),
    });

    print("\n✅ Task added successfully!");
  }

  void updateTasks() {
    if (tasks.isEmpty) {
      print("❌ No tasks to update.");
      return;
    }

    listAllTasks();

    stdout.write("Enter Task number to update: ");
    String? input = stdin.readLineSync();
    int? index = int.tryParse(input ?? '');

    if (index != null && index > 0 && index <= tasks.length) {
      var task = tasks[index - 1];

      stdout.write("Enter new Status (leave empty to keep existing): ");
      String? newStatus = stdin.readLineSync();

      stdout.write("Enter new Body (leave empty to keep existing): ");
      String? newBody = stdin.readLineSync();

      if (newStatus != null && newStatus.isNotEmpty) {
        task["Task Status"] = newStatus;
      }

      if (newBody != null && newBody.isNotEmpty) {
        task["Task Body"] = newBody;
      }

      task["Task Date"] = DateTime.now();

      print("\n✅ Task #$index updated successfully.");
    } else {
      print("❌ Invalid task number.");
    }
  }

  void deleteTasks() {
    if (tasks.isEmpty) {
      print("❌ No tasks to delete.");
      return;
    }

    listAllTasks();

    stdout.write("Enter Task number to delete: ");
    String? input = stdin.readLineSync();
    int? index = int.tryParse(input ?? '');

    if (index != null && index > 0 && index <= tasks.length) {
      tasks.removeAt(index - 1);
      print("\n✅ Task #$index deleted successfully.");
    } else {
      print("❌ Invalid task number.");
    }
  }

  void listAllTasks() {
    if (tasks.isEmpty) {
      print("📭 No tasks available.");
    } else {
      for (int i = 0; i < tasks.length; i++) {
        var task = tasks[i];
        print(
            '\n🔢 Task #${i + 1}\n📌 Status: ${task["Task Status"]}\n📝 Body: ${task["Task Body"]}\n📅 Date: ${task["Task Date"]}');
      }
    }
  }

  int totalTasks() => tasks.length;

  void clearAllTasks() {
    tasks.clear();
    print("🗑️ All tasks deleted.");
  }
}

void main() {
  TaskManager taskManager = TaskManager();

  while (true) {
    taskManager.allFeatures();

    stdout.write("\nEnter your choice: ");
    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? '');

    switch (choice) {
      case 0:
        print("👋 Exiting Task Manager. Goodbye!");
        return;
      case 1:
        taskManager.addTask();
        break;
      case 2:
        taskManager.updateTasks();
        break;
      case 3:
        taskManager.deleteTasks();
        break;
      case 4:
        taskManager.listAllTasks();
        break;
      case 5:
        print("🚧 Filter by status not implemented yet.");
        break;
      case 6:
        print("📊 Total Tasks: ${taskManager.totalTasks()}");
        break;
      case 7:
        taskManager.clearAllTasks();
        break;
      default:
        print("❌ Invalid choice. Try again.");
    }
  }
}
