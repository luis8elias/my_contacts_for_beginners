import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/models/contact.dart';

class AddContactBottomSheet extends StatefulWidget {
  const AddContactBottomSheet({
    super.key,
    required this.saveAction
  });

  final void Function(Contact) saveAction;

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {

  static  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void initState() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }


  String? validator({
      String? value,
      required bool isRequired,
      int? valueLength 
    }){
    if(isRequired){
      if(value!.isEmpty) {
        return 'Este campo es obligatorio';
      }
    }

    if(valueLength != null){
      if(value!.length != valueLength){
        return 'Este campo es de $valueLength dígitos';
      } 
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: const Color(0xFFEDEFF4),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.only(
              topLeft:  Radius.circular(20),
              topRight:  Radius.circular(20)
            )
          ),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children:  [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Agregar Contacto',
                     style: TextStyle(
                       fontWeight: FontWeight.bold
                     ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) => validator(
                      isRequired: true,
                      value: value
                    ),
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'ej. Luis Elias',
                      labelText: 'Nombre',
                      border:  OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator:   (value) => validator(
                      isRequired: true, 
                      value: value,
                      valueLength: 10
                    ),
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border:  OutlineInputBorder(),
                      hintText: 'ej. 6331156042',
                      labelText: 'Teléfono',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    keyboardType: TextInputType.phone,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        Navigator.of(context).pop();
                        widget.saveAction( Contact(
                          id: UniqueKey().toString(), 
                          name: nameController.text,
                          phone: phoneController.text
                        ));
                      }
                    },
                    style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const  EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal:20
                      ),
                    ),
                    backgroundColor: MaterialStateProperty
                      .all(Theme.of(context).primaryColor),
                      shape:  MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      )
                    ),
                    child: const Text('Guardar'),
                  ) 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}