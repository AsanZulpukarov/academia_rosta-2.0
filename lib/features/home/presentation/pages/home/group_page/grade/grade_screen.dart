import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/core/platform/network_info.dart';
import 'package:academia_rosta_diplom/features/home/data/datasources/remote/group_remote_data_source_impl.dart';
import 'package:academia_rosta_diplom/features/home/data/repositories/group_repository_impl.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/grade_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/student_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/post_grade_by_students_id.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/grade_bloc/grade_bloc.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/container_frame_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

enum GradeType { homeWork, classWork, selfWork }

class GradeScreen extends StatefulWidget {
  final StudentEntity student;
  final int idSubject;

  const GradeScreen({
    Key? key,
    required this.student,
    required this.idSubject,
  }) : super(key: key);

  @override
  State<GradeScreen> createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  List<StudentEntity> gradeStudents = [];
  GradeType selectGradeType = GradeType.homeWork;

  String typeGrade = "Домашная работа";
  final bloc = GradeBloc(
    PostGradeByStudentIdUseCase(
      GroupRepositoryImpl(
        remoteGroupDataSource: GroupRemoteDataSourceImpl(),
      ),
    ),
  );
  double initialRating = 0;
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(
        title: 'Оценка',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: BlocProvider.value(
          value: bloc,
          child: Column(
            children: [
              ContainerFrameWidget(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Оценить студента",
                      style: AppTextStyles.black18Medium.copyWith(
                        color: AppColors.main,
                      ),
                    ),
                    Gap(10.h),
                    Text(
                      "Тип оценки",
                      style: AppTextStyles.black16Medium,
                    ),
                    RadioMenuButton(
                      value: "Домашная работа",
                      groupValue: typeGrade,
                      onChanged: (String? value) {
                        setState(() {
                          typeGrade = value!;
                          selectGradeType = GradeType.homeWork;
                        });
                      },
                      child: Text(
                        "Домашная работа",
                        style: AppTextStyles.black16Medium,
                      ),
                    ),
                    RadioMenuButton(
                      value: "Классная работа",
                      groupValue: typeGrade,
                      onChanged: (String? value) {
                        setState(() {
                          typeGrade = value!;
                          selectGradeType = GradeType.classWork;
                        });
                      },
                      child: Text(
                        "Классная работа",
                        style: AppTextStyles.black16Medium,
                      ),
                    ),
                    RadioMenuButton(
                      value: "Самостоятельная работа",
                      groupValue: typeGrade,
                      onChanged: (String? value) {
                        setState(() {
                          typeGrade = value!;
                          selectGradeType = GradeType.selfWork;
                        });
                      },
                      child: Text(
                        "Самостоятельная работа",
                        style: AppTextStyles.black16Medium,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.25),
                      offset: const Offset(0, 0),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(5.w),
                        Expanded(
                          child: Text(
                            "${widget.student.lastname}\n${widget.student.firstname}",
                            style: AppTextStyles.black16Medium,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: RatingBar.builder(
                              initialRating: initialRating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 24.r,
                              itemBuilder: (context, index) => Icon(
                                index < initialRating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: AppColors.yellow,
                              ),
                              onRatingUpdate: (rating) {
                                initialRating = rating;
                              },
                              unratedColor: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(8.h),
                    TextFormField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.main.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.main.withOpacity(0.6),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.main.withOpacity(0.6),
                          ),
                        ),
                        hintText: "Напишите тему или комментарий",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        alignLabelWithHint: true,
                        labelText: "Комментарий",
                        filled: false,
                      ),
                      maxLines: 4,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              BlocConsumer<GradeBloc, GradeState>(
                listener: (context, state) {
                  if (state is GradeLoadedState) {
                    AppUtils.showSnackBar(
                      context: context,
                      title: "Успешно",
                      description: "Данные сохранены",
                      backgroundColor: AppColors.green,
                    );
                    Navigator.pop(context);
                  } else if (state is GradeErrorState) {
                    AppUtils.showSnackBar(
                        context: context, description: state.message);
                  }
                },
                builder: (context, state) {
                  if (state is GradeLoadingState) {
                    return const LoadingStateWidget();
                  }
                  return MainButtonWidget(
                    onPressed: () {
                      bloc.add(
                        GradeSaveEvent(
                          gradeEntity: GradeEntity(
                            idSubject: widget.idSubject,
                            gradeType: selectGradeType,
                            idStudent: widget.student.id ?? 0,
                            rating: initialRating,
                            comment: _commentController.text,
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20.r),
                    child: Text(
                      'Сохранить',
                      style: AppTextStyles.black16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
