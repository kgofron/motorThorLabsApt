# Missing Braces
* Compiler warning (Bug in GCC 4.6.3)

```
../devmotorThorLabsAptVersion.c:35:48: warning: missing braces around initializer [-Wmissing-braces]
   35 | static lsidset devmotorThorLabsAptVersion[5] = {
      |                                                ^
   36 |     5, NULL, NULL, NULL, NULL, read_string
      |     {{                       }
   37 | };
      | }
```
