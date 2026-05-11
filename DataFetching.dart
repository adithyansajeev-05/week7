
import 'dart:async';

Future<String> fetchData() async{
  await Future.delayed(Duration(seconds: 3));
  return "Data Fetched Succesfully";
}
void main() async{
  String? data;
  print("Data is Fetching......");
  try{
    data=await fetchData();
  }on TimeoutException{
    print("Connection time out!");
   
  }
   print(data);
  
}