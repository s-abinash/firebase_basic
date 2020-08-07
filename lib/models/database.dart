import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});  

  final CollectionReference studentdata =Firestore.instance.collection('student');
  Future updateUserData(String rollno, String name, String department ,String currentyear,String email,String password,String phone)async{
    return await studentdata.document(uid).setData({

        'rollno':rollno,
        'name':name,
        'department':department,
        'currentyear':currentyear,
        'phone':phone,
        'email':email,
        'password':password,


    }) ;

  }
  Future updateUserleave(String rollno, String name, String department ,String currentyear,String email,String password,String phone)async{
    return await studentdata.document(uid+'leave').setData({

        'rollno':rollno,
        'name':name,
        'department':department,
        'currentyear':currentyear,
        'phone':phone,
        'email':email,
        'password':password,


    }) ;

  }

  Stream<QuerySnapshot> get student {

      return studentdata.snapshots();

  }



}