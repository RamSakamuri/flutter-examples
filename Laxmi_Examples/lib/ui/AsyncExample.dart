import 'dart:async';

main(){

  Task1();
  printFileContent();
  printFileContentA();
  Task3();
}

Task1() {
 print('From Task 1');
}

Task3() {
  print('From Task 3');
}

printFileContent(){
  Future<String> filedetails = downloadAFile();
  print("File details without await--> $filedetails ");
}

printFileContentA() async{
  String filedetails = await downloadAFile();
  print("File details with await--> $filedetails ");
}

Future<String> downloadAFile()  {
  Future<String> result = Future.delayed(Duration(seconds: 6),(){
    print('actual result ');
    return 'My long file downloaded content';
  });
  return result;
}
