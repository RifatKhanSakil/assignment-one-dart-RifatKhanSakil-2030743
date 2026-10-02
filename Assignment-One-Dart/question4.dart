// Question 4: Inheritance & Polymorphism (Difficulty: 4/5) ⭐⭐⭐⭐
/// EXPECTED OUTPUT:
/// Vehicle Info: 2020 Toyota Camry (4 doors)
/// Starting the car engine...
/// Stopping the car engine...
/// 
/// Vehicle Info: 2021 Honda CBR (Has windshield: true)
/// Starting the motorcycle engine...
/// Stopping the motorcycle engine...
/// 
/// Car age: <Value> years
/// Motorcycle age: <Value> years

// 1. Abstract Class Vehicle:
//    - Properties: String brand, String model, int year
//    - Abstract method: void start()
//    - Abstract method: void stop()
//    - Concrete method: void displayInfo()
abstract class Vehicle {

  Vehicle(this.brand, this.model, this.year);
  String brand;
  String model;
  int year;

  // Abstract methods
  void start();
  void stop();

  // Concrete method
  void displayInfo() {
    // TODO: Display vehicle information
    print('Vehicle Info: $year $brand $model');
  }

  // Add a method to calculate vehicle age (current year - vehicle year)
  int calculateAge(int year) {
    // TODO: Calculate and return vehicle age
    var current=2026;
    return current-year;
  }
}

// 2. Concrete Classes:
//    - Car extends Vehicle
//      - Additional property: int numberOfDoors
//      - Override start() and stop() methods
class Car extends Vehicle {

  Car(String brand, String model, int year, this.numberOfDoors)
      : super(brand, model, year);
  int numberOfDoors;

  @override
  void start() {
    // TODO: Implement car start method
    print('Starting the car engine...');
  }

  @override
  void stop() {
    // TODO: Implement car stop method
    print('Stopping the car engine...');
  }

  @override
  void displayInfo() {
    // TODO: Override to show car-specific info as shown in expected output
    print('Vehicle Info: $year $brand $model ($numberOfDoors doors)');
  }
}

//    - Motorcycle extends Vehicle
//      - Additional property: bool hasWindshield
//      - Override start() and stop() methods
class Motorcycle extends Vehicle {
  bool hasWindshield;

  Motorcycle(super.brand, super.model, super.year, this.hasWindshield);

  @override
  void start() {
    // TODO: Implement motorcycle start method
    print('Starting the motorcycle engine...');
  }

  @override
  void stop() {
    // TODO: Implement motorcycle stop method
    print('Stopping the motorcycle engine...');
  }

  @override
  void displayInfo() {
    // TODO: Override to show motorcycle-specific info as shown in expected output
    print('Vehicle Info: $year $brand $model (Has windshield: $hasWindshield)');
    
  }
}

void main() {
  // 3. Create a list of vehicles and demonstrate polymorphism by calling start(), stop(), and displayInfo() on each vehicle
  // TODO: Create a list containing one Car and one Motorcycle
  var vehicle=<Vehicle>[Car('Toyota','Camry',2020,4),Motorcycle( 'Honda','CBR',2021,true)];
  // TODO: Loop through the list and call displayInfo(), start(), and stop()
for(var v in vehicle){
  v.displayInfo();
  v.start();
  v.stop();
}
  // TODO: Print the age of each vehicle using calculateAge()
  for(var ve in vehicle){
    var age=ve.calculateAge(ve.year);
    if (ve is Car){
      print('Car age: $age years');
    }
    else{
      print('Motorcycle age: $age years');
    }

  }
}
