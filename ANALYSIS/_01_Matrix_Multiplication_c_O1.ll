; ModuleID = '_01_Matrix_Multiplication.c'
source_filename = "_01_Matrix_Multiplication.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%.2lf \00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.3 = private unnamed_addr constant [39 x i8] c"Error reading input at index [%d][%d]\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"ans_file\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"Error in the file opening 1\00", align 1
@.str.9 = private unnamed_addr constant [28 x i8] c"Error in the file opening 2\00", align 1
@.str.13 = private unnamed_addr constant [41 x i8] c"\0A%lf sec time for simple Multiplication\0A\00", align 1
@.str.14 = private unnamed_addr constant [32 x i8] c"\0A%lf sec time using the openmp\0A\00", align 1
@str = private unnamed_addr constant [21 x i8] c"File 1 read complete\00", align 1
@str.15 = private unnamed_addr constant [24 x i8] c"File 2 reading complete\00", align 1
@str.16 = private unnamed_addr constant [15 x i8] c"File 1 complte\00", align 1
@str.17 = private unnamed_addr constant [16 x i8] c"File 2 complete\00", align 1

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @Matrix_Multiplication_OpenMp(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %19
  %5 = phi i64 [ 0, %3 ], [ %20, %19 ]
  %6 = trunc i64 %5 to i32
  %7 = tail call i32 @llvm.umin.i32(i32 %6, i32 84)
  %8 = add nuw nsw i32 %7, 16
  %9 = icmp samesign ugt i32 %8, %6
  %10 = zext nneg i32 %8 to i64
  br label %12

11:                                               ; preds = %19
  ret void

12:                                               ; preds = %4, %30
  %13 = phi i64 [ 0, %4 ], [ %31, %30 ]
  %14 = trunc i64 %13 to i32
  %15 = tail call i32 @llvm.umin.i32(i32 %14, i32 84)
  %16 = add nuw nsw i32 %15, 16
  %17 = icmp samesign ugt i32 %16, %14
  %18 = zext nneg i32 %16 to i64
  br label %22

19:                                               ; preds = %30
  %20 = add nuw nsw i64 %5, 16
  %21 = icmp samesign ult i32 %6, 84
  br i1 %21, label %4, label %11, !llvm.loop !6

22:                                               ; preds = %12, %38
  %23 = phi i64 [ 0, %12 ], [ %39, %38 ]
  %24 = trunc i64 %23 to i32
  br i1 %9, label %25, label %38

25:                                               ; preds = %22
  %26 = tail call i32 @llvm.umin.i32(i32 %24, i32 84)
  %27 = add nuw nsw i32 %26, 16
  %28 = icmp samesign ugt i32 %27, %24
  %29 = zext nneg i32 %27 to i64
  br label %33

30:                                               ; preds = %38
  %31 = add nuw nsw i64 %13, 16
  %32 = icmp samesign ult i32 %14, 84
  br i1 %32, label %12, label %19, !llvm.loop !9

33:                                               ; preds = %25, %48
  %34 = phi i64 [ %5, %25 ], [ %49, %48 ]
  br i1 %17, label %35, label %48

35:                                               ; preds = %33
  %36 = getelementptr inbounds nuw ptr, ptr %0, i64 %34
  %37 = getelementptr inbounds nuw ptr, ptr %2, i64 %34
  br label %41

38:                                               ; preds = %48, %22
  %39 = add nuw nsw i64 %23, 16
  %40 = icmp samesign ult i32 %24, 84
  br i1 %40, label %22, label %30, !llvm.loop !10

41:                                               ; preds = %35, %51
  %42 = phi i64 [ %13, %35 ], [ %52, %51 ]
  br i1 %28, label %43, label %51

43:                                               ; preds = %41
  %44 = load ptr, ptr %36, align 8, !tbaa !11
  %45 = load ptr, ptr %37, align 8, !tbaa !11
  %46 = getelementptr inbounds nuw double, ptr %45, i64 %42
  %47 = load double, ptr %46, align 8, !tbaa !16
  br label %54

48:                                               ; preds = %51, %33
  %49 = add nuw nsw i64 %34, 1
  %50 = icmp samesign ult i64 %49, %10
  br i1 %50, label %33, label %38, !llvm.loop !18

51:                                               ; preds = %54, %41
  %52 = add nuw nsw i64 %42, 1
  %53 = icmp samesign ult i64 %52, %18
  br i1 %53, label %41, label %48, !llvm.loop !19

54:                                               ; preds = %43, %54
  %55 = phi i64 [ %23, %43 ], [ %64, %54 ]
  %56 = phi double [ %47, %43 ], [ %63, %54 ]
  %57 = getelementptr inbounds nuw double, ptr %44, i64 %55
  %58 = load double, ptr %57, align 8, !tbaa !16
  %59 = getelementptr inbounds nuw ptr, ptr %1, i64 %55
  %60 = load ptr, ptr %59, align 8, !tbaa !11
  %61 = getelementptr inbounds nuw double, ptr %60, i64 %42
  %62 = load double, ptr %61, align 8, !tbaa !16
  %63 = tail call double @llvm.fmuladd.f64(double %58, double %62, double %56)
  store double %63, ptr %46, align 8, !tbaa !16
  %64 = add nuw nsw i64 %55, 1
  %65 = icmp samesign ult i64 %64, %29
  br i1 %65, label %54, label %51, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local void @Matrix_Multiplication_Tiling(ptr noundef readnone captures(none) %0, ptr noundef readnone captures(none) %1, ptr noundef readnone captures(none) %2) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @Matrix_Multiplication(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %15
  %5 = phi i64 [ 0, %3 ], [ %16, %15 ]
  %6 = getelementptr inbounds nuw ptr, ptr %0, i64 %5
  %7 = load ptr, ptr %6, align 8, !tbaa !11
  %8 = getelementptr inbounds nuw ptr, ptr %2, i64 %5
  %9 = load ptr, ptr %8, align 8, !tbaa !11
  br label %11

10:                                               ; preds = %15
  ret void

11:                                               ; preds = %4, %18
  %12 = phi i64 [ 0, %4 ], [ %19, %18 ]
  %13 = getelementptr inbounds nuw double, ptr %9, i64 %12
  %14 = load double, ptr %13, align 8, !tbaa !16
  br label %21

15:                                               ; preds = %18
  %16 = add nuw nsw i64 %5, 1
  %17 = icmp eq i64 %16, 100
  br i1 %17, label %10, label %4, !llvm.loop !21

18:                                               ; preds = %21
  %19 = add nuw nsw i64 %12, 1
  %20 = icmp eq i64 %19, 100
  br i1 %20, label %15, label %11, !llvm.loop !22

21:                                               ; preds = %11, %21
  %22 = phi i64 [ 0, %11 ], [ %31, %21 ]
  %23 = phi double [ %14, %11 ], [ %30, %21 ]
  %24 = getelementptr inbounds nuw double, ptr %7, i64 %22
  %25 = load double, ptr %24, align 8, !tbaa !16
  %26 = getelementptr inbounds nuw ptr, ptr %1, i64 %22
  %27 = load ptr, ptr %26, align 8, !tbaa !11
  %28 = getelementptr inbounds nuw double, ptr %27, i64 %12
  %29 = load double, ptr %28, align 8, !tbaa !16
  %30 = tail call double @llvm.fmuladd.f64(double %25, double %29, double %23)
  store double %30, ptr %13, align 8, !tbaa !16
  %31 = add nuw nsw i64 %22, 1
  %32 = icmp eq i64 %31, 100
  br i1 %32, label %18, label %21, !llvm.loop !23
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @display(ptr noundef readonly captures(none) %0) local_unnamed_addr #3 {
  br label %2

2:                                                ; preds = %1, %7
  %3 = phi i64 [ 0, %1 ], [ %9, %7 ]
  %4 = getelementptr inbounds nuw ptr, ptr %0, i64 %3
  br label %11

5:                                                ; preds = %7
  %6 = tail call i32 @putchar(i32 10)
  ret void

7:                                                ; preds = %11
  %8 = tail call i32 @putchar(i32 10)
  %9 = add nuw nsw i64 %3, 1
  %10 = icmp eq i64 %9, 100
  br i1 %10, label %5, label %2, !llvm.loop !24

11:                                               ; preds = %2, %11
  %12 = phi i64 [ 0, %2 ], [ %17, %11 ]
  %13 = load ptr, ptr %4, align 8, !tbaa !11
  %14 = getelementptr inbounds nuw double, ptr %13, i64 %12
  %15 = load double, ptr %14, align 8, !tbaa !16
  %16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %15)
  %17 = add nuw nsw i64 %12, 1
  %18 = icmp eq i64 %17, 100
  br i1 %18, label %7, label %11, !llvm.loop !25
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define dso_local void @read_file(ptr noundef readonly captures(none) %0, ptr noundef %1) local_unnamed_addr #5 {
  br label %3

3:                                                ; preds = %2, %19
  %4 = phi i64 [ 0, %2 ], [ %20, %19 ]
  %5 = getelementptr inbounds nuw ptr, ptr %0, i64 %4
  br label %6

6:                                                ; preds = %3, %16
  %7 = phi i64 [ 0, %3 ], [ %17, %16 ]
  %8 = load ptr, ptr %5, align 8, !tbaa !11
  %9 = getelementptr inbounds nuw double, ptr %8, i64 %7
  %10 = tail call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %1, ptr noundef nonnull @.str.2, ptr noundef %9) #12
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %16, label %12

12:                                               ; preds = %6
  %13 = trunc nuw nsw i64 %4 to i32
  %14 = trunc nuw nsw i64 %7 to i32
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %13, i32 noundef %14)
  br label %22

16:                                               ; preds = %6
  %17 = add nuw nsw i64 %7, 1
  %18 = icmp eq i64 %17, 100
  br i1 %18, label %19, label %6, !llvm.loop !26

19:                                               ; preds = %16
  %20 = add nuw nsw i64 %4, 1
  %21 = icmp eq i64 %20, 100
  br i1 %21, label %22, label %3, !llvm.loop !27

22:                                               ; preds = %19, %12
  ret void
}

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #6

; Function Attrs: nofree nounwind uwtable
define dso_local void @print_output_file(ptr noundef readonly captures(none) %0) local_unnamed_addr #3 {
  %2 = tail call noalias ptr @fopen(ptr noundef nonnull @.str.4, ptr noundef nonnull @.str.5)
  br label %3

3:                                                ; preds = %1, %8
  %4 = phi i64 [ 0, %1 ], [ %10, %8 ]
  %5 = getelementptr inbounds nuw ptr, ptr %0, i64 %4
  br label %12

6:                                                ; preds = %8
  %7 = tail call i32 @fclose(ptr noundef %2)
  ret void

8:                                                ; preds = %12
  %9 = tail call i32 @fputc(i32 10, ptr %2)
  %10 = add nuw nsw i64 %4, 1
  %11 = icmp eq i64 %10, 100
  br i1 %11, label %6, label %3, !llvm.loop !28

12:                                               ; preds = %3, %12
  %13 = phi i64 [ 0, %3 ], [ %18, %12 ]
  %14 = load ptr, ptr %5, align 8, !tbaa !11
  %15 = getelementptr inbounds nuw double, ptr %14, i64 %13
  %16 = load double, ptr %15, align 8, !tbaa !16
  %17 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef nonnull @.str, double noundef %16) #12
  %18 = add nuw nsw i64 %13, 1
  %19 = icmp eq i64 %18, 100
  br i1 %19, label %8, label %12, !llvm.loop !29
}

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr noundef readonly captures(none), ptr noundef readonly captures(none)) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr noundef captures(none), ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #5 {
  %3 = tail call noalias dereferenceable_or_null(800) ptr @malloc(i64 noundef 800) #13
  %4 = tail call noalias dereferenceable_or_null(800) ptr @malloc(i64 noundef 800) #13
  %5 = tail call noalias dereferenceable_or_null(800) ptr @malloc(i64 noundef 800) #13
  br label %11

6:                                                ; preds = %11
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %8 = load ptr, ptr %7, align 8, !tbaa !30
  %9 = tail call noalias ptr @fopen(ptr noundef %8, ptr noundef nonnull @.str.6)
  %10 = icmp eq ptr %9, null
  br i1 %10, label %21, label %23

11:                                               ; preds = %2, %11
  %12 = phi i64 [ 0, %2 ], [ %19, %11 ]
  %13 = tail call noalias dereferenceable_or_null(800) ptr @malloc(i64 noundef 800) #13
  %14 = getelementptr inbounds nuw ptr, ptr %3, i64 %12
  store ptr %13, ptr %14, align 8, !tbaa !11
  %15 = tail call noalias dereferenceable_or_null(800) ptr @malloc(i64 noundef 800) #13
  %16 = getelementptr inbounds nuw ptr, ptr %4, i64 %12
  store ptr %15, ptr %16, align 8, !tbaa !11
  %17 = tail call noalias dereferenceable_or_null(800) ptr @calloc(i64 noundef 100, i64 noundef 8) #14
  %18 = getelementptr inbounds nuw ptr, ptr %5, i64 %12
  store ptr %17, ptr %18, align 8, !tbaa !11
  %19 = add nuw nsw i64 %12, 1
  %20 = icmp eq i64 %19, 100
  br i1 %20, label %6, label %11, !llvm.loop !32

21:                                               ; preds = %6
  %22 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7)
  br label %251

23:                                               ; preds = %6
  %24 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %25 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %26 = load ptr, ptr %25, align 8, !tbaa !30
  %27 = tail call noalias ptr @fopen(ptr noundef %26, ptr noundef nonnull @.str.6)
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %31

29:                                               ; preds = %23
  %30 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9)
  br label %251

31:                                               ; preds = %23
  %32 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.15)
  br label %33

33:                                               ; preds = %49, %31
  %34 = phi i64 [ 0, %31 ], [ %50, %49 ]
  %35 = getelementptr inbounds nuw ptr, ptr %3, i64 %34
  %36 = load ptr, ptr %35, align 8, !tbaa !11
  br label %37

37:                                               ; preds = %46, %33
  %38 = phi i64 [ 0, %33 ], [ %47, %46 ]
  %39 = getelementptr inbounds nuw double, ptr %36, i64 %38
  %40 = tail call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %9, ptr noundef nonnull @.str.2, ptr noundef %39) #12
  %41 = icmp eq i32 %40, 1
  br i1 %41, label %46, label %42

42:                                               ; preds = %37
  %43 = trunc nuw nsw i64 %34 to i32
  %44 = trunc nuw nsw i64 %38 to i32
  %45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %43, i32 noundef %44)
  br label %52

46:                                               ; preds = %37
  %47 = add nuw nsw i64 %38, 1
  %48 = icmp eq i64 %47, 100
  br i1 %48, label %49, label %37, !llvm.loop !26

49:                                               ; preds = %46
  %50 = add nuw nsw i64 %34, 1
  %51 = icmp eq i64 %50, 100
  br i1 %51, label %52, label %33, !llvm.loop !27

52:                                               ; preds = %49, %42
  br label %53

53:                                               ; preds = %52, %69
  %54 = phi i64 [ %70, %69 ], [ 0, %52 ]
  %55 = getelementptr inbounds nuw ptr, ptr %4, i64 %54
  %56 = load ptr, ptr %55, align 8, !tbaa !11
  br label %57

57:                                               ; preds = %66, %53
  %58 = phi i64 [ 0, %53 ], [ %67, %66 ]
  %59 = getelementptr inbounds nuw double, ptr %56, i64 %58
  %60 = tail call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %27, ptr noundef nonnull @.str.2, ptr noundef %59) #12
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %66, label %62

62:                                               ; preds = %57
  %63 = trunc nuw nsw i64 %54 to i32
  %64 = trunc nuw nsw i64 %58 to i32
  %65 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %63, i32 noundef %64)
  br label %72

66:                                               ; preds = %57
  %67 = add nuw nsw i64 %58, 1
  %68 = icmp eq i64 %67, 100
  br i1 %68, label %69, label %57, !llvm.loop !26

69:                                               ; preds = %66
  %70 = add nuw nsw i64 %54, 1
  %71 = icmp eq i64 %70, 100
  br i1 %71, label %72, label %53, !llvm.loop !27

72:                                               ; preds = %69, %62
  br label %73

73:                                               ; preds = %72, %77
  %74 = phi i64 [ %79, %77 ], [ 0, %72 ]
  %75 = getelementptr inbounds nuw ptr, ptr %3, i64 %74
  %76 = load ptr, ptr %75, align 8, !tbaa !11
  br label %81

77:                                               ; preds = %81
  %78 = tail call i32 @putchar(i32 10)
  %79 = add nuw nsw i64 %74, 1
  %80 = icmp eq i64 %79, 100
  br i1 %80, label %88, label %73, !llvm.loop !24

81:                                               ; preds = %81, %73
  %82 = phi i64 [ 0, %73 ], [ %86, %81 ]
  %83 = getelementptr inbounds nuw double, ptr %76, i64 %82
  %84 = load double, ptr %83, align 8, !tbaa !16
  %85 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %84)
  %86 = add nuw nsw i64 %82, 1
  %87 = icmp eq i64 %86, 100
  br i1 %87, label %77, label %81, !llvm.loop !25

88:                                               ; preds = %77
  %89 = tail call i32 @putchar(i32 10)
  %90 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.16)
  br label %91

91:                                               ; preds = %95, %88
  %92 = phi i64 [ 0, %88 ], [ %97, %95 ]
  %93 = getelementptr inbounds nuw ptr, ptr %4, i64 %92
  %94 = load ptr, ptr %93, align 8, !tbaa !11
  br label %99

95:                                               ; preds = %99
  %96 = tail call i32 @putchar(i32 10)
  %97 = add nuw nsw i64 %92, 1
  %98 = icmp eq i64 %97, 100
  br i1 %98, label %106, label %91, !llvm.loop !24

99:                                               ; preds = %99, %91
  %100 = phi i64 [ 0, %91 ], [ %104, %99 ]
  %101 = getelementptr inbounds nuw double, ptr %94, i64 %100
  %102 = load double, ptr %101, align 8, !tbaa !16
  %103 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %102)
  %104 = add nuw nsw i64 %100, 1
  %105 = icmp eq i64 %104, 100
  br i1 %105, label %95, label %99, !llvm.loop !25

106:                                              ; preds = %95
  %107 = tail call i32 @putchar(i32 10)
  %108 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.17)
  %109 = tail call i64 @clock() #12
  br label %110

110:                                              ; preds = %120, %106
  %111 = phi i64 [ 0, %106 ], [ %121, %120 ]
  %112 = getelementptr inbounds nuw ptr, ptr %3, i64 %111
  %113 = load ptr, ptr %112, align 8, !tbaa !11
  %114 = getelementptr inbounds nuw ptr, ptr %5, i64 %111
  %115 = load ptr, ptr %114, align 8, !tbaa !11
  br label %116

116:                                              ; preds = %123, %110
  %117 = phi i64 [ 0, %110 ], [ %124, %123 ]
  %118 = getelementptr inbounds nuw double, ptr %115, i64 %117
  %119 = load double, ptr %118, align 8, !tbaa !16
  br label %126

120:                                              ; preds = %123
  %121 = add nuw nsw i64 %111, 1
  %122 = icmp eq i64 %121, 100
  br i1 %122, label %138, label %110, !llvm.loop !21

123:                                              ; preds = %126
  %124 = add nuw nsw i64 %117, 1
  %125 = icmp eq i64 %124, 100
  br i1 %125, label %120, label %116, !llvm.loop !22

126:                                              ; preds = %126, %116
  %127 = phi i64 [ 0, %116 ], [ %136, %126 ]
  %128 = phi double [ %119, %116 ], [ %135, %126 ]
  %129 = getelementptr inbounds nuw double, ptr %113, i64 %127
  %130 = load double, ptr %129, align 8, !tbaa !16
  %131 = getelementptr inbounds nuw ptr, ptr %4, i64 %127
  %132 = load ptr, ptr %131, align 8, !tbaa !11
  %133 = getelementptr inbounds nuw double, ptr %132, i64 %117
  %134 = load double, ptr %133, align 8, !tbaa !16
  %135 = tail call double @llvm.fmuladd.f64(double %130, double %134, double %128)
  store double %135, ptr %118, align 8, !tbaa !16
  %136 = add nuw nsw i64 %127, 1
  %137 = icmp eq i64 %136, 100
  br i1 %137, label %123, label %126, !llvm.loop !23

138:                                              ; preds = %120
  %139 = tail call noalias ptr @fopen(ptr noundef nonnull @.str.4, ptr noundef nonnull @.str.5)
  br label %140

140:                                              ; preds = %144, %138
  %141 = phi i64 [ 0, %138 ], [ %146, %144 ]
  %142 = getelementptr inbounds nuw ptr, ptr %5, i64 %141
  %143 = load ptr, ptr %142, align 8, !tbaa !11
  br label %148

144:                                              ; preds = %148
  %145 = tail call i32 @fputc(i32 10, ptr %139)
  %146 = add nuw nsw i64 %141, 1
  %147 = icmp eq i64 %146, 100
  br i1 %147, label %155, label %140, !llvm.loop !28

148:                                              ; preds = %148, %140
  %149 = phi i64 [ 0, %140 ], [ %153, %148 ]
  %150 = getelementptr inbounds nuw double, ptr %143, i64 %149
  %151 = load double, ptr %150, align 8, !tbaa !16
  %152 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %139, ptr noundef nonnull @.str, double noundef %151) #12
  %153 = add nuw nsw i64 %149, 1
  %154 = icmp eq i64 %153, 100
  br i1 %154, label %144, label %148, !llvm.loop !29

155:                                              ; preds = %144
  %156 = tail call i32 @fclose(ptr noundef %139)
  %157 = tail call i64 @clock() #12
  br label %158

158:                                              ; preds = %162, %155
  %159 = phi i64 [ 0, %155 ], [ %164, %162 ]
  %160 = getelementptr inbounds nuw ptr, ptr %5, i64 %159
  %161 = load ptr, ptr %160, align 8, !tbaa !11
  br label %166

162:                                              ; preds = %166
  %163 = tail call i32 @putchar(i32 10)
  %164 = add nuw nsw i64 %159, 1
  %165 = icmp eq i64 %164, 100
  br i1 %165, label %173, label %158, !llvm.loop !24

166:                                              ; preds = %166, %158
  %167 = phi i64 [ 0, %158 ], [ %171, %166 ]
  %168 = getelementptr inbounds nuw double, ptr %161, i64 %167
  %169 = load double, ptr %168, align 8, !tbaa !16
  %170 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %169)
  %171 = add nuw nsw i64 %167, 1
  %172 = icmp eq i64 %171, 100
  br i1 %172, label %162, label %166, !llvm.loop !25

173:                                              ; preds = %162
  %174 = sitofp i64 %109 to double
  %175 = sitofp i64 %157 to double
  %176 = tail call i32 @putchar(i32 10)
  %177 = fsub double %175, %174
  %178 = fdiv double %177, 1.000000e+06
  %179 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, double noundef %178)
  %180 = tail call i64 @clock() #12
  br label %181

181:                                              ; preds = %195, %173
  %182 = phi i64 [ 0, %173 ], [ %196, %195 ]
  %183 = trunc i64 %182 to i32
  %184 = tail call i32 @llvm.umin.i32(i32 %183, i32 84)
  %185 = add nuw nsw i32 %184, 16
  %186 = icmp samesign ugt i32 %185, %183
  %187 = zext nneg i32 %185 to i64
  br label %188

188:                                              ; preds = %206, %181
  %189 = phi i64 [ 0, %181 ], [ %207, %206 ]
  %190 = trunc i64 %189 to i32
  %191 = tail call i32 @llvm.umin.i32(i32 %190, i32 84)
  %192 = add nuw nsw i32 %191, 16
  %193 = icmp samesign ugt i32 %192, %190
  %194 = zext nneg i32 %192 to i64
  br label %198

195:                                              ; preds = %206
  %196 = add nuw nsw i64 %182, 16
  %197 = icmp samesign ult i32 %183, 84
  br i1 %197, label %181, label %242, !llvm.loop !6

198:                                              ; preds = %214, %188
  %199 = phi i64 [ 0, %188 ], [ %215, %214 ]
  %200 = trunc i64 %199 to i32
  br i1 %186, label %201, label %214

201:                                              ; preds = %198
  %202 = tail call i32 @llvm.umin.i32(i32 %200, i32 84)
  %203 = add nuw nsw i32 %202, 16
  %204 = icmp samesign ugt i32 %203, %200
  %205 = zext nneg i32 %203 to i64
  br label %209

206:                                              ; preds = %214
  %207 = add nuw nsw i64 %189, 16
  %208 = icmp samesign ult i32 %190, 84
  br i1 %208, label %188, label %195, !llvm.loop !9

209:                                              ; preds = %224, %201
  %210 = phi i64 [ %182, %201 ], [ %225, %224 ]
  br i1 %193, label %211, label %224

211:                                              ; preds = %209
  %212 = getelementptr inbounds nuw ptr, ptr %3, i64 %210
  %213 = getelementptr inbounds nuw ptr, ptr %5, i64 %210
  br label %217

214:                                              ; preds = %224, %198
  %215 = add nuw nsw i64 %199, 16
  %216 = icmp samesign ult i32 %200, 84
  br i1 %216, label %198, label %206, !llvm.loop !10

217:                                              ; preds = %227, %211
  %218 = phi i64 [ %189, %211 ], [ %228, %227 ]
  br i1 %204, label %219, label %227

219:                                              ; preds = %217
  %220 = load ptr, ptr %212, align 8, !tbaa !11
  %221 = load ptr, ptr %213, align 8, !tbaa !11
  %222 = getelementptr inbounds nuw double, ptr %221, i64 %218
  %223 = load double, ptr %222, align 8, !tbaa !16
  br label %230

224:                                              ; preds = %227, %209
  %225 = add nuw nsw i64 %210, 1
  %226 = icmp samesign ult i64 %225, %187
  br i1 %226, label %209, label %214, !llvm.loop !18

227:                                              ; preds = %230, %217
  %228 = add nuw nsw i64 %218, 1
  %229 = icmp samesign ult i64 %228, %194
  br i1 %229, label %217, label %224, !llvm.loop !19

230:                                              ; preds = %230, %219
  %231 = phi i64 [ %199, %219 ], [ %240, %230 ]
  %232 = phi double [ %223, %219 ], [ %239, %230 ]
  %233 = getelementptr inbounds nuw double, ptr %220, i64 %231
  %234 = load double, ptr %233, align 8, !tbaa !16
  %235 = getelementptr inbounds nuw ptr, ptr %4, i64 %231
  %236 = load ptr, ptr %235, align 8, !tbaa !11
  %237 = getelementptr inbounds nuw double, ptr %236, i64 %218
  %238 = load double, ptr %237, align 8, !tbaa !16
  %239 = tail call double @llvm.fmuladd.f64(double %234, double %238, double %232)
  store double %239, ptr %222, align 8, !tbaa !16
  %240 = add nuw nsw i64 %231, 1
  %241 = icmp samesign ult i64 %240, %205
  br i1 %241, label %230, label %227, !llvm.loop !20

242:                                              ; preds = %195
  %243 = sitofp i64 %180 to double
  %244 = tail call i64 @clock() #12
  %245 = sitofp i64 %244 to double
  %246 = fsub double %245, %243
  %247 = fdiv double %246, 1.000000e+06
  %248 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, double noundef %247)
  %249 = tail call i32 @fclose(ptr noundef nonnull %9)
  %250 = tail call i32 @fclose(ptr noundef nonnull %27)
  br label %251

251:                                              ; preds = %242, %29, %21
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nounwind
declare i64 @clock() local_unnamed_addr #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #10

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, ptr noundef captures(none)) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #11

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nofree nounwind }
attributes #12 = { nounwind }
attributes #13 = { nounwind allocsize(0) }
attributes #14 = { nounwind allocsize(0,1) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"openmp", i32 51}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{!"clang version 21.0.0git (https://github.com/llvm/llvm-project.git b8c4eea3d8b2a2df9442319de14ef38c2492428d)"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = !{!12, !12, i64 0}
!12 = !{!"p1 double", !13, i64 0}
!13 = !{!"any pointer", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !14, i64 0}
!18 = distinct !{!18, !7, !8}
!19 = distinct !{!19, !7, !8}
!20 = distinct !{!20, !7, !8}
!21 = distinct !{!21, !7, !8}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
!24 = distinct !{!24, !7, !8}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}
!27 = distinct !{!27, !7, !8}
!28 = distinct !{!28, !7, !8}
!29 = distinct !{!29, !7, !8}
!30 = !{!31, !31, i64 0}
!31 = !{!"p1 omnipotent char", !13, i64 0}
!32 = distinct !{!32, !7, !8}
