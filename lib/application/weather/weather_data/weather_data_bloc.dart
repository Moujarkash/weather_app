import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/domain/core/entities/failure.dart';
import 'package:weather_app/domain/core/use_case/use_case.dart';
import 'package:weather_app/domain/weather/entities/weather_response.dart';
import 'package:weather_app/domain/weather/use_cases/get_weather_data_use_case.dart';

part 'weather_data_event.dart';
part 'weather_data_state.dart';

@injectable
class WeatherDataBloc extends Bloc<WeatherDataEvent, WeatherDataState> {
  final GetWeatherDataUseCase getWeatherDataUseCase;

  WeatherDataBloc(this.getWeatherDataUseCase) : super(WeatherDataInitial()) {
    on<WeatherDataRequested>((event, emit) async {
      emit(WeatherDataInProgress());

      final result = await getWeatherDataUseCase(NoParams());
      emit(result.fold((failure) => WeatherDataFailure(failure),
          (weatherResponse) => WeatherDataSuccess(weatherResponse)));
    });
  }
}
