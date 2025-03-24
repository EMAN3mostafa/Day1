import 'dart:io';
import 'package:my_project/my_project.dart' as my_project;

void main() {
  List<List<String>> seats = List.generate(5, (_) => List.filled(5, 'E'));
  Map<String, Map<String, String>> bookings = {};

  print("Welcome To Our Theater");
  while (true) {
    print("press 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");
    stdout.write("input: ");
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      bookSeat(seats, bookings);
    } else if (choice == '2') {
      showSeats(seats);
    } else if (choice == '3') {
      showBookings(bookings);
    } else if (choice == '4') {
      print("See You Back");
      break;
    } else {
      print("Invalid choice, please try again.");
    }
  }
}

void bookSeat(
  List<List<String>> seats,
  Map<String, Map<String, String>> bookings,
) {
  while (true) {
    stdout.write("Enter row (1-5) or 'exit' to quit: ");
    String? rowInput = stdin.readLineSync();
    if (rowInput == 'exit') {
      return;
    }

    int row = int.tryParse(rowInput ?? '') ?? -1;
    if (row < 1 || row > 5) {
      print("Invalid row, please enter a number between 1 and 5.");
      continue;
    }

    stdout.write("Enter column (1-5): ");
    int col = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (col < 1 || col > 5) {
      print("Invalid column, please enter a number between 1 and 5.");
      continue;
    }

    if (seats[row - 1][col - 1] == 'B') {
      print("Seat already booked, choose another.");
      continue;
    }

    stdout.write("Enter your name: ");
    String name = stdin.readLineSync() ?? '';
    stdout.write("Enter your phone number: ");
    String phone = stdin.readLineSync() ?? '';

    seats[row - 1][col - 1] = 'B';
    bookings['$row,$col'] = {'name': name, 'phone': phone};
    print("Seat booked successfully!");
    break;
  }
}

void showSeats(List<List<String>> seats) {
  print("Theater Seats:");
  for (var row in seats) {
    print(row.join(' '));
  }
}

void showBookings(Map<String, Map<String, String>> bookings) {
  if (bookings.isEmpty) {
    print("No bookings yet.");
    return;
  }
  print("Users Booking Details:");
  bookings.forEach((seat, user) {
    print("Seat $seat: ${user['name']} - ${user['phone']}");
  });
}
