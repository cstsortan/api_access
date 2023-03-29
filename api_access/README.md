### api_access

api_access is a library for accessing and manipulating data in a remote data source. It provides a type-safe interface for performing CRUD (create, read, update, delete) operations on individual records as well as on collections of records. It also includes methods for monitoring changes to data and for creating new records.

## Installation

To use api_access in your Dart project, add it as a dependency in your pubspec.yaml file:

```yaml
dependencies:
  api_access: ^1.0.0
```
Then, run flutter pub get or dart pub get to install the package.

## Usage

To use api_access in your project, you can import it like any other library:

```dart
import 'package:api_access/api_access.dart';
```
Then, you can create an instance of the IApiAccess interface to access your remote data source:

```dart
final api = MyApiAccess(/* ... */);
```
You can use the methods provided by IApiAccess to perform CRUD operations on your data. For example, to retrieve a single record, you can use the getRecord method:

```dart
final ref = RecordReference<MyRecord>(/* ... */);
final record = await api.getRecord(ref);
```
Or, to retrieve a collection of records, you can use the getQuery method:

```dart
final query = Query<MyRecord>(/* ... */);
final result = await api.getQuery(query);
final records = result.data;
```
In addition to these basic methods, api_access also provides methods for monitoring changes to data and for creating new records. For more information on how to use these features, consult the API documentation.

API Documentation

For more detailed information on how to use api_access, consult the API documentation. The documentation includes detailed descriptions of each method provided by IApiAccess, as well as examples and usage notes. You can access the API documentation by generating it with dartdoc or by visiting the online documentation site at docs.apiaccess.com.