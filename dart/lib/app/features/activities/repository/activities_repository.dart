import 'package:chuva/app/core/eiither/either.dart';
import 'package:chuva/app/core/exceptions/repository_exception.dart';
import 'package:chuva/app/core/models/activite_model.dart';

abstract interface class ActivitiesRepository {
  Future<Either<RepositoryException, List<ActiviteModel>>> getActivities();
}
