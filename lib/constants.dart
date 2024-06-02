import 'package:academia_rosta_diplom/core/shared/shared_pref_source.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/user_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/enums/role_enum.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/entities/topic_entity.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'main.dart';

class Constants {
  // static const String _ip = "mental-academia.ru";
  // static const String _host = "https";
  // static const baseUrl = "$_host://$_ip/";

  static const String _ip = "192.168.50.84";
  static const String _host = "http";
  static const String _port = "8080";
  static const baseUrl = "$_host://$_ip:$_port/";
  static UserEntity user = UserModel.fromJson(
    {
      'token': prefs.getString(SharedPrefSource.tokenKey),
      'role': prefs.getString(SharedPrefSource.roleKey),
      'avatar': prefs.getString(SharedPrefSource.imageKey),
    },
  );

  static final List<String> months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];

  static const List<TopicEntity> topics = [
    TopicEntity(
      name: "Простое сложение вычитание",
      code: "ПСВ",
      json: "trainer.task.PSV.full",
    ),
    TopicEntity(
      name: "Помощь брата +1",
      code: "ПБ+1",
      json: "trainer.task.PBP1.full",
    ),
    TopicEntity(
      name: "Помощь брата -1",
      code: "ПБ-1",
      json: "trainer.task.PBM1.full",
    ),
    TopicEntity(
      name: "Помощь брата +2",
      code: "ПБ+2",
      json: "trainer.task.PBP2.full",
    ),
    TopicEntity(
      name: "Помощь брата -2",
      code: "ПБ-2",
      json: "trainer.task.PBM2.full",
    ),
    TopicEntity(
      name: "Помощь брата +3",
      code: "ПБ+3",
      json: "trainer.task.PBP3.full",
    ),
    TopicEntity(
      name: "Помощь брата -3",
      code: "ПБ-3",
      json: "trainer.task.PBM3.full",
    ),
    TopicEntity(
      name: "Помощь брата +4",
      code: "ПБ+4",
      json: "trainer.task.PBP4.full",
    ),
    TopicEntity(
      name: "Помощь брата -4",
      code: "ПБ-4",
      json: "trainer.task.PBM4.full",
    ),
    TopicEntity(
      name: "Помощь друга +1",
      code: "ПД+1",
      json: "trainer.task.PDP1.full",
    ),
    TopicEntity(
      name: "Помощь друга -1",
      code: "ПД-1",
      json: "trainer.task.PDM1.full",
    ),
    TopicEntity(
      name: "Помощь друга +2",
      code: "ПД+2",
      json: "trainer.task.PDP2.full",
    ),
    TopicEntity(
      name: "Помощь друга -2",
      code: "ПД-2",
      json: "trainer.task.PDM2.full",
    ),
    TopicEntity(
      name: "Помощь друга +3",
      code: "ПД+3",
      json: "trainer.task.PDP3.full",
    ),
    TopicEntity(
      name: "Помощь друга -3",
      code: "ПД-3",
      json: "trainer.task.PDM3.full",
    ),
    TopicEntity(
      name: "Помощь друга +4",
      code: "ПД+4",
      json: "trainer.task.PDP4.full",
    ),
    TopicEntity(
      name: "Помощь друга -4",
      code: "ПД-4",
      json: "trainer.task.PDM4.full",
    ),
    TopicEntity(
      name: "Помощь друга +5",
      code: "ПД+5",
      json: "trainer.task.PDP5.full",
    ),
    TopicEntity(
      name: "Помощь друга -5",
      code: "ПД-5",
      json: "trainer.task.PDM5.full",
    ),
    TopicEntity(
      name: "Помощь друга +6",
      code: "ПД+6",
      json: "trainer.task.PDP6.full",
    ),
    TopicEntity(
      name: "Помощь друга -6",
      code: "ПД-6",
      json: "trainer.task.PDM6.full",
    ),
    TopicEntity(
      name: "Помощь друга +7",
      code: "ПД+7",
      json: "trainer.task.PDP7.full",
    ),
    TopicEntity(
      name: "Помощь друга -7",
      code: "ПД-7",
      json: "trainer.task.PDM7.full",
    ),
    TopicEntity(
      name: "Помощь друга +8",
      code: "ПД+8",
      json: "trainer.task.PDP8.full",
    ),
    TopicEntity(
      name: "Помощь друга -8",
      code: "ПД-8",
      json: "trainer.task.PDM8.full",
    ),
    TopicEntity(
      name: "Помощь друга +9",
      code: "ПД+9",
      json: "trainer.task.PDP9.full",
    ),
    TopicEntity(
      name: "Помощь друга -9",
      code: "ПД-9",
      json: "trainer.task.PDM9.full",
    ),
  ];
}
