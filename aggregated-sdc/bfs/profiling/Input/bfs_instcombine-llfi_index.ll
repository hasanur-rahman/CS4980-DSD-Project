; ModuleID = '/home/hasan/cs4980-project/compiler-optimization/benchmarks/verified/bfs/FI/bfs_instcombine-1000000/fi-0/bfs_instcombine.ll'
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
@str = private unnamed_addr constant [25 x i8] c"Error Reading graph file\00"

; Function Attrs: uwtable
define void @_Z5UsageiPPc(i32 %argc, i8** %argv) #0 {
  %1 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !1
  %2 = load i8** %argv, align 8, !llfi_index !2
  %3 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([24 x i8]* @.str, i64 0, i64 0), i8* %2) #5, !llfi_index !3
  ret void, !llfi_index !4
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  call void @_Z8BFSGraphiPPc(i32 %argc, i8** %argv), !llfi_index !5
  ret i32 0, !llfi_index !6
}

; Function Attrs: uwtable
define void @_Z8BFSGraphiPPc(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4, !llfi_index !7
  %2 = alloca i8**, align 8, !llfi_index !8
  %no_of_nodes = alloca i32, align 4, !llfi_index !9
  %edge_list_size = alloca i32, align 4, !llfi_index !10
  %source = alloca i32, align 4, !llfi_index !11
  %h_graph_nodes = alloca %struct.Node*, align 8, !llfi_index !12
  %h_graph_mask = alloca i8*, align 8, !llfi_index !13
  %h_updating_graph_mask = alloca i8*, align 8, !llfi_index !14
  %h_graph_visited = alloca i8*, align 8, !llfi_index !15
  %start = alloca i32, align 4, !llfi_index !16
  %edgeno = alloca i32, align 4, !llfi_index !17
  %i = alloca i32, align 4, !llfi_index !18
  %id = alloca i32, align 4, !llfi_index !19
  %cost = alloca i32, align 4, !llfi_index !20
  %h_graph_edges = alloca i32*, align 8, !llfi_index !21
  %i1 = alloca i32, align 4, !llfi_index !22
  %h_cost = alloca i32*, align 8, !llfi_index !23
  %i2 = alloca i32, align 4, !llfi_index !24
  %k = alloca i32, align 4, !llfi_index !25
  %stop = alloca i8, align 1, !llfi_index !26
  %tid = alloca i32, align 4, !llfi_index !27
  %i3 = alloca i32, align 4, !llfi_index !28
  %id4 = alloca i32, align 4, !llfi_index !29
  %tid5 = alloca i32, align 4, !llfi_index !30
  %fpo = alloca %struct._IO_FILE*, align 8, !llfi_index !31
  %i6 = alloca i32, align 4, !llfi_index !32
  store i32 %argc, i32* %1, align 4, !llfi_index !33
  store i8** %argv, i8*** %2, align 8, !llfi_index !34
  store i32 0, i32* %no_of_nodes, align 4, !llfi_index !35
  store i32 0, i32* %edge_list_size, align 4, !llfi_index !36
  %3 = icmp eq i32 %argc, 2, !llfi_index !37
  br i1 %3, label %7, label %4, !llfi_index !38

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4, !llfi_index !39
  %6 = load i8*** %2, align 8, !llfi_index !40
  call void @_Z5UsageiPPc(i32 %5, i8** %6), !llfi_index !41
  call void @exit(i32 0) #6, !llfi_index !42
  unreachable, !llfi_index !43

; <label>:7                                       ; preds = %0
  %8 = load i8*** %2, align 8, !llfi_index !44
  %9 = getelementptr inbounds i8** %8, i64 1, !llfi_index !45
  %10 = load i8** %9, align 8, !llfi_index !46
  %11 = call %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([2 x i8]* @.str1, i64 0, i64 0)), !llfi_index !47
  store %struct._IO_FILE* %11, %struct._IO_FILE** @fp, align 8, !llfi_index !48
  %12 = icmp eq %struct._IO_FILE* %11, null, !llfi_index !49
  br i1 %12, label %13, label %14, !llfi_index !50

; <label>:13                                      ; preds = %7
  %puts = call i32 @puts(i8* getelementptr inbounds ([25 x i8]* @str, i64 0, i64 0)), !llfi_index !51
  br label %256, !llfi_index !52

; <label>:14                                      ; preds = %7
  store i32 0, i32* %source, align 4, !llfi_index !53
  %15 = load %struct._IO_FILE** @fp, align 8, !llfi_index !54
  %16 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32* %no_of_nodes), !llfi_index !55
  %17 = load i32* %no_of_nodes, align 4, !llfi_index !56
  %18 = sext i32 %17 to i64, !llfi_index !57
  %19 = shl nsw i64 %18, 3, !llfi_index !58
  %20 = call noalias i8* @malloc(i64 %19) #4, !llfi_index !59
  %21 = bitcast i8* %20 to %struct.Node*, !llfi_index !60
  store %struct.Node* %21, %struct.Node** %h_graph_nodes, align 8, !llfi_index !61
  %22 = load i32* %no_of_nodes, align 4, !llfi_index !62
  %23 = sext i32 %22 to i64, !llfi_index !63
  %24 = call noalias i8* @malloc(i64 %23) #4, !llfi_index !64
  store i8* %24, i8** %h_graph_mask, align 8, !llfi_index !65
  %25 = load i32* %no_of_nodes, align 4, !llfi_index !66
  %26 = sext i32 %25 to i64, !llfi_index !67
  %27 = call noalias i8* @malloc(i64 %26) #4, !llfi_index !68
  store i8* %27, i8** %h_updating_graph_mask, align 8, !llfi_index !69
  %28 = load i32* %no_of_nodes, align 4, !llfi_index !70
  %29 = sext i32 %28 to i64, !llfi_index !71
  %30 = call noalias i8* @malloc(i64 %29) #4, !llfi_index !72
  store i8* %30, i8** %h_graph_visited, align 8, !llfi_index !73
  br label %31, !llfi_index !74

; <label>:31                                      ; preds = %59, %14
  %storemerge = phi i32 [ 0, %14 ], [ %61, %59 ], !llfi_index !75
  store i32 %storemerge, i32* %i, align 4, !llfi_index !76
  %32 = load i32* %no_of_nodes, align 4, !llfi_index !77
  %33 = icmp ult i32 %storemerge, %32, !llfi_index !78
  br i1 %33, label %34, label %62, !llfi_index !79

; <label>:34                                      ; preds = %31
  %35 = load %struct._IO_FILE** @fp, align 8, !llfi_index !80
  %36 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([6 x i8]* @.str4, i64 0, i64 0), i32* %start, i32* %edgeno), !llfi_index !81
  %37 = load i32* %start, align 4, !llfi_index !82
  %38 = load i32* %i, align 4, !llfi_index !83
  %39 = zext i32 %38 to i64, !llfi_index !84
  %40 = load %struct.Node** %h_graph_nodes, align 8, !llfi_index !85
  %41 = getelementptr inbounds %struct.Node* %40, i64 %39, i32 0, !llfi_index !86
  store i32 %37, i32* %41, align 4, !llfi_index !87
  %42 = load i32* %edgeno, align 4, !llfi_index !88
  %43 = load i32* %i, align 4, !llfi_index !89
  %44 = zext i32 %43 to i64, !llfi_index !90
  %45 = load %struct.Node** %h_graph_nodes, align 8, !llfi_index !91
  %46 = getelementptr inbounds %struct.Node* %45, i64 %44, i32 1, !llfi_index !92
  store i32 %42, i32* %46, align 4, !llfi_index !93
  %47 = load i32* %i, align 4, !llfi_index !94
  %48 = zext i32 %47 to i64, !llfi_index !95
  %49 = load i8** %h_graph_mask, align 8, !llfi_index !96
  %50 = getelementptr inbounds i8* %49, i64 %48, !llfi_index !97
  store i8 0, i8* %50, align 1, !llfi_index !98
  %51 = load i32* %i, align 4, !llfi_index !99
  %52 = zext i32 %51 to i64, !llfi_index !100
  %53 = load i8** %h_updating_graph_mask, align 8, !llfi_index !101
  %54 = getelementptr inbounds i8* %53, i64 %52, !llfi_index !102
  store i8 0, i8* %54, align 1, !llfi_index !103
  %55 = load i32* %i, align 4, !llfi_index !104
  %56 = zext i32 %55 to i64, !llfi_index !105
  %57 = load i8** %h_graph_visited, align 8, !llfi_index !106
  %58 = getelementptr inbounds i8* %57, i64 %56, !llfi_index !107
  store i8 0, i8* %58, align 1, !llfi_index !108
  br label %59, !llfi_index !109

; <label>:59                                      ; preds = %34
  %60 = load i32* %i, align 4, !llfi_index !110
  %61 = add i32 %60, 1, !llfi_index !111
  br label %31, !llfi_index !112

; <label>:62                                      ; preds = %31
  %63 = load %struct._IO_FILE** @fp, align 8, !llfi_index !113
  %64 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32* %source), !llfi_index !114
  %65 = load i32* %source, align 4, !llfi_index !115
  %66 = sext i32 %65 to i64, !llfi_index !116
  %67 = load i8** %h_graph_mask, align 8, !llfi_index !117
  %68 = getelementptr inbounds i8* %67, i64 %66, !llfi_index !118
  store i8 1, i8* %68, align 1, !llfi_index !119
  %69 = load i32* %source, align 4, !llfi_index !120
  %70 = sext i32 %69 to i64, !llfi_index !121
  %71 = load i8** %h_graph_visited, align 8, !llfi_index !122
  %72 = getelementptr inbounds i8* %71, i64 %70, !llfi_index !123
  store i8 1, i8* %72, align 1, !llfi_index !124
  %73 = load %struct._IO_FILE** @fp, align 8, !llfi_index !125
  %74 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %73, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32* %edge_list_size), !llfi_index !126
  %75 = load i32* %edge_list_size, align 4, !llfi_index !127
  %76 = sext i32 %75 to i64, !llfi_index !128
  %77 = shl nsw i64 %76, 2, !llfi_index !129
  %78 = call noalias i8* @malloc(i64 %77) #4, !llfi_index !130
  %79 = bitcast i8* %78 to i32*, !llfi_index !131
  store i32* %79, i32** %h_graph_edges, align 8, !llfi_index !132
  br label %80, !llfi_index !133

; <label>:80                                      ; preds = %93, %62
  %storemerge1 = phi i32 [ 0, %62 ], [ %95, %93 ], !llfi_index !134
  store i32 %storemerge1, i32* %i1, align 4, !llfi_index !135
  %81 = load i32* %edge_list_size, align 4, !llfi_index !136
  %82 = icmp slt i32 %storemerge1, %81, !llfi_index !137
  br i1 %82, label %83, label %96, !llfi_index !138

; <label>:83                                      ; preds = %80
  %84 = load %struct._IO_FILE** @fp, align 8, !llfi_index !139
  %85 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %84, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32* %id), !llfi_index !140
  %86 = load %struct._IO_FILE** @fp, align 8, !llfi_index !141
  %87 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %86, i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), i32* %cost), !llfi_index !142
  %88 = load i32* %id, align 4, !llfi_index !143
  %89 = load i32* %i1, align 4, !llfi_index !144
  %90 = sext i32 %89 to i64, !llfi_index !145
  %91 = load i32** %h_graph_edges, align 8, !llfi_index !146
  %92 = getelementptr inbounds i32* %91, i64 %90, !llfi_index !147
  store i32 %88, i32* %92, align 4, !llfi_index !148
  br label %93, !llfi_index !149

; <label>:93                                      ; preds = %83
  %94 = load i32* %i1, align 4, !llfi_index !150
  %95 = add nsw i32 %94, 1, !llfi_index !151
  br label %80, !llfi_index !152

; <label>:96                                      ; preds = %80
  %97 = load %struct._IO_FILE** @fp, align 8, !llfi_index !153
  %98 = icmp eq %struct._IO_FILE* %97, null, !llfi_index !154
  br i1 %98, label %102, label %99, !llfi_index !155

; <label>:99                                      ; preds = %96
  %100 = load %struct._IO_FILE** @fp, align 8, !llfi_index !156
  %101 = call i32 @fclose(%struct._IO_FILE* %100), !llfi_index !157
  br label %102, !llfi_index !158

; <label>:102                                     ; preds = %99, %96
  %103 = load i32* %no_of_nodes, align 4, !llfi_index !159
  %104 = sext i32 %103 to i64, !llfi_index !160
  %105 = shl nsw i64 %104, 2, !llfi_index !161
  %106 = call noalias i8* @malloc(i64 %105) #4, !llfi_index !162
  %107 = bitcast i8* %106 to i32*, !llfi_index !163
  store i32* %107, i32** %h_cost, align 8, !llfi_index !164
  br label %108, !llfi_index !165

; <label>:108                                     ; preds = %116, %102
  %storemerge2 = phi i32 [ 0, %102 ], [ %118, %116 ], !llfi_index !166
  store i32 %storemerge2, i32* %i2, align 4, !llfi_index !167
  %109 = load i32* %no_of_nodes, align 4, !llfi_index !168
  %110 = icmp slt i32 %storemerge2, %109, !llfi_index !169
  br i1 %110, label %111, label %119, !llfi_index !170

; <label>:111                                     ; preds = %108
  %112 = load i32* %i2, align 4, !llfi_index !171
  %113 = sext i32 %112 to i64, !llfi_index !172
  %114 = load i32** %h_cost, align 8, !llfi_index !173
  %115 = getelementptr inbounds i32* %114, i64 %113, !llfi_index !174
  store i32 -1, i32* %115, align 4, !llfi_index !175
  br label %116, !llfi_index !176

; <label>:116                                     ; preds = %111
  %117 = load i32* %i2, align 4, !llfi_index !177
  %118 = add nsw i32 %117, 1, !llfi_index !178
  br label %108, !llfi_index !179

; <label>:119                                     ; preds = %108
  %120 = load i32* %source, align 4, !llfi_index !180
  %121 = sext i32 %120 to i64, !llfi_index !181
  %122 = load i32** %h_cost, align 8, !llfi_index !182
  %123 = getelementptr inbounds i32* %122, i64 %121, !llfi_index !183
  store i32 0, i32* %123, align 4, !llfi_index !184
  store i32 0, i32* %k, align 4, !llfi_index !185
  br label %124, !llfi_index !186

; <label>:124                                     ; preds = %224, %119
  store i8 0, i8* %stop, align 1, !llfi_index !187
  br label %125, !llfi_index !188

; <label>:125                                     ; preds = %189, %124
  %storemerge3 = phi i32 [ 0, %124 ], [ %191, %189 ], !llfi_index !189
  store i32 %storemerge3, i32* %tid, align 4, !llfi_index !190
  %126 = load i32* %no_of_nodes, align 4, !llfi_index !191
  %127 = icmp slt i32 %storemerge3, %126, !llfi_index !192
  br i1 %127, label %128, label %192, !llfi_index !193

; <label>:128                                     ; preds = %125
  %129 = load i32* %tid, align 4, !llfi_index !194
  %130 = sext i32 %129 to i64, !llfi_index !195
  %131 = load i8** %h_graph_mask, align 8, !llfi_index !196
  %132 = getelementptr inbounds i8* %131, i64 %130, !llfi_index !197
  %133 = load i8* %132, align 1, !llfi_index !198
  %134 = and i8 %133, 1, !llfi_index !199
  %135 = icmp eq i8 %134, 0, !llfi_index !200
  br i1 %135, label %188, label %136, !llfi_index !201

; <label>:136                                     ; preds = %128
  %137 = load i32* %tid, align 4, !llfi_index !202
  %138 = sext i32 %137 to i64, !llfi_index !203
  %139 = load i8** %h_graph_mask, align 8, !llfi_index !204
  %140 = getelementptr inbounds i8* %139, i64 %138, !llfi_index !205
  store i8 0, i8* %140, align 1, !llfi_index !206
  %141 = load i32* %tid, align 4, !llfi_index !207
  %142 = sext i32 %141 to i64, !llfi_index !208
  %143 = load %struct.Node** %h_graph_nodes, align 8, !llfi_index !209
  %144 = getelementptr inbounds %struct.Node* %143, i64 %142, i32 0, !llfi_index !210
  %145 = load i32* %144, align 4, !llfi_index !211
  br label %146, !llfi_index !212

; <label>:146                                     ; preds = %184, %136
  %storemerge6 = phi i32 [ %145, %136 ], [ %186, %184 ], !llfi_index !213
  store i32 %storemerge6, i32* %i3, align 4, !llfi_index !214
  %147 = load i32* %tid, align 4, !llfi_index !215
  %148 = sext i32 %147 to i64, !llfi_index !216
  %149 = load %struct.Node** %h_graph_nodes, align 8, !llfi_index !217
  %150 = getelementptr inbounds %struct.Node* %149, i64 %148, i32 1, !llfi_index !218
  %151 = load i32* %150, align 4, !llfi_index !219
  %152 = sext i32 %147 to i64, !llfi_index !220
  %153 = getelementptr inbounds %struct.Node* %149, i64 %152, i32 0, !llfi_index !221
  %154 = load i32* %153, align 4, !llfi_index !222
  %155 = add nsw i32 %151, %154, !llfi_index !223
  %156 = icmp slt i32 %storemerge6, %155, !llfi_index !224
  br i1 %156, label %157, label %187, !llfi_index !225

; <label>:157                                     ; preds = %146
  %158 = load i32* %i3, align 4, !llfi_index !226
  %159 = sext i32 %158 to i64, !llfi_index !227
  %160 = load i32** %h_graph_edges, align 8, !llfi_index !228
  %161 = getelementptr inbounds i32* %160, i64 %159, !llfi_index !229
  %162 = load i32* %161, align 4, !llfi_index !230
  store i32 %162, i32* %id4, align 4, !llfi_index !231
  %163 = sext i32 %162 to i64, !llfi_index !232
  %164 = load i8** %h_graph_visited, align 8, !llfi_index !233
  %165 = getelementptr inbounds i8* %164, i64 %163, !llfi_index !234
  %166 = load i8* %165, align 1, !llfi_index !235
  %167 = and i8 %166, 1, !llfi_index !236
  %168 = icmp eq i8 %167, 0, !llfi_index !237
  br i1 %168, label %169, label %183, !llfi_index !238

; <label>:169                                     ; preds = %157
  %170 = load i32* %tid, align 4, !llfi_index !239
  %171 = sext i32 %170 to i64, !llfi_index !240
  %172 = load i32** %h_cost, align 8, !llfi_index !241
  %173 = getelementptr inbounds i32* %172, i64 %171, !llfi_index !242
  %174 = load i32* %173, align 4, !llfi_index !243
  %175 = add nsw i32 %174, 1, !llfi_index !244
  %176 = load i32* %id4, align 4, !llfi_index !245
  %177 = sext i32 %176 to i64, !llfi_index !246
  %178 = getelementptr inbounds i32* %172, i64 %177, !llfi_index !247
  store i32 %175, i32* %178, align 4, !llfi_index !248
  %179 = load i32* %id4, align 4, !llfi_index !249
  %180 = sext i32 %179 to i64, !llfi_index !250
  %181 = load i8** %h_updating_graph_mask, align 8, !llfi_index !251
  %182 = getelementptr inbounds i8* %181, i64 %180, !llfi_index !252
  store i8 1, i8* %182, align 1, !llfi_index !253
  br label %183, !llfi_index !254

; <label>:183                                     ; preds = %169, %157
  br label %184, !llfi_index !255

; <label>:184                                     ; preds = %183
  %185 = load i32* %i3, align 4, !llfi_index !256
  %186 = add nsw i32 %185, 1, !llfi_index !257
  br label %146, !llfi_index !258

; <label>:187                                     ; preds = %146
  br label %188, !llfi_index !259

; <label>:188                                     ; preds = %187, %128
  br label %189, !llfi_index !260

; <label>:189                                     ; preds = %188
  %190 = load i32* %tid, align 4, !llfi_index !261
  %191 = add nsw i32 %190, 1, !llfi_index !262
  br label %125, !llfi_index !263

; <label>:192                                     ; preds = %125
  br label %193, !llfi_index !264

; <label>:193                                     ; preds = %218, %192
  %storemerge4 = phi i32 [ 0, %192 ], [ %220, %218 ], !llfi_index !265
  store i32 %storemerge4, i32* %tid5, align 4, !llfi_index !266
  %194 = load i32* %no_of_nodes, align 4, !llfi_index !267
  %195 = icmp slt i32 %storemerge4, %194, !llfi_index !268
  br i1 %195, label %196, label %221, !llfi_index !269

; <label>:196                                     ; preds = %193
  %197 = load i32* %tid5, align 4, !llfi_index !270
  %198 = sext i32 %197 to i64, !llfi_index !271
  %199 = load i8** %h_updating_graph_mask, align 8, !llfi_index !272
  %200 = getelementptr inbounds i8* %199, i64 %198, !llfi_index !273
  %201 = load i8* %200, align 1, !llfi_index !274
  %202 = and i8 %201, 1, !llfi_index !275
  %203 = icmp eq i8 %202, 0, !llfi_index !276
  br i1 %203, label %217, label %204, !llfi_index !277

; <label>:204                                     ; preds = %196
  %205 = load i32* %tid5, align 4, !llfi_index !278
  %206 = sext i32 %205 to i64, !llfi_index !279
  %207 = load i8** %h_graph_mask, align 8, !llfi_index !280
  %208 = getelementptr inbounds i8* %207, i64 %206, !llfi_index !281
  store i8 1, i8* %208, align 1, !llfi_index !282
  %209 = load i32* %tid5, align 4, !llfi_index !283
  %210 = sext i32 %209 to i64, !llfi_index !284
  %211 = load i8** %h_graph_visited, align 8, !llfi_index !285
  %212 = getelementptr inbounds i8* %211, i64 %210, !llfi_index !286
  store i8 1, i8* %212, align 1, !llfi_index !287
  store i8 1, i8* %stop, align 1, !llfi_index !288
  %213 = load i32* %tid5, align 4, !llfi_index !289
  %214 = sext i32 %213 to i64, !llfi_index !290
  %215 = load i8** %h_updating_graph_mask, align 8, !llfi_index !291
  %216 = getelementptr inbounds i8* %215, i64 %214, !llfi_index !292
  store i8 0, i8* %216, align 1, !llfi_index !293
  br label %217, !llfi_index !294

; <label>:217                                     ; preds = %204, %196
  br label %218, !llfi_index !295

; <label>:218                                     ; preds = %217
  %219 = load i32* %tid5, align 4, !llfi_index !296
  %220 = add nsw i32 %219, 1, !llfi_index !297
  br label %193, !llfi_index !298

; <label>:221                                     ; preds = %193
  %222 = load i32* %k, align 4, !llfi_index !299
  %223 = add nsw i32 %222, 1, !llfi_index !300
  store i32 %223, i32* %k, align 4, !llfi_index !301
  br label %224, !llfi_index !302

; <label>:224                                     ; preds = %221
  %225 = load i8* %stop, align 1, !llfi_index !303
  %226 = and i8 %225, 1, !llfi_index !304
  %227 = icmp eq i8 %226, 0, !llfi_index !305
  br i1 %227, label %228, label %124, !llfi_index !306

; <label>:228                                     ; preds = %224
  %229 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0)), !llfi_index !307
  store %struct._IO_FILE* %229, %struct._IO_FILE** %fpo, align 8, !llfi_index !308
  br label %230, !llfi_index !309

; <label>:230                                     ; preds = %241, %228
  %storemerge5 = phi i32 [ 0, %228 ], [ %243, %241 ], !llfi_index !310
  store i32 %storemerge5, i32* %i6, align 4, !llfi_index !311
  %231 = load i32* %no_of_nodes, align 4, !llfi_index !312
  %232 = icmp slt i32 %storemerge5, %231, !llfi_index !313
  br i1 %232, label %233, label %244, !llfi_index !314

; <label>:233                                     ; preds = %230
  %234 = load %struct._IO_FILE** %fpo, align 8, !llfi_index !315
  %235 = load i32* %i6, align 4, !llfi_index !316
  %236 = sext i32 %235 to i64, !llfi_index !317
  %237 = load i32** %h_cost, align 8, !llfi_index !318
  %238 = getelementptr inbounds i32* %237, i64 %236, !llfi_index !319
  %239 = load i32* %238, align 4, !llfi_index !320
  %240 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %234, i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0), i32 %235, i32 %239), !llfi_index !321
  br label %241, !llfi_index !322

; <label>:241                                     ; preds = %233
  %242 = load i32* %i6, align 4, !llfi_index !323
  %243 = add nsw i32 %242, 1, !llfi_index !324
  br label %230, !llfi_index !325

; <label>:244                                     ; preds = %230
  %245 = load %struct._IO_FILE** %fpo, align 8, !llfi_index !326
  %246 = call i32 @fclose(%struct._IO_FILE* %245), !llfi_index !327
  %247 = load %struct.Node** %h_graph_nodes, align 8, !llfi_index !328
  %248 = bitcast %struct.Node* %247 to i8*, !llfi_index !329
  call void @free(i8* %248) #4, !llfi_index !330
  %249 = load i32** %h_graph_edges, align 8, !llfi_index !331
  %250 = bitcast i32* %249 to i8*, !llfi_index !332
  call void @free(i8* %250) #4, !llfi_index !333
  %251 = load i8** %h_graph_mask, align 8, !llfi_index !334
  call void @free(i8* %251) #4, !llfi_index !335
  %252 = load i8** %h_updating_graph_mask, align 8, !llfi_index !336
  call void @free(i8* %252) #4, !llfi_index !337
  %253 = load i8** %h_graph_visited, align 8, !llfi_index !338
  call void @free(i8* %253) #4, !llfi_index !339
  %254 = load i32** %h_cost, align 8, !llfi_index !340
  %255 = bitcast i32* %254 to i8*, !llfi_index !341
  call void @free(i8* %255) #4, !llfi_index !342
  br label %256, !llfi_index !343

; <label>:256                                     ; preds = %244, %13
  ret void, !llfi_index !344
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

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #4

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }

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
!334 = metadata !{i64 334}
!335 = metadata !{i64 335}
!336 = metadata !{i64 336}
!337 = metadata !{i64 337}
!338 = metadata !{i64 338}
!339 = metadata !{i64 339}
!340 = metadata !{i64 340}
!341 = metadata !{i64 341}
!342 = metadata !{i64 342}
!343 = metadata !{i64 343}
!344 = metadata !{i64 344}
