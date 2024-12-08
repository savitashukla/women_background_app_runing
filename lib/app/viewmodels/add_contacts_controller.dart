import 'package:contacts_service/contacts_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AddContactsScreenController extends GetxController{

 List<Contact> contacts = <Contact>[].obs;
 RxBool isLoading = true.obs;


//Contact fetch permission
void getContactPermission() async{
 if (await Permission.contacts.isGranted) {
    fetchContacts();

  } else {

    var status = await Permission.contacts.request();
    if (status.isGranted) {
      fetchContacts();
    } else if (status.isPermanentlyDenied) {
      showPermissionPermanentlyDeniedDialog();
       isLoading.value = false;
    } else {
      showPermissionDeniedMessage();
       isLoading.value = false;
    }
  }
  }

  //Fetch Contacts...
void fetchContacts()async{
  try {
    if (await Permission.contacts.isGranted) {
      contacts = await ContactsService.getContacts();
      isLoading.value = false;
    } else {
      showPermissionDeniedMessage();
    }
  } catch (e) {
    print('Error fetching contacts: $e');
    isLoading.value = false;
  }
}


void showPermissionPermanentlyDeniedDialog() {
  Fluttertoast.showToast(msg: 'Permission permanently denied. Please enable it in app settings.',timeInSecForIosWeb: 5);
}

void showPermissionDeniedMessage() {
 Fluttertoast.showToast(msg: 'Permission denied. You can enable it in the app settings.',timeInSecForIosWeb: 5);
}

}