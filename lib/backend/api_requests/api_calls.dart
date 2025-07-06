import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Main Group Code

class MainGroup {
  static String getBaseUrl() => 'https://api.elevenlabs.io';
  static Map<String, String> headers = {
    'xi-api-key': 'sk_ffbc543b87a77f0d4266f380fb005328ba741afe2b8a5e02',
  };
  static VoicesCall voicesCall = VoicesCall();
  static ModelsCall modelsCall = ModelsCall();
  static TestToSpeechCall testToSpeechCall = TestToSpeechCall();
}

class VoicesCall {
  Future<ApiCallResponse> call({
    String? sortDirection = 'asc',
    String? voiceType = 'Default',
    String? search = '',
    int? pageSize = 100,
  }) async {
    final baseUrl = MainGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'voices',
      apiUrl: '${baseUrl}/v2/voices',
      callType: ApiCallType.GET,
      headers: {
        'xi-api-key': 'sk_ffbc543b87a77f0d4266f380fb005328ba741afe2b8a5e02',
      },
      params: {
        'voice_type': voiceType,
        'page_size': "100",
        'sort_direction': sortDirection,
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? voiceid(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].voice_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? accent(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].labels.accent''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lebeldiscrib(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].labels.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lebelage(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].labels.age''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lebelgender(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].labels.gender''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lebelusecase(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].labels.use_case''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? previewUrl(dynamic response) => (getJsonField(
        response,
        r'''$.voices[:].preview_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? nextpagetoken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.next_page_token''',
      ));
  int? totalcount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_count''',
      ));
  List? voices(dynamic response) => getJsonField(
        response,
        r'''$.voices''',
        true,
      ) as List?;
}

class ModelsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MainGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'models',
      apiUrl: '${baseUrl}/v1/models',
      callType: ApiCallType.GET,
      headers: {
        'xi-api-key': 'sk_ffbc543b87a77f0d4266f380fb005328ba741afe2b8a5e02',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? modelid(dynamic response) => (getJsonField(
        response,
        r'''$[:].model_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? modelname(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? canbefinetuned(dynamic response) => (getJsonField(
        response,
        r'''$[:].can_be_finetuned''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? candotesttospeech(dynamic response) => (getJsonField(
        response,
        r'''$[:].can_do_text_to_speech''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? maxtextlent(dynamic response) => (getJsonField(
        response,
        r'''$[:].maximum_text_length_per_request''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? maxtextlwtfree(dynamic response) => (getJsonField(
        response,
        r'''$[:].max_characters_request_free_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? maxtextsubscribed(dynamic response) => (getJsonField(
        response,
        r'''$[:].max_characters_request_subscribed_user''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? langueges(dynamic response) => getJsonField(
        response,
        r'''$[:].languages''',
        true,
      ) as List?;
  List<String>? landID(dynamic response) => (getJsonField(
        response,
        r'''$[:].languages[:].language_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TestToSpeechCall {
  Future<ApiCallResponse> call({
    String? voiceId = 'Xb7hH8MSUJpSbSDYk0k2',
    String? text = 'welcome to Voixr!',
    String? modelId = 'eleven_multilingual_v2',
    String? outputFormat = 'mp3_22050_32',
  }) async {
    final baseUrl = MainGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "text": "${escapeStringForJson(text)}",
  "model_id": "${escapeStringForJson(modelId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'testToSpeech',
      apiUrl:
          '${baseUrl}/v1/text-to-speech/${voiceId}?output_format=${outputFormat}',
      callType: ApiCallType.POST,
      headers: {
        'xi-api-key': 'sk_ffbc543b87a77f0d4266f380fb005328ba741afe2b8a5e02',
        'Accept': 'audio/mpeg',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Main Group Code

class BuildshipCall {
  static Future<ApiCallResponse> call({
    String? text = 'Hello Welcome to Voixr',
    String? voiceId = 'pNInz6obpgDQGcFmaJgB',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "${escapeStringForJson(text)}",
  "VoiceId": "${escapeStringForJson(voiceId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Buildship',
      apiUrl:
          'https://l6d582.buildship.run/elevenLabsTextToSpeech-a41174b03c9a',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuildshipVoiceChangerCall {
  static Future<ApiCallResponse> call({
    String? audio = '',
    String? voiceId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Audio": "${escapeStringForJson(audio)}",
  "VoiceId": "${escapeStringForJson(voiceId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Buildship VoiceChanger',
      apiUrl:
          'https://l6d582.buildship.run/eleven-labs-text-to-speech-copy-1fc2a6112e31',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DEEPsEEkCall {
  static Future<ApiCallResponse> call({
    String? messages = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "deepseek-chat",
  "messages": [
    {
      "role": "system",
      "content": "You a professional Voice over artist"
    },
    {
      "role": "user",
      "content": "${messages}"
    }
  ],
  "stream": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DEEPsEEk',
      apiUrl: 'https://api.deepseek.com/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer sk-a5ca2026a0c14f96a3b4e38aa2d1afe8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? messageContent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
  static String? printtt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.system_fingerprint''',
      ));
  static int? tokensused(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.usage.total_tokens''',
      ));
  static int? promt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.usage.prompt_tokens''',
      ));
}

class PodcastStudioTextCall {
  static Future<ApiCallResponse> call({
    String? host = '',
    String? guest = '',
    String? topic = '',
    String? description = '',
    String? language = 'English',
  }) async {
    final ffApiRequestBody = '''
{
  "Host": "${escapeStringForJson(host)}",
  "Guest": "${escapeStringForJson(guest)}",
  "Language": "${escapeStringForJson(language)}",
  "Topic": "${escapeStringForJson(topic)}",
  "Description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Podcast studioText',
      apiUrl: 'https://1yibyo.buildship.run/quickApi-431c668e1ad0',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? line(dynamic response) => (getJsonField(
        response,
        r'''$[:].line''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? speaker(dynamic response) => (getJsonField(
        response,
        r'''$[:].speaker''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PodcastStudioSoloCall {
  static Future<ApiCallResponse> call({
    String? host = '',
    String? topic = '',
    String? description = '',
    String? language = 'English',
    String? voiceID = '',
    String? outputFormat = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Host": "${escapeStringForJson(host)}",
  "VoiceID": "${escapeStringForJson(voiceID)}",
  "Language": "${escapeStringForJson(language)}",
  "Topic": "${escapeStringForJson(topic)}",
  "OutputFormat": "${escapeStringForJson(outputFormat)}",
  "Description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Podcast studio Solo',
      apiUrl: 'https://l6d582.buildship.run/textTo1MinutePodcast-bfe3681aad9d',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
  static String? link(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.textToSpeechSaveToFile''',
      ));
}

class MAinPodcastAudioCall {
  static Future<ApiCallResponse> call({
    String? voiceID1 = '',
    String? voiceID2 = '',
    String? text1 = '',
    String? text2 = '',
    String? text3 = '',
    String? text4 = '',
    String? text5 = '',
    String? text6 = '',
    String? text7 = '',
    String? outputFilePath = '',
    String? text8 = '',
    String? text9 = '',
    String? text10 = '',
    String? text11 = '',
    String? text12 = '',
    String? text13 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Voice ID1": "${voiceID1}",
  "Voice ID2": "${voiceID2}",
  "Text1": "${text1}",
  "Text2": "${text2}",
  "Text3": "${text3}",
  "Text4": "${text4}",
  "Text5": "${text5}",
  "Text6": "${text6}",
  "Text7": "${text7}",
  "Text8": "${text8}",
  "Text9": "${text9}",
  "Text10": "${text10}",
  "Text11": "${text11}",
  "Text12": "${text12}",
  "Text13": "${text13}",
  "OutputFilePath": "${outputFilePath}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MAinPodcastAudio',
      apiUrl: 'https://l6d582.buildship.run/podcastflow-8e5eba60a125',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EnhanxCall {
  static Future<ApiCallResponse> call({
    String? message = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "${escapeStringForJson(message)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'enhanx',
      apiUrl: 'https://1yibyo.buildship.run/quickApi-226a0662ad01',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TranscriptionCall {
  static Future<ApiCallResponse> call({
    String? audio = '',
    String? language = '',
  }) async {
    final ffApiRequestBody = '''
{
  "audio": "${escapeStringForJson(audio)}",
  "language": "${escapeStringForJson(language)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Transcription',
      apiUrl: 'https://l6d582.buildship.run/audioTranslator-08aaeb8320dc',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? translated(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.speechText''',
      ));
  static String? defaultENG(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.output''',
      ));
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
