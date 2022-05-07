; ModuleID = '/home/hasan/cs4980-project/compiler-optimization/benchmarks/verified/pathfinder/FI/instcombine/pathfinder_mem2reg-100000-100/fi-0/pathfinder_mem2reg.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@rows = global i32 0, align 4
@cols = global i32 0, align 4
@data = global i32* null, align 8
@wall = global i32** null, align 8
@result = global i32* null, align 8
@.str = private unnamed_addr constant [37 x i8] c"Usage: pathfiner width num_of_steps\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [11 x i8] c"error: %s\0A\00", align 1

; Function Attrs: uwtable
define void @_Z4initiPPc(i32 %argc, i8** %argv) #0 {
  %1 = icmp eq i32 %argc, 3, !llfi_index !1
  br i1 %1, label %2, label %9, !llfi_index !2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !llfi_index !3
  %4 = load i8** %3, align 8, !llfi_index !4
  %5 = call i32 @atoi(i8* %4) #7, !llfi_index !5
  store i32 %5, i32* @cols, align 4, !llfi_index !6
  %6 = getelementptr inbounds i8** %argv, i64 2, !llfi_index !7
  %7 = load i8** %6, align 8, !llfi_index !8
  %8 = call i32 @atoi(i8* %7) #7, !llfi_index !9
  store i32 %8, i32* @rows, align 4, !llfi_index !10
  br label %11, !llfi_index !11

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0)), !llfi_index !12
  call void @exit(i32 0) #8, !llfi_index !13
  unreachable, !llfi_index !14

; <label>:11                                      ; preds = %2
  %12 = load i32* @rows, align 4, !llfi_index !15
  %13 = load i32* @cols, align 4, !llfi_index !16
  %14 = mul nsw i32 %12, %13, !llfi_index !17
  %15 = sext i32 %14 to i64, !llfi_index !18
  %16 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %15, i64 4), !llfi_index !19
  %17 = extractvalue { i64, i1 } %16, 1, !llfi_index !20
  %18 = extractvalue { i64, i1 } %16, 0, !llfi_index !21
  %19 = select i1 %17, i64 -1, i64 %18, !llfi_index !22
  %20 = call noalias i8* @_Znam(i64 %19) #9, !llfi_index !23
  %21 = bitcast i8* %20 to i32*, !llfi_index !24
  store i32* %21, i32** @data, align 8, !llfi_index !25
  %22 = load i32* @rows, align 4, !llfi_index !26
  %23 = sext i32 %22 to i64, !llfi_index !27
  %24 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %23, i64 8), !llfi_index !28
  %25 = extractvalue { i64, i1 } %24, 1, !llfi_index !29
  %26 = extractvalue { i64, i1 } %24, 0, !llfi_index !30
  %27 = select i1 %25, i64 -1, i64 %26, !llfi_index !31
  %28 = call noalias i8* @_Znam(i64 %27) #9, !llfi_index !32
  %29 = bitcast i8* %28 to i32**, !llfi_index !33
  store i32** %29, i32*** @wall, align 8, !llfi_index !34
  br label %30, !llfi_index !35

; <label>:30                                      ; preds = %42, %11
  %n.0 = phi i32 [ 0, %11 ], [ %43, %42 ], !llfi_index !36
  %31 = load i32* @rows, align 4, !llfi_index !37
  %32 = icmp slt i32 %n.0, %31, !llfi_index !38
  br i1 %32, label %33, label %44, !llfi_index !39

; <label>:33                                      ; preds = %30
  %34 = load i32** @data, align 8, !llfi_index !40
  %35 = load i32* @cols, align 4, !llfi_index !41
  %36 = mul nsw i32 %35, %n.0, !llfi_index !42
  %37 = sext i32 %36 to i64, !llfi_index !43
  %38 = getelementptr inbounds i32* %34, i64 %37, !llfi_index !44
  %39 = sext i32 %n.0 to i64, !llfi_index !45
  %40 = load i32*** @wall, align 8, !llfi_index !46
  %41 = getelementptr inbounds i32** %40, i64 %39, !llfi_index !47
  store i32* %38, i32** %41, align 8, !llfi_index !48
  br label %42, !llfi_index !49

; <label>:42                                      ; preds = %33
  %43 = add nsw i32 %n.0, 1, !llfi_index !50
  br label %30, !llfi_index !51

; <label>:44                                      ; preds = %30
  %45 = load i32* @cols, align 4, !llfi_index !52
  %46 = sext i32 %45 to i64, !llfi_index !53
  %47 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %46, i64 4), !llfi_index !54
  %48 = extractvalue { i64, i1 } %47, 1, !llfi_index !55
  %49 = extractvalue { i64, i1 } %47, 0, !llfi_index !56
  %50 = select i1 %48, i64 -1, i64 %49, !llfi_index !57
  %51 = call noalias i8* @_Znam(i64 %50) #9, !llfi_index !58
  %52 = bitcast i8* %51 to i32*, !llfi_index !59
  store i32* %52, i32** @result, align 8, !llfi_index !60
  br label %53, !llfi_index !61

; <label>:53                                      ; preds = %70, %44
  %i.0 = phi i32 [ 0, %44 ], [ %71, %70 ], !llfi_index !62
  %54 = load i32* @rows, align 4, !llfi_index !63
  %55 = icmp slt i32 %i.0, %54, !llfi_index !64
  br i1 %55, label %56, label %72, !llfi_index !65

; <label>:56                                      ; preds = %53
  br label %57, !llfi_index !66

; <label>:57                                      ; preds = %67, %56
  %j.0 = phi i32 [ 0, %56 ], [ %68, %67 ], !llfi_index !67
  %58 = load i32* @cols, align 4, !llfi_index !68
  %59 = icmp slt i32 %j.0, %58, !llfi_index !69
  br i1 %59, label %60, label %69, !llfi_index !70

; <label>:60                                      ; preds = %57
  %61 = sext i32 %j.0 to i64, !llfi_index !71
  %62 = sext i32 %i.0 to i64, !llfi_index !72
  %63 = load i32*** @wall, align 8, !llfi_index !73
  %64 = getelementptr inbounds i32** %63, i64 %62, !llfi_index !74
  %65 = load i32** %64, align 8, !llfi_index !75
  %66 = getelementptr inbounds i32* %65, i64 %61, !llfi_index !76
  store i32 7, i32* %66, align 4, !llfi_index !77
  br label %67, !llfi_index !78

; <label>:67                                      ; preds = %60
  %68 = add nsw i32 %j.0, 1, !llfi_index !79
  br label %57, !llfi_index !80

; <label>:69                                      ; preds = %57
  br label %70, !llfi_index !81

; <label>:70                                      ; preds = %69
  %71 = add nsw i32 %i.0, 1, !llfi_index !82
  br label %53, !llfi_index !83

; <label>:72                                      ; preds = %53
  br label %73, !llfi_index !84

; <label>:73                                      ; preds = %86, %72
  %j1.0 = phi i32 [ 0, %72 ], [ %87, %86 ], !llfi_index !85
  %74 = load i32* @cols, align 4, !llfi_index !86
  %75 = icmp slt i32 %j1.0, %74, !llfi_index !87
  br i1 %75, label %76, label %88, !llfi_index !88

; <label>:76                                      ; preds = %73
  %77 = sext i32 %j1.0 to i64, !llfi_index !89
  %78 = load i32*** @wall, align 8, !llfi_index !90
  %79 = getelementptr inbounds i32** %78, i64 0, !llfi_index !91
  %80 = load i32** %79, align 8, !llfi_index !92
  %81 = getelementptr inbounds i32* %80, i64 %77, !llfi_index !93
  %82 = load i32* %81, align 4, !llfi_index !94
  %83 = sext i32 %j1.0 to i64, !llfi_index !95
  %84 = load i32** @result, align 8, !llfi_index !96
  %85 = getelementptr inbounds i32* %84, i64 %83, !llfi_index !97
  store i32 %82, i32* %85, align 4, !llfi_index !98
  br label %86, !llfi_index !99

; <label>:86                                      ; preds = %76
  %87 = add nsw i32 %j1.0, 1, !llfi_index !100
  br label %73, !llfi_index !101

; <label>:88                                      ; preds = %73
  br label %89, !llfi_index !102

; <label>:89                                      ; preds = %109, %88
  %i2.0 = phi i32 [ 0, %88 ], [ %110, %109 ], !llfi_index !103
  %90 = load i32* @rows, align 4, !llfi_index !104
  %91 = icmp slt i32 %i2.0, %90, !llfi_index !105
  br i1 %91, label %92, label %111, !llfi_index !106

; <label>:92                                      ; preds = %89
  br label %93, !llfi_index !107

; <label>:93                                      ; preds = %105, %92
  %j3.0 = phi i32 [ 0, %92 ], [ %106, %105 ], !llfi_index !108
  %94 = load i32* @cols, align 4, !llfi_index !109
  %95 = icmp slt i32 %j3.0, %94, !llfi_index !110
  br i1 %95, label %96, label %107, !llfi_index !111

; <label>:96                                      ; preds = %93
  %97 = sext i32 %j3.0 to i64, !llfi_index !112
  %98 = sext i32 %i2.0 to i64, !llfi_index !113
  %99 = load i32*** @wall, align 8, !llfi_index !114
  %100 = getelementptr inbounds i32** %99, i64 %98, !llfi_index !115
  %101 = load i32** %100, align 8, !llfi_index !116
  %102 = getelementptr inbounds i32* %101, i64 %97, !llfi_index !117
  %103 = load i32* %102, align 4, !llfi_index !118
  %104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %103), !llfi_index !119
  br label %105, !llfi_index !120

; <label>:105                                     ; preds = %96
  %106 = add nsw i32 %j3.0, 1, !llfi_index !121
  br label %93, !llfi_index !122

; <label>:107                                     ; preds = %93
  %108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !123
  br label %109, !llfi_index !124

; <label>:109                                     ; preds = %107
  %110 = add nsw i32 %i2.0, 1, !llfi_index !125
  br label %89, !llfi_index !126

; <label>:111                                     ; preds = %89
  ret void, !llfi_index !127
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #4

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #5

; Function Attrs: uwtable
define void @_Z5fatalPc(i8* %s) #0 {
  %1 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !128
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i8* %s), !llfi_index !129
  ret void, !llfi_index !130
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  call void @_Z3runiPPc(i32 %argc, i8** %argv), !llfi_index !131
  ret i32 0, !llfi_index !132
}

; Function Attrs: uwtable
define void @_Z3runiPPc(i32 %argc, i8** %argv) #0 {
  call void @_Z4initiPPc(i32 %argc, i8** %argv), !llfi_index !133
  %1 = load i32** @result, align 8, !llfi_index !134
  %2 = load i32* @cols, align 4, !llfi_index !135
  %3 = sext i32 %2 to i64, !llfi_index !136
  %4 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %3, i64 4), !llfi_index !137
  %5 = extractvalue { i64, i1 } %4, 1, !llfi_index !138
  %6 = extractvalue { i64, i1 } %4, 0, !llfi_index !139
  %7 = select i1 %5, i64 -1, i64 %6, !llfi_index !140
  %8 = call noalias i8* @_Znam(i64 %7) #9, !llfi_index !141
  %9 = bitcast i8* %8 to i32*, !llfi_index !142
  br label %10, !llfi_index !143

; <label>:10                                      ; preds = %70, %0
  %t.0 = phi i32 [ 0, %0 ], [ %71, %70 ], !llfi_index !144
  %dst.0 = phi i32* [ %1, %0 ], [ %src.0, %70 ], !llfi_index !145
  %src.0 = phi i32* [ %9, %0 ], [ %dst.0, %70 ], !llfi_index !146
  %11 = load i32* @rows, align 4, !llfi_index !147
  %12 = sub nsw i32 %11, 1, !llfi_index !148
  %13 = icmp slt i32 %t.0, %12, !llfi_index !149
  br i1 %13, label %14, label %72, !llfi_index !150

; <label>:14                                      ; preds = %10
  br label %15, !llfi_index !151

; <label>:15                                      ; preds = %67, %14
  %n.0 = phi i32 [ 0, %14 ], [ %68, %67 ], !llfi_index !152
  %16 = load i32* @cols, align 4, !llfi_index !153
  %17 = icmp slt i32 %n.0, %16, !llfi_index !154
  br i1 %17, label %18, label %69, !llfi_index !155

; <label>:18                                      ; preds = %15
  %19 = sext i32 %n.0 to i64, !llfi_index !156
  %20 = getelementptr inbounds i32* %dst.0, i64 %19, !llfi_index !157
  %21 = load i32* %20, align 4, !llfi_index !158
  %22 = icmp sgt i32 %n.0, 0, !llfi_index !159
  br i1 %22, label %23, label %37, !llfi_index !160

; <label>:23                                      ; preds = %18
  %24 = sub nsw i32 %n.0, 1, !llfi_index !161
  %25 = sext i32 %24 to i64, !llfi_index !162
  %26 = getelementptr inbounds i32* %dst.0, i64 %25, !llfi_index !163
  %27 = load i32* %26, align 4, !llfi_index !164
  %28 = icmp sle i32 %21, %27, !llfi_index !165
  br i1 %28, label %29, label %30, !llfi_index !166

; <label>:29                                      ; preds = %23
  br label %35, !llfi_index !167

; <label>:30                                      ; preds = %23
  %31 = sub nsw i32 %n.0, 1, !llfi_index !168
  %32 = sext i32 %31 to i64, !llfi_index !169
  %33 = getelementptr inbounds i32* %dst.0, i64 %32, !llfi_index !170
  %34 = load i32* %33, align 4, !llfi_index !171
  br label %35, !llfi_index !172

; <label>:35                                      ; preds = %30, %29
  %36 = phi i32 [ %21, %29 ], [ %34, %30 ], !llfi_index !173
  br label %37, !llfi_index !174

; <label>:37                                      ; preds = %35, %18
  %min.0 = phi i32 [ %36, %35 ], [ %21, %18 ], !llfi_index !175
  %38 = load i32* @cols, align 4, !llfi_index !176
  %39 = sub nsw i32 %38, 1, !llfi_index !177
  %40 = icmp slt i32 %n.0, %39, !llfi_index !178
  br i1 %40, label %41, label %55, !llfi_index !179

; <label>:41                                      ; preds = %37
  %42 = add nsw i32 %n.0, 1, !llfi_index !180
  %43 = sext i32 %42 to i64, !llfi_index !181
  %44 = getelementptr inbounds i32* %dst.0, i64 %43, !llfi_index !182
  %45 = load i32* %44, align 4, !llfi_index !183
  %46 = icmp sle i32 %min.0, %45, !llfi_index !184
  br i1 %46, label %47, label %48, !llfi_index !185

; <label>:47                                      ; preds = %41
  br label %53, !llfi_index !186

; <label>:48                                      ; preds = %41
  %49 = add nsw i32 %n.0, 1, !llfi_index !187
  %50 = sext i32 %49 to i64, !llfi_index !188
  %51 = getelementptr inbounds i32* %dst.0, i64 %50, !llfi_index !189
  %52 = load i32* %51, align 4, !llfi_index !190
  br label %53, !llfi_index !191

; <label>:53                                      ; preds = %48, %47
  %54 = phi i32 [ %min.0, %47 ], [ %52, %48 ], !llfi_index !192
  br label %55, !llfi_index !193

; <label>:55                                      ; preds = %53, %37
  %min.1 = phi i32 [ %54, %53 ], [ %min.0, %37 ], !llfi_index !194
  %56 = sext i32 %n.0 to i64, !llfi_index !195
  %57 = add nsw i32 %t.0, 1, !llfi_index !196
  %58 = sext i32 %57 to i64, !llfi_index !197
  %59 = load i32*** @wall, align 8, !llfi_index !198
  %60 = getelementptr inbounds i32** %59, i64 %58, !llfi_index !199
  %61 = load i32** %60, align 8, !llfi_index !200
  %62 = getelementptr inbounds i32* %61, i64 %56, !llfi_index !201
  %63 = load i32* %62, align 4, !llfi_index !202
  %64 = add nsw i32 %63, %min.1, !llfi_index !203
  %65 = sext i32 %n.0 to i64, !llfi_index !204
  %66 = getelementptr inbounds i32* %src.0, i64 %65, !llfi_index !205
  store i32 %64, i32* %66, align 4, !llfi_index !206
  br label %67, !llfi_index !207

; <label>:67                                      ; preds = %55
  %68 = add nsw i32 %n.0, 1, !llfi_index !208
  br label %15, !llfi_index !209

; <label>:69                                      ; preds = %15
  br label %70, !llfi_index !210

; <label>:70                                      ; preds = %69
  %71 = add nsw i32 %t.0, 1, !llfi_index !211
  br label %10, !llfi_index !212

; <label>:72                                      ; preds = %10
  br label %73, !llfi_index !213

; <label>:73                                      ; preds = %82, %72
  %i.0 = phi i32 [ 0, %72 ], [ %83, %82 ], !llfi_index !214
  %74 = load i32* @cols, align 4, !llfi_index !215
  %75 = icmp slt i32 %i.0, %74, !llfi_index !216
  br i1 %75, label %76, label %84, !llfi_index !217

; <label>:76                                      ; preds = %73
  %77 = sext i32 %i.0 to i64, !llfi_index !218
  %78 = load i32** @data, align 8, !llfi_index !219
  %79 = getelementptr inbounds i32* %78, i64 %77, !llfi_index !220
  %80 = load i32* %79, align 4, !llfi_index !221
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %80), !llfi_index !222
  br label %82, !llfi_index !223

; <label>:82                                      ; preds = %76
  %83 = add nsw i32 %i.0, 1, !llfi_index !224
  br label %73, !llfi_index !225

; <label>:84                                      ; preds = %73
  %85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !226
  br label %86, !llfi_index !227

; <label>:86                                      ; preds = %94, %84
  %i1.0 = phi i32 [ 0, %84 ], [ %95, %94 ], !llfi_index !228
  %87 = load i32* @cols, align 4, !llfi_index !229
  %88 = icmp slt i32 %i1.0, %87, !llfi_index !230
  br i1 %88, label %89, label %96, !llfi_index !231

; <label>:89                                      ; preds = %86
  %90 = sext i32 %i1.0 to i64, !llfi_index !232
  %91 = getelementptr inbounds i32* %dst.0, i64 %90, !llfi_index !233
  %92 = load i32* %91, align 4, !llfi_index !234
  %93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %92), !llfi_index !235
  br label %94, !llfi_index !236

; <label>:94                                      ; preds = %89
  %95 = add nsw i32 %i1.0, 1, !llfi_index !237
  br label %86, !llfi_index !238

; <label>:96                                      ; preds = %86
  %97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !239
  %98 = load i32** @data, align 8, !llfi_index !240
  %99 = icmp eq i32* %98, null, !llfi_index !241
  br i1 %99, label %102, label %100, !llfi_index !242

; <label>:100                                     ; preds = %96
  %101 = bitcast i32* %98 to i8*, !llfi_index !243
  call void @_ZdaPv(i8* %101) #10, !llfi_index !244
  br label %102, !llfi_index !245

; <label>:102                                     ; preds = %100, %96
  %103 = load i32*** @wall, align 8, !llfi_index !246
  %104 = icmp eq i32** %103, null, !llfi_index !247
  br i1 %104, label %107, label %105, !llfi_index !248

; <label>:105                                     ; preds = %102
  %106 = bitcast i32** %103 to i8*, !llfi_index !249
  call void @_ZdaPv(i8* %106) #10, !llfi_index !250
  br label %107, !llfi_index !251

; <label>:107                                     ; preds = %105, %102
  %108 = icmp eq i32* %dst.0, null, !llfi_index !252
  br i1 %108, label %111, label %109, !llfi_index !253

; <label>:109                                     ; preds = %107
  %110 = bitcast i32* %dst.0 to i8*, !llfi_index !254
  call void @_ZdaPv(i8* %110) #10, !llfi_index !255
  br label %111, !llfi_index !256

; <label>:111                                     ; preds = %109, %107
  %112 = icmp eq i32* %src.0, null, !llfi_index !257
  br i1 %112, label %115, label %113, !llfi_index !258

; <label>:113                                     ; preds = %111
  %114 = bitcast i32* %src.0 to i8*, !llfi_index !259
  call void @_ZdaPv(i8* %114) #10, !llfi_index !260
  br label %115, !llfi_index !261

; <label>:115                                     ; preds = %113, %111
  ret void, !llfi_index !262
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #6

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn nounwind }
attributes #9 = { builtin }
attributes #10 = { builtin nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!1 = metadata !{i64 1}
!2 = metadata !{i64 2}
!3 = metadata !{i64 3}
!4 = metadata !{i64 4}
!5 = metadata !{i64 5}
!6 = metadata !{i64 6}
!7 = metadata !{i64 7}
!8 = metadata !{i64 8}
!9 = metadata !{i64 9}
!10 = metadata !{i64 10}
!11 = metadata !{i64 11}
!12 = metadata !{i64 12}
!13 = metadata !{i64 13}
!14 = metadata !{i64 14}
!15 = metadata !{i64 15}
!16 = metadata !{i64 16}
!17 = metadata !{i64 17}
!18 = metadata !{i64 18}
!19 = metadata !{i64 19}
!20 = metadata !{i64 20}
!21 = metadata !{i64 21}
!22 = metadata !{i64 22}
!23 = metadata !{i64 23}
!24 = metadata !{i64 24}
!25 = metadata !{i64 25}
!26 = metadata !{i64 26}
!27 = metadata !{i64 27}
!28 = metadata !{i64 28}
!29 = metadata !{i64 29}
!30 = metadata !{i64 30}
!31 = metadata !{i64 31}
!32 = metadata !{i64 32}
!33 = metadata !{i64 33}
!34 = metadata !{i64 34}
!35 = metadata !{i64 35}
!36 = metadata !{i64 36}
!37 = metadata !{i64 37}
!38 = metadata !{i64 38}
!39 = metadata !{i64 39}
!40 = metadata !{i64 40}
!41 = metadata !{i64 41}
!42 = metadata !{i64 42}
!43 = metadata !{i64 43}
!44 = metadata !{i64 44}
!45 = metadata !{i64 45}
!46 = metadata !{i64 46}
!47 = metadata !{i64 47}
!48 = metadata !{i64 48}
!49 = metadata !{i64 49}
!50 = metadata !{i64 50}
!51 = metadata !{i64 51}
!52 = metadata !{i64 52}
!53 = metadata !{i64 53}
!54 = metadata !{i64 54}
!55 = metadata !{i64 55}
!56 = metadata !{i64 56}
!57 = metadata !{i64 57}
!58 = metadata !{i64 58}
!59 = metadata !{i64 59}
!60 = metadata !{i64 60}
!61 = metadata !{i64 61}
!62 = metadata !{i64 62}
!63 = metadata !{i64 63}
!64 = metadata !{i64 64}
!65 = metadata !{i64 65}
!66 = metadata !{i64 66}
!67 = metadata !{i64 67}
!68 = metadata !{i64 68}
!69 = metadata !{i64 69}
!70 = metadata !{i64 70}
!71 = metadata !{i64 71}
!72 = metadata !{i64 72}
!73 = metadata !{i64 73}
!74 = metadata !{i64 74}
!75 = metadata !{i64 75}
!76 = metadata !{i64 76}
!77 = metadata !{i64 77}
!78 = metadata !{i64 78}
!79 = metadata !{i64 79}
!80 = metadata !{i64 80}
!81 = metadata !{i64 81}
!82 = metadata !{i64 82}
!83 = metadata !{i64 83}
!84 = metadata !{i64 84}
!85 = metadata !{i64 85}
!86 = metadata !{i64 86}
!87 = metadata !{i64 87}
!88 = metadata !{i64 88}
!89 = metadata !{i64 89}
!90 = metadata !{i64 90}
!91 = metadata !{i64 91}
!92 = metadata !{i64 92}
!93 = metadata !{i64 93}
!94 = metadata !{i64 94}
!95 = metadata !{i64 95}
!96 = metadata !{i64 96}
!97 = metadata !{i64 97}
!98 = metadata !{i64 98}
!99 = metadata !{i64 99}
!100 = metadata !{i64 100}
!101 = metadata !{i64 101}
!102 = metadata !{i64 102}
!103 = metadata !{i64 103}
!104 = metadata !{i64 104}
!105 = metadata !{i64 105}
!106 = metadata !{i64 106}
!107 = metadata !{i64 107}
!108 = metadata !{i64 108}
!109 = metadata !{i64 109}
!110 = metadata !{i64 110}
!111 = metadata !{i64 111}
!112 = metadata !{i64 112}
!113 = metadata !{i64 113}
!114 = metadata !{i64 114}
!115 = metadata !{i64 115}
!116 = metadata !{i64 116}
!117 = metadata !{i64 117}
!118 = metadata !{i64 118}
!119 = metadata !{i64 119}
!120 = metadata !{i64 120}
!121 = metadata !{i64 121}
!122 = metadata !{i64 122}
!123 = metadata !{i64 123}
!124 = metadata !{i64 124}
!125 = metadata !{i64 125}
!126 = metadata !{i64 126}
!127 = metadata !{i64 127}
!128 = metadata !{i64 128}
!129 = metadata !{i64 129}
!130 = metadata !{i64 130}
!131 = metadata !{i64 131}
!132 = metadata !{i64 132}
!133 = metadata !{i64 133}
!134 = metadata !{i64 134}
!135 = metadata !{i64 135}
!136 = metadata !{i64 136}
!137 = metadata !{i64 137}
!138 = metadata !{i64 138}
!139 = metadata !{i64 139}
!140 = metadata !{i64 140}
!141 = metadata !{i64 141}
!142 = metadata !{i64 142}
!143 = metadata !{i64 143}
!144 = metadata !{i64 144}
!145 = metadata !{i64 145}
!146 = metadata !{i64 146}
!147 = metadata !{i64 147}
!148 = metadata !{i64 148}
!149 = metadata !{i64 149}
!150 = metadata !{i64 150}
!151 = metadata !{i64 151}
!152 = metadata !{i64 152}
!153 = metadata !{i64 153}
!154 = metadata !{i64 154}
!155 = metadata !{i64 155}
!156 = metadata !{i64 156}
!157 = metadata !{i64 157}
!158 = metadata !{i64 158}
!159 = metadata !{i64 159}
!160 = metadata !{i64 160}
!161 = metadata !{i64 161}
!162 = metadata !{i64 162}
!163 = metadata !{i64 163}
!164 = metadata !{i64 164}
!165 = metadata !{i64 165}
!166 = metadata !{i64 166}
!167 = metadata !{i64 167}
!168 = metadata !{i64 168}
!169 = metadata !{i64 169}
!170 = metadata !{i64 170}
!171 = metadata !{i64 171}
!172 = metadata !{i64 172}
!173 = metadata !{i64 173}
!174 = metadata !{i64 174}
!175 = metadata !{i64 175}
!176 = metadata !{i64 176}
!177 = metadata !{i64 177}
!178 = metadata !{i64 178}
!179 = metadata !{i64 179}
!180 = metadata !{i64 180}
!181 = metadata !{i64 181}
!182 = metadata !{i64 182}
!183 = metadata !{i64 183}
!184 = metadata !{i64 184}
!185 = metadata !{i64 185}
!186 = metadata !{i64 186}
!187 = metadata !{i64 187}
!188 = metadata !{i64 188}
!189 = metadata !{i64 189}
!190 = metadata !{i64 190}
!191 = metadata !{i64 191}
!192 = metadata !{i64 192}
!193 = metadata !{i64 193}
!194 = metadata !{i64 194}
!195 = metadata !{i64 195}
!196 = metadata !{i64 196}
!197 = metadata !{i64 197}
!198 = metadata !{i64 198}
!199 = metadata !{i64 199}
!200 = metadata !{i64 200}
!201 = metadata !{i64 201}
!202 = metadata !{i64 202}
!203 = metadata !{i64 203}
!204 = metadata !{i64 204}
!205 = metadata !{i64 205}
!206 = metadata !{i64 206}
!207 = metadata !{i64 207}
!208 = metadata !{i64 208}
!209 = metadata !{i64 209}
!210 = metadata !{i64 210}
!211 = metadata !{i64 211}
!212 = metadata !{i64 212}
!213 = metadata !{i64 213}
!214 = metadata !{i64 214}
!215 = metadata !{i64 215}
!216 = metadata !{i64 216}
!217 = metadata !{i64 217}
!218 = metadata !{i64 218}
!219 = metadata !{i64 219}
!220 = metadata !{i64 220}
!221 = metadata !{i64 221}
!222 = metadata !{i64 222}
!223 = metadata !{i64 223}
!224 = metadata !{i64 224}
!225 = metadata !{i64 225}
!226 = metadata !{i64 226}
!227 = metadata !{i64 227}
!228 = metadata !{i64 228}
!229 = metadata !{i64 229}
!230 = metadata !{i64 230}
!231 = metadata !{i64 231}
!232 = metadata !{i64 232}
!233 = metadata !{i64 233}
!234 = metadata !{i64 234}
!235 = metadata !{i64 235}
!236 = metadata !{i64 236}
!237 = metadata !{i64 237}
!238 = metadata !{i64 238}
!239 = metadata !{i64 239}
!240 = metadata !{i64 240}
!241 = metadata !{i64 241}
!242 = metadata !{i64 242}
!243 = metadata !{i64 243}
!244 = metadata !{i64 244}
!245 = metadata !{i64 245}
!246 = metadata !{i64 246}
!247 = metadata !{i64 247}
!248 = metadata !{i64 248}
!249 = metadata !{i64 249}
!250 = metadata !{i64 250}
!251 = metadata !{i64 251}
!252 = metadata !{i64 252}
!253 = metadata !{i64 253}
!254 = metadata !{i64 254}
!255 = metadata !{i64 255}
!256 = metadata !{i64 256}
!257 = metadata !{i64 257}
!258 = metadata !{i64 258}
!259 = metadata !{i64 259}
!260 = metadata !{i64 260}
!261 = metadata !{i64 261}
!262 = metadata !{i64 262}
