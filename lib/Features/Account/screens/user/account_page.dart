// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trucks/Common/Theme/color.dart';
import 'package:trucks/Common/Theme/color2.dart';
import 'package:trucks/Common/Utils/dimension.dart';
import 'package:trucks/Common/Utils/string2.dart';
import 'package:trucks/Common/Widgets/generic_icon_button.dart';
import 'package:trucks/Common/Widgets/snackbar.dart';
import 'package:trucks/Common/Widgets/textarea.dart';
import 'package:trucks/Features/Account/controller/account_controller.dart';
import 'package:trucks/Features/Account/repo/common_firebase_storage_repo.dart';
import 'package:trucks/Features/Auth/widgets/generic_elevated.dart';
import 'package:trucks/Models/usermodel.dart';

class AccountPage extends ConsumerStatefulWidget {
  final UserModel userModel;
  const AccountPage({super.key, required this.userModel});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  final authKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;
  File? image;

  Future<File?> pickImageFromGallery(BuildContext context) async {
    File? image;
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return image;
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  @override
  void initState() {
    nameCtrl = TextEditingController(text: widget.userModel.name);
    emailCtrl = TextEditingController(text: widget.userModel.email);
    phoneCtrl = TextEditingController(text: widget.userModel.phoneNumber);
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              CupertinoIcons.back,
              color: AppColors.blackColor,
              size: 35,
            ),
          ),
          title: const Text("Profile"),
        ),
        body: Form(
          key: authKey,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(10),
            children: [
              Stack(
                children: [
                  Center(
                    child: widget.userModel.profilePic == ""
                        ? image != null
                            ? CircleAvatar(
                                radius: 120,
                                backgroundColor: blackColor.withOpacity(0.2),
                                backgroundImage: FileImage(image!),
                              )
                            : CircleAvatar(
                                radius: 120,
                                backgroundColor: blackColor.withOpacity(0.2),
                                backgroundImage: const NetworkImage(profilepic),
                              )
                        : CircleAvatar(
                            radius: 120,
                            backgroundColor: blackColor.withOpacity(0.2),
                            backgroundImage: NetworkImage(
                              widget.userModel.profilePic,
                            ),
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 200,
                    child: GenericIconButton(
                      icon: const Icon(
                        Icons.photo_camera_outlined,
                      ),
                      onPressed: selectImage,
                      color: greenColor.shade100,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.sHeight * 3,
              ),
              TextAreas(
                controller: nameCtrl,
                hintText: "Name",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please fill this field";
                  }
                  return null;
                },
                onChanged: (val) {
                  nameCtrl.text = val;
                },
              ),
              SizedBox(
                height: SizeConfig.sHeight * 2,
              ),
              TextAreas(
                controller: emailCtrl,
                hintText: "Email",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please fill this field";
                  }
                  return null;
                },
                onChanged: (val) {
                  emailCtrl.text = val;
                },
              ),
              SizedBox(
                height: SizeConfig.sHeight * 2,
              ),
              TextAreas(
                controller: phoneCtrl,
                hintText: "Phone",
                keyboard: TextInputType.phone,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please fill this field";
                  }
                  return null;
                },
                onChanged: (val) {
                  phoneCtrl.text = val;
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GenericElevatedButton(
            onPressed: () async {
              if (authKey.currentState!.validate()) {
                String photoUrl = "";

                if (image != null) {
                  photoUrl = await ref
                      .read(commonFirebaseStorageRepoProvider)
                      .storeFileToFirebase(
                        "profilePic/${widget.userModel.uid}",
                        image!,
                      );
                }

                ref.read(accountController).updateUserDetails(
                      context: context,
                      user: UserModel(
                        name: nameCtrl.text,
                        phoneNumber: phoneCtrl.text,
                        profilePic: photoUrl,
                        userToken: widget.userModel.userToken,
                        uid: widget.userModel.uid,
                        email: emailCtrl.text,
                        password: widget.userModel.password,
                        isAccepted: false,
                      ),
                    );
              }
            },
            title: "Save",
          ),
        ),
      ),
    );
  }
}
