import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/backend/schema/structs/index.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _Voiceid = await secureStorage.getString('ff_Voiceid') ?? _Voiceid;
    });
    await _safeInitAsync(() async {
      _audiopath = await secureStorage.getString('ff_audiopath') ?? _audiopath;
    });
    await _safeInitAsync(() async {
      _text = await secureStorage.getString('ff_text') ?? _text;
    });
    await _safeInitAsync(() async {
      _UploadedAudio =
          await secureStorage.getString('ff_UploadedAudio') ?? _UploadedAudio;
    });
    await _safeInitAsync(() async {
      _InstlyRecorded =
          await secureStorage.getString('ff_InstlyRecorded') ?? _InstlyRecorded;
    });
    await _safeInitAsync(() async {
      _seletpodcatlin =
          await secureStorage.getStringList('ff_seletpodcatlin') ??
              _seletpodcatlin;
    });
    await _safeInitAsync(() async {
      _HostName = await secureStorage.getString('ff_HostName') ?? _HostName;
    });
    await _safeInitAsync(() async {
      _HostUC = await secureStorage.getString('ff_HostUC') ?? _HostUC;
    });
    await _safeInitAsync(() async {
      _HostPVL = await secureStorage.getString('ff_HostPVL') ?? _HostPVL;
    });
    await _safeInitAsync(() async {
      _HostVid = await secureStorage.getString('ff_HostVid') ?? _HostVid;
    });
    await _safeInitAsync(() async {
      _GuestName = await secureStorage.getString('ff_GuestName') ?? _GuestName;
    });
    await _safeInitAsync(() async {
      _GuestUC = await secureStorage.getString('ff_GuestUC') ?? _GuestUC;
    });
    await _safeInitAsync(() async {
      _GuestPVL = await secureStorage.getString('ff_GuestPVL') ?? _GuestPVL;
    });
    await _safeInitAsync(() async {
      _GuestVid = await secureStorage.getString('ff_GuestVid') ?? _GuestVid;
    });
    await _safeInitAsync(() async {
      _stillWorking =
          await secureStorage.getBool('ff_stillWorking') ?? _stillWorking;
    });
    await _safeInitAsync(() async {
      _charactercount =
          await secureStorage.getInt('ff_charactercount') ?? _charactercount;
    });
    await _safeInitAsync(() async {
      _nointernet = await secureStorage.getBool('ff_nointernet') ?? _nointernet;
    });
    await _safeInitAsync(() async {
      _audiooo = (await secureStorage.getStringList('ff_audiooo')) ?? _audiooo;
    });
    await _safeInitAsync(() async {
      _isrecordingNow =
          await secureStorage.getBool('ff_isrecordingNow') ?? _isrecordingNow;
    });
    await _safeInitAsync(() async {
      _descrip = await secureStorage.getString('ff_descrip') ?? _descrip;
    });
    await _safeInitAsync(() async {
      _podcastTitle =
          await secureStorage.getString('ff_podcastTitle') ?? _podcastTitle;
    });
    await _safeInitAsync(() async {
      _MainHost = await secureStorage.getString('ff_MainHost') ?? _MainHost;
    });
    await _safeInitAsync(() async {
      _mainGuest = await secureStorage.getString('ff_mainGuest') ?? _mainGuest;
    });
    await _safeInitAsync(() async {
      _isSolo = await secureStorage.getBool('ff_isSolo') ?? _isSolo;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _Voiceid = '';
  String get Voiceid => _Voiceid;
  set Voiceid(String value) {
    _Voiceid = value;
    secureStorage.setString('ff_Voiceid', value);
  }

  void deleteVoiceid() {
    secureStorage.delete(key: 'ff_Voiceid');
  }

  String _audiopath = '';
  String get audiopath => _audiopath;
  set audiopath(String value) {
    _audiopath = value;
    secureStorage.setString('ff_audiopath', value);
  }

  void deleteAudiopath() {
    secureStorage.delete(key: 'ff_audiopath');
  }

  String _text = '';
  String get text => _text;
  set text(String value) {
    _text = value;
    secureStorage.setString('ff_text', value);
  }

  void deleteText() {
    secureStorage.delete(key: 'ff_text');
  }

  String _UploadedAudio = '';
  String get UploadedAudio => _UploadedAudio;
  set UploadedAudio(String value) {
    _UploadedAudio = value;
    secureStorage.setString('ff_UploadedAudio', value);
  }

  void deleteUploadedAudio() {
    secureStorage.delete(key: 'ff_UploadedAudio');
  }

  String _InstlyRecorded = '';
  String get InstlyRecorded => _InstlyRecorded;
  set InstlyRecorded(String value) {
    _InstlyRecorded = value;
    secureStorage.setString('ff_InstlyRecorded', value);
  }

  void deleteInstlyRecorded() {
    secureStorage.delete(key: 'ff_InstlyRecorded');
  }

  List<String> _seletpodcatlin = [];
  List<String> get seletpodcatlin => _seletpodcatlin;
  set seletpodcatlin(List<String> value) {
    _seletpodcatlin = value;
    secureStorage.setStringList('ff_seletpodcatlin', value);
  }

  void deleteSeletpodcatlin() {
    secureStorage.delete(key: 'ff_seletpodcatlin');
  }

  void addToSeletpodcatlin(String value) {
    seletpodcatlin.add(value);
    secureStorage.setStringList('ff_seletpodcatlin', _seletpodcatlin);
  }

  void removeFromSeletpodcatlin(String value) {
    seletpodcatlin.remove(value);
    secureStorage.setStringList('ff_seletpodcatlin', _seletpodcatlin);
  }

  void removeAtIndexFromSeletpodcatlin(int index) {
    seletpodcatlin.removeAt(index);
    secureStorage.setStringList('ff_seletpodcatlin', _seletpodcatlin);
  }

  void updateSeletpodcatlinAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    seletpodcatlin[index] = updateFn(_seletpodcatlin[index]);
    secureStorage.setStringList('ff_seletpodcatlin', _seletpodcatlin);
  }

  void insertAtIndexInSeletpodcatlin(int index, String value) {
    seletpodcatlin.insert(index, value);
    secureStorage.setStringList('ff_seletpodcatlin', _seletpodcatlin);
  }

  List<dynamic> _podcastdata2 = [];
  List<dynamic> get podcastdata2 => _podcastdata2;
  set podcastdata2(List<dynamic> value) {
    _podcastdata2 = value;
  }

  void addToPodcastdata2(dynamic value) {
    podcastdata2.add(value);
  }

  void removeFromPodcastdata2(dynamic value) {
    podcastdata2.remove(value);
  }

  void removeAtIndexFromPodcastdata2(int index) {
    podcastdata2.removeAt(index);
  }

  void updatePodcastdata2AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    podcastdata2[index] = updateFn(_podcastdata2[index]);
  }

  void insertAtIndexInPodcastdata2(int index, dynamic value) {
    podcastdata2.insert(index, value);
  }

  List<String> _newpods = [];
  List<String> get newpods => _newpods;
  set newpods(List<String> value) {
    _newpods = value;
  }

  void addToNewpods(String value) {
    newpods.add(value);
  }

  void removeFromNewpods(String value) {
    newpods.remove(value);
  }

  void removeAtIndexFromNewpods(int index) {
    newpods.removeAt(index);
  }

  void updateNewpodsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    newpods[index] = updateFn(_newpods[index]);
  }

  void insertAtIndexInNewpods(int index, String value) {
    newpods.insert(index, value);
  }

  String _HostName = '';
  String get HostName => _HostName;
  set HostName(String value) {
    _HostName = value;
    secureStorage.setString('ff_HostName', value);
  }

  void deleteHostName() {
    secureStorage.delete(key: 'ff_HostName');
  }

  String _HostUC = '';
  String get HostUC => _HostUC;
  set HostUC(String value) {
    _HostUC = value;
    secureStorage.setString('ff_HostUC', value);
  }

  void deleteHostUC() {
    secureStorage.delete(key: 'ff_HostUC');
  }

  String _HostPVL = '';
  String get HostPVL => _HostPVL;
  set HostPVL(String value) {
    _HostPVL = value;
    secureStorage.setString('ff_HostPVL', value);
  }

  void deleteHostPVL() {
    secureStorage.delete(key: 'ff_HostPVL');
  }

  String _HostVid = '';
  String get HostVid => _HostVid;
  set HostVid(String value) {
    _HostVid = value;
    secureStorage.setString('ff_HostVid', value);
  }

  void deleteHostVid() {
    secureStorage.delete(key: 'ff_HostVid');
  }

  String _GuestName = '';
  String get GuestName => _GuestName;
  set GuestName(String value) {
    _GuestName = value;
    secureStorage.setString('ff_GuestName', value);
  }

  void deleteGuestName() {
    secureStorage.delete(key: 'ff_GuestName');
  }

  String _GuestUC = '';
  String get GuestUC => _GuestUC;
  set GuestUC(String value) {
    _GuestUC = value;
    secureStorage.setString('ff_GuestUC', value);
  }

  void deleteGuestUC() {
    secureStorage.delete(key: 'ff_GuestUC');
  }

  String _GuestPVL = '';
  String get GuestPVL => _GuestPVL;
  set GuestPVL(String value) {
    _GuestPVL = value;
    secureStorage.setString('ff_GuestPVL', value);
  }

  void deleteGuestPVL() {
    secureStorage.delete(key: 'ff_GuestPVL');
  }

  String _GuestVid = '';
  String get GuestVid => _GuestVid;
  set GuestVid(String value) {
    _GuestVid = value;
    secureStorage.setString('ff_GuestVid', value);
  }

  void deleteGuestVid() {
    secureStorage.delete(key: 'ff_GuestVid');
  }

  bool _stillWorking = false;
  bool get stillWorking => _stillWorking;
  set stillWorking(bool value) {
    _stillWorking = value;
    secureStorage.setBool('ff_stillWorking', value);
  }

  void deleteStillWorking() {
    secureStorage.delete(key: 'ff_stillWorking');
  }

  int _charactercount = 0;
  int get charactercount => _charactercount;
  set charactercount(int value) {
    _charactercount = value;
    secureStorage.setInt('ff_charactercount', value);
  }

  void deleteCharactercount() {
    secureStorage.delete(key: 'ff_charactercount');
  }

  bool _nointernet = false;
  bool get nointernet => _nointernet;
  set nointernet(bool value) {
    _nointernet = value;
    secureStorage.setBool('ff_nointernet', value);
  }

  void deleteNointernet() {
    secureStorage.delete(key: 'ff_nointernet');
  }

  List<String> _audiooo = [
    'https://filesamples.com/samples/audio/mp3/sample3.mp3',
    'https://filesamples.com/samples/audio/mp3/sample3.mp3'
  ];
  List<String> get audiooo => _audiooo;
  set audiooo(List<String> value) {
    _audiooo = value;
    secureStorage.setStringList('ff_audiooo', value);
  }

  void deleteAudiooo() {
    secureStorage.delete(key: 'ff_audiooo');
  }

  void addToAudiooo(String value) {
    audiooo.add(value);
    secureStorage.setStringList('ff_audiooo', _audiooo);
  }

  void removeFromAudiooo(String value) {
    audiooo.remove(value);
    secureStorage.setStringList('ff_audiooo', _audiooo);
  }

  void removeAtIndexFromAudiooo(int index) {
    audiooo.removeAt(index);
    secureStorage.setStringList('ff_audiooo', _audiooo);
  }

  void updateAudioooAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    audiooo[index] = updateFn(_audiooo[index]);
    secureStorage.setStringList('ff_audiooo', _audiooo);
  }

  void insertAtIndexInAudiooo(int index, String value) {
    audiooo.insert(index, value);
    secureStorage.setStringList('ff_audiooo', _audiooo);
  }

  bool _isrecordingNow = false;
  bool get isrecordingNow => _isrecordingNow;
  set isrecordingNow(bool value) {
    _isrecordingNow = value;
    secureStorage.setBool('ff_isrecordingNow', value);
  }

  void deleteIsrecordingNow() {
    secureStorage.delete(key: 'ff_isrecordingNow');
  }

  String _descrip = '';
  String get descrip => _descrip;
  set descrip(String value) {
    _descrip = value;
    secureStorage.setString('ff_descrip', value);
  }

  void deleteDescrip() {
    secureStorage.delete(key: 'ff_descrip');
  }

  String _podcastTitle = '';
  String get podcastTitle => _podcastTitle;
  set podcastTitle(String value) {
    _podcastTitle = value;
    secureStorage.setString('ff_podcastTitle', value);
  }

  void deletePodcastTitle() {
    secureStorage.delete(key: 'ff_podcastTitle');
  }

  String _MainHost = '';
  String get MainHost => _MainHost;
  set MainHost(String value) {
    _MainHost = value;
    secureStorage.setString('ff_MainHost', value);
  }

  void deleteMainHost() {
    secureStorage.delete(key: 'ff_MainHost');
  }

  String _mainGuest = '';
  String get mainGuest => _mainGuest;
  set mainGuest(String value) {
    _mainGuest = value;
    secureStorage.setString('ff_mainGuest', value);
  }

  void deleteMainGuest() {
    secureStorage.delete(key: 'ff_mainGuest');
  }

  bool _isSolo = true;
  bool get isSolo => _isSolo;
  set isSolo(bool value) {
    _isSolo = value;
    secureStorage.setBool('ff_isSolo', value);
  }

  void deleteIsSolo() {
    secureStorage.delete(key: 'ff_isSolo');
  }

  String _podcataUDIO = '';
  String get podcataUDIO => _podcataUDIO;
  set podcataUDIO(String value) {
    _podcataUDIO = value;
  }

  final _voice1Manager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> voice1({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _voice1Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVoice1Cache() => _voice1Manager.clear();
  void clearVoice1CacheKey(String? uniqueKey) =>
      _voice1Manager.clearRequest(uniqueKey);

  final _historyManager = StreamRequestManager<List<SpeechDataRecord>>();
  Stream<List<SpeechDataRecord>> history({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SpeechDataRecord>> Function() requestFn,
  }) =>
      _historyManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHistoryCache() => _historyManager.clear();
  void clearHistoryCacheKey(String? uniqueKey) =>
      _historyManager.clearRequest(uniqueKey);

  final _voice2Manager = StreamRequestManager<List<VoicesRecord>>();
  Stream<List<VoicesRecord>> voice2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<VoicesRecord>> Function() requestFn,
  }) =>
      _voice2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVoice2Cache() => _voice2Manager.clear();
  void clearVoice2CacheKey(String? uniqueKey) =>
      _voice2Manager.clearRequest(uniqueKey);

  final _trendinglistManager = StreamRequestManager<List<PodcastsRecord>>();
  Stream<List<PodcastsRecord>> trendinglist({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PodcastsRecord>> Function() requestFn,
  }) =>
      _trendinglistManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTrendinglistCache() => _trendinglistManager.clear();
  void clearTrendinglistCacheKey(String? uniqueKey) =>
      _trendinglistManager.clearRequest(uniqueKey);

  final _podrefManager = FutureRequestManager<TranscriptionsRecord>();
  Future<TranscriptionsRecord> podref({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<TranscriptionsRecord> Function() requestFn,
  }) =>
      _podrefManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPodrefCache() => _podrefManager.clear();
  void clearPodrefCacheKey(String? uniqueKey) =>
      _podrefManager.clearRequest(uniqueKey);

  final _voiceoverManager = FutureRequestManager<SpeechDataRecord>();
  Future<SpeechDataRecord> voiceover({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<SpeechDataRecord> Function() requestFn,
  }) =>
      _voiceoverManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVoiceoverCache() => _voiceoverManager.clear();
  void clearVoiceoverCacheKey(String? uniqueKey) =>
      _voiceoverManager.clearRequest(uniqueKey);

  final _bookmackManager = StreamRequestManager<List<PodcastsRecord>>();
  Stream<List<PodcastsRecord>> bookmack({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PodcastsRecord>> Function() requestFn,
  }) =>
      _bookmackManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBookmackCache() => _bookmackManager.clear();
  void clearBookmackCacheKey(String? uniqueKey) =>
      _bookmackManager.clearRequest(uniqueKey);

  final _feeaturedpostManager = StreamRequestManager<List<PodcastsRecord>>();
  Stream<List<PodcastsRecord>> feeaturedpost({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PodcastsRecord>> Function() requestFn,
  }) =>
      _feeaturedpostManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFeeaturedpostCache() => _feeaturedpostManager.clear();
  void clearFeeaturedpostCacheKey(String? uniqueKey) =>
      _feeaturedpostManager.clearRequest(uniqueKey);

  final _transcripManager = StreamRequestManager<List<TranscriptionsRecord>>();
  Stream<List<TranscriptionsRecord>> transcrip({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TranscriptionsRecord>> Function() requestFn,
  }) =>
      _transcripManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTranscripCache() => _transcripManager.clear();
  void clearTranscripCacheKey(String? uniqueKey) =>
      _transcripManager.clearRequest(uniqueKey);

  final _languageManager = FutureRequestManager<List<LanguagesRecord>>();
  Future<List<LanguagesRecord>> language({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<LanguagesRecord>> Function() requestFn,
  }) =>
      _languageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLanguageCache() => _languageManager.clear();
  void clearLanguageCacheKey(String? uniqueKey) =>
      _languageManager.clearRequest(uniqueKey);

  final _podxxManager = FutureRequestManager<PodcastsRecord>();
  Future<PodcastsRecord> podxx({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<PodcastsRecord> Function() requestFn,
  }) =>
      _podxxManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPodxxCache() => _podxxManager.clear();
  void clearPodxxCacheKey(String? uniqueKey) =>
      _podxxManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
