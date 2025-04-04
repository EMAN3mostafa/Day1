import 'dart:io';

class TheaterSystem {
  static final TheaterSystem _instance = TheaterSystem._internal();

  List<List<String>> seats = List.generate(5, (_) => List.filled(5, 'E'));

  Map<String, Map<String, String>> bookings = {};

  TheaterSystem._internal();

  factory TheaterSystem() {
    return _instance;
  }

  void begin() {
    print("Welcome To Our Theater");

    while (true) {
      print("\nMenu:");
      print("1 - Book a seat");
      print("2 - Show seats");
      print("3 - Show bookings");
      print("4 - Exit");

      stdout.write("Your choice: ");
      String? choice = stdin.readLineSync();

      if (choice == '1') {
        bookSeat();
      } else if (choice == '2') {
        showSeats();
      } else if (choice == '3') {
        showBookings();
      } else if (choice == '4') {
        print("thank u!");
        break;
      } else {
        print("Invalid choice, try again.");
      }
    }
  }

  void bookSeat() {
    stdout.write("Enter row (1-5): ");
    int row = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    stdout.write("Enter column (1-5): ");
    int col = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (row < 1 || row > 5 || col < 1 || col > 5) {
      print("Invalid seat location.");
      return;
    }

    if (seats[row - 1][col - 1] == 'B') {
      print("Seat already booked.");
      return;
    }

    stdout.write("Enter your name: ");
    String name = stdin.readLineSync() ?? '';

    stdout.write("Enter your phone: ");
    String phone = stdin.readLineSync() ?? '';

    seats[row - 1][col - 1] = 'B';
    bookings['$row,$col'] = {'name': name, 'phone': phone};

    print("Seat booked successfully!");
  }

  void showSeats() {
    print("\nTheater Seats:");
    print("   1 2 3 4 5");
    for (int i = 0; i < 5; i++) {
      print("R${i + 1} ${seats[i].join(' ')}");
    }
  }

  void showBookings() {
    if (bookings.isEmpty) {
      print("No bookings yet.");
      return;
    }

    print("\nBookings:");
    bookings.forEach((seat, info) {
      print("Seat $seat => ${info['name']} (${info['phone']})");
    });
  }
}

void main() {
  var theater = TheaterSystem();
  theater.begin();
}
