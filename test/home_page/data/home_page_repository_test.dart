import 'package:flutter_test/flutter_test.dart';
import 'package:learning_offline_first/app/api/connectivity_status.dart';
import 'package:learning_offline_first/app/core/database/database_datasource.dart';
import 'package:learning_offline_first/app/features/home_page/data/datasources/home_page_datasource.dart';
import 'package:learning_offline_first/app/features/home_page/data/repositories/home_page_repository.dart';
import 'package:mockito/mockito.dart';

class MockHomePageDatasource extends Mock implements HomePageDataSource {}

class MockDatabaseDatasource extends Mock implements DatabaseDataSource {}

class MockConnectivityStatus extends Mock implements ConnectivityStatus {}

void main() {
  HomePageRepository homePageRepository;
  MockHomePageDatasource mockHomePageDatasource;
  MockDatabaseDatasource mockDatabaseDatasource;
  MockConnectivityStatus mockConnectivityStatus;

  setUp(() {
    mockHomePageDatasource = MockHomePageDatasource();
    mockDatabaseDatasource = MockDatabaseDatasource();
    mockConnectivityStatus = MockConnectivityStatus();
    homePageRepository = HomePageRepository(
        homePageDataSource: mockHomePageDatasource,
        databaseDataSource: mockDatabaseDatasource,
        connectivityStatus: mockConnectivityStatus);
  });

  group('Listagem dos itens na HomePage do app (Repository)', () {});
}
