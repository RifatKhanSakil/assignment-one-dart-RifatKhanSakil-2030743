// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
/// EXPECTED OUTPUT:
/// Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
/// Job Title: Manager
/// Base Salary: 8000.0
/// Calculated Salary: 9000.0
/// Payment processed: 9000.0
/// Report: Monthly report for John Smith in IT department
/// 
/// Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
/// Job Title: Senior Developer
/// Base Salary: 6000.0
/// Calculated Salary: 6500.0
/// Payment processed: 6500.0

// 1. Mixin Payable:
//    - Method: double calculateSalary(double baseSalary, double bonus)
//    - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    // TODO: Calculate total salary (base + bonus)
    var totalSalary=baseSalary+bonus;
    return totalSalary;
  }

  void processPayment(double amount) {
    // TODO: Process payment and print "Payment processed: <amount>"
    print('Payment Processed: $amount');
  }
}

// 2. Mixin Reportable:
//    - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) {
    // TODO: Generate and return report string: "Report: Monthly report for <name> in <department> department"
    return 'Report: Monthly report for $employeeName in $department department';
  }
}

// 3. Abstract Class Employee:
//    - Properties: String name, String id, String department
//    - Abstract method: String getJobTitle()
//    - Abstract method: double getBaseSalary()
abstract class Employee {

  Employee(this.name, this.id, this.department);
  String name;
  String id;
  String department;

  String getJobTitle();
  double getBaseSalary();

  void displayInfo() {
    // TODO: Display employee information
    print('Employee: $name, ID: $id, Dept: $department');
  }
}

// 4. Concrete Classes:
//    - Manager extends Employee with Payable and Reportable
//      - Additional property: int teamSize
//      - Override required methods
class Manager extends Employee with Payable, Reportable {
  int teamSize;

  Manager(super.name, super.id, super.department, this.teamSize);

  @override
  String getJobTitle() {
    // TODO: Return manager job title
    return 'Manager';
  }

  @override
  double getBaseSalary() {
    // TODO: Return manager base salary
    return 8000;
  }

  @override
  void displayInfo() {
    // TODO: Override to show manager-specific info as shown in expected output
    print('Manager: $name(ID: $id, Department: $department, Team Size: $teamSize)');
  }
}

//    - Developer extends Employee with Payable
//      - Additional property: String programmingLanguage
//      - Override required methods
class Developer extends Employee with Payable {

  Developer(String name, String id, String department, this.programmingLanguage)
      : super(name, id, department);
  String programmingLanguage;

  @override
  String getJobTitle() {
    // TODO: Return developer job title
    return 'Senior Developer';
  }

  @override
  double getBaseSalary() {
    // TODO: Return developer base salary
    return 6000;
  }

  @override
  void displayInfo() {
    // TODO: Override to show developer-specific info as shown in expected output
    print('Developer: $name(ID: $id, Department: $department, Language: $programmingLanguage)');
  }
}

void main() {
  // 5. Create employees and demonstrate:
  //    - Salary calculation with bonus
  //    - Payment processing
  //    - Report generation (for managers)
  //    - Display all employee information

  // TODO: Create one Manager and one Developer with the details shown in expected output
  final var manager=Manager('John Smith','M001','IT',5);
  var dev=Developer('Alice Johnson','D001','IT','Dart');

  // TODO: Demonstrate salary calculation and payment processing for both
  var salMan=manager.getBaseSalary();
  var bonusMan=1000;
  var calsal=manager.calculateSalary(salMan, bonusMan);
  print('Calculated Salary: $calsal');
  manager.processPayment(calsal);
  var saldev=dev.getBaseSalary();
  var bonusdev=500;
  final var calsald=dev.calculateSalary(saldev, bonusdev);
  print('Calculated Salary: $calsald');
  dev.processPayment(calsald);

  // TODO: Generate and print report for the Manager
  final var report=manager.generateReport(manager.name, manager.department);
  print(report);


  // TODO: Display information for both employees
  manager.displayInfo();
  dev.displayInfo();
}
