; ModuleID = '/home/hasan/cs4980-project/compiler-optimization/benchmarks/verified/bfs/FI/bfs_mem2reg-1000000/fi-0/bfs_mem2reg.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Node = type { i32, i32 }

@fp = global %struct._IO_FILE* null, align 8
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [24 x i8] c"Usage: %s <input_file>\0A\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"Error Reading graph file\0A\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str4 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"%d) cost:%d\0A\00", align 1

; Function Attrs: uwtable
define void @_Z5UsageiPPc(i32 %argc, i8** %argv) #0 {
  %1 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !1
  %2 = getelementptr inbounds i8** %argv, i64 0, !llfi_index !2
  %3 = load i8** %2, align 8, !llfi_index !3
  %4 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([24 x i8]* @.str, i32 0, i32 0), i8* %3), !llfi_index !4
  ret void, !llfi_index !5
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  call void @_Z8BFSGraphiPPc(i32 %argc, i8** %argv), !llfi_index !6
  ret i32 0, !llfi_index !7
}

; Function Attrs: uwtable
define void @_Z8BFSGraphiPPc(i32 %argc, i8** %argv) #0 {
  %no_of_nodes = alloca i32, align 4, !llfi_index !8
  %edge_list_size = alloca i32, align 4, !llfi_index !9
  %source = alloca i32, align 4, !llfi_index !10
  %start = alloca i32, align 4, !llfi_index !11
  %edgeno = alloca i32, align 4, !llfi_index !12
  %id = alloca i32, align 4, !llfi_index !13
  %cost = alloca i32, align 4, !llfi_index !14
  store i32 0, i32* %no_of_nodes, align 4, !llfi_index !15
  store i32 0, i32* %edge_list_size, align 4, !llfi_index !16
  %1 = icmp ne i32 %argc, 2, !llfi_index !17
  br i1 %1, label %2, label %3, !llfi_index !18

; <label>:2                                       ; preds = %0
  call void @_Z5UsageiPPc(i32 %argc, i8** %argv), !llfi_index !19
  call void @exit(i32 0) #4, !llfi_index !20
  unreachable, !llfi_index !21

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds i8** %argv, i64 1, !llfi_index !22
  %5 = load i8** %4, align 8, !llfi_index !23
  %6 = call %struct._IO_FILE* @fopen(i8* %5, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !llfi_index !24
  store %struct._IO_FILE* %6, %struct._IO_FILE** @fp, align 8, !llfi_index !25
  %7 = load %struct._IO_FILE** @fp, align 8, !llfi_index !26
  %8 = icmp ne %struct._IO_FILE* %7, null, !llfi_index !27
  br i1 %8, label %11, label %9, !llfi_index !28

; <label>:9                                       ; preds = %3
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i32 0, i32 0)), !llfi_index !29
  br label %201, !llfi_index !30

; <label>:11                                      ; preds = %3
  store i32 0, i32* %source, align 4, !llfi_index !31
  %12 = load %struct._IO_FILE** @fp, align 8, !llfi_index !32
  %13 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32* %no_of_nodes), !llfi_index !33
  %14 = load i32* %no_of_nodes, align 4, !llfi_index !34
  %15 = sext i32 %14 to i64, !llfi_index !35
  %16 = mul i64 8, %15, !llfi_index !36
  %17 = call noalias i8* @malloc(i64 %16) #5, !llfi_index !37
  %18 = bitcast i8* %17 to %struct.Node*, !llfi_index !38
  %19 = load i32* %no_of_nodes, align 4, !llfi_index !39
  %20 = sext i32 %19 to i64, !llfi_index !40
  %21 = mul i64 1, %20, !llfi_index !41
  %22 = call noalias i8* @malloc(i64 %21) #5, !llfi_index !42
  %23 = load i32* %no_of_nodes, align 4, !llfi_index !43
  %24 = sext i32 %23 to i64, !llfi_index !44
  %25 = mul i64 1, %24, !llfi_index !45
  %26 = call noalias i8* @malloc(i64 %25) #5, !llfi_index !46
  %27 = load i32* %no_of_nodes, align 4, !llfi_index !47
  %28 = sext i32 %27 to i64, !llfi_index !48
  %29 = mul i64 1, %28, !llfi_index !49
  %30 = call noalias i8* @malloc(i64 %29) #5, !llfi_index !50
  br label %31, !llfi_index !51

; <label>:31                                      ; preds = %51, %11
  %i.0 = phi i32 [ 0, %11 ], [ %52, %51 ], !llfi_index !52
  %32 = load i32* %no_of_nodes, align 4, !llfi_index !53
  %33 = icmp ult i32 %i.0, %32, !llfi_index !54
  br i1 %33, label %34, label %53, !llfi_index !55

; <label>:34                                      ; preds = %31
  %35 = load %struct._IO_FILE** @fp, align 8, !llfi_index !56
  %36 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0), i32* %start, i32* %edgeno), !llfi_index !57
  %37 = load i32* %start, align 4, !llfi_index !58
  %38 = zext i32 %i.0 to i64, !llfi_index !59
  %39 = getelementptr inbounds %struct.Node* %18, i64 %38, !llfi_index !60
  %40 = getelementptr inbounds %struct.Node* %39, i32 0, i32 0, !llfi_index !61
  store i32 %37, i32* %40, align 4, !llfi_index !62
  %41 = load i32* %edgeno, align 4, !llfi_index !63
  %42 = zext i32 %i.0 to i64, !llfi_index !64
  %43 = getelementptr inbounds %struct.Node* %18, i64 %42, !llfi_index !65
  %44 = getelementptr inbounds %struct.Node* %43, i32 0, i32 1, !llfi_index !66
  store i32 %41, i32* %44, align 4, !llfi_index !67
  %45 = zext i32 %i.0 to i64, !llfi_index !68
  %46 = getelementptr inbounds i8* %22, i64 %45, !llfi_index !69
  store i8 0, i8* %46, align 1, !llfi_index !70
  %47 = zext i32 %i.0 to i64, !llfi_index !71
  %48 = getelementptr inbounds i8* %26, i64 %47, !llfi_index !72
  store i8 0, i8* %48, align 1, !llfi_index !73
  %49 = zext i32 %i.0 to i64, !llfi_index !74
  %50 = getelementptr inbounds i8* %30, i64 %49, !llfi_index !75
  store i8 0, i8* %50, align 1, !llfi_index !76
  br label %51, !llfi_index !77

; <label>:51                                      ; preds = %34
  %52 = add i32 %i.0, 1, !llfi_index !78
  br label %31, !llfi_index !79

; <label>:53                                      ; preds = %31
  %54 = load %struct._IO_FILE** @fp, align 8, !llfi_index !80
  %55 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32* %source), !llfi_index !81
  %56 = load i32* %source, align 4, !llfi_index !82
  %57 = sext i32 %56 to i64, !llfi_index !83
  %58 = getelementptr inbounds i8* %22, i64 %57, !llfi_index !84
  store i8 1, i8* %58, align 1, !llfi_index !85
  %59 = load i32* %source, align 4, !llfi_index !86
  %60 = sext i32 %59 to i64, !llfi_index !87
  %61 = getelementptr inbounds i8* %30, i64 %60, !llfi_index !88
  store i8 1, i8* %61, align 1, !llfi_index !89
  %62 = load %struct._IO_FILE** @fp, align 8, !llfi_index !90
  %63 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32* %edge_list_size), !llfi_index !91
  %64 = load i32* %edge_list_size, align 4, !llfi_index !92
  %65 = sext i32 %64 to i64, !llfi_index !93
  %66 = mul i64 4, %65, !llfi_index !94
  %67 = call noalias i8* @malloc(i64 %66) #5, !llfi_index !95
  %68 = bitcast i8* %67 to i32*, !llfi_index !96
  br label %69, !llfi_index !97

; <label>:69                                      ; preds = %80, %53
  %i1.0 = phi i32 [ 0, %53 ], [ %81, %80 ], !llfi_index !98
  %70 = load i32* %edge_list_size, align 4, !llfi_index !99
  %71 = icmp slt i32 %i1.0, %70, !llfi_index !100
  br i1 %71, label %72, label %82, !llfi_index !101

; <label>:72                                      ; preds = %69
  %73 = load %struct._IO_FILE** @fp, align 8, !llfi_index !102
  %74 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %73, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32* %id), !llfi_index !103
  %75 = load %struct._IO_FILE** @fp, align 8, !llfi_index !104
  %76 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %75, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i32* %cost), !llfi_index !105
  %77 = load i32* %id, align 4, !llfi_index !106
  %78 = sext i32 %i1.0 to i64, !llfi_index !107
  %79 = getelementptr inbounds i32* %68, i64 %78, !llfi_index !108
  store i32 %77, i32* %79, align 4, !llfi_index !109
  br label %80, !llfi_index !110

; <label>:80                                      ; preds = %72
  %81 = add nsw i32 %i1.0, 1, !llfi_index !111
  br label %69, !llfi_index !112

; <label>:82                                      ; preds = %69
  %83 = load %struct._IO_FILE** @fp, align 8, !llfi_index !113
  %84 = icmp ne %struct._IO_FILE* %83, null, !llfi_index !114
  br i1 %84, label %85, label %88, !llfi_index !115

; <label>:85                                      ; preds = %82
  %86 = load %struct._IO_FILE** @fp, align 8, !llfi_index !116
  %87 = call i32 @fclose(%struct._IO_FILE* %86), !llfi_index !117
  br label %88, !llfi_index !118

; <label>:88                                      ; preds = %85, %82
  %89 = load i32* %no_of_nodes, align 4, !llfi_index !119
  %90 = sext i32 %89 to i64, !llfi_index !120
  %91 = mul i64 4, %90, !llfi_index !121
  %92 = call noalias i8* @malloc(i64 %91) #5, !llfi_index !122
  %93 = bitcast i8* %92 to i32*, !llfi_index !123
  br label %94, !llfi_index !124

; <label>:94                                      ; preds = %100, %88
  %i2.0 = phi i32 [ 0, %88 ], [ %101, %100 ], !llfi_index !125
  %95 = load i32* %no_of_nodes, align 4, !llfi_index !126
  %96 = icmp slt i32 %i2.0, %95, !llfi_index !127
  br i1 %96, label %97, label %102, !llfi_index !128

; <label>:97                                      ; preds = %94
  %98 = sext i32 %i2.0 to i64, !llfi_index !129
  %99 = getelementptr inbounds i32* %93, i64 %98, !llfi_index !130
  store i32 -1, i32* %99, align 4, !llfi_index !131
  br label %100, !llfi_index !132

; <label>:100                                     ; preds = %97
  %101 = add nsw i32 %i2.0, 1, !llfi_index !133
  br label %94, !llfi_index !134

; <label>:102                                     ; preds = %94
  %103 = load i32* %source, align 4, !llfi_index !135
  %104 = sext i32 %103 to i64, !llfi_index !136
  %105 = getelementptr inbounds i32* %93, i64 %104, !llfi_index !137
  store i32 0, i32* %105, align 4, !llfi_index !138
  br label %106, !llfi_index !139

; <label>:106                                     ; preds = %182, %102
  %k.0 = phi i32 [ 0, %102 ], [ %181, %182 ], !llfi_index !140
  br label %107, !llfi_index !141

; <label>:107                                     ; preds = %157, %106
  %tid.0 = phi i32 [ 0, %106 ], [ %158, %157 ], !llfi_index !142
  %108 = load i32* %no_of_nodes, align 4, !llfi_index !143
  %109 = icmp slt i32 %tid.0, %108, !llfi_index !144
  br i1 %109, label %110, label %159, !llfi_index !145

; <label>:110                                     ; preds = %107
  %111 = sext i32 %tid.0 to i64, !llfi_index !146
  %112 = getelementptr inbounds i8* %22, i64 %111, !llfi_index !147
  %113 = load i8* %112, align 1, !llfi_index !148
  %114 = trunc i8 %113 to i1, !llfi_index !149
  %115 = zext i1 %114 to i32, !llfi_index !150
  %116 = icmp eq i32 %115, 1, !llfi_index !151
  br i1 %116, label %117, label %156, !llfi_index !152

; <label>:117                                     ; preds = %110
  %118 = sext i32 %tid.0 to i64, !llfi_index !153
  %119 = getelementptr inbounds i8* %22, i64 %118, !llfi_index !154
  store i8 0, i8* %119, align 1, !llfi_index !155
  %120 = sext i32 %tid.0 to i64, !llfi_index !156
  %121 = getelementptr inbounds %struct.Node* %18, i64 %120, !llfi_index !157
  %122 = getelementptr inbounds %struct.Node* %121, i32 0, i32 0, !llfi_index !158
  %123 = load i32* %122, align 4, !llfi_index !159
  br label %124, !llfi_index !160

; <label>:124                                     ; preds = %153, %117
  %i3.0 = phi i32 [ %123, %117 ], [ %154, %153 ], !llfi_index !161
  %125 = sext i32 %tid.0 to i64, !llfi_index !162
  %126 = getelementptr inbounds %struct.Node* %18, i64 %125, !llfi_index !163
  %127 = getelementptr inbounds %struct.Node* %126, i32 0, i32 1, !llfi_index !164
  %128 = load i32* %127, align 4, !llfi_index !165
  %129 = sext i32 %tid.0 to i64, !llfi_index !166
  %130 = getelementptr inbounds %struct.Node* %18, i64 %129, !llfi_index !167
  %131 = getelementptr inbounds %struct.Node* %130, i32 0, i32 0, !llfi_index !168
  %132 = load i32* %131, align 4, !llfi_index !169
  %133 = add nsw i32 %128, %132, !llfi_index !170
  %134 = icmp slt i32 %i3.0, %133, !llfi_index !171
  br i1 %134, label %135, label %155, !llfi_index !172

; <label>:135                                     ; preds = %124
  %136 = sext i32 %i3.0 to i64, !llfi_index !173
  %137 = getelementptr inbounds i32* %68, i64 %136, !llfi_index !174
  %138 = load i32* %137, align 4, !llfi_index !175
  %139 = sext i32 %138 to i64, !llfi_index !176
  %140 = getelementptr inbounds i8* %30, i64 %139, !llfi_index !177
  %141 = load i8* %140, align 1, !llfi_index !178
  %142 = trunc i8 %141 to i1, !llfi_index !179
  br i1 %142, label %152, label %143, !llfi_index !180

; <label>:143                                     ; preds = %135
  %144 = sext i32 %tid.0 to i64, !llfi_index !181
  %145 = getelementptr inbounds i32* %93, i64 %144, !llfi_index !182
  %146 = load i32* %145, align 4, !llfi_index !183
  %147 = add nsw i32 %146, 1, !llfi_index !184
  %148 = sext i32 %138 to i64, !llfi_index !185
  %149 = getelementptr inbounds i32* %93, i64 %148, !llfi_index !186
  store i32 %147, i32* %149, align 4, !llfi_index !187
  %150 = sext i32 %138 to i64, !llfi_index !188
  %151 = getelementptr inbounds i8* %26, i64 %150, !llfi_index !189
  store i8 1, i8* %151, align 1, !llfi_index !190
  br label %152, !llfi_index !191

; <label>:152                                     ; preds = %143, %135
  br label %153, !llfi_index !192

; <label>:153                                     ; preds = %152
  %154 = add nsw i32 %i3.0, 1, !llfi_index !193
  br label %124, !llfi_index !194

; <label>:155                                     ; preds = %124
  br label %156, !llfi_index !195

; <label>:156                                     ; preds = %155, %110
  br label %157, !llfi_index !196

; <label>:157                                     ; preds = %156
  %158 = add nsw i32 %tid.0, 1, !llfi_index !197
  br label %107, !llfi_index !198

; <label>:159                                     ; preds = %107
  br label %160, !llfi_index !199

; <label>:160                                     ; preds = %178, %159
  %stop.0 = phi i8 [ 0, %159 ], [ %stop.1, %178 ], !llfi_index !200
  %tid5.0 = phi i32 [ 0, %159 ], [ %179, %178 ], !llfi_index !201
  %161 = load i32* %no_of_nodes, align 4, !llfi_index !202
  %162 = icmp slt i32 %tid5.0, %161, !llfi_index !203
  br i1 %162, label %163, label %180, !llfi_index !204

; <label>:163                                     ; preds = %160
  %164 = sext i32 %tid5.0 to i64, !llfi_index !205
  %165 = getelementptr inbounds i8* %26, i64 %164, !llfi_index !206
  %166 = load i8* %165, align 1, !llfi_index !207
  %167 = trunc i8 %166 to i1, !llfi_index !208
  %168 = zext i1 %167 to i32, !llfi_index !209
  %169 = icmp eq i32 %168, 1, !llfi_index !210
  br i1 %169, label %170, label %177, !llfi_index !211

; <label>:170                                     ; preds = %163
  %171 = sext i32 %tid5.0 to i64, !llfi_index !212
  %172 = getelementptr inbounds i8* %22, i64 %171, !llfi_index !213
  store i8 1, i8* %172, align 1, !llfi_index !214
  %173 = sext i32 %tid5.0 to i64, !llfi_index !215
  %174 = getelementptr inbounds i8* %30, i64 %173, !llfi_index !216
  store i8 1, i8* %174, align 1, !llfi_index !217
  %175 = sext i32 %tid5.0 to i64, !llfi_index !218
  %176 = getelementptr inbounds i8* %26, i64 %175, !llfi_index !219
  store i8 0, i8* %176, align 1, !llfi_index !220
  br label %177, !llfi_index !221

; <label>:177                                     ; preds = %170, %163
  %stop.1 = phi i8 [ 1, %170 ], [ %stop.0, %163 ], !llfi_index !222
  br label %178, !llfi_index !223

; <label>:178                                     ; preds = %177
  %179 = add nsw i32 %tid5.0, 1, !llfi_index !224
  br label %160, !llfi_index !225

; <label>:180                                     ; preds = %160
  %181 = add nsw i32 %k.0, 1, !llfi_index !226
  br label %182, !llfi_index !227

; <label>:182                                     ; preds = %180
  %183 = trunc i8 %stop.0 to i1, !llfi_index !228
  br i1 %183, label %106, label %184, !llfi_index !229

; <label>:184                                     ; preds = %182
  %185 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0)), !llfi_index !230
  br label %186, !llfi_index !231

; <label>:186                                     ; preds = %194, %184
  %i6.0 = phi i32 [ 0, %184 ], [ %195, %194 ], !llfi_index !232
  %187 = load i32* %no_of_nodes, align 4, !llfi_index !233
  %188 = icmp slt i32 %i6.0, %187, !llfi_index !234
  br i1 %188, label %189, label %196, !llfi_index !235

; <label>:189                                     ; preds = %186
  %190 = sext i32 %i6.0 to i64, !llfi_index !236
  %191 = getelementptr inbounds i32* %93, i64 %190, !llfi_index !237
  %192 = load i32* %191, align 4, !llfi_index !238
  %193 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %185, i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0), i32 %i6.0, i32 %192), !llfi_index !239
  br label %194, !llfi_index !240

; <label>:194                                     ; preds = %189
  %195 = add nsw i32 %i6.0, 1, !llfi_index !241
  br label %186, !llfi_index !242

; <label>:196                                     ; preds = %186
  %197 = call i32 @fclose(%struct._IO_FILE* %185), !llfi_index !243
  %198 = bitcast %struct.Node* %18 to i8*, !llfi_index !244
  call void @free(i8* %198) #5, !llfi_index !245
  %199 = bitcast i32* %68 to i8*, !llfi_index !246
  call void @free(i8* %199) #5, !llfi_index !247
  call void @free(i8* %22) #5, !llfi_index !248
  call void @free(i8* %26) #5, !llfi_index !249
  call void @free(i8* %30) #5, !llfi_index !250
  %200 = bitcast i32* %93 to i8*, !llfi_index !251
  call void @free(i8* %200) #5, !llfi_index !252
  br label %201, !llfi_index !253

; <label>:201                                     ; preds = %196, %9
  ret void, !llfi_index !254
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @fscanf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

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
