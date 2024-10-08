-keep class okhttp3.** { *; }
-keep class okio.** { *; }
-keep class retrofit2.** { *; }

# تجنب إزالة أسماء الفئات
-keepnames class okhttp3.** { *; }
-keepnames class retrofit2.** { *; }