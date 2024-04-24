import 'dart:io';
import 'dart:typed_data';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter_template/domain/datasources/file_datasource.dart';
import 'package:flutter_template/domain/enums/file.dart';
import 'package:flutter_template/domain/exceptions/platform_not_supported_exception.dart';
import 'package:flutter_template/domain/repositories/file_repository.dart';
import 'package:image_picker/image_picker.dart';

class FileRepositoryImpl implements FileRepository {
  const FileRepositoryImpl({
    required FileDataSource androidDataSource,
    required FileDataSource iosDataSource,
    required FileDataSource linuxDataSource,
    required FileDataSource windowsDataSource,
  })  : _androidDataSource = androidDataSource,
        _iosDataSource = iosDataSource,
        _linuxDataSource = linuxDataSource,
        _windowsDataSource = windowsDataSource;

  final FileDataSource _androidDataSource;
  final FileDataSource _iosDataSource;
  final FileDataSource _linuxDataSource;
  final FileDataSource _windowsDataSource;

  ImagePicker get _picker => ImagePicker();

  @override
  Future<Uint8List?> pick({
    FileSource? source,
  }) {
    switch (source) {
      case FileSource.camera:
        return _pickCamera();
      case FileSource.gallery:
        return _pickGallery();
      default:
        return _pickFile();
    }
  }

  @override
  Future<void> write({
    required Object value,
    required String name,
    required FileLocation location,
  }) {
    switch (location) {
      case FileLocation.application:
        return _writeToApplication(
          value: value,
          name: name,
        );
      case FileLocation.downloads:
        return _writeToDownloads(
          value: value,
          name: name,
        );
    }
  }

  Future<Uint8List?> _pickCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    return image?.readAsBytes();
  }

  Future<Uint8List?> _pickGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    return image?.readAsBytes();
  }

  Future<Uint8List?> _pickFile() async {
    final XFile? file = await openFile();
    return file?.readAsBytes();
  }

  Future<void> _writeToApplication({
    required Object value,
    required String name,
  }) async {
    final Directory directory;
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        directory = await _androidDataSource.applicationDirectory;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        directory = await _iosDataSource.applicationDirectory;
      case TargetPlatform.linux:
        directory = await _linuxDataSource.applicationDirectory;
      case TargetPlatform.windows:
        directory = await _windowsDataSource.applicationDirectory;
      default:
        throw PlatformNotSupportedException();
    }
    final File file = File('${directory.path}/$name');
    file.write(value);
  }

  Future<void> _writeToDownloads({
    required Object value,
    required String name,
  }) async {
    final Directory directory;
    switch (PlatformExtension.target) {
      case TargetPlatform.android:
        directory = await _androidDataSource.downloadDirectory;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        directory = await _iosDataSource.downloadDirectory;
      case TargetPlatform.linux:
        directory = await _linuxDataSource.downloadDirectory;
      case TargetPlatform.windows:
        directory = await _windowsDataSource.downloadDirectory;
      default:
        throw PlatformNotSupportedException();
    }
    final File file = File('${directory.path}/$name');
    file.write(value);
  }
}
