//late osnradan deyer verir, static const, final

import 'dart:io';
main(){
  Admin admin1 = new Admin();
  admin1.userName = 'elieliyev';
  admin1.password = '12345';

  Admin admin2 = Admin();
  admin2.userName = 'akifveliyev';
  admin2.password = 'akif123';

  List myAdmins = [admin1, admin2];
  

  Teacher teacher1 = new Teacher();
  teacher1.firstName = 'Elemdar';
  teacher1.lastName = 'Shahverdiyev';
  teacher1.password = 'elem123';
  teacher1.userName = 'elemdar';

  Teacher teacher2 = Teacher();
  teacher2.firstName = 'Aygul';
  teacher2.lastName = 'Musayeva';
  teacher2.password = 'aygul123';
  teacher2.userName = 'aygulmus';

  List myTeachers = [teacher1, teacher2];

  Student student1 = new Student();
  student1.firstName = 'Eli';
  student1.lastName = 'Quluzade';
  student1.score = 5;

  Student student2 = Student();
  student2.firstName = 'Nicat';
  student2.lastName = 'Memmedli';
  student2.score = 4;

  Student student3 = Student();
  student3.firstName = 'Fidan';
  student3.lastName = 'Memmedli';
  student3.score = 4;

  List myStudents = [student1, student2, student3];

  print("Xosh gelmisiniz!\n1. Admin girishi.\n2. Muellim girishi.");
  int tempChoice1 = int.parse(stdin.readLineSync()!);


  print("Zehmet olmasa sayta daxil olmaq ucun istifadeci adi ve ya parolu daxil edin.");
  String myUserName = stdin.readLineSync()!;
  String myPassword = stdin.readLineSync()!;

  print("="*100);
  bool flag = false;
  switch (tempChoice1) {
    case 1:
      for(var element in myAdmins){
        if((myUserName == element.userName) && (myPassword == element.password)){
          flag=true;
        }
      }

      if(flag == true){
        print("Xosh gelmisiniz!");
      while(true){
        print("Ne etmek isteyirsiniz?\n1. Telebelerin siyahisini gormek.\n2. Sisteme telebe elave etmek.\n3. Muellimlerin siyahisi.\n4. Sisteme muellim elave etmek.\n5. Telebelerin ortlamasina baxmaq.");
        int tempChocie = int.parse(stdin.readLineSync()!);
        switch (tempChocie) {
          case 1:
            for(int i = 0; i<myStudents.length; i++){
              print("${i+1}. ${myStudents[i].firstName} ${myStudents[i].lastName} ${myStudents[i].score}");
            }
            break;
          case 2:
            Student student4 = Student();
            print("Telebenin adi:");
            student4.firstName = stdin.readLineSync()!;
            print("Telebenin soyadi:");
            student4.lastName = stdin.readLineSync()!;
            print("Telebenin qiymeti:");
            student4.score = int.parse(stdin.readLineSync()!);
            myStudents.add(student4);
            break;
          case 3:
            for(int i = 0; i<myTeachers.length; i++){
              print("${i+1}. ${myTeachers[i].firstName} ${myTeachers[i].lastName}");
            }        
            break;
          case 4:
            Student teacher3 = Student();
            print("Muellimin adi:");
            teacher3.firstName = stdin.readLineSync()!;
            print("Muellimin soyadi:");
            teacher3.lastName = stdin.readLineSync()!;
            myTeachers.add(teacher3);
            break;
          case 5:
            print("Telebelerin ortalamasi: ${averageCalculator(myStudents)}");
            break;
          default:
            print("Sehv input.");
        }
        print("\nDavam etmek isteyirsiniz?[y or n]");
        String tempChocie2 = stdin.readLineSync()!;
        if(tempChocie2.toLowerCase()=='n'){
          break;
        }
        }
      }
      else{
        print("Istiadeci adi ve ya parol sehv daxil edilib.");
        main();
      }
      break;


    case 2:
      for(var element in myTeachers){
        if((myUserName == element.userName) && (myPassword == element.password)){
          flag=true;
        }
      }
      if(flag == true){
        print("Xosh gelmisiniz!");
          print("Telebelerin siyahisi:");
          for(int i = 0; i<myStudents.length; i++){
            print("${i+1}. ${myStudents[i].firstName} ${myStudents[i].lastName} ${myStudents[i].score}");
          }
          print("Telebelerin ortalamasi: ${averageCalculator(myStudents)}");
      }
      else{
        print("Istiadeci adi ve ya parol sehv daxil edilib.");
        main();
      }
      break;
    default:
      print("Sehv input.");
      main();
  }


}


class Student{
  String firstName = '';
  String lastName = '';
  int score = 0;
}

class Admin{
  String userName = '';
  String password = '';

}

class Teacher{
  String firstName = '';
  String lastName = '';
  String userName = '';
  String password = '';
}

num averageCalculator(students){
  num sum = 0;
  for(var element in students){
    sum+=element.score;
  }
  num av = sum/students.length;
  return av;
}