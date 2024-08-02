import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BioSetupScreen extends StatefulWidget {
  @override
  _BioSetupScreenState createState() => _BioSetupScreenState();
}

class _BioSetupScreenState extends State<BioSetupScreen> {
  int _currentStep = 0;
  final _nameController = TextEditingController();
  final _professionController = TextEditingController();
  final _institutionController = TextEditingController();
  List<XFile> _imageFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup Your Bio'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() {
              _currentStep += 1;
            });
          } else {
            // Save bio data and navigate to event selection
            Navigator.pushReplacementNamed(context, '/eventSelection');
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: [
          Step(
            title: Text('Name'),
            content: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.editing,
          ),
          Step(
            title: Text('Profession & Institution'),
            content: Column(
              children: [
                TextFormField(
                  controller: _professionController,
                  decoration: InputDecoration(labelText: 'Profession'),
                ),
                TextFormField(
                  controller: _institutionController,
                  decoration: InputDecoration(labelText: 'Institution'),
                ),
              ],
            ),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.editing,
          ),
          Step(
            title: Text('Photos'),
            content: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    final List<XFile>? selectedImages = await _picker.pickMultiImage();
                    if (selectedImages != null && selectedImages.length <= 5) {
                      setState(() {
                        _imageFiles = selectedImages;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You can upload up to 5 images.')),
                      );
                    }
                  },
                  child: Text('Upload Photos'),
                ),
                _imageFiles.isNotEmpty
                    ? Wrap(
                        children: _imageFiles.map((file) {
                          return Image.file(File(file.path), width: 100, height: 100);
                        }).toList(),
                      )
                    : Text('No images uploaded'),
              ],
            ),
            isActive: _currentStep >= 2,
            state: _currentStep == 2 ? StepState.editing : StepState.complete,
          ),
        ],
      ),
    );
  }
}
