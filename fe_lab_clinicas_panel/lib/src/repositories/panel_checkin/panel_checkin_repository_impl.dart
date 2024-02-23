import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_panel/src/core/env.dart';
import 'package:fe_lab_clinicas_panel/src/models/panel_checkin_model.dart';
import 'package:fe_lab_clinicas_panel/src/repositories/panel_checkin/panel_checkin_repository.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PanelCheckinRepositoryImpl implements PanelCheckinRepository {
  PanelCheckinRepositoryImpl({required this.restClient});

  final RestClient restClient;

  @override
  Stream<List<PanelCheckinModel>> getToDayPanel(
      WebSocketChannel channel) async* {
    yield await resquestData();
    yield* channel.stream.asyncMap((_) => resquestData());
  }

  @override
  ({WebSocketChannel channel, Function dispose}) openChannelSocket() {
    final channel = WebSocketChannel.connect(
        Uri.parse('${Env.wsBackendBaseUrl}?table=painelCheckin'));

    return (
      channel: channel,
      dispose: () => channel.sink.close(),
    );
  }

  Future<List<PanelCheckinModel>> resquestData() async {
    final dateFormat = DateFormat('y-MM-dd');
    final Response(:List data) =
        await restClient.auth.get('/painelCheckin', queryParameters: {
      'time_called': dateFormat.format(DateTime.now()),
    });
    return data.reversed
        .take(7)
        .map((e) => PanelCheckinModel.fromJson(e))
        .toList();
  }
}
