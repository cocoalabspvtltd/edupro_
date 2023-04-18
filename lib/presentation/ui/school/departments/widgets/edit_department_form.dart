import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pgs_edupro/application/school_department/school_department_bloc.dart';
import 'package:pgs_edupro/application/school_edit_department/edit_department_bloc.dart';
import 'package:pgs_edupro/domain/core/constants.dart';
import 'package:pgs_edupro/presentation/ui/instructor/instructor_add_course/department_dropdown.dart';

import '../../../../../infrastructure/remote_data/models/insiistution_adding_responses/school_department_response.dart';


class AddDepartmentsForm extends StatefulWidget {
String?  depatmentname;
int?  departmentId;
   AddDepartmentsForm({super.key, required this.depatmentname,required this.departmentId});

  @override
  State<AddDepartmentsForm> createState() => _AddDepartmentsFormState();
}

class _AddDepartmentsFormState extends State<AddDepartmentsForm> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();

  }
  Widget build(BuildContext context) {
    print("kjhlkkl${widget.depatmentname}");
    print("kjhlkkl${widget.departmentId}");
    return BlocConsumer<EditDepartmentBloc, EditDepartmentState>(
      listener: (context, state) {
        state.loadFailureOrSuccessOption.fold(
              () {},
              (either) {
            either.fold(
                  (failure) {
                FlushbarHelper.createError(
                  message: failure.map(
                    unexpected: (value) => 'Unexpected Error',
                    serverError: (value) => 'Server Error',
                    serverTimeOut: (value) => 'Server Timed Out',
                    unAuthorized: (value) => value.message,
                    nullData: (value) => 'Data Not Found',
                  ),
                ).show(context);
              },
                  (res) {},
            );
          },
        );
        state.submitFailedOrSuccessOption.fold(() {}, (either) {
          either.fold((failure) {
            FlushbarHelper.createError(
              message: failure.map(
                unexpected: (value) => 'Unexpected Error',
                serverError: (value) => 'Server Error',
                serverTimeOut: (value) => 'Server Timed Out',
                unAuthorized: (value) => value.message,
                nullData: (value) => 'Data Not Found',
              ),
            ).show(context);
          },

                  (r) => Fluttertoast.showToast(msg: r.message!));
        });
      },
      builder: (context, state) {
        return state.isLoading
            ? SizedBox(
          height: screenHeight - 180,
          child: const Center(child: CircularProgressIndicator()),
        )
            :   Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 15,right: 15),
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Department Details",
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenHeight * .02),
              SizedBox(height: screenHeight * .02),
              _textForm(
                  state.nameController,
                      (v) => context
                      .read<EditDepartmentBloc>()
                      .add(EditDepartmentEvent.nameChanged(v)),
                      (_) =>
                      context.read<EditDepartmentBloc>().state.name.value.fold(
                            (f) => f.maybeMap(
                          invalidName: (_) => 'Invalid Name',
                          orElse: () => null,
                        ),
                            (_) => null,
                      ),
                  "Name",
                  true,
                  TextInputType.streetAddress,
                  maxLine: 1,
                  hint: "${widget.depatmentname}"),
              thickSpace,
              thickSpace,
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed:() => context
                        .read<EditDepartmentBloc>()
                        .add(EditDepartmentEvent.saveAndUpdatePressed()),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ),
              thickSpace,
              thickSpace,
            ],
          ),
        );
      },
    );

  }

  Widget _textForm(
      TextEditingController controller,
      onChanged,
      validator,
      String label,
      bool editable,
      TextInputType keyboardType, {
        List<TextInputFormatter>? formatter,
        String? hint,
        int maxLine = 1,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.black,fontSize: 16),
        ),
        thickSpace,
        TextFormField(
          enabled: editable,
          controller: controller,
          maxLines: maxLine,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: formatter,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black87),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            hintText: hint,
            hintStyle: TextStyle(color:Colors.black54 ),
            //filled: true,
            fillColor: primaryColor[100],
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey, width: 1)),
          ),
        ),
      ],
    );
  }


}
