; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [312 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [618 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 28873261, ; 3: Npgsql.dll => 0x1b8922d => 190
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 232
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 266
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 53857724, ; 9: ca/Microsoft.Maui.Controls.resources => 0x335cdbc => 275
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 189
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 250
	i32 113429830, ; 15: zh-HK/Microsoft.Maui.Controls.resources => 0x6c2cd46 => 305
	i32 117431740, ; 16: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 17: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 250
	i32 122350210, ; 18: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 19: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 270
	i32 142721839, ; 20: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 21: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 22: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 23: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 206
	i32 176265551, ; 24: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 25: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 252
	i32 184328833, ; 26: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 27: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 304
	i32 199333315, ; 28: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 305
	i32 205061960, ; 29: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 30: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 204
	i32 220171995, ; 31: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 32: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 226
	i32 230752869, ; 33: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 34: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 35: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 37: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 209
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 228
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 225
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 276
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 43: System.Net.Ping.dll => 0x11d123fd => 69
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 195
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 46: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 289
	i32 342366114, ; 47: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 227
	i32 356389973, ; 48: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 288
	i32 357576608, ; 49: cs/Microsoft.Maui.Controls.resources => 0x15502fa0 => 276
	i32 360082299, ; 50: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 51: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 52: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 53: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 54: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 55: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 56: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 57: _Microsoft.Android.Resource.Designer => 0x17969339 => 308
	i32 403441872, ; 58: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 59: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 300
	i32 441335492, ; 60: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 210
	i32 442565967, ; 61: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 62: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 223
	i32 451504562, ; 63: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 64: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 65: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 66: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 67: System.dll => 0x1bff388e => 164
	i32 476646585, ; 68: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 225
	i32 486930444, ; 69: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 238
	i32 498788369, ; 70: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 71: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 287
	i32 503918385, ; 72: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 281
	i32 513247710, ; 73: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 183
	i32 526420162, ; 74: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527168573, ; 75: hi/Microsoft.Maui.Controls.resources => 0x1f6bf43d => 284
	i32 527452488, ; 76: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 270
	i32 530272170, ; 77: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 78: Microsoft.Extensions.Logging => 0x20216150 => 179
	i32 540030774, ; 79: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 80: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 81: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 82: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 83: Jsr305Binding => 0x213954e7 => 263
	i32 569601784, ; 84: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 261
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 86: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 295
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 89: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 90: Xamarin.AndroidX.CustomView => 0x2568904f => 215
	i32 639843206, ; 91: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 221
	i32 643868501, ; 92: System.Net => 0x2660a755 => 81
	i32 662205335, ; 93: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 94: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 257
	i32 666292255, ; 95: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 202
	i32 672442732, ; 96: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 97: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 98: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 275
	i32 690569205, ; 99: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 100: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 272
	i32 693804605, ; 101: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 102: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 103: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 267
	i32 700358131, ; 104: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 105: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 290
	i32 709557578, ; 106: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 278
	i32 720511267, ; 107: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 271
	i32 722857257, ; 108: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 109: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 110: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 111: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 192
	i32 759454413, ; 112: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 113: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 114: System.IO.Compression => 0x2e394f87 => 46
	i32 789151979, ; 115: Microsoft.Extensions.Options => 0x2f0980eb => 182
	i32 790371945, ; 116: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 216
	i32 804715423, ; 117: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 118: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 230
	i32 823281589, ; 119: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 120: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 121: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 122: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 123: Xamarin.AndroidX.Print => 0x3246f6cd => 243
	i32 870878177, ; 124: ar/Microsoft.Maui.Controls.resources => 0x33e88be1 => 274
	i32 873119928, ; 125: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 126: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 127: System.Net.Http.Json => 0x3463c971 => 63
	i32 902506256, ; 128: todoapp.dll => 0x35cb2710 => 0
	i32 904024072, ; 129: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 130: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 131: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 302
	i32 928116545, ; 132: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 266
	i32 952186615, ; 133: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 134: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 271
	i32 966729478, ; 135: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 264
	i32 967690846, ; 136: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 227
	i32 975236339, ; 137: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 138: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 139: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 140: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 141: System.Collections.dll => 0x3b2c715c => 12
	i32 993161700, ; 142: zh-Hans/Microsoft.Maui.Controls.resources => 0x3b3271e4 => 306
	i32 994442037, ; 143: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 994547685, ; 144: es/Microsoft.Maui.Controls.resources => 0x3b4797e5 => 280
	i32 1001831731, ; 145: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 146: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 247
	i32 1019214401, ; 147: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 148: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 178
	i32 1029334545, ; 149: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 277
	i32 1031528504, ; 150: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 265
	i32 1035644815, ; 151: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 200
	i32 1036536393, ; 152: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 153: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 154: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 234
	i32 1067306892, ; 155: GoogleGson => 0x3f9dcf8c => 174
	i32 1082857460, ; 156: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 157: Xamarin.Kotlin.StdLib => 0x409e66d8 => 268
	i32 1098259244, ; 158: System => 0x41761b2c => 164
	i32 1121599056, ; 159: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 233
	i32 1127624469, ; 160: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 181
	i32 1149092582, ; 161: Xamarin.AndroidX.Window => 0x447dc2e6 => 260
	i32 1170634674, ; 162: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 163: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 256
	i32 1178241025, ; 164: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 241
	i32 1178797549, ; 165: fi/Microsoft.Maui.Controls.resources => 0x464305ed => 281
	i32 1203215381, ; 166: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 294
	i32 1204270330, ; 167: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 202
	i32 1208641965, ; 168: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 169: CommunityToolkit.Mvvm => 0x4868cc7b => 173
	i32 1219128291, ; 170: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 171: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 292
	i32 1243150071, ; 172: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 261
	i32 1253011324, ; 173: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1264511973, ; 174: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 251
	i32 1267360935, ; 175: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 255
	i32 1273260888, ; 176: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 207
	i32 1275534314, ; 177: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 272
	i32 1278448581, ; 178: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 199
	i32 1293217323, ; 179: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 218
	i32 1309188875, ; 180: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 181: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 260
	i32 1324164729, ; 182: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 183: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 184: System.IO => 0x514d38cd => 57
	i32 1376866003, ; 185: Xamarin.AndroidX.SavedState => 0x52114ed3 => 247
	i32 1379779777, ; 186: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 187: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 188: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 211
	i32 1408764838, ; 189: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 190: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 191: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1434145427, ; 192: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 193: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 264
	i32 1439761251, ; 194: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 195: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 196: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 197: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 198: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461234159, ; 199: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 200: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 201: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 202: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 201
	i32 1470490898, ; 203: Microsoft.Extensions.Primitives => 0x57a5e912 => 183
	i32 1479771757, ; 204: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 205: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 206: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 207: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 248
	i32 1493001747, ; 208: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 284
	i32 1514721132, ; 209: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 279
	i32 1536373174, ; 210: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 211: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 212: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 213: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 214: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 299
	i32 1554762148, ; 215: fr/Microsoft.Maui.Controls.resources => 0x5cabc9a4 => 282
	i32 1565862583, ; 216: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 217: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 218: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 219: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1580413037, ; 220: sv/Microsoft.Maui.Controls.resources => 0x5e33306d => 300
	i32 1582372066, ; 221: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 217
	i32 1591080825, ; 222: zh-Hant/Microsoft.Maui.Controls.resources => 0x5ed5f779 => 307
	i32 1592978981, ; 223: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 224: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 265
	i32 1601112923, ; 225: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 226: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 227: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 228: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 237
	i32 1622358360, ; 229: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 230: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 259
	i32 1635184631, ; 231: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 221
	i32 1636350590, ; 232: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 214
	i32 1639515021, ; 233: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 234: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 235: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 236: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 237: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 253
	i32 1658251792, ; 238: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 262
	i32 1670060433, ; 239: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 209
	i32 1675553242, ; 240: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 241: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 242: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 243: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 244: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 245: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 246: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 269
	i32 1701541528, ; 247: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 248: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 230
	i32 1726116996, ; 249: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 250: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 251: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 205
	i32 1736233607, ; 252: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 297
	i32 1744735666, ; 253: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 254: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 255: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 256: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 257: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 258: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 259: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 252
	i32 1770582343, ; 260: Microsoft.Extensions.Logging.dll => 0x6988f147 => 179
	i32 1776026572, ; 261: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 262: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 263: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1788241197, ; 264: Xamarin.AndroidX.Fragment => 0x6a96652d => 223
	i32 1808609942, ; 265: Xamarin.AndroidX.Loader => 0x6bcd3296 => 237
	i32 1809966115, ; 266: nb/Microsoft.Maui.Controls.resources => 0x6be1e423 => 292
	i32 1813058853, ; 267: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 268
	i32 1813201214, ; 268: Xamarin.Google.Android.Material => 0x6c13413e => 262
	i32 1818569960, ; 269: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 242
	i32 1818787751, ; 270: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1821794637, ; 271: hu/Microsoft.Maui.Controls.resources => 0x6c96614d => 286
	i32 1824175904, ; 272: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 273: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 274: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 180
	i32 1842015223, ; 275: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 303
	i32 1847515442, ; 276: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 192
	i32 1858542181, ; 277: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 278: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1879696579, ; 279: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 280: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 203
	i32 1888955245, ; 281: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 282: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 283: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 284: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 285: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 286: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 287: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1960264639, ; 288: ja/Microsoft.Maui.Controls.resources => 0x74d743bf => 289
	i32 1961813231, ; 289: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 249
	i32 1968388702, ; 290: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 175
	i32 1983156543, ; 291: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 269
	i32 1985761444, ; 292: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 194
	i32 2011961780, ; 293: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014344398, ; 294: hr/Microsoft.Maui.Controls.resources => 0x781074ce => 285
	i32 2019465201, ; 295: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 234
	i32 2025202353, ; 296: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 274
	i32 2031763787, ; 297: Xamarin.Android.Glide => 0x791a414b => 191
	i32 2043674646, ; 298: it/Microsoft.Maui.Controls.resources => 0x79d00016 => 288
	i32 2045470958, ; 299: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 300: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 229
	i32 2060060697, ; 301: System.Windows.dll => 0x7aca0819 => 154
	i32 2070888862, ; 302: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 303: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 304: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 305: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 306: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 307: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 308: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2150663486, ; 309: ko/Microsoft.Maui.Controls.resources => 0x8030853e => 290
	i32 2159891885, ; 310: Microsoft.Maui => 0x80bd55ad => 187
	i32 2165051842, ; 311: ro/Microsoft.Maui.Controls.resources => 0x810c11c2 => 297
	i32 2181898931, ; 312: Microsoft.Extensions.Options.dll => 0x820d22b3 => 182
	i32 2192057212, ; 313: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 180
	i32 2193016926, ; 314: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 315: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 273
	i32 2201231467, ; 316: System.Net.Http => 0x8334206b => 64
	i32 2217644978, ; 317: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 256
	i32 2222056684, ; 318: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 319: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 238
	i32 2252106437, ; 320: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 321: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 322: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 323: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 176
	i32 2267999099, ; 324: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 193
	i32 2270573516, ; 325: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 282
	i32 2279755925, ; 326: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 245
	i32 2289298199, ; 327: th/Microsoft.Maui.Controls.resources => 0x8873eb17 => 301
	i32 2293034957, ; 328: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2294913272, ; 329: Npgsql => 0x88c998f8 => 190
	i32 2295906218, ; 330: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 331: System.Net.Mail => 0x88ffe49e => 66
	i32 2305521784, ; 332: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 333: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 197
	i32 2320631194, ; 334: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 335: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 336: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 337: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 338: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369760409, ; 339: tr/Microsoft.Maui.Controls.resources => 0x8d3fac99 => 302
	i32 2371007202, ; 340: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 175
	i32 2378619854, ; 341: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 342: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2401565422, ; 343: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 344: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 220
	i32 2421380589, ; 345: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2421992093, ; 346: nl/Microsoft.Maui.Controls.resources => 0x905caa9d => 293
	i32 2423080555, ; 347: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 207
	i32 2435356389, ; 348: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 349: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 350: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 351: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 352: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 353: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 210
	i32 2471841756, ; 354: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 355: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 356: Microsoft.Maui.Controls => 0x93dba8a1 => 185
	i32 2483903535, ; 357: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 358: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 359: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 360: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 361: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 232
	i32 2520433370, ; 362: sk/Microsoft.Maui.Controls.resources => 0x963ac2da => 299
	i32 2522472828, ; 363: Xamarin.Android.Glide.dll => 0x9659e17c => 191
	i32 2538310050, ; 364: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2562349572, ; 365: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 366: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 367: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 233
	i32 2581819634, ; 368: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 255
	i32 2585220780, ; 369: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 370: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 371: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2605712449, ; 372: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 273
	i32 2615233544, ; 373: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 224
	i32 2616218305, ; 374: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 181
	i32 2617129537, ; 375: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 376: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 377: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 214
	i32 2624644809, ; 378: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 219
	i32 2627185994, ; 379: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 380: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 381: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 228
	i32 2663391936, ; 382: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 193
	i32 2663698177, ; 383: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 384: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 385: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 386: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 387: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 388: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 389: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 253
	i32 2715334215, ; 390: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 391: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 392: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 393: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 394: Xamarin.AndroidX.Activity => 0xa2e0939b => 195
	i32 2735172069, ; 395: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 396: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 201
	i32 2740948882, ; 397: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 398: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2758225723, ; 399: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 186
	i32 2764765095, ; 400: Microsoft.Maui.dll => 0xa4caf7a7 => 187
	i32 2765824710, ; 401: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 402: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 267
	i32 2778768386, ; 403: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 258
	i32 2779977773, ; 404: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 246
	i32 2788224221, ; 405: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 224
	i32 2801831435, ; 406: Microsoft.Maui.Graphics => 0xa7008e0b => 189
	i32 2802068195, ; 407: uk/Microsoft.Maui.Controls.resources => 0xa7042ae3 => 303
	i32 2803228030, ; 408: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 409: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 280
	i32 2810250172, ; 410: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 211
	i32 2819470561, ; 411: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 412: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 413: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 246
	i32 2824502124, ; 414: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 415: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 293
	i32 2838993487, ; 416: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 235
	i32 2849599387, ; 417: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 418: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 258
	i32 2855708567, ; 419: Xamarin.AndroidX.Transition => 0xaa36a797 => 254
	i32 2857259519, ; 420: el/Microsoft.Maui.Controls.resources => 0xaa4e51ff => 279
	i32 2861098320, ; 421: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 422: Microsoft.Maui.Essentials => 0xaa8a4878 => 188
	i32 2870099610, ; 423: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 196
	i32 2875164099, ; 424: Jsr305Binding.dll => 0xab5f85c3 => 263
	i32 2875220617, ; 425: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2883495834, ; 426: ru/Microsoft.Maui.Controls.resources => 0xabdea79a => 298
	i32 2884993177, ; 427: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 222
	i32 2887636118, ; 428: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 429: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 430: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 431: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 432: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 433: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 434: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 259
	i32 2919462931, ; 435: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 436: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 198
	i32 2936416060, ; 437: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 438: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 439: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 440: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 441: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 442: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 443: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 218
	i32 2987532451, ; 444: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 249
	i32 2996846495, ; 445: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 231
	i32 3016983068, ; 446: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 251
	i32 3023353419, ; 447: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 448: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 226
	i32 3038032645, ; 449: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 308
	i32 3056245963, ; 450: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 248
	i32 3057625584, ; 451: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 239
	i32 3059408633, ; 452: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 453: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 454: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 455: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 286
	i32 3090735792, ; 456: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 457: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 458: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 459: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 460: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 461: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 462: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 463: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 464: GoogleGson.dll => 0xbba64c02 => 174
	i32 3159123045, ; 465: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 466: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 467: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 240
	i32 3192346100, ; 468: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 469: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 470: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 471: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 472: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 217
	i32 3220365878, ; 473: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 474: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 475: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 476: Xamarin.AndroidX.CardView => 0xc235e84d => 205
	i32 3265493905, ; 477: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 478: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 479: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 480: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 481: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 482: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 483: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 484: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3316684772, ; 485: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 486: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 215
	i32 3317144872, ; 487: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 488: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 203
	i32 3345895724, ; 489: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 244
	i32 3346324047, ; 490: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 241
	i32 3358260929, ; 491: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 492: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 196
	i32 3362522851, ; 493: Xamarin.AndroidX.Core => 0xc86c06e3 => 212
	i32 3366347497, ; 494: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 495: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 245
	i32 3395150330, ; 496: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 497: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 498: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 216
	i32 3428513518, ; 499: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 177
	i32 3429136800, ; 500: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 501: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 502: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 219
	i32 3445260447, ; 503: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 504: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 184
	i32 3463511458, ; 505: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 285
	i32 3471940407, ; 506: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 507: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 508: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 298
	i32 3485117614, ; 509: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 510: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 511: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 208
	i32 3500067605, ; 512: todoapp => 0xd09ecb15 => 0
	i32 3509114376, ; 513: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 514: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 515: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 516: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3542658132, ; 517: vi/Microsoft.Maui.Controls.resources => 0xd328ac54 => 304
	i32 3560100363, ; 518: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 519: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3596930546, ; 520: de/Microsoft.Maui.Controls.resources => 0xd664cdf2 => 278
	i32 3597029428, ; 521: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 194
	i32 3598340787, ; 522: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 523: System.Linq.dll => 0xd715a361 => 61
	i32 3623444314, ; 524: da/Microsoft.Maui.Controls.resources => 0xd7f95f5a => 277
	i32 3624195450, ; 525: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 526: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 243
	i32 3633644679, ; 527: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 198
	i32 3638274909, ; 528: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 529: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 229
	i32 3643854240, ; 530: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 240
	i32 3645089577, ; 531: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3647796983, ; 532: pt-BR/Microsoft.Maui.Controls.resources => 0xd96cf6f7 => 295
	i32 3657292374, ; 533: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 176
	i32 3660523487, ; 534: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3662115805, ; 535: he/Microsoft.Maui.Controls.resources => 0xda4773dd => 283
	i32 3672681054, ; 536: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 537: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 204
	i32 3684561358, ; 538: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 208
	i32 3686075795, ; 539: ms/Microsoft.Maui.Controls.resources => 0xdbb50d93 => 291
	i32 3697841164, ; 540: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 307
	i32 3700866549, ; 541: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 542: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 213
	i32 3716563718, ; 543: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 544: Xamarin.AndroidX.Annotation => 0xdda814c6 => 197
	i32 3724971120, ; 545: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 239
	i32 3732100267, ; 546: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 547: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 548: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 549: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 550: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 206
	i32 3792276235, ; 551: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 552: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 184
	i32 3802395368, ; 553: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 554: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 555: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 556: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 557: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 178
	i32 3844307129, ; 558: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 559: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 560: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 561: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 562: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 563: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 564: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 254
	i32 3888767677, ; 565: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 244
	i32 3889960447, ; 566: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 306
	i32 3896106733, ; 567: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 568: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 212
	i32 3901907137, ; 569: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 570: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 571: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 257
	i32 3928044579, ; 572: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 573: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 574: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 242
	i32 3945713374, ; 575: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 576: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 577: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 200
	i32 3959773229, ; 578: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 231
	i32 3980434154, ; 579: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 301
	i32 3987592930, ; 580: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 283
	i32 4003436829, ; 581: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 582: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 199
	i32 4025784931, ; 583: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 584: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 186
	i32 4054681211, ; 585: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 586: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4070331268, ; 587: id/Microsoft.Maui.Controls.resources => 0xf29c5384 => 287
	i32 4073602200, ; 588: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 589: Microsoft.Maui.Essentials.dll => 0xf40add04 => 188
	i32 4099507663, ; 590: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 591: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 592: Xamarin.AndroidX.Emoji2 => 0xf479582c => 220
	i32 4102112229, ; 593: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 296
	i32 4119206479, ; 594: pl/Microsoft.Maui.Controls.resources => 0xf5861a4f => 294
	i32 4125707920, ; 595: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 291
	i32 4126470640, ; 596: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 177
	i32 4127667938, ; 597: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 598: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 599: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4151237749, ; 600: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 601: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 602: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 603: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 604: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 605: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 236
	i32 4185676441, ; 606: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 607: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 608: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4234116406, ; 609: pt/Microsoft.Maui.Controls.resources => 0xfc5f7d36 => 296
	i32 4256097574, ; 610: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 213
	i32 4258378803, ; 611: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 235
	i32 4260525087, ; 612: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 613: Microsoft.Maui.Controls.dll => 0xfea12dee => 185
	i32 4274623895, ; 614: CommunityToolkit.Mvvm.dll => 0xfec99597 => 173
	i32 4274976490, ; 615: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 616: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 236
	i32 4294763496 ; 617: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 222
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [618 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 190, ; 3
	i32 232, ; 4
	i32 266, ; 5
	i32 48, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 275, ; 9
	i32 30, ; 10
	i32 124, ; 11
	i32 189, ; 12
	i32 102, ; 13
	i32 250, ; 14
	i32 305, ; 15
	i32 107, ; 16
	i32 250, ; 17
	i32 139, ; 18
	i32 270, ; 19
	i32 77, ; 20
	i32 124, ; 21
	i32 13, ; 22
	i32 206, ; 23
	i32 132, ; 24
	i32 252, ; 25
	i32 151, ; 26
	i32 304, ; 27
	i32 305, ; 28
	i32 18, ; 29
	i32 204, ; 30
	i32 26, ; 31
	i32 226, ; 32
	i32 1, ; 33
	i32 59, ; 34
	i32 42, ; 35
	i32 91, ; 36
	i32 209, ; 37
	i32 147, ; 38
	i32 228, ; 39
	i32 225, ; 40
	i32 276, ; 41
	i32 54, ; 42
	i32 69, ; 43
	i32 195, ; 44
	i32 83, ; 45
	i32 289, ; 46
	i32 227, ; 47
	i32 288, ; 48
	i32 276, ; 49
	i32 131, ; 50
	i32 55, ; 51
	i32 149, ; 52
	i32 74, ; 53
	i32 145, ; 54
	i32 62, ; 55
	i32 146, ; 56
	i32 308, ; 57
	i32 165, ; 58
	i32 300, ; 59
	i32 210, ; 60
	i32 12, ; 61
	i32 223, ; 62
	i32 125, ; 63
	i32 152, ; 64
	i32 113, ; 65
	i32 166, ; 66
	i32 164, ; 67
	i32 225, ; 68
	i32 238, ; 69
	i32 84, ; 70
	i32 287, ; 71
	i32 281, ; 72
	i32 183, ; 73
	i32 150, ; 74
	i32 284, ; 75
	i32 270, ; 76
	i32 60, ; 77
	i32 179, ; 78
	i32 51, ; 79
	i32 103, ; 80
	i32 114, ; 81
	i32 40, ; 82
	i32 263, ; 83
	i32 261, ; 84
	i32 120, ; 85
	i32 295, ; 86
	i32 52, ; 87
	i32 44, ; 88
	i32 119, ; 89
	i32 215, ; 90
	i32 221, ; 91
	i32 81, ; 92
	i32 136, ; 93
	i32 257, ; 94
	i32 202, ; 95
	i32 8, ; 96
	i32 73, ; 97
	i32 275, ; 98
	i32 155, ; 99
	i32 272, ; 100
	i32 154, ; 101
	i32 92, ; 102
	i32 267, ; 103
	i32 45, ; 104
	i32 290, ; 105
	i32 278, ; 106
	i32 271, ; 107
	i32 109, ; 108
	i32 129, ; 109
	i32 25, ; 110
	i32 192, ; 111
	i32 72, ; 112
	i32 55, ; 113
	i32 46, ; 114
	i32 182, ; 115
	i32 216, ; 116
	i32 22, ; 117
	i32 230, ; 118
	i32 86, ; 119
	i32 43, ; 120
	i32 160, ; 121
	i32 71, ; 122
	i32 243, ; 123
	i32 274, ; 124
	i32 3, ; 125
	i32 42, ; 126
	i32 63, ; 127
	i32 0, ; 128
	i32 16, ; 129
	i32 53, ; 130
	i32 302, ; 131
	i32 266, ; 132
	i32 105, ; 133
	i32 271, ; 134
	i32 264, ; 135
	i32 227, ; 136
	i32 34, ; 137
	i32 158, ; 138
	i32 85, ; 139
	i32 32, ; 140
	i32 12, ; 141
	i32 306, ; 142
	i32 51, ; 143
	i32 280, ; 144
	i32 56, ; 145
	i32 247, ; 146
	i32 36, ; 147
	i32 178, ; 148
	i32 277, ; 149
	i32 265, ; 150
	i32 200, ; 151
	i32 35, ; 152
	i32 58, ; 153
	i32 234, ; 154
	i32 174, ; 155
	i32 17, ; 156
	i32 268, ; 157
	i32 164, ; 158
	i32 233, ; 159
	i32 181, ; 160
	i32 260, ; 161
	i32 153, ; 162
	i32 256, ; 163
	i32 241, ; 164
	i32 281, ; 165
	i32 294, ; 166
	i32 202, ; 167
	i32 29, ; 168
	i32 173, ; 169
	i32 52, ; 170
	i32 292, ; 171
	i32 261, ; 172
	i32 5, ; 173
	i32 251, ; 174
	i32 255, ; 175
	i32 207, ; 176
	i32 272, ; 177
	i32 199, ; 178
	i32 218, ; 179
	i32 85, ; 180
	i32 260, ; 181
	i32 61, ; 182
	i32 112, ; 183
	i32 57, ; 184
	i32 247, ; 185
	i32 99, ; 186
	i32 19, ; 187
	i32 211, ; 188
	i32 111, ; 189
	i32 101, ; 190
	i32 102, ; 191
	i32 104, ; 192
	i32 264, ; 193
	i32 71, ; 194
	i32 38, ; 195
	i32 32, ; 196
	i32 103, ; 197
	i32 73, ; 198
	i32 9, ; 199
	i32 123, ; 200
	i32 46, ; 201
	i32 201, ; 202
	i32 183, ; 203
	i32 9, ; 204
	i32 43, ; 205
	i32 4, ; 206
	i32 248, ; 207
	i32 284, ; 208
	i32 279, ; 209
	i32 31, ; 210
	i32 138, ; 211
	i32 92, ; 212
	i32 93, ; 213
	i32 299, ; 214
	i32 282, ; 215
	i32 49, ; 216
	i32 141, ; 217
	i32 112, ; 218
	i32 140, ; 219
	i32 300, ; 220
	i32 217, ; 221
	i32 307, ; 222
	i32 115, ; 223
	i32 265, ; 224
	i32 157, ; 225
	i32 76, ; 226
	i32 79, ; 227
	i32 237, ; 228
	i32 37, ; 229
	i32 259, ; 230
	i32 221, ; 231
	i32 214, ; 232
	i32 64, ; 233
	i32 138, ; 234
	i32 15, ; 235
	i32 116, ; 236
	i32 253, ; 237
	i32 262, ; 238
	i32 209, ; 239
	i32 48, ; 240
	i32 70, ; 241
	i32 80, ; 242
	i32 126, ; 243
	i32 94, ; 244
	i32 121, ; 245
	i32 269, ; 246
	i32 26, ; 247
	i32 230, ; 248
	i32 97, ; 249
	i32 28, ; 250
	i32 205, ; 251
	i32 297, ; 252
	i32 149, ; 253
	i32 169, ; 254
	i32 4, ; 255
	i32 98, ; 256
	i32 33, ; 257
	i32 93, ; 258
	i32 252, ; 259
	i32 179, ; 260
	i32 21, ; 261
	i32 41, ; 262
	i32 170, ; 263
	i32 223, ; 264
	i32 237, ; 265
	i32 292, ; 266
	i32 268, ; 267
	i32 262, ; 268
	i32 242, ; 269
	i32 2, ; 270
	i32 286, ; 271
	i32 134, ; 272
	i32 111, ; 273
	i32 180, ; 274
	i32 303, ; 275
	i32 192, ; 276
	i32 58, ; 277
	i32 95, ; 278
	i32 39, ; 279
	i32 203, ; 280
	i32 25, ; 281
	i32 94, ; 282
	i32 89, ; 283
	i32 99, ; 284
	i32 10, ; 285
	i32 87, ; 286
	i32 100, ; 287
	i32 289, ; 288
	i32 249, ; 289
	i32 175, ; 290
	i32 269, ; 291
	i32 194, ; 292
	i32 7, ; 293
	i32 285, ; 294
	i32 234, ; 295
	i32 274, ; 296
	i32 191, ; 297
	i32 288, ; 298
	i32 88, ; 299
	i32 229, ; 300
	i32 154, ; 301
	i32 33, ; 302
	i32 116, ; 303
	i32 82, ; 304
	i32 20, ; 305
	i32 11, ; 306
	i32 162, ; 307
	i32 3, ; 308
	i32 290, ; 309
	i32 187, ; 310
	i32 297, ; 311
	i32 182, ; 312
	i32 180, ; 313
	i32 84, ; 314
	i32 273, ; 315
	i32 64, ; 316
	i32 256, ; 317
	i32 143, ; 318
	i32 238, ; 319
	i32 157, ; 320
	i32 41, ; 321
	i32 117, ; 322
	i32 176, ; 323
	i32 193, ; 324
	i32 282, ; 325
	i32 245, ; 326
	i32 301, ; 327
	i32 131, ; 328
	i32 190, ; 329
	i32 75, ; 330
	i32 66, ; 331
	i32 172, ; 332
	i32 197, ; 333
	i32 143, ; 334
	i32 106, ; 335
	i32 151, ; 336
	i32 70, ; 337
	i32 156, ; 338
	i32 302, ; 339
	i32 175, ; 340
	i32 121, ; 341
	i32 127, ; 342
	i32 152, ; 343
	i32 220, ; 344
	i32 141, ; 345
	i32 293, ; 346
	i32 207, ; 347
	i32 20, ; 348
	i32 14, ; 349
	i32 135, ; 350
	i32 75, ; 351
	i32 59, ; 352
	i32 210, ; 353
	i32 167, ; 354
	i32 168, ; 355
	i32 185, ; 356
	i32 15, ; 357
	i32 74, ; 358
	i32 6, ; 359
	i32 23, ; 360
	i32 232, ; 361
	i32 299, ; 362
	i32 191, ; 363
	i32 91, ; 364
	i32 1, ; 365
	i32 136, ; 366
	i32 233, ; 367
	i32 255, ; 368
	i32 134, ; 369
	i32 69, ; 370
	i32 146, ; 371
	i32 273, ; 372
	i32 224, ; 373
	i32 181, ; 374
	i32 88, ; 375
	i32 96, ; 376
	i32 214, ; 377
	i32 219, ; 378
	i32 31, ; 379
	i32 45, ; 380
	i32 228, ; 381
	i32 193, ; 382
	i32 109, ; 383
	i32 158, ; 384
	i32 35, ; 385
	i32 22, ; 386
	i32 114, ; 387
	i32 57, ; 388
	i32 253, ; 389
	i32 144, ; 390
	i32 118, ; 391
	i32 120, ; 392
	i32 110, ; 393
	i32 195, ; 394
	i32 139, ; 395
	i32 201, ; 396
	i32 54, ; 397
	i32 105, ; 398
	i32 186, ; 399
	i32 187, ; 400
	i32 133, ; 401
	i32 267, ; 402
	i32 258, ; 403
	i32 246, ; 404
	i32 224, ; 405
	i32 189, ; 406
	i32 303, ; 407
	i32 159, ; 408
	i32 280, ; 409
	i32 211, ; 410
	i32 163, ; 411
	i32 132, ; 412
	i32 246, ; 413
	i32 161, ; 414
	i32 293, ; 415
	i32 235, ; 416
	i32 140, ; 417
	i32 258, ; 418
	i32 254, ; 419
	i32 279, ; 420
	i32 169, ; 421
	i32 188, ; 422
	i32 196, ; 423
	i32 263, ; 424
	i32 40, ; 425
	i32 298, ; 426
	i32 222, ; 427
	i32 81, ; 428
	i32 56, ; 429
	i32 37, ; 430
	i32 97, ; 431
	i32 166, ; 432
	i32 172, ; 433
	i32 259, ; 434
	i32 82, ; 435
	i32 198, ; 436
	i32 98, ; 437
	i32 30, ; 438
	i32 159, ; 439
	i32 18, ; 440
	i32 127, ; 441
	i32 119, ; 442
	i32 218, ; 443
	i32 249, ; 444
	i32 231, ; 445
	i32 251, ; 446
	i32 165, ; 447
	i32 226, ; 448
	i32 308, ; 449
	i32 248, ; 450
	i32 239, ; 451
	i32 170, ; 452
	i32 16, ; 453
	i32 144, ; 454
	i32 286, ; 455
	i32 125, ; 456
	i32 118, ; 457
	i32 38, ; 458
	i32 115, ; 459
	i32 47, ; 460
	i32 142, ; 461
	i32 117, ; 462
	i32 34, ; 463
	i32 174, ; 464
	i32 95, ; 465
	i32 53, ; 466
	i32 240, ; 467
	i32 129, ; 468
	i32 153, ; 469
	i32 24, ; 470
	i32 161, ; 471
	i32 217, ; 472
	i32 148, ; 473
	i32 104, ; 474
	i32 89, ; 475
	i32 205, ; 476
	i32 60, ; 477
	i32 142, ; 478
	i32 100, ; 479
	i32 5, ; 480
	i32 13, ; 481
	i32 122, ; 482
	i32 135, ; 483
	i32 28, ; 484
	i32 72, ; 485
	i32 215, ; 486
	i32 24, ; 487
	i32 203, ; 488
	i32 244, ; 489
	i32 241, ; 490
	i32 137, ; 491
	i32 196, ; 492
	i32 212, ; 493
	i32 168, ; 494
	i32 245, ; 495
	i32 101, ; 496
	i32 123, ; 497
	i32 216, ; 498
	i32 177, ; 499
	i32 163, ; 500
	i32 167, ; 501
	i32 219, ; 502
	i32 39, ; 503
	i32 184, ; 504
	i32 285, ; 505
	i32 17, ; 506
	i32 171, ; 507
	i32 298, ; 508
	i32 137, ; 509
	i32 150, ; 510
	i32 208, ; 511
	i32 0, ; 512
	i32 155, ; 513
	i32 130, ; 514
	i32 19, ; 515
	i32 65, ; 516
	i32 304, ; 517
	i32 147, ; 518
	i32 47, ; 519
	i32 278, ; 520
	i32 194, ; 521
	i32 79, ; 522
	i32 61, ; 523
	i32 277, ; 524
	i32 106, ; 525
	i32 243, ; 526
	i32 198, ; 527
	i32 49, ; 528
	i32 229, ; 529
	i32 240, ; 530
	i32 14, ; 531
	i32 295, ; 532
	i32 176, ; 533
	i32 68, ; 534
	i32 283, ; 535
	i32 171, ; 536
	i32 204, ; 537
	i32 208, ; 538
	i32 291, ; 539
	i32 307, ; 540
	i32 78, ; 541
	i32 213, ; 542
	i32 108, ; 543
	i32 197, ; 544
	i32 239, ; 545
	i32 67, ; 546
	i32 63, ; 547
	i32 27, ; 548
	i32 160, ; 549
	i32 206, ; 550
	i32 10, ; 551
	i32 184, ; 552
	i32 11, ; 553
	i32 78, ; 554
	i32 126, ; 555
	i32 83, ; 556
	i32 178, ; 557
	i32 66, ; 558
	i32 107, ; 559
	i32 65, ; 560
	i32 128, ; 561
	i32 122, ; 562
	i32 77, ; 563
	i32 254, ; 564
	i32 244, ; 565
	i32 306, ; 566
	i32 8, ; 567
	i32 212, ; 568
	i32 2, ; 569
	i32 44, ; 570
	i32 257, ; 571
	i32 156, ; 572
	i32 128, ; 573
	i32 242, ; 574
	i32 23, ; 575
	i32 133, ; 576
	i32 200, ; 577
	i32 231, ; 578
	i32 301, ; 579
	i32 283, ; 580
	i32 29, ; 581
	i32 199, ; 582
	i32 62, ; 583
	i32 186, ; 584
	i32 90, ; 585
	i32 87, ; 586
	i32 287, ; 587
	i32 148, ; 588
	i32 188, ; 589
	i32 36, ; 590
	i32 86, ; 591
	i32 220, ; 592
	i32 296, ; 593
	i32 294, ; 594
	i32 291, ; 595
	i32 177, ; 596
	i32 50, ; 597
	i32 6, ; 598
	i32 90, ; 599
	i32 21, ; 600
	i32 162, ; 601
	i32 96, ; 602
	i32 50, ; 603
	i32 113, ; 604
	i32 236, ; 605
	i32 130, ; 606
	i32 76, ; 607
	i32 27, ; 608
	i32 296, ; 609
	i32 213, ; 610
	i32 235, ; 611
	i32 7, ; 612
	i32 185, ; 613
	i32 173, ; 614
	i32 110, ; 615
	i32 236, ; 616
	i32 222 ; 617
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ 87e4a6d890397c13b2572ce01d4b57874ecef9b0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
