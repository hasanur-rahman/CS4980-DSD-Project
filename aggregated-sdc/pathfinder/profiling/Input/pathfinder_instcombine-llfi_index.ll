; ModuleID = '/home/hasan/cs4980-project/compiler-optimization/benchmarks/verified/pathfinder/FI/instcombine/pathfinder_instcombine-100000-100/fi-0/pathfinder_instcombine.ll'
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
@str = private unnamed_addr constant [36 x i8] c"Usage: pathfiner width num_of_steps\00"

; Function Attrs: uwtable
define void @_Z4initiPPc(i32 %argc, i8** %argv) #0 {
  %1 = alloca i8**, align 8, !llfi_index !1
  %n = alloca i32, align 4, !llfi_index !2
  %i = alloca i32, align 4, !llfi_index !3
  %j = alloca i32, align 4, !llfi_index !4
  %j1 = alloca i32, align 4, !llfi_index !5
  %i2 = alloca i32, align 4, !llfi_index !6
  %j3 = alloca i32, align 4, !llfi_index !7
  store i8** %argv, i8*** %1, align 8, !llfi_index !8
  %2 = icmp eq i32 %argc, 3, !llfi_index !9
  br i1 %2, label %3, label %11, !llfi_index !10

; <label>:3                                       ; preds = %0
  %4 = load i8*** %1, align 8, !llfi_index !11
  %5 = getelementptr inbounds i8** %4, i64 1, !llfi_index !12
  %6 = load i8** %5, align 8, !llfi_index !13
  %7 = call i32 @atoi(i8* %6) #8, !llfi_index !14
  store i32 %7, i32* @cols, align 4, !llfi_index !15
  %8 = getelementptr inbounds i8** %4, i64 2, !llfi_index !16
  %9 = load i8** %8, align 8, !llfi_index !17
  %10 = call i32 @atoi(i8* %9) #8, !llfi_index !18
  store i32 %10, i32* @rows, align 4, !llfi_index !19
  br label %12, !llfi_index !20

; <label>:11                                      ; preds = %0
  %puts = call i32 @puts(i8* getelementptr inbounds ([36 x i8]* @str, i64 0, i64 0)), !llfi_index !21
  call void @exit(i32 0) #9, !llfi_index !22
  unreachable, !llfi_index !23

; <label>:12                                      ; preds = %3
  %13 = load i32* @rows, align 4, !llfi_index !24
  %14 = load i32* @cols, align 4, !llfi_index !25
  %15 = mul nsw i32 %13, %14, !llfi_index !26
  %16 = sext i32 %15 to i64, !llfi_index !27
  %17 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %16, i64 4), !llfi_index !28
  %18 = extractvalue { i64, i1 } %17, 1, !llfi_index !29
  %19 = extractvalue { i64, i1 } %17, 0, !llfi_index !30
  %20 = select i1 %18, i64 -1, i64 %19, !llfi_index !31
  %21 = call noalias i8* @_Znam(i64 %20) #10, !llfi_index !32
  %22 = bitcast i8* %21 to i32*, !llfi_index !33
  store i32* %22, i32** @data, align 8, !llfi_index !34
  %23 = load i32* @rows, align 4, !llfi_index !35
  %24 = sext i32 %23 to i64, !llfi_index !36
  %25 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %24, i64 8), !llfi_index !37
  %26 = extractvalue { i64, i1 } %25, 1, !llfi_index !38
  %27 = extractvalue { i64, i1 } %25, 0, !llfi_index !39
  %28 = select i1 %26, i64 -1, i64 %27, !llfi_index !40
  %29 = call noalias i8* @_Znam(i64 %28) #10, !llfi_index !41
  %30 = bitcast i8* %29 to i32**, !llfi_index !42
  store i32** %30, i32*** @wall, align 8, !llfi_index !43
  br label %31, !llfi_index !44

; <label>:31                                      ; preds = %44, %12
  %storemerge = phi i32 [ 0, %12 ], [ %46, %44 ], !llfi_index !45
  store i32 %storemerge, i32* %n, align 4, !llfi_index !46
  %32 = load i32* @rows, align 4, !llfi_index !47
  %33 = icmp slt i32 %storemerge, %32, !llfi_index !48
  br i1 %33, label %34, label %47, !llfi_index !49

; <label>:34                                      ; preds = %31
  %35 = load i32** @data, align 8, !llfi_index !50
  %36 = load i32* @cols, align 4, !llfi_index !51
  %37 = load i32* %n, align 4, !llfi_index !52
  %38 = mul nsw i32 %36, %37, !llfi_index !53
  %39 = sext i32 %38 to i64, !llfi_index !54
  %40 = getelementptr inbounds i32* %35, i64 %39, !llfi_index !55
  %41 = sext i32 %37 to i64, !llfi_index !56
  %42 = load i32*** @wall, align 8, !llfi_index !57
  %43 = getelementptr inbounds i32** %42, i64 %41, !llfi_index !58
  store i32* %40, i32** %43, align 8, !llfi_index !59
  br label %44, !llfi_index !60

; <label>:44                                      ; preds = %34
  %45 = load i32* %n, align 4, !llfi_index !61
  %46 = add nsw i32 %45, 1, !llfi_index !62
  br label %31, !llfi_index !63

; <label>:47                                      ; preds = %31
  %48 = load i32* @cols, align 4, !llfi_index !64
  %49 = sext i32 %48 to i64, !llfi_index !65
  %50 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %49, i64 4), !llfi_index !66
  %51 = extractvalue { i64, i1 } %50, 1, !llfi_index !67
  %52 = extractvalue { i64, i1 } %50, 0, !llfi_index !68
  %53 = select i1 %51, i64 -1, i64 %52, !llfi_index !69
  %54 = call noalias i8* @_Znam(i64 %53) #10, !llfi_index !70
  %55 = bitcast i8* %54 to i32*, !llfi_index !71
  store i32* %55, i32** @result, align 8, !llfi_index !72
  br label %56, !llfi_index !73

; <label>:56                                      ; preds = %76, %47
  %storemerge1 = phi i32 [ 0, %47 ], [ %78, %76 ], !llfi_index !74
  store i32 %storemerge1, i32* %i, align 4, !llfi_index !75
  %57 = load i32* @rows, align 4, !llfi_index !76
  %58 = icmp slt i32 %storemerge1, %57, !llfi_index !77
  br i1 %58, label %59, label %79, !llfi_index !78

; <label>:59                                      ; preds = %56
  br label %60, !llfi_index !79

; <label>:60                                      ; preds = %72, %59
  %storemerge5 = phi i32 [ 0, %59 ], [ %74, %72 ], !llfi_index !80
  store i32 %storemerge5, i32* %j, align 4, !llfi_index !81
  %61 = load i32* @cols, align 4, !llfi_index !82
  %62 = icmp slt i32 %storemerge5, %61, !llfi_index !83
  br i1 %62, label %63, label %75, !llfi_index !84

; <label>:63                                      ; preds = %60
  %64 = load i32* %j, align 4, !llfi_index !85
  %65 = sext i32 %64 to i64, !llfi_index !86
  %66 = load i32* %i, align 4, !llfi_index !87
  %67 = sext i32 %66 to i64, !llfi_index !88
  %68 = load i32*** @wall, align 8, !llfi_index !89
  %69 = getelementptr inbounds i32** %68, i64 %67, !llfi_index !90
  %70 = load i32** %69, align 8, !llfi_index !91
  %71 = getelementptr inbounds i32* %70, i64 %65, !llfi_index !92
  store i32 7, i32* %71, align 4, !llfi_index !93
  br label %72, !llfi_index !94

; <label>:72                                      ; preds = %63
  %73 = load i32* %j, align 4, !llfi_index !95
  %74 = add nsw i32 %73, 1, !llfi_index !96
  br label %60, !llfi_index !97

; <label>:75                                      ; preds = %60
  br label %76, !llfi_index !98

; <label>:76                                      ; preds = %75
  %77 = load i32* %i, align 4, !llfi_index !99
  %78 = add nsw i32 %77, 1, !llfi_index !100
  br label %56, !llfi_index !101

; <label>:79                                      ; preds = %56
  br label %80, !llfi_index !102

; <label>:80                                      ; preds = %93, %79
  %storemerge2 = phi i32 [ 0, %79 ], [ %95, %93 ], !llfi_index !103
  store i32 %storemerge2, i32* %j1, align 4, !llfi_index !104
  %81 = load i32* @cols, align 4, !llfi_index !105
  %82 = icmp slt i32 %storemerge2, %81, !llfi_index !106
  br i1 %82, label %83, label %96, !llfi_index !107

; <label>:83                                      ; preds = %80
  %84 = load i32* %j1, align 4, !llfi_index !108
  %85 = sext i32 %84 to i64, !llfi_index !109
  %86 = load i32*** @wall, align 8, !llfi_index !110
  %87 = load i32** %86, align 8, !llfi_index !111
  %88 = getelementptr inbounds i32* %87, i64 %85, !llfi_index !112
  %89 = load i32* %88, align 4, !llfi_index !113
  %90 = sext i32 %84 to i64, !llfi_index !114
  %91 = load i32** @result, align 8, !llfi_index !115
  %92 = getelementptr inbounds i32* %91, i64 %90, !llfi_index !116
  store i32 %89, i32* %92, align 4, !llfi_index !117
  br label %93, !llfi_index !118

; <label>:93                                      ; preds = %83
  %94 = load i32* %j1, align 4, !llfi_index !119
  %95 = add nsw i32 %94, 1, !llfi_index !120
  br label %80, !llfi_index !121

; <label>:96                                      ; preds = %80
  br label %97, !llfi_index !122

; <label>:97                                      ; preds = %119, %96
  %storemerge3 = phi i32 [ 0, %96 ], [ %121, %119 ], !llfi_index !123
  store i32 %storemerge3, i32* %i2, align 4, !llfi_index !124
  %98 = load i32* @rows, align 4, !llfi_index !125
  %99 = icmp slt i32 %storemerge3, %98, !llfi_index !126
  br i1 %99, label %100, label %122, !llfi_index !127

; <label>:100                                     ; preds = %97
  br label %101, !llfi_index !128

; <label>:101                                     ; preds = %115, %100
  %storemerge4 = phi i32 [ 0, %100 ], [ %117, %115 ], !llfi_index !129
  store i32 %storemerge4, i32* %j3, align 4, !llfi_index !130
  %102 = load i32* @cols, align 4, !llfi_index !131
  %103 = icmp slt i32 %storemerge4, %102, !llfi_index !132
  br i1 %103, label %104, label %118, !llfi_index !133

; <label>:104                                     ; preds = %101
  %105 = load i32* %j3, align 4, !llfi_index !134
  %106 = sext i32 %105 to i64, !llfi_index !135
  %107 = load i32* %i2, align 4, !llfi_index !136
  %108 = sext i32 %107 to i64, !llfi_index !137
  %109 = load i32*** @wall, align 8, !llfi_index !138
  %110 = getelementptr inbounds i32** %109, i64 %108, !llfi_index !139
  %111 = load i32** %110, align 8, !llfi_index !140
  %112 = getelementptr inbounds i32* %111, i64 %106, !llfi_index !141
  %113 = load i32* %112, align 4, !llfi_index !142
  %114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %113), !llfi_index !143
  br label %115, !llfi_index !144

; <label>:115                                     ; preds = %104
  %116 = load i32* %j3, align 4, !llfi_index !145
  %117 = add nsw i32 %116, 1, !llfi_index !146
  br label %101, !llfi_index !147

; <label>:118                                     ; preds = %101
  %putchar = call i32 @putchar(i32 10), !llfi_index !148
  br label %119, !llfi_index !149

; <label>:119                                     ; preds = %118
  %120 = load i32* %i2, align 4, !llfi_index !150
  %121 = add nsw i32 %120, 1, !llfi_index !151
  br label %97, !llfi_index !152

; <label>:122                                     ; preds = %97
  ret void, !llfi_index !153
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
  %1 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !154
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0), i8* %s) #11, !llfi_index !155
  ret void, !llfi_index !156
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  call void @_Z3runiPPc(i32 %argc, i8** %argv), !llfi_index !157
  ret i32 0, !llfi_index !158
}

; Function Attrs: uwtable
define void @_Z3runiPPc(i32 %argc, i8** %argv) #0 {
  %src = alloca i32*, align 8, !llfi_index !159
  %dst = alloca i32*, align 8, !llfi_index !160
  %min = alloca i32, align 4, !llfi_index !161
  %t = alloca i32, align 4, !llfi_index !162
  %n = alloca i32, align 4, !llfi_index !163
  %i = alloca i32, align 4, !llfi_index !164
  %i1 = alloca i32, align 4, !llfi_index !165
  call void @_Z4initiPPc(i32 %argc, i8** %argv), !llfi_index !166
  %1 = load i32** @result, align 8, !llfi_index !167
  store i32* %1, i32** %dst, align 8, !llfi_index !168
  %2 = load i32* @cols, align 4, !llfi_index !169
  %3 = sext i32 %2 to i64, !llfi_index !170
  %4 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %3, i64 4), !llfi_index !171
  %5 = extractvalue { i64, i1 } %4, 1, !llfi_index !172
  %6 = extractvalue { i64, i1 } %4, 0, !llfi_index !173
  %7 = select i1 %5, i64 -1, i64 %6, !llfi_index !174
  %8 = call noalias i8* @_Znam(i64 %7) #10, !llfi_index !175
  %9 = bitcast i8* %8 to i32*, !llfi_index !176
  store i32* %9, i32** %src, align 8, !llfi_index !177
  br label %10, !llfi_index !178

; <label>:10                                      ; preds = %93, %0
  %storemerge = phi i32 [ 0, %0 ], [ %95, %93 ], !llfi_index !179
  store i32 %storemerge, i32* %t, align 4, !llfi_index !180
  %11 = load i32* @rows, align 4, !llfi_index !181
  %12 = add nsw i32 %11, -1, !llfi_index !182
  %13 = icmp slt i32 %storemerge, %12, !llfi_index !183
  br i1 %13, label %14, label %96, !llfi_index !184

; <label>:14                                      ; preds = %10
  %15 = load i32** %src, align 8, !llfi_index !185
  %16 = load i32** %dst, align 8, !llfi_index !186
  store i32* %16, i32** %src, align 8, !llfi_index !187
  store i32* %15, i32** %dst, align 8, !llfi_index !188
  br label %17, !llfi_index !189

; <label>:17                                      ; preds = %89, %14
  %storemerge4 = phi i32 [ 0, %14 ], [ %91, %89 ], !llfi_index !190
  store i32 %storemerge4, i32* %n, align 4, !llfi_index !191
  %18 = load i32* @cols, align 4, !llfi_index !192
  %19 = icmp slt i32 %storemerge4, %18, !llfi_index !193
  br i1 %19, label %20, label %92, !llfi_index !194

; <label>:20                                      ; preds = %17
  %21 = load i32* %n, align 4, !llfi_index !195
  %22 = sext i32 %21 to i64, !llfi_index !196
  %23 = load i32** %src, align 8, !llfi_index !197
  %24 = getelementptr inbounds i32* %23, i64 %22, !llfi_index !198
  %25 = load i32* %24, align 4, !llfi_index !199
  store i32 %25, i32* %min, align 4, !llfi_index !200
  %26 = icmp sgt i32 %21, 0, !llfi_index !201
  br i1 %26, label %27, label %47, !llfi_index !202

; <label>:27                                      ; preds = %20
  %28 = load i32* %min, align 4, !llfi_index !203
  %29 = load i32* %n, align 4, !llfi_index !204
  %30 = add nsw i32 %29, -1, !llfi_index !205
  %31 = sext i32 %30 to i64, !llfi_index !206
  %32 = load i32** %src, align 8, !llfi_index !207
  %33 = getelementptr inbounds i32* %32, i64 %31, !llfi_index !208
  %34 = load i32* %33, align 4, !llfi_index !209
  %35 = icmp sgt i32 %28, %34, !llfi_index !210
  br i1 %35, label %38, label %36, !llfi_index !211

; <label>:36                                      ; preds = %27
  %37 = load i32* %min, align 4, !llfi_index !212
  br label %45, !llfi_index !213

; <label>:38                                      ; preds = %27
  %39 = load i32* %n, align 4, !llfi_index !214
  %40 = add nsw i32 %39, -1, !llfi_index !215
  %41 = sext i32 %40 to i64, !llfi_index !216
  %42 = load i32** %src, align 8, !llfi_index !217
  %43 = getelementptr inbounds i32* %42, i64 %41, !llfi_index !218
  %44 = load i32* %43, align 4, !llfi_index !219
  br label %45, !llfi_index !220

; <label>:45                                      ; preds = %38, %36
  %46 = phi i32 [ %37, %36 ], [ %44, %38 ], !llfi_index !221
  store i32 %46, i32* %min, align 4, !llfi_index !222
  br label %47, !llfi_index !223

; <label>:47                                      ; preds = %45, %20
  %48 = load i32* %n, align 4, !llfi_index !224
  %49 = load i32* @cols, align 4, !llfi_index !225
  %50 = add nsw i32 %49, -1, !llfi_index !226
  %51 = icmp slt i32 %48, %50, !llfi_index !227
  br i1 %51, label %52, label %72, !llfi_index !228

; <label>:52                                      ; preds = %47
  %53 = load i32* %min, align 4, !llfi_index !229
  %54 = load i32* %n, align 4, !llfi_index !230
  %55 = add nsw i32 %54, 1, !llfi_index !231
  %56 = sext i32 %55 to i64, !llfi_index !232
  %57 = load i32** %src, align 8, !llfi_index !233
  %58 = getelementptr inbounds i32* %57, i64 %56, !llfi_index !234
  %59 = load i32* %58, align 4, !llfi_index !235
  %60 = icmp sgt i32 %53, %59, !llfi_index !236
  br i1 %60, label %63, label %61, !llfi_index !237

; <label>:61                                      ; preds = %52
  %62 = load i32* %min, align 4, !llfi_index !238
  br label %70, !llfi_index !239

; <label>:63                                      ; preds = %52
  %64 = load i32* %n, align 4, !llfi_index !240
  %65 = add nsw i32 %64, 1, !llfi_index !241
  %66 = sext i32 %65 to i64, !llfi_index !242
  %67 = load i32** %src, align 8, !llfi_index !243
  %68 = getelementptr inbounds i32* %67, i64 %66, !llfi_index !244
  %69 = load i32* %68, align 4, !llfi_index !245
  br label %70, !llfi_index !246

; <label>:70                                      ; preds = %63, %61
  %71 = phi i32 [ %62, %61 ], [ %69, %63 ], !llfi_index !247
  store i32 %71, i32* %min, align 4, !llfi_index !248
  br label %72, !llfi_index !249

; <label>:72                                      ; preds = %70, %47
  %73 = load i32* %n, align 4, !llfi_index !250
  %74 = sext i32 %73 to i64, !llfi_index !251
  %75 = load i32* %t, align 4, !llfi_index !252
  %76 = add nsw i32 %75, 1, !llfi_index !253
  %77 = sext i32 %76 to i64, !llfi_index !254
  %78 = load i32*** @wall, align 8, !llfi_index !255
  %79 = getelementptr inbounds i32** %78, i64 %77, !llfi_index !256
  %80 = load i32** %79, align 8, !llfi_index !257
  %81 = getelementptr inbounds i32* %80, i64 %74, !llfi_index !258
  %82 = load i32* %81, align 4, !llfi_index !259
  %83 = load i32* %min, align 4, !llfi_index !260
  %84 = add nsw i32 %82, %83, !llfi_index !261
  %85 = load i32* %n, align 4, !llfi_index !262
  %86 = sext i32 %85 to i64, !llfi_index !263
  %87 = load i32** %dst, align 8, !llfi_index !264
  %88 = getelementptr inbounds i32* %87, i64 %86, !llfi_index !265
  store i32 %84, i32* %88, align 4, !llfi_index !266
  br label %89, !llfi_index !267

; <label>:89                                      ; preds = %72
  %90 = load i32* %n, align 4, !llfi_index !268
  %91 = add nsw i32 %90, 1, !llfi_index !269
  br label %17, !llfi_index !270

; <label>:92                                      ; preds = %17
  br label %93, !llfi_index !271

; <label>:93                                      ; preds = %92
  %94 = load i32* %t, align 4, !llfi_index !272
  %95 = add nsw i32 %94, 1, !llfi_index !273
  br label %10, !llfi_index !274

; <label>:96                                      ; preds = %10
  br label %97, !llfi_index !275

; <label>:97                                      ; preds = %107, %96
  %storemerge1 = phi i32 [ 0, %96 ], [ %109, %107 ], !llfi_index !276
  store i32 %storemerge1, i32* %i, align 4, !llfi_index !277
  %98 = load i32* @cols, align 4, !llfi_index !278
  %99 = icmp slt i32 %storemerge1, %98, !llfi_index !279
  br i1 %99, label %100, label %110, !llfi_index !280

; <label>:100                                     ; preds = %97
  %101 = load i32* %i, align 4, !llfi_index !281
  %102 = sext i32 %101 to i64, !llfi_index !282
  %103 = load i32** @data, align 8, !llfi_index !283
  %104 = getelementptr inbounds i32* %103, i64 %102, !llfi_index !284
  %105 = load i32* %104, align 4, !llfi_index !285
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %105), !llfi_index !286
  br label %107, !llfi_index !287

; <label>:107                                     ; preds = %100
  %108 = load i32* %i, align 4, !llfi_index !288
  %109 = add nsw i32 %108, 1, !llfi_index !289
  br label %97, !llfi_index !290

; <label>:110                                     ; preds = %97
  %putchar = call i32 @putchar(i32 10), !llfi_index !291
  br label %111, !llfi_index !292

; <label>:111                                     ; preds = %121, %110
  %storemerge2 = phi i32 [ 0, %110 ], [ %123, %121 ], !llfi_index !293
  store i32 %storemerge2, i32* %i1, align 4, !llfi_index !294
  %112 = load i32* @cols, align 4, !llfi_index !295
  %113 = icmp slt i32 %storemerge2, %112, !llfi_index !296
  br i1 %113, label %114, label %124, !llfi_index !297

; <label>:114                                     ; preds = %111
  %115 = load i32* %i1, align 4, !llfi_index !298
  %116 = sext i32 %115 to i64, !llfi_index !299
  %117 = load i32** %dst, align 8, !llfi_index !300
  %118 = getelementptr inbounds i32* %117, i64 %116, !llfi_index !301
  %119 = load i32* %118, align 4, !llfi_index !302
  %120 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %119), !llfi_index !303
  br label %121, !llfi_index !304

; <label>:121                                     ; preds = %114
  %122 = load i32* %i1, align 4, !llfi_index !305
  %123 = add nsw i32 %122, 1, !llfi_index !306
  br label %111, !llfi_index !307

; <label>:124                                     ; preds = %111
  %putchar3 = call i32 @putchar(i32 10), !llfi_index !308
  %125 = load i32** @data, align 8, !llfi_index !309
  %126 = icmp eq i32* %125, null, !llfi_index !310
  br i1 %126, label %129, label %127, !llfi_index !311

; <label>:127                                     ; preds = %124
  %128 = bitcast i32* %125 to i8*, !llfi_index !312
  call void @_ZdaPv(i8* %128) #12, !llfi_index !313
  br label %129, !llfi_index !314

; <label>:129                                     ; preds = %127, %124
  %130 = load i32*** @wall, align 8, !llfi_index !315
  %131 = icmp eq i32** %130, null, !llfi_index !316
  br i1 %131, label %134, label %132, !llfi_index !317

; <label>:132                                     ; preds = %129
  %133 = bitcast i32** %130 to i8*, !llfi_index !318
  call void @_ZdaPv(i8* %133) #12, !llfi_index !319
  br label %134, !llfi_index !320

; <label>:134                                     ; preds = %132, %129
  %135 = load i32** %dst, align 8, !llfi_index !321
  %136 = icmp eq i32* %135, null, !llfi_index !322
  br i1 %136, label %139, label %137, !llfi_index !323

; <label>:137                                     ; preds = %134
  %138 = bitcast i32* %135 to i8*, !llfi_index !324
  call void @_ZdaPv(i8* %138) #12, !llfi_index !325
  br label %139, !llfi_index !326

; <label>:139                                     ; preds = %137, %134
  %140 = load i32** %src, align 8, !llfi_index !327
  %141 = icmp eq i32* %140, null, !llfi_index !328
  br i1 %141, label %144, label %142, !llfi_index !329

; <label>:142                                     ; preds = %139
  %143 = bitcast i32* %140 to i8*, !llfi_index !330
  call void @_ZdaPv(i8* %143) #12, !llfi_index !331
  br label %144, !llfi_index !332

; <label>:144                                     ; preds = %142, %139
  ret void, !llfi_index !333
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #6

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #7

declare i32 @putchar(i32)

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }
attributes #10 = { builtin }
attributes #11 = { cold }
attributes #12 = { builtin nounwind }

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
!263 = metadata !{i64 263}
!264 = metadata !{i64 264}
!265 = metadata !{i64 265}
!266 = metadata !{i64 266}
!267 = metadata !{i64 267}
!268 = metadata !{i64 268}
!269 = metadata !{i64 269}
!270 = metadata !{i64 270}
!271 = metadata !{i64 271}
!272 = metadata !{i64 272}
!273 = metadata !{i64 273}
!274 = metadata !{i64 274}
!275 = metadata !{i64 275}
!276 = metadata !{i64 276}
!277 = metadata !{i64 277}
!278 = metadata !{i64 278}
!279 = metadata !{i64 279}
!280 = metadata !{i64 280}
!281 = metadata !{i64 281}
!282 = metadata !{i64 282}
!283 = metadata !{i64 283}
!284 = metadata !{i64 284}
!285 = metadata !{i64 285}
!286 = metadata !{i64 286}
!287 = metadata !{i64 287}
!288 = metadata !{i64 288}
!289 = metadata !{i64 289}
!290 = metadata !{i64 290}
!291 = metadata !{i64 291}
!292 = metadata !{i64 292}
!293 = metadata !{i64 293}
!294 = metadata !{i64 294}
!295 = metadata !{i64 295}
!296 = metadata !{i64 296}
!297 = metadata !{i64 297}
!298 = metadata !{i64 298}
!299 = metadata !{i64 299}
!300 = metadata !{i64 300}
!301 = metadata !{i64 301}
!302 = metadata !{i64 302}
!303 = metadata !{i64 303}
!304 = metadata !{i64 304}
!305 = metadata !{i64 305}
!306 = metadata !{i64 306}
!307 = metadata !{i64 307}
!308 = metadata !{i64 308}
!309 = metadata !{i64 309}
!310 = metadata !{i64 310}
!311 = metadata !{i64 311}
!312 = metadata !{i64 312}
!313 = metadata !{i64 313}
!314 = metadata !{i64 314}
!315 = metadata !{i64 315}
!316 = metadata !{i64 316}
!317 = metadata !{i64 317}
!318 = metadata !{i64 318}
!319 = metadata !{i64 319}
!320 = metadata !{i64 320}
!321 = metadata !{i64 321}
!322 = metadata !{i64 322}
!323 = metadata !{i64 323}
!324 = metadata !{i64 324}
!325 = metadata !{i64 325}
!326 = metadata !{i64 326}
!327 = metadata !{i64 327}
!328 = metadata !{i64 328}
!329 = metadata !{i64 329}
!330 = metadata !{i64 330}
!331 = metadata !{i64 331}
!332 = metadata !{i64 332}
!333 = metadata !{i64 333}
