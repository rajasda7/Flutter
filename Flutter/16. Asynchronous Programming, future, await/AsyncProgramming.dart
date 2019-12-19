// ALL functions declared below runs on Main UI Thread..import
import 'dart:async';
main(){
print('Main program starts');
printFileContent();
print('Main program ends');
}

printFileContent()async{
  String fileContent = await downloadAFile(); // we also an use then fileContent.then
  print('The content file is $fileContent');
}

// To download a file [ Dummy Long Operation]
downloadAFile(){
 Future<String> result =  Future.delayed(Duration(seconds: 6),(){ // 1sec, 2sec.....6sec returns string a promise token
    return 'My Secret file content';
  });
 return result;
}