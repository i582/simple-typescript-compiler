.586
.model flat, stdcall

include <\masm32\include\msvcrt.inc>
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\msvcrt.lib>
includelib <\masm32\lib\kernel32.lib>

data segment

   string_const_0 db " ",13,10,0
   string_const_1 db " ",13,10,0
   div_operand_1 dd 0
   div_operand_2 dd 0

; Global variable START
   i5451 dd 0
   k5455 dd 0
   s_arr10_arr dd 0 dup (0)
   s_arr10 dd offset s_arr10_arr
   s_arr26_arr dd 0 dup (0)
   s_arr26 dd offset s_arr26_arr
   s_arr42_arr dd 0 dup (0)
   s_arr42 dd offset s_arr42_arr
   s_arr58_arr dd 0 dup (0)
   s_arr58 dd offset s_arr58_arr
   s_arr74_arr dd 0 dup (0)
   s_arr74 dd offset s_arr74_arr
   s_arr90_arr dd 0 dup (0)
   s_arr90 dd offset s_arr90_arr
   s_arr106_arr dd 0 dup (0)
   s_arr106 dd offset s_arr106_arr
   s_arr122_arr dd 0 dup (0)
   s_arr122 dd offset s_arr122_arr
   s_arr138_arr dd 0 dup (0)
   s_arr138 dd offset s_arr138_arr
   s_arr154_arr dd 0 dup (0)
   s_arr154 dd offset s_arr154_arr
   s_arr170_arr dd 0 dup (0)
   s_arr170 dd offset s_arr170_arr
   s_arr186_arr dd 0 dup (0)
   s_arr186 dd offset s_arr186_arr
   s_arr202_arr dd 0 dup (0)
   s_arr202 dd offset s_arr202_arr
   s_arr218_arr dd 0 dup (0)
   s_arr218 dd offset s_arr218_arr
   s_arr234_arr dd 0 dup (0)
   s_arr234 dd offset s_arr234_arr
   s_arr250_arr dd 0 dup (0)
   s_arr250 dd offset s_arr250_arr
   s_arr266_arr dd 0 dup (0)
   s_arr266 dd offset s_arr266_arr
   s_arr282_arr dd 0 dup (0)
   s_arr282 dd offset s_arr282_arr
   s_arr298_arr dd 0 dup (0)
   s_arr298 dd offset s_arr298_arr
   s_arr314_arr dd 0 dup (0)
   s_arr314 dd offset s_arr314_arr
   s_arr330_arr dd 0 dup (0)
   s_arr330 dd offset s_arr330_arr
   s_arr346_arr dd 0 dup (0)
   s_arr346 dd offset s_arr346_arr
   s_arr362_arr dd 0 dup (0)
   s_arr362 dd offset s_arr362_arr
   s_arr378_arr dd 0 dup (0)
   s_arr378 dd offset s_arr378_arr
   s_arr394_arr dd 0 dup (0)
   s_arr394 dd offset s_arr394_arr
   s_arr410_arr dd 0 dup (0)
   s_arr410 dd offset s_arr410_arr
   s_arr426_arr dd 0 dup (0)
   s_arr426 dd offset s_arr426_arr
   s_arr442_arr dd 0 dup (0)
   s_arr442 dd offset s_arr442_arr
   s_arr458_arr dd 0 dup (0)
   s_arr458 dd offset s_arr458_arr
   s_arr474_arr dd 0 dup (0)
   s_arr474 dd offset s_arr474_arr
   s_arr490_arr dd 0 dup (0)
   s_arr490 dd offset s_arr490_arr
   s_arr506_arr dd 0 dup (0)
   s_arr506 dd offset s_arr506_arr
   s_arr522_arr dd 0 dup (0)
   s_arr522 dd offset s_arr522_arr
   s_arr538_arr dd 0 dup (0)
   s_arr538 dd offset s_arr538_arr
   s_arr554_arr dd 0 dup (0)
   s_arr554 dd offset s_arr554_arr
   s_arr570_arr dd 0 dup (0)
   s_arr570 dd offset s_arr570_arr
   s_arr586_arr dd 0 dup (0)
   s_arr586 dd offset s_arr586_arr
   s_arr602_arr dd 0 dup (0)
   s_arr602 dd offset s_arr602_arr
   s_arr618_arr dd 0 dup (0)
   s_arr618 dd offset s_arr618_arr
   s_arr634_arr dd 0 dup (0)
   s_arr634 dd offset s_arr634_arr
   s_arr650_arr dd 0 dup (0)
   s_arr650 dd offset s_arr650_arr
   s_arr666_arr dd 0 dup (0)
   s_arr666 dd offset s_arr666_arr
   s_arr682_arr dd 0 dup (0)
   s_arr682 dd offset s_arr682_arr
   s_arr698_arr dd 0 dup (0)
   s_arr698 dd offset s_arr698_arr
   s_arr714_arr dd 0 dup (0)
   s_arr714 dd offset s_arr714_arr
   s_arr730_arr dd 0 dup (0)
   s_arr730 dd offset s_arr730_arr
   s_arr746_arr dd 0 dup (0)
   s_arr746 dd offset s_arr746_arr
   s_arr762_arr dd 0 dup (0)
   s_arr762 dd offset s_arr762_arr
   s_arr778_arr dd 0 dup (0)
   s_arr778 dd offset s_arr778_arr
   s_arr794_arr dd 0 dup (0)
   s_arr794 dd offset s_arr794_arr
   s_arr810_arr dd 0 dup (0)
   s_arr810 dd offset s_arr810_arr
   s_arr826_arr dd 0 dup (0)
   s_arr826 dd offset s_arr826_arr
   s_arr842_arr dd 0 dup (0)
   s_arr842 dd offset s_arr842_arr
   s_arr858_arr dd 0 dup (0)
   s_arr858 dd offset s_arr858_arr
   s_arr874_arr dd 0 dup (0)
   s_arr874 dd offset s_arr874_arr
   s_arr890_arr dd 0 dup (0)
   s_arr890 dd offset s_arr890_arr
   s_arr906_arr dd 0 dup (0)
   s_arr906 dd offset s_arr906_arr
   s_arr922_arr dd 0 dup (0)
   s_arr922 dd offset s_arr922_arr
   s_arr938_arr dd 0 dup (0)
   s_arr938 dd offset s_arr938_arr
   s_arr954_arr dd 0 dup (0)
   s_arr954 dd offset s_arr954_arr
   s_arr970_arr dd 0 dup (0)
   s_arr970 dd offset s_arr970_arr
   s_arr986_arr dd 0 dup (0)
   s_arr986 dd offset s_arr986_arr
   s_arr1002_arr dd 0 dup (0)
   s_arr1002 dd offset s_arr1002_arr
   s_arr1018_arr dd 0 dup (0)
   s_arr1018 dd offset s_arr1018_arr
   s_arr1034_arr dd 0 dup (0)
   s_arr1034 dd offset s_arr1034_arr
   s_arr1050_arr dd 0 dup (0)
   s_arr1050 dd offset s_arr1050_arr
   s_arr1066_arr dd 0 dup (0)
   s_arr1066 dd offset s_arr1066_arr
   s_arr1082_arr dd 0 dup (0)
   s_arr1082 dd offset s_arr1082_arr
   s_arr1098_arr dd 0 dup (0)
   s_arr1098 dd offset s_arr1098_arr
   s_arr1114_arr dd 0 dup (0)
   s_arr1114 dd offset s_arr1114_arr
   s_arr1130_arr dd 0 dup (0)
   s_arr1130 dd offset s_arr1130_arr
   s_arr1146_arr dd 0 dup (0)
   s_arr1146 dd offset s_arr1146_arr
   s_arr1162_arr dd 0 dup (0)
   s_arr1162 dd offset s_arr1162_arr
   s_arr1178_arr dd 0 dup (0)
   s_arr1178 dd offset s_arr1178_arr
   s_arr1194_arr dd 0 dup (0)
   s_arr1194 dd offset s_arr1194_arr
   s_arr1210_arr dd 0 dup (0)
   s_arr1210 dd offset s_arr1210_arr
   s_arr1226_arr dd 0 dup (0)
   s_arr1226 dd offset s_arr1226_arr
   s_arr1242_arr dd 0 dup (0)
   s_arr1242 dd offset s_arr1242_arr
   s_arr1258_arr dd 0 dup (0)
   s_arr1258 dd offset s_arr1258_arr
   s_arr1274_arr dd 0 dup (0)
   s_arr1274 dd offset s_arr1274_arr
   s_arr1290_arr dd 0 dup (0)
   s_arr1290 dd offset s_arr1290_arr
   s_arr1306_arr dd 0 dup (0)
   s_arr1306 dd offset s_arr1306_arr
   s_arr1322_arr dd 0 dup (0)
   s_arr1322 dd offset s_arr1322_arr
   s_arr1338_arr dd 0 dup (0)
   s_arr1338 dd offset s_arr1338_arr
   s_arr1354_arr dd 0 dup (0)
   s_arr1354 dd offset s_arr1354_arr
   s_arr1370_arr dd 0 dup (0)
   s_arr1370 dd offset s_arr1370_arr
   s_arr1386_arr dd 0 dup (0)
   s_arr1386 dd offset s_arr1386_arr
   s_arr1402_arr dd 0 dup (0)
   s_arr1402 dd offset s_arr1402_arr
   s_arr1418_arr dd 0 dup (0)
   s_arr1418 dd offset s_arr1418_arr
   s_arr1434_arr dd 0 dup (0)
   s_arr1434 dd offset s_arr1434_arr
   s_arr1450_arr dd 0 dup (0)
   s_arr1450 dd offset s_arr1450_arr
   s_arr1466_arr dd 0 dup (0)
   s_arr1466 dd offset s_arr1466_arr
   s_arr1482_arr dd 0 dup (0)
   s_arr1482 dd offset s_arr1482_arr
   s_arr1498_arr dd 0 dup (0)
   s_arr1498 dd offset s_arr1498_arr
   s_arr1514_arr dd 0 dup (0)
   s_arr1514 dd offset s_arr1514_arr
   s_arr1530_arr dd 0 dup (0)
   s_arr1530 dd offset s_arr1530_arr
   s_arr1546_arr dd 0 dup (0)
   s_arr1546 dd offset s_arr1546_arr
   s_arr1562_arr dd 0 dup (0)
   s_arr1562 dd offset s_arr1562_arr
   s_arr1578_arr dd 0 dup (0)
   s_arr1578 dd offset s_arr1578_arr
   s_arr1594_arr dd 0 dup (0)
   s_arr1594 dd offset s_arr1594_arr
   s_arr1610_arr dd 0 dup (0)
   s_arr1610 dd offset s_arr1610_arr
   s_arr1626_arr dd 0 dup (0)
   s_arr1626 dd offset s_arr1626_arr
   s_arr1642_arr dd 0 dup (0)
   s_arr1642 dd offset s_arr1642_arr
   s_arr1658_arr dd 0 dup (0)
   s_arr1658 dd offset s_arr1658_arr
   s_arr1674_arr dd 0 dup (0)
   s_arr1674 dd offset s_arr1674_arr
   s_arr1690_arr dd 0 dup (0)
   s_arr1690 dd offset s_arr1690_arr
   s_arr1706_arr dd 0 dup (0)
   s_arr1706 dd offset s_arr1706_arr
   s_arr1722_arr dd 0 dup (0)
   s_arr1722 dd offset s_arr1722_arr
   s_arr1738_arr dd 0 dup (0)
   s_arr1738 dd offset s_arr1738_arr
   s_arr1754_arr dd 0 dup (0)
   s_arr1754 dd offset s_arr1754_arr
   s_arr1770_arr dd 0 dup (0)
   s_arr1770 dd offset s_arr1770_arr
   s_arr1786_arr dd 0 dup (0)
   s_arr1786 dd offset s_arr1786_arr
   s_arr1802_arr dd 0 dup (0)
   s_arr1802 dd offset s_arr1802_arr
   s_arr1818_arr dd 0 dup (0)
   s_arr1818 dd offset s_arr1818_arr
   s_arr1834_arr dd 0 dup (0)
   s_arr1834 dd offset s_arr1834_arr
   s_arr1850_arr dd 0 dup (0)
   s_arr1850 dd offset s_arr1850_arr
   s_arr1866_arr dd 0 dup (0)
   s_arr1866 dd offset s_arr1866_arr
   s_arr1882_arr dd 0 dup (0)
   s_arr1882 dd offset s_arr1882_arr
   s_arr1898_arr dd 0 dup (0)
   s_arr1898 dd offset s_arr1898_arr
   s_arr1914_arr dd 0 dup (0)
   s_arr1914 dd offset s_arr1914_arr
   s_arr1930_arr dd 0 dup (0)
   s_arr1930 dd offset s_arr1930_arr
   s_arr1946_arr dd 0 dup (0)
   s_arr1946 dd offset s_arr1946_arr
   s_arr1962_arr dd 0 dup (0)
   s_arr1962 dd offset s_arr1962_arr
   s_arr1978_arr dd 0 dup (0)
   s_arr1978 dd offset s_arr1978_arr
   s_arr1994_arr dd 0 dup (0)
   s_arr1994 dd offset s_arr1994_arr
   s_arr2010_arr dd 0 dup (0)
   s_arr2010 dd offset s_arr2010_arr
   s_arr2026_arr dd 0 dup (0)
   s_arr2026 dd offset s_arr2026_arr
   s_arr2042_arr dd 0 dup (0)
   s_arr2042 dd offset s_arr2042_arr
   s_arr2058_arr dd 0 dup (0)
   s_arr2058 dd offset s_arr2058_arr
   s_arr2074_arr dd 0 dup (0)
   s_arr2074 dd offset s_arr2074_arr
   s_arr2090_arr dd 0 dup (0)
   s_arr2090 dd offset s_arr2090_arr
   s_arr2106_arr dd 0 dup (0)
   s_arr2106 dd offset s_arr2106_arr
   s_arr2122_arr dd 0 dup (0)
   s_arr2122 dd offset s_arr2122_arr
   s_arr2138_arr dd 0 dup (0)
   s_arr2138 dd offset s_arr2138_arr
   s_arr2154_arr dd 0 dup (0)
   s_arr2154 dd offset s_arr2154_arr
   s_arr2170_arr dd 0 dup (0)
   s_arr2170 dd offset s_arr2170_arr
   s_arr2186_arr dd 0 dup (0)
   s_arr2186 dd offset s_arr2186_arr
   s_arr2202_arr dd 0 dup (0)
   s_arr2202 dd offset s_arr2202_arr
   s_arr2218_arr dd 0 dup (0)
   s_arr2218 dd offset s_arr2218_arr
   s_arr2234_arr dd 0 dup (0)
   s_arr2234 dd offset s_arr2234_arr
   s_arr2250_arr dd 0 dup (0)
   s_arr2250 dd offset s_arr2250_arr
   s_arr2266_arr dd 0 dup (0)
   s_arr2266 dd offset s_arr2266_arr
   s_arr2282_arr dd 0 dup (0)
   s_arr2282 dd offset s_arr2282_arr
   s_arr2298_arr dd 0 dup (0)
   s_arr2298 dd offset s_arr2298_arr
   s_arr2314_arr dd 0 dup (0)
   s_arr2314 dd offset s_arr2314_arr
   s_arr2330_arr dd 0 dup (0)
   s_arr2330 dd offset s_arr2330_arr
   s_arr2346_arr dd 0 dup (0)
   s_arr2346 dd offset s_arr2346_arr
   s_arr2362_arr dd 0 dup (0)
   s_arr2362 dd offset s_arr2362_arr
   s_arr2378_arr dd 0 dup (0)
   s_arr2378 dd offset s_arr2378_arr
   s_arr2394_arr dd 0 dup (0)
   s_arr2394 dd offset s_arr2394_arr
   s_arr2410_arr dd 0 dup (0)
   s_arr2410 dd offset s_arr2410_arr
   s_arr2426_arr dd 0 dup (0)
   s_arr2426 dd offset s_arr2426_arr
   s_arr2442_arr dd 0 dup (0)
   s_arr2442 dd offset s_arr2442_arr
   s_arr2458_arr dd 0 dup (0)
   s_arr2458 dd offset s_arr2458_arr
   s_arr2474_arr dd 0 dup (0)
   s_arr2474 dd offset s_arr2474_arr
   s_arr2490_arr dd 0 dup (0)
   s_arr2490 dd offset s_arr2490_arr
   s_arr2506_arr dd 0 dup (0)
   s_arr2506 dd offset s_arr2506_arr
   s_arr2522_arr dd 0 dup (0)
   s_arr2522 dd offset s_arr2522_arr
   s_arr2538_arr dd 0 dup (0)
   s_arr2538 dd offset s_arr2538_arr
   s_arr2554_arr dd 0 dup (0)
   s_arr2554 dd offset s_arr2554_arr
   s_arr2570_arr dd 0 dup (0)
   s_arr2570 dd offset s_arr2570_arr
   s_arr2586_arr dd 0 dup (0)
   s_arr2586 dd offset s_arr2586_arr
   s_arr2602_arr dd 0 dup (0)
   s_arr2602 dd offset s_arr2602_arr
   s_arr2618_arr dd 0 dup (0)
   s_arr2618 dd offset s_arr2618_arr
   s_arr2634_arr dd 0 dup (0)
   s_arr2634 dd offset s_arr2634_arr
   s_arr2650_arr dd 0 dup (0)
   s_arr2650 dd offset s_arr2650_arr
   s_arr2666_arr dd 0 dup (0)
   s_arr2666 dd offset s_arr2666_arr
   s_arr2682_arr dd 0 dup (0)
   s_arr2682 dd offset s_arr2682_arr
   s_arr2698_arr dd 0 dup (0)
   s_arr2698 dd offset s_arr2698_arr
   s_arr2714_arr dd 0 dup (0)
   s_arr2714 dd offset s_arr2714_arr
   s_arr2730_arr dd 0 dup (0)
   s_arr2730 dd offset s_arr2730_arr
   s_arr2746_arr dd 0 dup (0)
   s_arr2746 dd offset s_arr2746_arr
   s_arr2762_arr dd 0 dup (0)
   s_arr2762 dd offset s_arr2762_arr
   s_arr2778_arr dd 0 dup (0)
   s_arr2778 dd offset s_arr2778_arr
   s_arr2794_arr dd 0 dup (0)
   s_arr2794 dd offset s_arr2794_arr
   s_arr2810_arr dd 0 dup (0)
   s_arr2810 dd offset s_arr2810_arr
   s_arr2826_arr dd 0 dup (0)
   s_arr2826 dd offset s_arr2826_arr
   s_arr2842_arr dd 0 dup (0)
   s_arr2842 dd offset s_arr2842_arr
   s_arr2858_arr dd 0 dup (0)
   s_arr2858 dd offset s_arr2858_arr
   s_arr2874_arr dd 0 dup (0)
   s_arr2874 dd offset s_arr2874_arr
   s_arr2890_arr dd 0 dup (0)
   s_arr2890 dd offset s_arr2890_arr
   s_arr2906_arr dd 0 dup (0)
   s_arr2906 dd offset s_arr2906_arr
   s_arr2922_arr dd 0 dup (0)
   s_arr2922 dd offset s_arr2922_arr
   s_arr2938_arr dd 0 dup (0)
   s_arr2938 dd offset s_arr2938_arr
   s_arr2954_arr dd 0 dup (0)
   s_arr2954 dd offset s_arr2954_arr
   s_arr2970_arr dd 0 dup (0)
   s_arr2970 dd offset s_arr2970_arr
   s_arr2986_arr dd 0 dup (0)
   s_arr2986 dd offset s_arr2986_arr
   s_arr3002_arr dd 0 dup (0)
   s_arr3002 dd offset s_arr3002_arr
   s_arr3018_arr dd 0 dup (0)
   s_arr3018 dd offset s_arr3018_arr
   s_arr3034_arr dd 0 dup (0)
   s_arr3034 dd offset s_arr3034_arr
   s_arr3050_arr dd 0 dup (0)
   s_arr3050 dd offset s_arr3050_arr
   s_arr3066_arr dd 0 dup (0)
   s_arr3066 dd offset s_arr3066_arr
   s_arr3082_arr dd 0 dup (0)
   s_arr3082 dd offset s_arr3082_arr
   s_arr3098_arr dd 0 dup (0)
   s_arr3098 dd offset s_arr3098_arr
   s_arr3114_arr dd 0 dup (0)
   s_arr3114 dd offset s_arr3114_arr
   s_arr3130_arr dd 0 dup (0)
   s_arr3130 dd offset s_arr3130_arr
   s_arr3146_arr dd 0 dup (0)
   s_arr3146 dd offset s_arr3146_arr
   s_arr3162_arr dd 0 dup (0)
   s_arr3162 dd offset s_arr3162_arr
   s_arr3178_arr dd 0 dup (0)
   s_arr3178 dd offset s_arr3178_arr
   s_arr3194_arr dd 0 dup (0)
   s_arr3194 dd offset s_arr3194_arr
   s_arr3210_arr dd 0 dup (0)
   s_arr3210 dd offset s_arr3210_arr
   s_arr3226_arr dd 0 dup (0)
   s_arr3226 dd offset s_arr3226_arr
   s_arr3242_arr dd 0 dup (0)
   s_arr3242 dd offset s_arr3242_arr
   s_arr3258_arr dd 0 dup (0)
   s_arr3258 dd offset s_arr3258_arr
   s_arr3274_arr dd 0 dup (0)
   s_arr3274 dd offset s_arr3274_arr
   s_arr3290_arr dd 0 dup (0)
   s_arr3290 dd offset s_arr3290_arr
   s_arr3306_arr dd 0 dup (0)
   s_arr3306 dd offset s_arr3306_arr
   s_arr3322_arr dd 0 dup (0)
   s_arr3322 dd offset s_arr3322_arr
   s_arr3338_arr dd 0 dup (0)
   s_arr3338 dd offset s_arr3338_arr
   s_arr3354_arr dd 0 dup (0)
   s_arr3354 dd offset s_arr3354_arr
   s_arr3370_arr dd 0 dup (0)
   s_arr3370 dd offset s_arr3370_arr
   s_arr3386_arr dd 0 dup (0)
   s_arr3386 dd offset s_arr3386_arr
   s_arr3402_arr dd 0 dup (0)
   s_arr3402 dd offset s_arr3402_arr
   s_arr3418_arr dd 0 dup (0)
   s_arr3418 dd offset s_arr3418_arr
   s_arr3434_arr dd 0 dup (0)
   s_arr3434 dd offset s_arr3434_arr
   s_arr3450_arr dd 0 dup (0)
   s_arr3450 dd offset s_arr3450_arr
   s_arr3466_arr dd 0 dup (0)
   s_arr3466 dd offset s_arr3466_arr
   s_arr3482_arr dd 0 dup (0)
   s_arr3482 dd offset s_arr3482_arr
   s_arr3498_arr dd 0 dup (0)
   s_arr3498 dd offset s_arr3498_arr
   s_arr3514_arr dd 0 dup (0)
   s_arr3514 dd offset s_arr3514_arr
   s_arr3530_arr dd 0 dup (0)
   s_arr3530 dd offset s_arr3530_arr
   s_arr3546_arr dd 0 dup (0)
   s_arr3546 dd offset s_arr3546_arr
   s_arr3562_arr dd 0 dup (0)
   s_arr3562 dd offset s_arr3562_arr
   s_arr3578_arr dd 0 dup (0)
   s_arr3578 dd offset s_arr3578_arr
   s_arr3594_arr dd 0 dup (0)
   s_arr3594 dd offset s_arr3594_arr
   s_arr3610_arr dd 0 dup (0)
   s_arr3610 dd offset s_arr3610_arr
   s_arr3626_arr dd 0 dup (0)
   s_arr3626 dd offset s_arr3626_arr
   s_arr3642_arr dd 0 dup (0)
   s_arr3642 dd offset s_arr3642_arr
   s_arr3658_arr dd 0 dup (0)
   s_arr3658 dd offset s_arr3658_arr
   s_arr3674_arr dd 0 dup (0)
   s_arr3674 dd offset s_arr3674_arr
   s_arr3690_arr dd 0 dup (0)
   s_arr3690 dd offset s_arr3690_arr
   s_arr3706_arr dd 0 dup (0)
   s_arr3706 dd offset s_arr3706_arr
   s_arr3722_arr dd 0 dup (0)
   s_arr3722 dd offset s_arr3722_arr
   s_arr3738_arr dd 0 dup (0)
   s_arr3738 dd offset s_arr3738_arr
   s_arr3754_arr dd 0 dup (0)
   s_arr3754 dd offset s_arr3754_arr
   s_arr3770_arr dd 0 dup (0)
   s_arr3770 dd offset s_arr3770_arr
   s_arr3786_arr dd 0 dup (0)
   s_arr3786 dd offset s_arr3786_arr
   s_arr3802_arr dd 0 dup (0)
   s_arr3802 dd offset s_arr3802_arr
   s_arr3818_arr dd 0 dup (0)
   s_arr3818 dd offset s_arr3818_arr
   s_arr3834_arr dd 0 dup (0)
   s_arr3834 dd offset s_arr3834_arr
   s_arr3850_arr dd 0 dup (0)
   s_arr3850 dd offset s_arr3850_arr
   s_arr3866_arr dd 0 dup (0)
   s_arr3866 dd offset s_arr3866_arr
   s_arr3882_arr dd 0 dup (0)
   s_arr3882 dd offset s_arr3882_arr
   s_arr3898_arr dd 0 dup (0)
   s_arr3898 dd offset s_arr3898_arr
   s_arr3914_arr dd 0 dup (0)
   s_arr3914 dd offset s_arr3914_arr
   s_arr3930_arr dd 0 dup (0)
   s_arr3930 dd offset s_arr3930_arr
   s_arr3946_arr dd 0 dup (0)
   s_arr3946 dd offset s_arr3946_arr
   s_arr3962_arr dd 0 dup (0)
   s_arr3962 dd offset s_arr3962_arr
   s_arr3978_arr dd 0 dup (0)
   s_arr3978 dd offset s_arr3978_arr
   s_arr3994_arr dd 0 dup (0)
   s_arr3994 dd offset s_arr3994_arr
   s_arr4010_arr dd 0 dup (0)
   s_arr4010 dd offset s_arr4010_arr
   s_arr4026_arr dd 0 dup (0)
   s_arr4026 dd offset s_arr4026_arr
   s_arr4042_arr dd 0 dup (0)
   s_arr4042 dd offset s_arr4042_arr
   s_arr4058_arr dd 0 dup (0)
   s_arr4058 dd offset s_arr4058_arr
   s_arr4074_arr dd 0 dup (0)
   s_arr4074 dd offset s_arr4074_arr
   s_arr4090_arr dd 0 dup (0)
   s_arr4090 dd offset s_arr4090_arr
   s_arr4106_arr dd 0 dup (0)
   s_arr4106 dd offset s_arr4106_arr
   s_arr4122_arr dd 0 dup (0)
   s_arr4122 dd offset s_arr4122_arr
   s_arr4138_arr dd 0 dup (0)
   s_arr4138 dd offset s_arr4138_arr
   s_arr4154_arr dd 0 dup (0)
   s_arr4154 dd offset s_arr4154_arr
   s_arr4170_arr dd 0 dup (0)
   s_arr4170 dd offset s_arr4170_arr
   s_arr4186_arr dd 0 dup (0)
   s_arr4186 dd offset s_arr4186_arr
   s_arr4202_arr dd 0 dup (0)
   s_arr4202 dd offset s_arr4202_arr
   s_arr4218_arr dd 0 dup (0)
   s_arr4218 dd offset s_arr4218_arr
   s_arr4234_arr dd 0 dup (0)
   s_arr4234 dd offset s_arr4234_arr
   s_arr4250_arr dd 0 dup (0)
   s_arr4250 dd offset s_arr4250_arr
   s_arr4266_arr dd 0 dup (0)
   s_arr4266 dd offset s_arr4266_arr
   s_arr4282_arr dd 0 dup (0)
   s_arr4282 dd offset s_arr4282_arr
   s_arr4298_arr dd 0 dup (0)
   s_arr4298 dd offset s_arr4298_arr
   s_arr4314_arr dd 0 dup (0)
   s_arr4314 dd offset s_arr4314_arr
   s_arr4330_arr dd 0 dup (0)
   s_arr4330 dd offset s_arr4330_arr
   s_arr4346_arr dd 0 dup (0)
   s_arr4346 dd offset s_arr4346_arr
   s_arr4362_arr dd 0 dup (0)
   s_arr4362 dd offset s_arr4362_arr
   s_arr4378_arr dd 0 dup (0)
   s_arr4378 dd offset s_arr4378_arr
   s_arr4394_arr dd 0 dup (0)
   s_arr4394 dd offset s_arr4394_arr
   s_arr4410_arr dd 0 dup (0)
   s_arr4410 dd offset s_arr4410_arr
   s_arr4426_arr dd 0 dup (0)
   s_arr4426 dd offset s_arr4426_arr
   s_arr4442_arr dd 0 dup (0)
   s_arr4442 dd offset s_arr4442_arr
   s_arr4458_arr dd 0 dup (0)
   s_arr4458 dd offset s_arr4458_arr
   s_arr4474_arr dd 0 dup (0)
   s_arr4474 dd offset s_arr4474_arr
   s_arr4490_arr dd 0 dup (0)
   s_arr4490 dd offset s_arr4490_arr
   s_arr4506_arr dd 0 dup (0)
   s_arr4506 dd offset s_arr4506_arr
   s_arr4522_arr dd 0 dup (0)
   s_arr4522 dd offset s_arr4522_arr
   s_arr4538_arr dd 0 dup (0)
   s_arr4538 dd offset s_arr4538_arr
   s_arr4554_arr dd 0 dup (0)
   s_arr4554 dd offset s_arr4554_arr
   s_arr4570_arr dd 0 dup (0)
   s_arr4570 dd offset s_arr4570_arr
   s_arr4586_arr dd 0 dup (0)
   s_arr4586 dd offset s_arr4586_arr
   s_arr4602_arr dd 0 dup (0)
   s_arr4602 dd offset s_arr4602_arr
   s_arr4618_arr dd 0 dup (0)
   s_arr4618 dd offset s_arr4618_arr
   s_arr4634_arr dd 0 dup (0)
   s_arr4634 dd offset s_arr4634_arr
   s_arr4650_arr dd 0 dup (0)
   s_arr4650 dd offset s_arr4650_arr
   s_arr4666_arr dd 0 dup (0)
   s_arr4666 dd offset s_arr4666_arr
   s_arr4682_arr dd 0 dup (0)
   s_arr4682 dd offset s_arr4682_arr
   s_arr4698_arr dd 0 dup (0)
   s_arr4698 dd offset s_arr4698_arr
   s_arr4714_arr dd 0 dup (0)
   s_arr4714 dd offset s_arr4714_arr
   s_arr4730_arr dd 0 dup (0)
   s_arr4730 dd offset s_arr4730_arr
   s_arr4746_arr dd 0 dup (0)
   s_arr4746 dd offset s_arr4746_arr
   s_arr4762_arr dd 0 dup (0)
   s_arr4762 dd offset s_arr4762_arr
   s_arr4778_arr dd 0 dup (0)
   s_arr4778 dd offset s_arr4778_arr
   s_arr4794_arr dd 0 dup (0)
   s_arr4794 dd offset s_arr4794_arr
   s_arr4810_arr dd 0 dup (0)
   s_arr4810 dd offset s_arr4810_arr
   s_arr4826_arr dd 0 dup (0)
   s_arr4826 dd offset s_arr4826_arr
   s_arr4842_arr dd 0 dup (0)
   s_arr4842 dd offset s_arr4842_arr
   s_arr4858_arr dd 0 dup (0)
   s_arr4858 dd offset s_arr4858_arr
   s_arr4874_arr dd 0 dup (0)
   s_arr4874 dd offset s_arr4874_arr
   s_arr4890_arr dd 0 dup (0)
   s_arr4890 dd offset s_arr4890_arr
   s_arr4906_arr dd 0 dup (0)
   s_arr4906 dd offset s_arr4906_arr
   s_arr4922_arr dd 0 dup (0)
   s_arr4922 dd offset s_arr4922_arr
   s_arr4938_arr dd 0 dup (0)
   s_arr4938 dd offset s_arr4938_arr
   s_arr4954_arr dd 0 dup (0)
   s_arr4954 dd offset s_arr4954_arr
   s_arr4970_arr dd 0 dup (0)
   s_arr4970 dd offset s_arr4970_arr
   s_arr4986_arr dd 0 dup (0)
   s_arr4986 dd offset s_arr4986_arr
   s_arr5002_arr dd 0 dup (0)
   s_arr5002 dd offset s_arr5002_arr
   s_arr5018_arr dd 0 dup (0)
   s_arr5018 dd offset s_arr5018_arr
   s_arr5034_arr dd 0 dup (0)
   s_arr5034 dd offset s_arr5034_arr
   s_arr5050_arr dd 0 dup (0)
   s_arr5050 dd offset s_arr5050_arr
   s_arr5066_arr dd 0 dup (0)
   s_arr5066 dd offset s_arr5066_arr
   s_arr5082_arr dd 0 dup (0)
   s_arr5082 dd offset s_arr5082_arr
   s_arr5098_arr dd 0 dup (0)
   s_arr5098 dd offset s_arr5098_arr
   s_arr5114_arr dd 0 dup (0)
   s_arr5114 dd offset s_arr5114_arr
   s_arr5130_arr dd 0 dup (0)
   s_arr5130 dd offset s_arr5130_arr
   s_arr5146_arr dd 0 dup (0)
   s_arr5146 dd offset s_arr5146_arr
   s_arr5162_arr dd 0 dup (0)
   s_arr5162 dd offset s_arr5162_arr
   s_arr5178_arr dd 0 dup (0)
   s_arr5178 dd offset s_arr5178_arr
   s_arr5194_arr dd 0 dup (0)
   s_arr5194 dd offset s_arr5194_arr
   s_arr5210_arr dd 0 dup (0)
   s_arr5210 dd offset s_arr5210_arr
   s_arr5226_arr dd 0 dup (0)
   s_arr5226 dd offset s_arr5226_arr
   s_arr5242_arr dd 0 dup (0)
   s_arr5242 dd offset s_arr5242_arr
   s_arr5258_arr dd 0 dup (0)
   s_arr5258 dd offset s_arr5258_arr
   s_arr5274_arr dd 0 dup (0)
   s_arr5274 dd offset s_arr5274_arr
   s_arr5290_arr dd 0 dup (0)
   s_arr5290 dd offset s_arr5290_arr
   s_arr5306_arr dd 0 dup (0)
   s_arr5306 dd offset s_arr5306_arr
   s_arr5322_arr dd 0 dup (0)
   s_arr5322 dd offset s_arr5322_arr
   s_arr5338_arr dd 0 dup (0)
   s_arr5338 dd offset s_arr5338_arr
   s_arr5354_arr dd 0 dup (0)
   s_arr5354 dd offset s_arr5354_arr
   s_arr5370_arr dd 0 dup (0)
   s_arr5370 dd offset s_arr5370_arr
   s_arr5386_arr dd 0 dup (0)
   s_arr5386 dd offset s_arr5386_arr
   s_arr5402_arr dd 0 dup (0)
   s_arr5402 dd offset s_arr5402_arr
   s_arr5418_arr dd 0 dup (0)
   s_arr5418 dd offset s_arr5418_arr
   s_arr5434_arr dd 0 dup (0)
   s_arr5434 dd offset s_arr5434_arr
   arr1_arr dd 10,4,2,14,67,2,11,33,1,15
   arr1 dd offset arr1_arr
; Global variable END

   print_format db "%d ", 0
   println_format db "%s", 0
   input_format db "%d", 0
   input_result dd 0
   sqrt_result dd 0

data ends

text segment

left14 = -4 ; size = 4
right14 = -8 ; size = 4
middle14 = -12 ; size = 4
tmp25 = -16 ; size = 4
left30 = -4 ; size = 4
right30 = -8 ; size = 4
middle30 = -12 ; size = 4
tmp41 = -16 ; size = 4
left46 = -4 ; size = 4
right46 = -8 ; size = 4
middle46 = -12 ; size = 4
tmp57 = -16 ; size = 4
left62 = -4 ; size = 4
right62 = -8 ; size = 4
middle62 = -12 ; size = 4
tmp73 = -16 ; size = 4
left78 = -4 ; size = 4
right78 = -8 ; size = 4
middle78 = -12 ; size = 4
tmp89 = -16 ; size = 4
left94 = -4 ; size = 4
right94 = -8 ; size = 4
middle94 = -12 ; size = 4
tmp105 = -16 ; size = 4
left110 = -4 ; size = 4
right110 = -8 ; size = 4
middle110 = -12 ; size = 4
tmp121 = -16 ; size = 4
left126 = -4 ; size = 4
right126 = -8 ; size = 4
middle126 = -12 ; size = 4
tmp137 = -16 ; size = 4
left142 = -4 ; size = 4
right142 = -8 ; size = 4
middle142 = -12 ; size = 4
tmp153 = -16 ; size = 4
left158 = -4 ; size = 4
right158 = -8 ; size = 4
middle158 = -12 ; size = 4
tmp169 = -16 ; size = 4
left174 = -4 ; size = 4
right174 = -8 ; size = 4
middle174 = -12 ; size = 4
tmp185 = -16 ; size = 4
left190 = -4 ; size = 4
right190 = -8 ; size = 4
middle190 = -12 ; size = 4
tmp201 = -16 ; size = 4
left206 = -4 ; size = 4
right206 = -8 ; size = 4
middle206 = -12 ; size = 4
tmp217 = -16 ; size = 4
left222 = -4 ; size = 4
right222 = -8 ; size = 4
middle222 = -12 ; size = 4
tmp233 = -16 ; size = 4
left238 = -4 ; size = 4
right238 = -8 ; size = 4
middle238 = -12 ; size = 4
tmp249 = -16 ; size = 4
left254 = -4 ; size = 4
right254 = -8 ; size = 4
middle254 = -12 ; size = 4
tmp265 = -16 ; size = 4
left270 = -4 ; size = 4
right270 = -8 ; size = 4
middle270 = -12 ; size = 4
tmp281 = -16 ; size = 4
left286 = -4 ; size = 4
right286 = -8 ; size = 4
middle286 = -12 ; size = 4
tmp297 = -16 ; size = 4
left302 = -4 ; size = 4
right302 = -8 ; size = 4
middle302 = -12 ; size = 4
tmp313 = -16 ; size = 4
left318 = -4 ; size = 4
right318 = -8 ; size = 4
middle318 = -12 ; size = 4
tmp329 = -16 ; size = 4
left334 = -4 ; size = 4
right334 = -8 ; size = 4
middle334 = -12 ; size = 4
tmp345 = -16 ; size = 4
left350 = -4 ; size = 4
right350 = -8 ; size = 4
middle350 = -12 ; size = 4
tmp361 = -16 ; size = 4
left366 = -4 ; size = 4
right366 = -8 ; size = 4
middle366 = -12 ; size = 4
tmp377 = -16 ; size = 4
left382 = -4 ; size = 4
right382 = -8 ; size = 4
middle382 = -12 ; size = 4
tmp393 = -16 ; size = 4
left398 = -4 ; size = 4
right398 = -8 ; size = 4
middle398 = -12 ; size = 4
tmp409 = -16 ; size = 4
left414 = -4 ; size = 4
right414 = -8 ; size = 4
middle414 = -12 ; size = 4
tmp425 = -16 ; size = 4
left430 = -4 ; size = 4
right430 = -8 ; size = 4
middle430 = -12 ; size = 4
tmp441 = -16 ; size = 4
left446 = -4 ; size = 4
right446 = -8 ; size = 4
middle446 = -12 ; size = 4
tmp457 = -16 ; size = 4
left462 = -4 ; size = 4
right462 = -8 ; size = 4
middle462 = -12 ; size = 4
tmp473 = -16 ; size = 4
left478 = -4 ; size = 4
right478 = -8 ; size = 4
middle478 = -12 ; size = 4
tmp489 = -16 ; size = 4
left494 = -4 ; size = 4
right494 = -8 ; size = 4
middle494 = -12 ; size = 4
tmp505 = -16 ; size = 4
left510 = -4 ; size = 4
right510 = -8 ; size = 4
middle510 = -12 ; size = 4
tmp521 = -16 ; size = 4
left526 = -4 ; size = 4
right526 = -8 ; size = 4
middle526 = -12 ; size = 4
tmp537 = -16 ; size = 4
left542 = -4 ; size = 4
right542 = -8 ; size = 4
middle542 = -12 ; size = 4
tmp553 = -16 ; size = 4
left558 = -4 ; size = 4
right558 = -8 ; size = 4
middle558 = -12 ; size = 4
tmp569 = -16 ; size = 4
left574 = -4 ; size = 4
right574 = -8 ; size = 4
middle574 = -12 ; size = 4
tmp585 = -16 ; size = 4
left590 = -4 ; size = 4
right590 = -8 ; size = 4
middle590 = -12 ; size = 4
tmp601 = -16 ; size = 4
left606 = -4 ; size = 4
right606 = -8 ; size = 4
middle606 = -12 ; size = 4
tmp617 = -16 ; size = 4
left622 = -4 ; size = 4
right622 = -8 ; size = 4
middle622 = -12 ; size = 4
tmp633 = -16 ; size = 4
left638 = -4 ; size = 4
right638 = -8 ; size = 4
middle638 = -12 ; size = 4
tmp649 = -16 ; size = 4
left654 = -4 ; size = 4
right654 = -8 ; size = 4
middle654 = -12 ; size = 4
tmp665 = -16 ; size = 4
left670 = -4 ; size = 4
right670 = -8 ; size = 4
middle670 = -12 ; size = 4
tmp681 = -16 ; size = 4
left686 = -4 ; size = 4
right686 = -8 ; size = 4
middle686 = -12 ; size = 4
tmp697 = -16 ; size = 4
left702 = -4 ; size = 4
right702 = -8 ; size = 4
middle702 = -12 ; size = 4
tmp713 = -16 ; size = 4
left718 = -4 ; size = 4
right718 = -8 ; size = 4
middle718 = -12 ; size = 4
tmp729 = -16 ; size = 4
left734 = -4 ; size = 4
right734 = -8 ; size = 4
middle734 = -12 ; size = 4
tmp745 = -16 ; size = 4
left750 = -4 ; size = 4
right750 = -8 ; size = 4
middle750 = -12 ; size = 4
tmp761 = -16 ; size = 4
left766 = -4 ; size = 4
right766 = -8 ; size = 4
middle766 = -12 ; size = 4
tmp777 = -16 ; size = 4
left782 = -4 ; size = 4
right782 = -8 ; size = 4
middle782 = -12 ; size = 4
tmp793 = -16 ; size = 4
left798 = -4 ; size = 4
right798 = -8 ; size = 4
middle798 = -12 ; size = 4
tmp809 = -16 ; size = 4
left814 = -4 ; size = 4
right814 = -8 ; size = 4
middle814 = -12 ; size = 4
tmp825 = -16 ; size = 4
left830 = -4 ; size = 4
right830 = -8 ; size = 4
middle830 = -12 ; size = 4
tmp841 = -16 ; size = 4
left846 = -4 ; size = 4
right846 = -8 ; size = 4
middle846 = -12 ; size = 4
tmp857 = -16 ; size = 4
left862 = -4 ; size = 4
right862 = -8 ; size = 4
middle862 = -12 ; size = 4
tmp873 = -16 ; size = 4
left878 = -4 ; size = 4
right878 = -8 ; size = 4
middle878 = -12 ; size = 4
tmp889 = -16 ; size = 4
left894 = -4 ; size = 4
right894 = -8 ; size = 4
middle894 = -12 ; size = 4
tmp905 = -16 ; size = 4
left910 = -4 ; size = 4
right910 = -8 ; size = 4
middle910 = -12 ; size = 4
tmp921 = -16 ; size = 4
left926 = -4 ; size = 4
right926 = -8 ; size = 4
middle926 = -12 ; size = 4
tmp937 = -16 ; size = 4
left942 = -4 ; size = 4
right942 = -8 ; size = 4
middle942 = -12 ; size = 4
tmp953 = -16 ; size = 4
left958 = -4 ; size = 4
right958 = -8 ; size = 4
middle958 = -12 ; size = 4
tmp969 = -16 ; size = 4
left974 = -4 ; size = 4
right974 = -8 ; size = 4
middle974 = -12 ; size = 4
tmp985 = -16 ; size = 4
left990 = -4 ; size = 4
right990 = -8 ; size = 4
middle990 = -12 ; size = 4
tmp1001 = -16 ; size = 4
left1006 = -4 ; size = 4
right1006 = -8 ; size = 4
middle1006 = -12 ; size = 4
tmp1017 = -16 ; size = 4
left1022 = -4 ; size = 4
right1022 = -8 ; size = 4
middle1022 = -12 ; size = 4
tmp1033 = -16 ; size = 4
left1038 = -4 ; size = 4
right1038 = -8 ; size = 4
middle1038 = -12 ; size = 4
tmp1049 = -16 ; size = 4
left1054 = -4 ; size = 4
right1054 = -8 ; size = 4
middle1054 = -12 ; size = 4
tmp1065 = -16 ; size = 4
left1070 = -4 ; size = 4
right1070 = -8 ; size = 4
middle1070 = -12 ; size = 4
tmp1081 = -16 ; size = 4
left1086 = -4 ; size = 4
right1086 = -8 ; size = 4
middle1086 = -12 ; size = 4
tmp1097 = -16 ; size = 4
left1102 = -4 ; size = 4
right1102 = -8 ; size = 4
middle1102 = -12 ; size = 4
tmp1113 = -16 ; size = 4
left1118 = -4 ; size = 4
right1118 = -8 ; size = 4
middle1118 = -12 ; size = 4
tmp1129 = -16 ; size = 4
left1134 = -4 ; size = 4
right1134 = -8 ; size = 4
middle1134 = -12 ; size = 4
tmp1145 = -16 ; size = 4
left1150 = -4 ; size = 4
right1150 = -8 ; size = 4
middle1150 = -12 ; size = 4
tmp1161 = -16 ; size = 4
left1166 = -4 ; size = 4
right1166 = -8 ; size = 4
middle1166 = -12 ; size = 4
tmp1177 = -16 ; size = 4
left1182 = -4 ; size = 4
right1182 = -8 ; size = 4
middle1182 = -12 ; size = 4
tmp1193 = -16 ; size = 4
left1198 = -4 ; size = 4
right1198 = -8 ; size = 4
middle1198 = -12 ; size = 4
tmp1209 = -16 ; size = 4
left1214 = -4 ; size = 4
right1214 = -8 ; size = 4
middle1214 = -12 ; size = 4
tmp1225 = -16 ; size = 4
left1230 = -4 ; size = 4
right1230 = -8 ; size = 4
middle1230 = -12 ; size = 4
tmp1241 = -16 ; size = 4
left1246 = -4 ; size = 4
right1246 = -8 ; size = 4
middle1246 = -12 ; size = 4
tmp1257 = -16 ; size = 4
left1262 = -4 ; size = 4
right1262 = -8 ; size = 4
middle1262 = -12 ; size = 4
tmp1273 = -16 ; size = 4
left1278 = -4 ; size = 4
right1278 = -8 ; size = 4
middle1278 = -12 ; size = 4
tmp1289 = -16 ; size = 4
left1294 = -4 ; size = 4
right1294 = -8 ; size = 4
middle1294 = -12 ; size = 4
tmp1305 = -16 ; size = 4
left1310 = -4 ; size = 4
right1310 = -8 ; size = 4
middle1310 = -12 ; size = 4
tmp1321 = -16 ; size = 4
left1326 = -4 ; size = 4
right1326 = -8 ; size = 4
middle1326 = -12 ; size = 4
tmp1337 = -16 ; size = 4
left1342 = -4 ; size = 4
right1342 = -8 ; size = 4
middle1342 = -12 ; size = 4
tmp1353 = -16 ; size = 4
left1358 = -4 ; size = 4
right1358 = -8 ; size = 4
middle1358 = -12 ; size = 4
tmp1369 = -16 ; size = 4
left1374 = -4 ; size = 4
right1374 = -8 ; size = 4
middle1374 = -12 ; size = 4
tmp1385 = -16 ; size = 4
left1390 = -4 ; size = 4
right1390 = -8 ; size = 4
middle1390 = -12 ; size = 4
tmp1401 = -16 ; size = 4
left1406 = -4 ; size = 4
right1406 = -8 ; size = 4
middle1406 = -12 ; size = 4
tmp1417 = -16 ; size = 4
left1422 = -4 ; size = 4
right1422 = -8 ; size = 4
middle1422 = -12 ; size = 4
tmp1433 = -16 ; size = 4
left1438 = -4 ; size = 4
right1438 = -8 ; size = 4
middle1438 = -12 ; size = 4
tmp1449 = -16 ; size = 4
left1454 = -4 ; size = 4
right1454 = -8 ; size = 4
middle1454 = -12 ; size = 4
tmp1465 = -16 ; size = 4
left1470 = -4 ; size = 4
right1470 = -8 ; size = 4
middle1470 = -12 ; size = 4
tmp1481 = -16 ; size = 4
left1486 = -4 ; size = 4
right1486 = -8 ; size = 4
middle1486 = -12 ; size = 4
tmp1497 = -16 ; size = 4
left1502 = -4 ; size = 4
right1502 = -8 ; size = 4
middle1502 = -12 ; size = 4
tmp1513 = -16 ; size = 4
left1518 = -4 ; size = 4
right1518 = -8 ; size = 4
middle1518 = -12 ; size = 4
tmp1529 = -16 ; size = 4
left1534 = -4 ; size = 4
right1534 = -8 ; size = 4
middle1534 = -12 ; size = 4
tmp1545 = -16 ; size = 4
left1550 = -4 ; size = 4
right1550 = -8 ; size = 4
middle1550 = -12 ; size = 4
tmp1561 = -16 ; size = 4
left1566 = -4 ; size = 4
right1566 = -8 ; size = 4
middle1566 = -12 ; size = 4
tmp1577 = -16 ; size = 4
left1582 = -4 ; size = 4
right1582 = -8 ; size = 4
middle1582 = -12 ; size = 4
tmp1593 = -16 ; size = 4
left1598 = -4 ; size = 4
right1598 = -8 ; size = 4
middle1598 = -12 ; size = 4
tmp1609 = -16 ; size = 4
left1614 = -4 ; size = 4
right1614 = -8 ; size = 4
middle1614 = -12 ; size = 4
tmp1625 = -16 ; size = 4
left1630 = -4 ; size = 4
right1630 = -8 ; size = 4
middle1630 = -12 ; size = 4
tmp1641 = -16 ; size = 4
left1646 = -4 ; size = 4
right1646 = -8 ; size = 4
middle1646 = -12 ; size = 4
tmp1657 = -16 ; size = 4
left1662 = -4 ; size = 4
right1662 = -8 ; size = 4
middle1662 = -12 ; size = 4
tmp1673 = -16 ; size = 4
left1678 = -4 ; size = 4
right1678 = -8 ; size = 4
middle1678 = -12 ; size = 4
tmp1689 = -16 ; size = 4
left1694 = -4 ; size = 4
right1694 = -8 ; size = 4
middle1694 = -12 ; size = 4
tmp1705 = -16 ; size = 4
left1710 = -4 ; size = 4
right1710 = -8 ; size = 4
middle1710 = -12 ; size = 4
tmp1721 = -16 ; size = 4
left1726 = -4 ; size = 4
right1726 = -8 ; size = 4
middle1726 = -12 ; size = 4
tmp1737 = -16 ; size = 4
left1742 = -4 ; size = 4
right1742 = -8 ; size = 4
middle1742 = -12 ; size = 4
tmp1753 = -16 ; size = 4
left1758 = -4 ; size = 4
right1758 = -8 ; size = 4
middle1758 = -12 ; size = 4
tmp1769 = -16 ; size = 4
left1774 = -4 ; size = 4
right1774 = -8 ; size = 4
middle1774 = -12 ; size = 4
tmp1785 = -16 ; size = 4
left1790 = -4 ; size = 4
right1790 = -8 ; size = 4
middle1790 = -12 ; size = 4
tmp1801 = -16 ; size = 4
left1806 = -4 ; size = 4
right1806 = -8 ; size = 4
middle1806 = -12 ; size = 4
tmp1817 = -16 ; size = 4
left1822 = -4 ; size = 4
right1822 = -8 ; size = 4
middle1822 = -12 ; size = 4
tmp1833 = -16 ; size = 4
left1838 = -4 ; size = 4
right1838 = -8 ; size = 4
middle1838 = -12 ; size = 4
tmp1849 = -16 ; size = 4
left1854 = -4 ; size = 4
right1854 = -8 ; size = 4
middle1854 = -12 ; size = 4
tmp1865 = -16 ; size = 4
left1870 = -4 ; size = 4
right1870 = -8 ; size = 4
middle1870 = -12 ; size = 4
tmp1881 = -16 ; size = 4
left1886 = -4 ; size = 4
right1886 = -8 ; size = 4
middle1886 = -12 ; size = 4
tmp1897 = -16 ; size = 4
left1902 = -4 ; size = 4
right1902 = -8 ; size = 4
middle1902 = -12 ; size = 4
tmp1913 = -16 ; size = 4
left1918 = -4 ; size = 4
right1918 = -8 ; size = 4
middle1918 = -12 ; size = 4
tmp1929 = -16 ; size = 4
left1934 = -4 ; size = 4
right1934 = -8 ; size = 4
middle1934 = -12 ; size = 4
tmp1945 = -16 ; size = 4
left1950 = -4 ; size = 4
right1950 = -8 ; size = 4
middle1950 = -12 ; size = 4
tmp1961 = -16 ; size = 4
left1966 = -4 ; size = 4
right1966 = -8 ; size = 4
middle1966 = -12 ; size = 4
tmp1977 = -16 ; size = 4
left1982 = -4 ; size = 4
right1982 = -8 ; size = 4
middle1982 = -12 ; size = 4
tmp1993 = -16 ; size = 4
left1998 = -4 ; size = 4
right1998 = -8 ; size = 4
middle1998 = -12 ; size = 4
tmp2009 = -16 ; size = 4
left2014 = -4 ; size = 4
right2014 = -8 ; size = 4
middle2014 = -12 ; size = 4
tmp2025 = -16 ; size = 4
left2030 = -4 ; size = 4
right2030 = -8 ; size = 4
middle2030 = -12 ; size = 4
tmp2041 = -16 ; size = 4
left2046 = -4 ; size = 4
right2046 = -8 ; size = 4
middle2046 = -12 ; size = 4
tmp2057 = -16 ; size = 4
left2062 = -4 ; size = 4
right2062 = -8 ; size = 4
middle2062 = -12 ; size = 4
tmp2073 = -16 ; size = 4
left2078 = -4 ; size = 4
right2078 = -8 ; size = 4
middle2078 = -12 ; size = 4
tmp2089 = -16 ; size = 4
left2094 = -4 ; size = 4
right2094 = -8 ; size = 4
middle2094 = -12 ; size = 4
tmp2105 = -16 ; size = 4
left2110 = -4 ; size = 4
right2110 = -8 ; size = 4
middle2110 = -12 ; size = 4
tmp2121 = -16 ; size = 4
left2126 = -4 ; size = 4
right2126 = -8 ; size = 4
middle2126 = -12 ; size = 4
tmp2137 = -16 ; size = 4
left2142 = -4 ; size = 4
right2142 = -8 ; size = 4
middle2142 = -12 ; size = 4
tmp2153 = -16 ; size = 4
left2158 = -4 ; size = 4
right2158 = -8 ; size = 4
middle2158 = -12 ; size = 4
tmp2169 = -16 ; size = 4
left2174 = -4 ; size = 4
right2174 = -8 ; size = 4
middle2174 = -12 ; size = 4
tmp2185 = -16 ; size = 4
left2190 = -4 ; size = 4
right2190 = -8 ; size = 4
middle2190 = -12 ; size = 4
tmp2201 = -16 ; size = 4
left2206 = -4 ; size = 4
right2206 = -8 ; size = 4
middle2206 = -12 ; size = 4
tmp2217 = -16 ; size = 4
left2222 = -4 ; size = 4
right2222 = -8 ; size = 4
middle2222 = -12 ; size = 4
tmp2233 = -16 ; size = 4
left2238 = -4 ; size = 4
right2238 = -8 ; size = 4
middle2238 = -12 ; size = 4
tmp2249 = -16 ; size = 4
left2254 = -4 ; size = 4
right2254 = -8 ; size = 4
middle2254 = -12 ; size = 4
tmp2265 = -16 ; size = 4
left2270 = -4 ; size = 4
right2270 = -8 ; size = 4
middle2270 = -12 ; size = 4
tmp2281 = -16 ; size = 4
left2286 = -4 ; size = 4
right2286 = -8 ; size = 4
middle2286 = -12 ; size = 4
tmp2297 = -16 ; size = 4
left2302 = -4 ; size = 4
right2302 = -8 ; size = 4
middle2302 = -12 ; size = 4
tmp2313 = -16 ; size = 4
left2318 = -4 ; size = 4
right2318 = -8 ; size = 4
middle2318 = -12 ; size = 4
tmp2329 = -16 ; size = 4
left2334 = -4 ; size = 4
right2334 = -8 ; size = 4
middle2334 = -12 ; size = 4
tmp2345 = -16 ; size = 4
left2350 = -4 ; size = 4
right2350 = -8 ; size = 4
middle2350 = -12 ; size = 4
tmp2361 = -16 ; size = 4
left2366 = -4 ; size = 4
right2366 = -8 ; size = 4
middle2366 = -12 ; size = 4
tmp2377 = -16 ; size = 4
left2382 = -4 ; size = 4
right2382 = -8 ; size = 4
middle2382 = -12 ; size = 4
tmp2393 = -16 ; size = 4
left2398 = -4 ; size = 4
right2398 = -8 ; size = 4
middle2398 = -12 ; size = 4
tmp2409 = -16 ; size = 4
left2414 = -4 ; size = 4
right2414 = -8 ; size = 4
middle2414 = -12 ; size = 4
tmp2425 = -16 ; size = 4
left2430 = -4 ; size = 4
right2430 = -8 ; size = 4
middle2430 = -12 ; size = 4
tmp2441 = -16 ; size = 4
left2446 = -4 ; size = 4
right2446 = -8 ; size = 4
middle2446 = -12 ; size = 4
tmp2457 = -16 ; size = 4
left2462 = -4 ; size = 4
right2462 = -8 ; size = 4
middle2462 = -12 ; size = 4
tmp2473 = -16 ; size = 4
left2478 = -4 ; size = 4
right2478 = -8 ; size = 4
middle2478 = -12 ; size = 4
tmp2489 = -16 ; size = 4
left2494 = -4 ; size = 4
right2494 = -8 ; size = 4
middle2494 = -12 ; size = 4
tmp2505 = -16 ; size = 4
left2510 = -4 ; size = 4
right2510 = -8 ; size = 4
middle2510 = -12 ; size = 4
tmp2521 = -16 ; size = 4
left2526 = -4 ; size = 4
right2526 = -8 ; size = 4
middle2526 = -12 ; size = 4
tmp2537 = -16 ; size = 4
left2542 = -4 ; size = 4
right2542 = -8 ; size = 4
middle2542 = -12 ; size = 4
tmp2553 = -16 ; size = 4
left2558 = -4 ; size = 4
right2558 = -8 ; size = 4
middle2558 = -12 ; size = 4
tmp2569 = -16 ; size = 4
left2574 = -4 ; size = 4
right2574 = -8 ; size = 4
middle2574 = -12 ; size = 4
tmp2585 = -16 ; size = 4
left2590 = -4 ; size = 4
right2590 = -8 ; size = 4
middle2590 = -12 ; size = 4
tmp2601 = -16 ; size = 4
left2606 = -4 ; size = 4
right2606 = -8 ; size = 4
middle2606 = -12 ; size = 4
tmp2617 = -16 ; size = 4
left2622 = -4 ; size = 4
right2622 = -8 ; size = 4
middle2622 = -12 ; size = 4
tmp2633 = -16 ; size = 4
left2638 = -4 ; size = 4
right2638 = -8 ; size = 4
middle2638 = -12 ; size = 4
tmp2649 = -16 ; size = 4
left2654 = -4 ; size = 4
right2654 = -8 ; size = 4
middle2654 = -12 ; size = 4
tmp2665 = -16 ; size = 4
left2670 = -4 ; size = 4
right2670 = -8 ; size = 4
middle2670 = -12 ; size = 4
tmp2681 = -16 ; size = 4
left2686 = -4 ; size = 4
right2686 = -8 ; size = 4
middle2686 = -12 ; size = 4
tmp2697 = -16 ; size = 4
left2702 = -4 ; size = 4
right2702 = -8 ; size = 4
middle2702 = -12 ; size = 4
tmp2713 = -16 ; size = 4
left2718 = -4 ; size = 4
right2718 = -8 ; size = 4
middle2718 = -12 ; size = 4
tmp2729 = -16 ; size = 4
left2734 = -4 ; size = 4
right2734 = -8 ; size = 4
middle2734 = -12 ; size = 4
tmp2745 = -16 ; size = 4
left2750 = -4 ; size = 4
right2750 = -8 ; size = 4
middle2750 = -12 ; size = 4
tmp2761 = -16 ; size = 4
left2766 = -4 ; size = 4
right2766 = -8 ; size = 4
middle2766 = -12 ; size = 4
tmp2777 = -16 ; size = 4
left2782 = -4 ; size = 4
right2782 = -8 ; size = 4
middle2782 = -12 ; size = 4
tmp2793 = -16 ; size = 4
left2798 = -4 ; size = 4
right2798 = -8 ; size = 4
middle2798 = -12 ; size = 4
tmp2809 = -16 ; size = 4
left2814 = -4 ; size = 4
right2814 = -8 ; size = 4
middle2814 = -12 ; size = 4
tmp2825 = -16 ; size = 4
left2830 = -4 ; size = 4
right2830 = -8 ; size = 4
middle2830 = -12 ; size = 4
tmp2841 = -16 ; size = 4
left2846 = -4 ; size = 4
right2846 = -8 ; size = 4
middle2846 = -12 ; size = 4
tmp2857 = -16 ; size = 4
left2862 = -4 ; size = 4
right2862 = -8 ; size = 4
middle2862 = -12 ; size = 4
tmp2873 = -16 ; size = 4
left2878 = -4 ; size = 4
right2878 = -8 ; size = 4
middle2878 = -12 ; size = 4
tmp2889 = -16 ; size = 4
left2894 = -4 ; size = 4
right2894 = -8 ; size = 4
middle2894 = -12 ; size = 4
tmp2905 = -16 ; size = 4
left2910 = -4 ; size = 4
right2910 = -8 ; size = 4
middle2910 = -12 ; size = 4
tmp2921 = -16 ; size = 4
left2926 = -4 ; size = 4
right2926 = -8 ; size = 4
middle2926 = -12 ; size = 4
tmp2937 = -16 ; size = 4
left2942 = -4 ; size = 4
right2942 = -8 ; size = 4
middle2942 = -12 ; size = 4
tmp2953 = -16 ; size = 4
left2958 = -4 ; size = 4
right2958 = -8 ; size = 4
middle2958 = -12 ; size = 4
tmp2969 = -16 ; size = 4
left2974 = -4 ; size = 4
right2974 = -8 ; size = 4
middle2974 = -12 ; size = 4
tmp2985 = -16 ; size = 4
left2990 = -4 ; size = 4
right2990 = -8 ; size = 4
middle2990 = -12 ; size = 4
tmp3001 = -16 ; size = 4
left3006 = -4 ; size = 4
right3006 = -8 ; size = 4
middle3006 = -12 ; size = 4
tmp3017 = -16 ; size = 4
left3022 = -4 ; size = 4
right3022 = -8 ; size = 4
middle3022 = -12 ; size = 4
tmp3033 = -16 ; size = 4
left3038 = -4 ; size = 4
right3038 = -8 ; size = 4
middle3038 = -12 ; size = 4
tmp3049 = -16 ; size = 4
left3054 = -4 ; size = 4
right3054 = -8 ; size = 4
middle3054 = -12 ; size = 4
tmp3065 = -16 ; size = 4
left3070 = -4 ; size = 4
right3070 = -8 ; size = 4
middle3070 = -12 ; size = 4
tmp3081 = -16 ; size = 4
left3086 = -4 ; size = 4
right3086 = -8 ; size = 4
middle3086 = -12 ; size = 4
tmp3097 = -16 ; size = 4
left3102 = -4 ; size = 4
right3102 = -8 ; size = 4
middle3102 = -12 ; size = 4
tmp3113 = -16 ; size = 4
left3118 = -4 ; size = 4
right3118 = -8 ; size = 4
middle3118 = -12 ; size = 4
tmp3129 = -16 ; size = 4
left3134 = -4 ; size = 4
right3134 = -8 ; size = 4
middle3134 = -12 ; size = 4
tmp3145 = -16 ; size = 4
left3150 = -4 ; size = 4
right3150 = -8 ; size = 4
middle3150 = -12 ; size = 4
tmp3161 = -16 ; size = 4
left3166 = -4 ; size = 4
right3166 = -8 ; size = 4
middle3166 = -12 ; size = 4
tmp3177 = -16 ; size = 4
left3182 = -4 ; size = 4
right3182 = -8 ; size = 4
middle3182 = -12 ; size = 4
tmp3193 = -16 ; size = 4
left3198 = -4 ; size = 4
right3198 = -8 ; size = 4
middle3198 = -12 ; size = 4
tmp3209 = -16 ; size = 4
left3214 = -4 ; size = 4
right3214 = -8 ; size = 4
middle3214 = -12 ; size = 4
tmp3225 = -16 ; size = 4
left3230 = -4 ; size = 4
right3230 = -8 ; size = 4
middle3230 = -12 ; size = 4
tmp3241 = -16 ; size = 4
left3246 = -4 ; size = 4
right3246 = -8 ; size = 4
middle3246 = -12 ; size = 4
tmp3257 = -16 ; size = 4
left3262 = -4 ; size = 4
right3262 = -8 ; size = 4
middle3262 = -12 ; size = 4
tmp3273 = -16 ; size = 4
left3278 = -4 ; size = 4
right3278 = -8 ; size = 4
middle3278 = -12 ; size = 4
tmp3289 = -16 ; size = 4
left3294 = -4 ; size = 4
right3294 = -8 ; size = 4
middle3294 = -12 ; size = 4
tmp3305 = -16 ; size = 4
left3310 = -4 ; size = 4
right3310 = -8 ; size = 4
middle3310 = -12 ; size = 4
tmp3321 = -16 ; size = 4
left3326 = -4 ; size = 4
right3326 = -8 ; size = 4
middle3326 = -12 ; size = 4
tmp3337 = -16 ; size = 4
left3342 = -4 ; size = 4
right3342 = -8 ; size = 4
middle3342 = -12 ; size = 4
tmp3353 = -16 ; size = 4
left3358 = -4 ; size = 4
right3358 = -8 ; size = 4
middle3358 = -12 ; size = 4
tmp3369 = -16 ; size = 4
left3374 = -4 ; size = 4
right3374 = -8 ; size = 4
middle3374 = -12 ; size = 4
tmp3385 = -16 ; size = 4
left3390 = -4 ; size = 4
right3390 = -8 ; size = 4
middle3390 = -12 ; size = 4
tmp3401 = -16 ; size = 4
left3406 = -4 ; size = 4
right3406 = -8 ; size = 4
middle3406 = -12 ; size = 4
tmp3417 = -16 ; size = 4
left3422 = -4 ; size = 4
right3422 = -8 ; size = 4
middle3422 = -12 ; size = 4
tmp3433 = -16 ; size = 4
left3438 = -4 ; size = 4
right3438 = -8 ; size = 4
middle3438 = -12 ; size = 4
tmp3449 = -16 ; size = 4
left3454 = -4 ; size = 4
right3454 = -8 ; size = 4
middle3454 = -12 ; size = 4
tmp3465 = -16 ; size = 4
left3470 = -4 ; size = 4
right3470 = -8 ; size = 4
middle3470 = -12 ; size = 4
tmp3481 = -16 ; size = 4
left3486 = -4 ; size = 4
right3486 = -8 ; size = 4
middle3486 = -12 ; size = 4
tmp3497 = -16 ; size = 4
left3502 = -4 ; size = 4
right3502 = -8 ; size = 4
middle3502 = -12 ; size = 4
tmp3513 = -16 ; size = 4
left3518 = -4 ; size = 4
right3518 = -8 ; size = 4
middle3518 = -12 ; size = 4
tmp3529 = -16 ; size = 4
left3534 = -4 ; size = 4
right3534 = -8 ; size = 4
middle3534 = -12 ; size = 4
tmp3545 = -16 ; size = 4
left3550 = -4 ; size = 4
right3550 = -8 ; size = 4
middle3550 = -12 ; size = 4
tmp3561 = -16 ; size = 4
left3566 = -4 ; size = 4
right3566 = -8 ; size = 4
middle3566 = -12 ; size = 4
tmp3577 = -16 ; size = 4
left3582 = -4 ; size = 4
right3582 = -8 ; size = 4
middle3582 = -12 ; size = 4
tmp3593 = -16 ; size = 4
left3598 = -4 ; size = 4
right3598 = -8 ; size = 4
middle3598 = -12 ; size = 4
tmp3609 = -16 ; size = 4
left3614 = -4 ; size = 4
right3614 = -8 ; size = 4
middle3614 = -12 ; size = 4
tmp3625 = -16 ; size = 4
left3630 = -4 ; size = 4
right3630 = -8 ; size = 4
middle3630 = -12 ; size = 4
tmp3641 = -16 ; size = 4
left3646 = -4 ; size = 4
right3646 = -8 ; size = 4
middle3646 = -12 ; size = 4
tmp3657 = -16 ; size = 4
left3662 = -4 ; size = 4
right3662 = -8 ; size = 4
middle3662 = -12 ; size = 4
tmp3673 = -16 ; size = 4
left3678 = -4 ; size = 4
right3678 = -8 ; size = 4
middle3678 = -12 ; size = 4
tmp3689 = -16 ; size = 4
left3694 = -4 ; size = 4
right3694 = -8 ; size = 4
middle3694 = -12 ; size = 4
tmp3705 = -16 ; size = 4
left3710 = -4 ; size = 4
right3710 = -8 ; size = 4
middle3710 = -12 ; size = 4
tmp3721 = -16 ; size = 4
left3726 = -4 ; size = 4
right3726 = -8 ; size = 4
middle3726 = -12 ; size = 4
tmp3737 = -16 ; size = 4
left3742 = -4 ; size = 4
right3742 = -8 ; size = 4
middle3742 = -12 ; size = 4
tmp3753 = -16 ; size = 4
left3758 = -4 ; size = 4
right3758 = -8 ; size = 4
middle3758 = -12 ; size = 4
tmp3769 = -16 ; size = 4
left3774 = -4 ; size = 4
right3774 = -8 ; size = 4
middle3774 = -12 ; size = 4
tmp3785 = -16 ; size = 4
left3790 = -4 ; size = 4
right3790 = -8 ; size = 4
middle3790 = -12 ; size = 4
tmp3801 = -16 ; size = 4
left3806 = -4 ; size = 4
right3806 = -8 ; size = 4
middle3806 = -12 ; size = 4
tmp3817 = -16 ; size = 4
left3822 = -4 ; size = 4
right3822 = -8 ; size = 4
middle3822 = -12 ; size = 4
tmp3833 = -16 ; size = 4
left3838 = -4 ; size = 4
right3838 = -8 ; size = 4
middle3838 = -12 ; size = 4
tmp3849 = -16 ; size = 4
left3854 = -4 ; size = 4
right3854 = -8 ; size = 4
middle3854 = -12 ; size = 4
tmp3865 = -16 ; size = 4
left3870 = -4 ; size = 4
right3870 = -8 ; size = 4
middle3870 = -12 ; size = 4
tmp3881 = -16 ; size = 4
left3886 = -4 ; size = 4
right3886 = -8 ; size = 4
middle3886 = -12 ; size = 4
tmp3897 = -16 ; size = 4
left3902 = -4 ; size = 4
right3902 = -8 ; size = 4
middle3902 = -12 ; size = 4
tmp3913 = -16 ; size = 4
left3918 = -4 ; size = 4
right3918 = -8 ; size = 4
middle3918 = -12 ; size = 4
tmp3929 = -16 ; size = 4
left3934 = -4 ; size = 4
right3934 = -8 ; size = 4
middle3934 = -12 ; size = 4
tmp3945 = -16 ; size = 4
left3950 = -4 ; size = 4
right3950 = -8 ; size = 4
middle3950 = -12 ; size = 4
tmp3961 = -16 ; size = 4
left3966 = -4 ; size = 4
right3966 = -8 ; size = 4
middle3966 = -12 ; size = 4
tmp3977 = -16 ; size = 4
left3982 = -4 ; size = 4
right3982 = -8 ; size = 4
middle3982 = -12 ; size = 4
tmp3993 = -16 ; size = 4
left3998 = -4 ; size = 4
right3998 = -8 ; size = 4
middle3998 = -12 ; size = 4
tmp4009 = -16 ; size = 4
left4014 = -4 ; size = 4
right4014 = -8 ; size = 4
middle4014 = -12 ; size = 4
tmp4025 = -16 ; size = 4
left4030 = -4 ; size = 4
right4030 = -8 ; size = 4
middle4030 = -12 ; size = 4
tmp4041 = -16 ; size = 4
left4046 = -4 ; size = 4
right4046 = -8 ; size = 4
middle4046 = -12 ; size = 4
tmp4057 = -16 ; size = 4
left4062 = -4 ; size = 4
right4062 = -8 ; size = 4
middle4062 = -12 ; size = 4
tmp4073 = -16 ; size = 4
left4078 = -4 ; size = 4
right4078 = -8 ; size = 4
middle4078 = -12 ; size = 4
tmp4089 = -16 ; size = 4
left4094 = -4 ; size = 4
right4094 = -8 ; size = 4
middle4094 = -12 ; size = 4
tmp4105 = -16 ; size = 4
left4110 = -4 ; size = 4
right4110 = -8 ; size = 4
middle4110 = -12 ; size = 4
tmp4121 = -16 ; size = 4
left4126 = -4 ; size = 4
right4126 = -8 ; size = 4
middle4126 = -12 ; size = 4
tmp4137 = -16 ; size = 4
left4142 = -4 ; size = 4
right4142 = -8 ; size = 4
middle4142 = -12 ; size = 4
tmp4153 = -16 ; size = 4
left4158 = -4 ; size = 4
right4158 = -8 ; size = 4
middle4158 = -12 ; size = 4
tmp4169 = -16 ; size = 4
left4174 = -4 ; size = 4
right4174 = -8 ; size = 4
middle4174 = -12 ; size = 4
tmp4185 = -16 ; size = 4
left4190 = -4 ; size = 4
right4190 = -8 ; size = 4
middle4190 = -12 ; size = 4
tmp4201 = -16 ; size = 4
left4206 = -4 ; size = 4
right4206 = -8 ; size = 4
middle4206 = -12 ; size = 4
tmp4217 = -16 ; size = 4
left4222 = -4 ; size = 4
right4222 = -8 ; size = 4
middle4222 = -12 ; size = 4
tmp4233 = -16 ; size = 4
left4238 = -4 ; size = 4
right4238 = -8 ; size = 4
middle4238 = -12 ; size = 4
tmp4249 = -16 ; size = 4
left4254 = -4 ; size = 4
right4254 = -8 ; size = 4
middle4254 = -12 ; size = 4
tmp4265 = -16 ; size = 4
left4270 = -4 ; size = 4
right4270 = -8 ; size = 4
middle4270 = -12 ; size = 4
tmp4281 = -16 ; size = 4
left4286 = -4 ; size = 4
right4286 = -8 ; size = 4
middle4286 = -12 ; size = 4
tmp4297 = -16 ; size = 4
left4302 = -4 ; size = 4
right4302 = -8 ; size = 4
middle4302 = -12 ; size = 4
tmp4313 = -16 ; size = 4
left4318 = -4 ; size = 4
right4318 = -8 ; size = 4
middle4318 = -12 ; size = 4
tmp4329 = -16 ; size = 4
left4334 = -4 ; size = 4
right4334 = -8 ; size = 4
middle4334 = -12 ; size = 4
tmp4345 = -16 ; size = 4
left4350 = -4 ; size = 4
right4350 = -8 ; size = 4
middle4350 = -12 ; size = 4
tmp4361 = -16 ; size = 4
left4366 = -4 ; size = 4
right4366 = -8 ; size = 4
middle4366 = -12 ; size = 4
tmp4377 = -16 ; size = 4
left4382 = -4 ; size = 4
right4382 = -8 ; size = 4
middle4382 = -12 ; size = 4
tmp4393 = -16 ; size = 4
left4398 = -4 ; size = 4
right4398 = -8 ; size = 4
middle4398 = -12 ; size = 4
tmp4409 = -16 ; size = 4
left4414 = -4 ; size = 4
right4414 = -8 ; size = 4
middle4414 = -12 ; size = 4
tmp4425 = -16 ; size = 4
left4430 = -4 ; size = 4
right4430 = -8 ; size = 4
middle4430 = -12 ; size = 4
tmp4441 = -16 ; size = 4
left4446 = -4 ; size = 4
right4446 = -8 ; size = 4
middle4446 = -12 ; size = 4
tmp4457 = -16 ; size = 4
left4462 = -4 ; size = 4
right4462 = -8 ; size = 4
middle4462 = -12 ; size = 4
tmp4473 = -16 ; size = 4
left4478 = -4 ; size = 4
right4478 = -8 ; size = 4
middle4478 = -12 ; size = 4
tmp4489 = -16 ; size = 4
left4494 = -4 ; size = 4
right4494 = -8 ; size = 4
middle4494 = -12 ; size = 4
tmp4505 = -16 ; size = 4
left4510 = -4 ; size = 4
right4510 = -8 ; size = 4
middle4510 = -12 ; size = 4
tmp4521 = -16 ; size = 4
left4526 = -4 ; size = 4
right4526 = -8 ; size = 4
middle4526 = -12 ; size = 4
tmp4537 = -16 ; size = 4
left4542 = -4 ; size = 4
right4542 = -8 ; size = 4
middle4542 = -12 ; size = 4
tmp4553 = -16 ; size = 4
left4558 = -4 ; size = 4
right4558 = -8 ; size = 4
middle4558 = -12 ; size = 4
tmp4569 = -16 ; size = 4
left4574 = -4 ; size = 4
right4574 = -8 ; size = 4
middle4574 = -12 ; size = 4
tmp4585 = -16 ; size = 4
left4590 = -4 ; size = 4
right4590 = -8 ; size = 4
middle4590 = -12 ; size = 4
tmp4601 = -16 ; size = 4
left4606 = -4 ; size = 4
right4606 = -8 ; size = 4
middle4606 = -12 ; size = 4
tmp4617 = -16 ; size = 4
left4622 = -4 ; size = 4
right4622 = -8 ; size = 4
middle4622 = -12 ; size = 4
tmp4633 = -16 ; size = 4
left4638 = -4 ; size = 4
right4638 = -8 ; size = 4
middle4638 = -12 ; size = 4
tmp4649 = -16 ; size = 4
left4654 = -4 ; size = 4
right4654 = -8 ; size = 4
middle4654 = -12 ; size = 4
tmp4665 = -16 ; size = 4
left4670 = -4 ; size = 4
right4670 = -8 ; size = 4
middle4670 = -12 ; size = 4
tmp4681 = -16 ; size = 4
left4686 = -4 ; size = 4
right4686 = -8 ; size = 4
middle4686 = -12 ; size = 4
tmp4697 = -16 ; size = 4
left4702 = -4 ; size = 4
right4702 = -8 ; size = 4
middle4702 = -12 ; size = 4
tmp4713 = -16 ; size = 4
left4718 = -4 ; size = 4
right4718 = -8 ; size = 4
middle4718 = -12 ; size = 4
tmp4729 = -16 ; size = 4
left4734 = -4 ; size = 4
right4734 = -8 ; size = 4
middle4734 = -12 ; size = 4
tmp4745 = -16 ; size = 4
left4750 = -4 ; size = 4
right4750 = -8 ; size = 4
middle4750 = -12 ; size = 4
tmp4761 = -16 ; size = 4
left4766 = -4 ; size = 4
right4766 = -8 ; size = 4
middle4766 = -12 ; size = 4
tmp4777 = -16 ; size = 4
left4782 = -4 ; size = 4
right4782 = -8 ; size = 4
middle4782 = -12 ; size = 4
tmp4793 = -16 ; size = 4
left4798 = -4 ; size = 4
right4798 = -8 ; size = 4
middle4798 = -12 ; size = 4
tmp4809 = -16 ; size = 4
left4814 = -4 ; size = 4
right4814 = -8 ; size = 4
middle4814 = -12 ; size = 4
tmp4825 = -16 ; size = 4
left4830 = -4 ; size = 4
right4830 = -8 ; size = 4
middle4830 = -12 ; size = 4
tmp4841 = -16 ; size = 4
left4846 = -4 ; size = 4
right4846 = -8 ; size = 4
middle4846 = -12 ; size = 4
tmp4857 = -16 ; size = 4
left4862 = -4 ; size = 4
right4862 = -8 ; size = 4
middle4862 = -12 ; size = 4
tmp4873 = -16 ; size = 4
left4878 = -4 ; size = 4
right4878 = -8 ; size = 4
middle4878 = -12 ; size = 4
tmp4889 = -16 ; size = 4
left4894 = -4 ; size = 4
right4894 = -8 ; size = 4
middle4894 = -12 ; size = 4
tmp4905 = -16 ; size = 4
left4910 = -4 ; size = 4
right4910 = -8 ; size = 4
middle4910 = -12 ; size = 4
tmp4921 = -16 ; size = 4
left4926 = -4 ; size = 4
right4926 = -8 ; size = 4
middle4926 = -12 ; size = 4
tmp4937 = -16 ; size = 4
left4942 = -4 ; size = 4
right4942 = -8 ; size = 4
middle4942 = -12 ; size = 4
tmp4953 = -16 ; size = 4
left4958 = -4 ; size = 4
right4958 = -8 ; size = 4
middle4958 = -12 ; size = 4
tmp4969 = -16 ; size = 4
left4974 = -4 ; size = 4
right4974 = -8 ; size = 4
middle4974 = -12 ; size = 4
tmp4985 = -16 ; size = 4
left4990 = -4 ; size = 4
right4990 = -8 ; size = 4
middle4990 = -12 ; size = 4
tmp5001 = -16 ; size = 4
left5006 = -4 ; size = 4
right5006 = -8 ; size = 4
middle5006 = -12 ; size = 4
tmp5017 = -16 ; size = 4
left5022 = -4 ; size = 4
right5022 = -8 ; size = 4
middle5022 = -12 ; size = 4
tmp5033 = -16 ; size = 4
left5038 = -4 ; size = 4
right5038 = -8 ; size = 4
middle5038 = -12 ; size = 4
tmp5049 = -16 ; size = 4
left5054 = -4 ; size = 4
right5054 = -8 ; size = 4
middle5054 = -12 ; size = 4
tmp5065 = -16 ; size = 4
left5070 = -4 ; size = 4
right5070 = -8 ; size = 4
middle5070 = -12 ; size = 4
tmp5081 = -16 ; size = 4
left5086 = -4 ; size = 4
right5086 = -8 ; size = 4
middle5086 = -12 ; size = 4
tmp5097 = -16 ; size = 4
left5102 = -4 ; size = 4
right5102 = -8 ; size = 4
middle5102 = -12 ; size = 4
tmp5113 = -16 ; size = 4
left5118 = -4 ; size = 4
right5118 = -8 ; size = 4
middle5118 = -12 ; size = 4
tmp5129 = -16 ; size = 4
left5134 = -4 ; size = 4
right5134 = -8 ; size = 4
middle5134 = -12 ; size = 4
tmp5145 = -16 ; size = 4
left5150 = -4 ; size = 4
right5150 = -8 ; size = 4
middle5150 = -12 ; size = 4
tmp5161 = -16 ; size = 4
left5166 = -4 ; size = 4
right5166 = -8 ; size = 4
middle5166 = -12 ; size = 4
tmp5177 = -16 ; size = 4
left5182 = -4 ; size = 4
right5182 = -8 ; size = 4
middle5182 = -12 ; size = 4
tmp5193 = -16 ; size = 4
left5198 = -4 ; size = 4
right5198 = -8 ; size = 4
middle5198 = -12 ; size = 4
tmp5209 = -16 ; size = 4
left5214 = -4 ; size = 4
right5214 = -8 ; size = 4
middle5214 = -12 ; size = 4
tmp5225 = -16 ; size = 4
left5230 = -4 ; size = 4
right5230 = -8 ; size = 4
middle5230 = -12 ; size = 4
tmp5241 = -16 ; size = 4
left5246 = -4 ; size = 4
right5246 = -8 ; size = 4
middle5246 = -12 ; size = 4
tmp5257 = -16 ; size = 4
left5262 = -4 ; size = 4
right5262 = -8 ; size = 4
middle5262 = -12 ; size = 4
tmp5273 = -16 ; size = 4
left5278 = -4 ; size = 4
right5278 = -8 ; size = 4
middle5278 = -12 ; size = 4
tmp5289 = -16 ; size = 4
left5294 = -4 ; size = 4
right5294 = -8 ; size = 4
middle5294 = -12 ; size = 4
tmp5305 = -16 ; size = 4
left5310 = -4 ; size = 4
right5310 = -8 ; size = 4
middle5310 = -12 ; size = 4
tmp5321 = -16 ; size = 4
left5326 = -4 ; size = 4
right5326 = -8 ; size = 4
middle5326 = -12 ; size = 4
tmp5337 = -16 ; size = 4
left5342 = -4 ; size = 4
right5342 = -8 ; size = 4
middle5342 = -12 ; size = 4
tmp5353 = -16 ; size = 4
left5358 = -4 ; size = 4
right5358 = -8 ; size = 4
middle5358 = -12 ; size = 4
tmp5369 = -16 ; size = 4
left5374 = -4 ; size = 4
right5374 = -8 ; size = 4
middle5374 = -12 ; size = 4
tmp5385 = -16 ; size = 4
left5390 = -4 ; size = 4
right5390 = -8 ; size = 4
middle5390 = -12 ; size = 4
tmp5401 = -16 ; size = 4
left5406 = -4 ; size = 4
right5406 = -8 ; size = 4
middle5406 = -12 ; size = 4
tmp5417 = -16 ; size = 4
left5422 = -4 ; size = 4
right5422 = -8 ; size = 4
middle5422 = -12 ; size = 4
tmp5433 = -16 ; size = 4
left5438 = -4 ; size = 4
right5438 = -8 ; size = 4
middle5438 = -12 ; size = 4
tmp5449 = -16 ; size = 4
arg_n2 = 8 ; size = 4
arg_n4 = 8 ; size = 4
arg_a8 = 8 ; size = 4
arg_s_arr10 = 8 ; size = 4
arg_first10 = 12 ; size = 4
arg_last10 = 16 ; size = 4
arg_s_arr26 = 8 ; size = 4
arg_first26 = 12 ; size = 4
arg_last26 = 16 ; size = 4
arg_s_arr42 = 8 ; size = 4
arg_first42 = 12 ; size = 4
arg_last42 = 16 ; size = 4
arg_s_arr58 = 8 ; size = 4
arg_first58 = 12 ; size = 4
arg_last58 = 16 ; size = 4
arg_s_arr74 = 8 ; size = 4
arg_first74 = 12 ; size = 4
arg_last74 = 16 ; size = 4
arg_s_arr90 = 8 ; size = 4
arg_first90 = 12 ; size = 4
arg_last90 = 16 ; size = 4
arg_s_arr106 = 8 ; size = 4
arg_first106 = 12 ; size = 4
arg_last106 = 16 ; size = 4
arg_s_arr122 = 8 ; size = 4
arg_first122 = 12 ; size = 4
arg_last122 = 16 ; size = 4
arg_s_arr138 = 8 ; size = 4
arg_first138 = 12 ; size = 4
arg_last138 = 16 ; size = 4
arg_s_arr154 = 8 ; size = 4
arg_first154 = 12 ; size = 4
arg_last154 = 16 ; size = 4
arg_s_arr170 = 8 ; size = 4
arg_first170 = 12 ; size = 4
arg_last170 = 16 ; size = 4
arg_s_arr186 = 8 ; size = 4
arg_first186 = 12 ; size = 4
arg_last186 = 16 ; size = 4
arg_s_arr202 = 8 ; size = 4
arg_first202 = 12 ; size = 4
arg_last202 = 16 ; size = 4
arg_s_arr218 = 8 ; size = 4
arg_first218 = 12 ; size = 4
arg_last218 = 16 ; size = 4
arg_s_arr234 = 8 ; size = 4
arg_first234 = 12 ; size = 4
arg_last234 = 16 ; size = 4
arg_s_arr250 = 8 ; size = 4
arg_first250 = 12 ; size = 4
arg_last250 = 16 ; size = 4
arg_s_arr266 = 8 ; size = 4
arg_first266 = 12 ; size = 4
arg_last266 = 16 ; size = 4
arg_s_arr282 = 8 ; size = 4
arg_first282 = 12 ; size = 4
arg_last282 = 16 ; size = 4
arg_s_arr298 = 8 ; size = 4
arg_first298 = 12 ; size = 4
arg_last298 = 16 ; size = 4
arg_s_arr314 = 8 ; size = 4
arg_first314 = 12 ; size = 4
arg_last314 = 16 ; size = 4
arg_s_arr330 = 8 ; size = 4
arg_first330 = 12 ; size = 4
arg_last330 = 16 ; size = 4
arg_s_arr346 = 8 ; size = 4
arg_first346 = 12 ; size = 4
arg_last346 = 16 ; size = 4
arg_s_arr362 = 8 ; size = 4
arg_first362 = 12 ; size = 4
arg_last362 = 16 ; size = 4
arg_s_arr378 = 8 ; size = 4
arg_first378 = 12 ; size = 4
arg_last378 = 16 ; size = 4
arg_s_arr394 = 8 ; size = 4
arg_first394 = 12 ; size = 4
arg_last394 = 16 ; size = 4
arg_s_arr410 = 8 ; size = 4
arg_first410 = 12 ; size = 4
arg_last410 = 16 ; size = 4
arg_s_arr426 = 8 ; size = 4
arg_first426 = 12 ; size = 4
arg_last426 = 16 ; size = 4
arg_s_arr442 = 8 ; size = 4
arg_first442 = 12 ; size = 4
arg_last442 = 16 ; size = 4
arg_s_arr458 = 8 ; size = 4
arg_first458 = 12 ; size = 4
arg_last458 = 16 ; size = 4
arg_s_arr474 = 8 ; size = 4
arg_first474 = 12 ; size = 4
arg_last474 = 16 ; size = 4
arg_s_arr490 = 8 ; size = 4
arg_first490 = 12 ; size = 4
arg_last490 = 16 ; size = 4
arg_s_arr506 = 8 ; size = 4
arg_first506 = 12 ; size = 4
arg_last506 = 16 ; size = 4
arg_s_arr522 = 8 ; size = 4
arg_first522 = 12 ; size = 4
arg_last522 = 16 ; size = 4
arg_s_arr538 = 8 ; size = 4
arg_first538 = 12 ; size = 4
arg_last538 = 16 ; size = 4
arg_s_arr554 = 8 ; size = 4
arg_first554 = 12 ; size = 4
arg_last554 = 16 ; size = 4
arg_s_arr570 = 8 ; size = 4
arg_first570 = 12 ; size = 4
arg_last570 = 16 ; size = 4
arg_s_arr586 = 8 ; size = 4
arg_first586 = 12 ; size = 4
arg_last586 = 16 ; size = 4
arg_s_arr602 = 8 ; size = 4
arg_first602 = 12 ; size = 4
arg_last602 = 16 ; size = 4
arg_s_arr618 = 8 ; size = 4
arg_first618 = 12 ; size = 4
arg_last618 = 16 ; size = 4
arg_s_arr634 = 8 ; size = 4
arg_first634 = 12 ; size = 4
arg_last634 = 16 ; size = 4
arg_s_arr650 = 8 ; size = 4
arg_first650 = 12 ; size = 4
arg_last650 = 16 ; size = 4
arg_s_arr666 = 8 ; size = 4
arg_first666 = 12 ; size = 4
arg_last666 = 16 ; size = 4
arg_s_arr682 = 8 ; size = 4
arg_first682 = 12 ; size = 4
arg_last682 = 16 ; size = 4
arg_s_arr698 = 8 ; size = 4
arg_first698 = 12 ; size = 4
arg_last698 = 16 ; size = 4
arg_s_arr714 = 8 ; size = 4
arg_first714 = 12 ; size = 4
arg_last714 = 16 ; size = 4
arg_s_arr730 = 8 ; size = 4
arg_first730 = 12 ; size = 4
arg_last730 = 16 ; size = 4
arg_s_arr746 = 8 ; size = 4
arg_first746 = 12 ; size = 4
arg_last746 = 16 ; size = 4
arg_s_arr762 = 8 ; size = 4
arg_first762 = 12 ; size = 4
arg_last762 = 16 ; size = 4
arg_s_arr778 = 8 ; size = 4
arg_first778 = 12 ; size = 4
arg_last778 = 16 ; size = 4
arg_s_arr794 = 8 ; size = 4
arg_first794 = 12 ; size = 4
arg_last794 = 16 ; size = 4
arg_s_arr810 = 8 ; size = 4
arg_first810 = 12 ; size = 4
arg_last810 = 16 ; size = 4
arg_s_arr826 = 8 ; size = 4
arg_first826 = 12 ; size = 4
arg_last826 = 16 ; size = 4
arg_s_arr842 = 8 ; size = 4
arg_first842 = 12 ; size = 4
arg_last842 = 16 ; size = 4
arg_s_arr858 = 8 ; size = 4
arg_first858 = 12 ; size = 4
arg_last858 = 16 ; size = 4
arg_s_arr874 = 8 ; size = 4
arg_first874 = 12 ; size = 4
arg_last874 = 16 ; size = 4
arg_s_arr890 = 8 ; size = 4
arg_first890 = 12 ; size = 4
arg_last890 = 16 ; size = 4
arg_s_arr906 = 8 ; size = 4
arg_first906 = 12 ; size = 4
arg_last906 = 16 ; size = 4
arg_s_arr922 = 8 ; size = 4
arg_first922 = 12 ; size = 4
arg_last922 = 16 ; size = 4
arg_s_arr938 = 8 ; size = 4
arg_first938 = 12 ; size = 4
arg_last938 = 16 ; size = 4
arg_s_arr954 = 8 ; size = 4
arg_first954 = 12 ; size = 4
arg_last954 = 16 ; size = 4
arg_s_arr970 = 8 ; size = 4
arg_first970 = 12 ; size = 4
arg_last970 = 16 ; size = 4
arg_s_arr986 = 8 ; size = 4
arg_first986 = 12 ; size = 4
arg_last986 = 16 ; size = 4
arg_s_arr1002 = 8 ; size = 4
arg_first1002 = 12 ; size = 4
arg_last1002 = 16 ; size = 4
arg_s_arr1018 = 8 ; size = 4
arg_first1018 = 12 ; size = 4
arg_last1018 = 16 ; size = 4
arg_s_arr1034 = 8 ; size = 4
arg_first1034 = 12 ; size = 4
arg_last1034 = 16 ; size = 4
arg_s_arr1050 = 8 ; size = 4
arg_first1050 = 12 ; size = 4
arg_last1050 = 16 ; size = 4
arg_s_arr1066 = 8 ; size = 4
arg_first1066 = 12 ; size = 4
arg_last1066 = 16 ; size = 4
arg_s_arr1082 = 8 ; size = 4
arg_first1082 = 12 ; size = 4
arg_last1082 = 16 ; size = 4
arg_s_arr1098 = 8 ; size = 4
arg_first1098 = 12 ; size = 4
arg_last1098 = 16 ; size = 4
arg_s_arr1114 = 8 ; size = 4
arg_first1114 = 12 ; size = 4
arg_last1114 = 16 ; size = 4
arg_s_arr1130 = 8 ; size = 4
arg_first1130 = 12 ; size = 4
arg_last1130 = 16 ; size = 4
arg_s_arr1146 = 8 ; size = 4
arg_first1146 = 12 ; size = 4
arg_last1146 = 16 ; size = 4
arg_s_arr1162 = 8 ; size = 4
arg_first1162 = 12 ; size = 4
arg_last1162 = 16 ; size = 4
arg_s_arr1178 = 8 ; size = 4
arg_first1178 = 12 ; size = 4
arg_last1178 = 16 ; size = 4
arg_s_arr1194 = 8 ; size = 4
arg_first1194 = 12 ; size = 4
arg_last1194 = 16 ; size = 4
arg_s_arr1210 = 8 ; size = 4
arg_first1210 = 12 ; size = 4
arg_last1210 = 16 ; size = 4
arg_s_arr1226 = 8 ; size = 4
arg_first1226 = 12 ; size = 4
arg_last1226 = 16 ; size = 4
arg_s_arr1242 = 8 ; size = 4
arg_first1242 = 12 ; size = 4
arg_last1242 = 16 ; size = 4
arg_s_arr1258 = 8 ; size = 4
arg_first1258 = 12 ; size = 4
arg_last1258 = 16 ; size = 4
arg_s_arr1274 = 8 ; size = 4
arg_first1274 = 12 ; size = 4
arg_last1274 = 16 ; size = 4
arg_s_arr1290 = 8 ; size = 4
arg_first1290 = 12 ; size = 4
arg_last1290 = 16 ; size = 4
arg_s_arr1306 = 8 ; size = 4
arg_first1306 = 12 ; size = 4
arg_last1306 = 16 ; size = 4
arg_s_arr1322 = 8 ; size = 4
arg_first1322 = 12 ; size = 4
arg_last1322 = 16 ; size = 4
arg_s_arr1338 = 8 ; size = 4
arg_first1338 = 12 ; size = 4
arg_last1338 = 16 ; size = 4
arg_s_arr1354 = 8 ; size = 4
arg_first1354 = 12 ; size = 4
arg_last1354 = 16 ; size = 4
arg_s_arr1370 = 8 ; size = 4
arg_first1370 = 12 ; size = 4
arg_last1370 = 16 ; size = 4
arg_s_arr1386 = 8 ; size = 4
arg_first1386 = 12 ; size = 4
arg_last1386 = 16 ; size = 4
arg_s_arr1402 = 8 ; size = 4
arg_first1402 = 12 ; size = 4
arg_last1402 = 16 ; size = 4
arg_s_arr1418 = 8 ; size = 4
arg_first1418 = 12 ; size = 4
arg_last1418 = 16 ; size = 4
arg_s_arr1434 = 8 ; size = 4
arg_first1434 = 12 ; size = 4
arg_last1434 = 16 ; size = 4
arg_s_arr1450 = 8 ; size = 4
arg_first1450 = 12 ; size = 4
arg_last1450 = 16 ; size = 4
arg_s_arr1466 = 8 ; size = 4
arg_first1466 = 12 ; size = 4
arg_last1466 = 16 ; size = 4
arg_s_arr1482 = 8 ; size = 4
arg_first1482 = 12 ; size = 4
arg_last1482 = 16 ; size = 4
arg_s_arr1498 = 8 ; size = 4
arg_first1498 = 12 ; size = 4
arg_last1498 = 16 ; size = 4
arg_s_arr1514 = 8 ; size = 4
arg_first1514 = 12 ; size = 4
arg_last1514 = 16 ; size = 4
arg_s_arr1530 = 8 ; size = 4
arg_first1530 = 12 ; size = 4
arg_last1530 = 16 ; size = 4
arg_s_arr1546 = 8 ; size = 4
arg_first1546 = 12 ; size = 4
arg_last1546 = 16 ; size = 4
arg_s_arr1562 = 8 ; size = 4
arg_first1562 = 12 ; size = 4
arg_last1562 = 16 ; size = 4
arg_s_arr1578 = 8 ; size = 4
arg_first1578 = 12 ; size = 4
arg_last1578 = 16 ; size = 4
arg_s_arr1594 = 8 ; size = 4
arg_first1594 = 12 ; size = 4
arg_last1594 = 16 ; size = 4
arg_s_arr1610 = 8 ; size = 4
arg_first1610 = 12 ; size = 4
arg_last1610 = 16 ; size = 4
arg_s_arr1626 = 8 ; size = 4
arg_first1626 = 12 ; size = 4
arg_last1626 = 16 ; size = 4
arg_s_arr1642 = 8 ; size = 4
arg_first1642 = 12 ; size = 4
arg_last1642 = 16 ; size = 4
arg_s_arr1658 = 8 ; size = 4
arg_first1658 = 12 ; size = 4
arg_last1658 = 16 ; size = 4
arg_s_arr1674 = 8 ; size = 4
arg_first1674 = 12 ; size = 4
arg_last1674 = 16 ; size = 4
arg_s_arr1690 = 8 ; size = 4
arg_first1690 = 12 ; size = 4
arg_last1690 = 16 ; size = 4
arg_s_arr1706 = 8 ; size = 4
arg_first1706 = 12 ; size = 4
arg_last1706 = 16 ; size = 4
arg_s_arr1722 = 8 ; size = 4
arg_first1722 = 12 ; size = 4
arg_last1722 = 16 ; size = 4
arg_s_arr1738 = 8 ; size = 4
arg_first1738 = 12 ; size = 4
arg_last1738 = 16 ; size = 4
arg_s_arr1754 = 8 ; size = 4
arg_first1754 = 12 ; size = 4
arg_last1754 = 16 ; size = 4
arg_s_arr1770 = 8 ; size = 4
arg_first1770 = 12 ; size = 4
arg_last1770 = 16 ; size = 4
arg_s_arr1786 = 8 ; size = 4
arg_first1786 = 12 ; size = 4
arg_last1786 = 16 ; size = 4
arg_s_arr1802 = 8 ; size = 4
arg_first1802 = 12 ; size = 4
arg_last1802 = 16 ; size = 4
arg_s_arr1818 = 8 ; size = 4
arg_first1818 = 12 ; size = 4
arg_last1818 = 16 ; size = 4
arg_s_arr1834 = 8 ; size = 4
arg_first1834 = 12 ; size = 4
arg_last1834 = 16 ; size = 4
arg_s_arr1850 = 8 ; size = 4
arg_first1850 = 12 ; size = 4
arg_last1850 = 16 ; size = 4
arg_s_arr1866 = 8 ; size = 4
arg_first1866 = 12 ; size = 4
arg_last1866 = 16 ; size = 4
arg_s_arr1882 = 8 ; size = 4
arg_first1882 = 12 ; size = 4
arg_last1882 = 16 ; size = 4
arg_s_arr1898 = 8 ; size = 4
arg_first1898 = 12 ; size = 4
arg_last1898 = 16 ; size = 4
arg_s_arr1914 = 8 ; size = 4
arg_first1914 = 12 ; size = 4
arg_last1914 = 16 ; size = 4
arg_s_arr1930 = 8 ; size = 4
arg_first1930 = 12 ; size = 4
arg_last1930 = 16 ; size = 4
arg_s_arr1946 = 8 ; size = 4
arg_first1946 = 12 ; size = 4
arg_last1946 = 16 ; size = 4
arg_s_arr1962 = 8 ; size = 4
arg_first1962 = 12 ; size = 4
arg_last1962 = 16 ; size = 4
arg_s_arr1978 = 8 ; size = 4
arg_first1978 = 12 ; size = 4
arg_last1978 = 16 ; size = 4
arg_s_arr1994 = 8 ; size = 4
arg_first1994 = 12 ; size = 4
arg_last1994 = 16 ; size = 4
arg_s_arr2010 = 8 ; size = 4
arg_first2010 = 12 ; size = 4
arg_last2010 = 16 ; size = 4
arg_s_arr2026 = 8 ; size = 4
arg_first2026 = 12 ; size = 4
arg_last2026 = 16 ; size = 4
arg_s_arr2042 = 8 ; size = 4
arg_first2042 = 12 ; size = 4
arg_last2042 = 16 ; size = 4
arg_s_arr2058 = 8 ; size = 4
arg_first2058 = 12 ; size = 4
arg_last2058 = 16 ; size = 4
arg_s_arr2074 = 8 ; size = 4
arg_first2074 = 12 ; size = 4
arg_last2074 = 16 ; size = 4
arg_s_arr2090 = 8 ; size = 4
arg_first2090 = 12 ; size = 4
arg_last2090 = 16 ; size = 4
arg_s_arr2106 = 8 ; size = 4
arg_first2106 = 12 ; size = 4
arg_last2106 = 16 ; size = 4
arg_s_arr2122 = 8 ; size = 4
arg_first2122 = 12 ; size = 4
arg_last2122 = 16 ; size = 4
arg_s_arr2138 = 8 ; size = 4
arg_first2138 = 12 ; size = 4
arg_last2138 = 16 ; size = 4
arg_s_arr2154 = 8 ; size = 4
arg_first2154 = 12 ; size = 4
arg_last2154 = 16 ; size = 4
arg_s_arr2170 = 8 ; size = 4
arg_first2170 = 12 ; size = 4
arg_last2170 = 16 ; size = 4
arg_s_arr2186 = 8 ; size = 4
arg_first2186 = 12 ; size = 4
arg_last2186 = 16 ; size = 4
arg_s_arr2202 = 8 ; size = 4
arg_first2202 = 12 ; size = 4
arg_last2202 = 16 ; size = 4
arg_s_arr2218 = 8 ; size = 4
arg_first2218 = 12 ; size = 4
arg_last2218 = 16 ; size = 4
arg_s_arr2234 = 8 ; size = 4
arg_first2234 = 12 ; size = 4
arg_last2234 = 16 ; size = 4
arg_s_arr2250 = 8 ; size = 4
arg_first2250 = 12 ; size = 4
arg_last2250 = 16 ; size = 4
arg_s_arr2266 = 8 ; size = 4
arg_first2266 = 12 ; size = 4
arg_last2266 = 16 ; size = 4
arg_s_arr2282 = 8 ; size = 4
arg_first2282 = 12 ; size = 4
arg_last2282 = 16 ; size = 4
arg_s_arr2298 = 8 ; size = 4
arg_first2298 = 12 ; size = 4
arg_last2298 = 16 ; size = 4
arg_s_arr2314 = 8 ; size = 4
arg_first2314 = 12 ; size = 4
arg_last2314 = 16 ; size = 4
arg_s_arr2330 = 8 ; size = 4
arg_first2330 = 12 ; size = 4
arg_last2330 = 16 ; size = 4
arg_s_arr2346 = 8 ; size = 4
arg_first2346 = 12 ; size = 4
arg_last2346 = 16 ; size = 4
arg_s_arr2362 = 8 ; size = 4
arg_first2362 = 12 ; size = 4
arg_last2362 = 16 ; size = 4
arg_s_arr2378 = 8 ; size = 4
arg_first2378 = 12 ; size = 4
arg_last2378 = 16 ; size = 4
arg_s_arr2394 = 8 ; size = 4
arg_first2394 = 12 ; size = 4
arg_last2394 = 16 ; size = 4
arg_s_arr2410 = 8 ; size = 4
arg_first2410 = 12 ; size = 4
arg_last2410 = 16 ; size = 4
arg_s_arr2426 = 8 ; size = 4
arg_first2426 = 12 ; size = 4
arg_last2426 = 16 ; size = 4
arg_s_arr2442 = 8 ; size = 4
arg_first2442 = 12 ; size = 4
arg_last2442 = 16 ; size = 4
arg_s_arr2458 = 8 ; size = 4
arg_first2458 = 12 ; size = 4
arg_last2458 = 16 ; size = 4
arg_s_arr2474 = 8 ; size = 4
arg_first2474 = 12 ; size = 4
arg_last2474 = 16 ; size = 4
arg_s_arr2490 = 8 ; size = 4
arg_first2490 = 12 ; size = 4
arg_last2490 = 16 ; size = 4
arg_s_arr2506 = 8 ; size = 4
arg_first2506 = 12 ; size = 4
arg_last2506 = 16 ; size = 4
arg_s_arr2522 = 8 ; size = 4
arg_first2522 = 12 ; size = 4
arg_last2522 = 16 ; size = 4
arg_s_arr2538 = 8 ; size = 4
arg_first2538 = 12 ; size = 4
arg_last2538 = 16 ; size = 4
arg_s_arr2554 = 8 ; size = 4
arg_first2554 = 12 ; size = 4
arg_last2554 = 16 ; size = 4
arg_s_arr2570 = 8 ; size = 4
arg_first2570 = 12 ; size = 4
arg_last2570 = 16 ; size = 4
arg_s_arr2586 = 8 ; size = 4
arg_first2586 = 12 ; size = 4
arg_last2586 = 16 ; size = 4
arg_s_arr2602 = 8 ; size = 4
arg_first2602 = 12 ; size = 4
arg_last2602 = 16 ; size = 4
arg_s_arr2618 = 8 ; size = 4
arg_first2618 = 12 ; size = 4
arg_last2618 = 16 ; size = 4
arg_s_arr2634 = 8 ; size = 4
arg_first2634 = 12 ; size = 4
arg_last2634 = 16 ; size = 4
arg_s_arr2650 = 8 ; size = 4
arg_first2650 = 12 ; size = 4
arg_last2650 = 16 ; size = 4
arg_s_arr2666 = 8 ; size = 4
arg_first2666 = 12 ; size = 4
arg_last2666 = 16 ; size = 4
arg_s_arr2682 = 8 ; size = 4
arg_first2682 = 12 ; size = 4
arg_last2682 = 16 ; size = 4
arg_s_arr2698 = 8 ; size = 4
arg_first2698 = 12 ; size = 4
arg_last2698 = 16 ; size = 4
arg_s_arr2714 = 8 ; size = 4
arg_first2714 = 12 ; size = 4
arg_last2714 = 16 ; size = 4
arg_s_arr2730 = 8 ; size = 4
arg_first2730 = 12 ; size = 4
arg_last2730 = 16 ; size = 4
arg_s_arr2746 = 8 ; size = 4
arg_first2746 = 12 ; size = 4
arg_last2746 = 16 ; size = 4
arg_s_arr2762 = 8 ; size = 4
arg_first2762 = 12 ; size = 4
arg_last2762 = 16 ; size = 4
arg_s_arr2778 = 8 ; size = 4
arg_first2778 = 12 ; size = 4
arg_last2778 = 16 ; size = 4
arg_s_arr2794 = 8 ; size = 4
arg_first2794 = 12 ; size = 4
arg_last2794 = 16 ; size = 4
arg_s_arr2810 = 8 ; size = 4
arg_first2810 = 12 ; size = 4
arg_last2810 = 16 ; size = 4
arg_s_arr2826 = 8 ; size = 4
arg_first2826 = 12 ; size = 4
arg_last2826 = 16 ; size = 4
arg_s_arr2842 = 8 ; size = 4
arg_first2842 = 12 ; size = 4
arg_last2842 = 16 ; size = 4
arg_s_arr2858 = 8 ; size = 4
arg_first2858 = 12 ; size = 4
arg_last2858 = 16 ; size = 4
arg_s_arr2874 = 8 ; size = 4
arg_first2874 = 12 ; size = 4
arg_last2874 = 16 ; size = 4
arg_s_arr2890 = 8 ; size = 4
arg_first2890 = 12 ; size = 4
arg_last2890 = 16 ; size = 4
arg_s_arr2906 = 8 ; size = 4
arg_first2906 = 12 ; size = 4
arg_last2906 = 16 ; size = 4
arg_s_arr2922 = 8 ; size = 4
arg_first2922 = 12 ; size = 4
arg_last2922 = 16 ; size = 4
arg_s_arr2938 = 8 ; size = 4
arg_first2938 = 12 ; size = 4
arg_last2938 = 16 ; size = 4
arg_s_arr2954 = 8 ; size = 4
arg_first2954 = 12 ; size = 4
arg_last2954 = 16 ; size = 4
arg_s_arr2970 = 8 ; size = 4
arg_first2970 = 12 ; size = 4
arg_last2970 = 16 ; size = 4
arg_s_arr2986 = 8 ; size = 4
arg_first2986 = 12 ; size = 4
arg_last2986 = 16 ; size = 4
arg_s_arr3002 = 8 ; size = 4
arg_first3002 = 12 ; size = 4
arg_last3002 = 16 ; size = 4
arg_s_arr3018 = 8 ; size = 4
arg_first3018 = 12 ; size = 4
arg_last3018 = 16 ; size = 4
arg_s_arr3034 = 8 ; size = 4
arg_first3034 = 12 ; size = 4
arg_last3034 = 16 ; size = 4
arg_s_arr3050 = 8 ; size = 4
arg_first3050 = 12 ; size = 4
arg_last3050 = 16 ; size = 4
arg_s_arr3066 = 8 ; size = 4
arg_first3066 = 12 ; size = 4
arg_last3066 = 16 ; size = 4
arg_s_arr3082 = 8 ; size = 4
arg_first3082 = 12 ; size = 4
arg_last3082 = 16 ; size = 4
arg_s_arr3098 = 8 ; size = 4
arg_first3098 = 12 ; size = 4
arg_last3098 = 16 ; size = 4
arg_s_arr3114 = 8 ; size = 4
arg_first3114 = 12 ; size = 4
arg_last3114 = 16 ; size = 4
arg_s_arr3130 = 8 ; size = 4
arg_first3130 = 12 ; size = 4
arg_last3130 = 16 ; size = 4
arg_s_arr3146 = 8 ; size = 4
arg_first3146 = 12 ; size = 4
arg_last3146 = 16 ; size = 4
arg_s_arr3162 = 8 ; size = 4
arg_first3162 = 12 ; size = 4
arg_last3162 = 16 ; size = 4
arg_s_arr3178 = 8 ; size = 4
arg_first3178 = 12 ; size = 4
arg_last3178 = 16 ; size = 4
arg_s_arr3194 = 8 ; size = 4
arg_first3194 = 12 ; size = 4
arg_last3194 = 16 ; size = 4
arg_s_arr3210 = 8 ; size = 4
arg_first3210 = 12 ; size = 4
arg_last3210 = 16 ; size = 4
arg_s_arr3226 = 8 ; size = 4
arg_first3226 = 12 ; size = 4
arg_last3226 = 16 ; size = 4
arg_s_arr3242 = 8 ; size = 4
arg_first3242 = 12 ; size = 4
arg_last3242 = 16 ; size = 4
arg_s_arr3258 = 8 ; size = 4
arg_first3258 = 12 ; size = 4
arg_last3258 = 16 ; size = 4
arg_s_arr3274 = 8 ; size = 4
arg_first3274 = 12 ; size = 4
arg_last3274 = 16 ; size = 4
arg_s_arr3290 = 8 ; size = 4
arg_first3290 = 12 ; size = 4
arg_last3290 = 16 ; size = 4
arg_s_arr3306 = 8 ; size = 4
arg_first3306 = 12 ; size = 4
arg_last3306 = 16 ; size = 4
arg_s_arr3322 = 8 ; size = 4
arg_first3322 = 12 ; size = 4
arg_last3322 = 16 ; size = 4
arg_s_arr3338 = 8 ; size = 4
arg_first3338 = 12 ; size = 4
arg_last3338 = 16 ; size = 4
arg_s_arr3354 = 8 ; size = 4
arg_first3354 = 12 ; size = 4
arg_last3354 = 16 ; size = 4
arg_s_arr3370 = 8 ; size = 4
arg_first3370 = 12 ; size = 4
arg_last3370 = 16 ; size = 4
arg_s_arr3386 = 8 ; size = 4
arg_first3386 = 12 ; size = 4
arg_last3386 = 16 ; size = 4
arg_s_arr3402 = 8 ; size = 4
arg_first3402 = 12 ; size = 4
arg_last3402 = 16 ; size = 4
arg_s_arr3418 = 8 ; size = 4
arg_first3418 = 12 ; size = 4
arg_last3418 = 16 ; size = 4
arg_s_arr3434 = 8 ; size = 4
arg_first3434 = 12 ; size = 4
arg_last3434 = 16 ; size = 4
arg_s_arr3450 = 8 ; size = 4
arg_first3450 = 12 ; size = 4
arg_last3450 = 16 ; size = 4
arg_s_arr3466 = 8 ; size = 4
arg_first3466 = 12 ; size = 4
arg_last3466 = 16 ; size = 4
arg_s_arr3482 = 8 ; size = 4
arg_first3482 = 12 ; size = 4
arg_last3482 = 16 ; size = 4
arg_s_arr3498 = 8 ; size = 4
arg_first3498 = 12 ; size = 4
arg_last3498 = 16 ; size = 4
arg_s_arr3514 = 8 ; size = 4
arg_first3514 = 12 ; size = 4
arg_last3514 = 16 ; size = 4
arg_s_arr3530 = 8 ; size = 4
arg_first3530 = 12 ; size = 4
arg_last3530 = 16 ; size = 4
arg_s_arr3546 = 8 ; size = 4
arg_first3546 = 12 ; size = 4
arg_last3546 = 16 ; size = 4
arg_s_arr3562 = 8 ; size = 4
arg_first3562 = 12 ; size = 4
arg_last3562 = 16 ; size = 4
arg_s_arr3578 = 8 ; size = 4
arg_first3578 = 12 ; size = 4
arg_last3578 = 16 ; size = 4
arg_s_arr3594 = 8 ; size = 4
arg_first3594 = 12 ; size = 4
arg_last3594 = 16 ; size = 4
arg_s_arr3610 = 8 ; size = 4
arg_first3610 = 12 ; size = 4
arg_last3610 = 16 ; size = 4
arg_s_arr3626 = 8 ; size = 4
arg_first3626 = 12 ; size = 4
arg_last3626 = 16 ; size = 4
arg_s_arr3642 = 8 ; size = 4
arg_first3642 = 12 ; size = 4
arg_last3642 = 16 ; size = 4
arg_s_arr3658 = 8 ; size = 4
arg_first3658 = 12 ; size = 4
arg_last3658 = 16 ; size = 4
arg_s_arr3674 = 8 ; size = 4
arg_first3674 = 12 ; size = 4
arg_last3674 = 16 ; size = 4
arg_s_arr3690 = 8 ; size = 4
arg_first3690 = 12 ; size = 4
arg_last3690 = 16 ; size = 4
arg_s_arr3706 = 8 ; size = 4
arg_first3706 = 12 ; size = 4
arg_last3706 = 16 ; size = 4
arg_s_arr3722 = 8 ; size = 4
arg_first3722 = 12 ; size = 4
arg_last3722 = 16 ; size = 4
arg_s_arr3738 = 8 ; size = 4
arg_first3738 = 12 ; size = 4
arg_last3738 = 16 ; size = 4
arg_s_arr3754 = 8 ; size = 4
arg_first3754 = 12 ; size = 4
arg_last3754 = 16 ; size = 4
arg_s_arr3770 = 8 ; size = 4
arg_first3770 = 12 ; size = 4
arg_last3770 = 16 ; size = 4
arg_s_arr3786 = 8 ; size = 4
arg_first3786 = 12 ; size = 4
arg_last3786 = 16 ; size = 4
arg_s_arr3802 = 8 ; size = 4
arg_first3802 = 12 ; size = 4
arg_last3802 = 16 ; size = 4
arg_s_arr3818 = 8 ; size = 4
arg_first3818 = 12 ; size = 4
arg_last3818 = 16 ; size = 4
arg_s_arr3834 = 8 ; size = 4
arg_first3834 = 12 ; size = 4
arg_last3834 = 16 ; size = 4
arg_s_arr3850 = 8 ; size = 4
arg_first3850 = 12 ; size = 4
arg_last3850 = 16 ; size = 4
arg_s_arr3866 = 8 ; size = 4
arg_first3866 = 12 ; size = 4
arg_last3866 = 16 ; size = 4
arg_s_arr3882 = 8 ; size = 4
arg_first3882 = 12 ; size = 4
arg_last3882 = 16 ; size = 4
arg_s_arr3898 = 8 ; size = 4
arg_first3898 = 12 ; size = 4
arg_last3898 = 16 ; size = 4
arg_s_arr3914 = 8 ; size = 4
arg_first3914 = 12 ; size = 4
arg_last3914 = 16 ; size = 4
arg_s_arr3930 = 8 ; size = 4
arg_first3930 = 12 ; size = 4
arg_last3930 = 16 ; size = 4
arg_s_arr3946 = 8 ; size = 4
arg_first3946 = 12 ; size = 4
arg_last3946 = 16 ; size = 4
arg_s_arr3962 = 8 ; size = 4
arg_first3962 = 12 ; size = 4
arg_last3962 = 16 ; size = 4
arg_s_arr3978 = 8 ; size = 4
arg_first3978 = 12 ; size = 4
arg_last3978 = 16 ; size = 4
arg_s_arr3994 = 8 ; size = 4
arg_first3994 = 12 ; size = 4
arg_last3994 = 16 ; size = 4
arg_s_arr4010 = 8 ; size = 4
arg_first4010 = 12 ; size = 4
arg_last4010 = 16 ; size = 4
arg_s_arr4026 = 8 ; size = 4
arg_first4026 = 12 ; size = 4
arg_last4026 = 16 ; size = 4
arg_s_arr4042 = 8 ; size = 4
arg_first4042 = 12 ; size = 4
arg_last4042 = 16 ; size = 4
arg_s_arr4058 = 8 ; size = 4
arg_first4058 = 12 ; size = 4
arg_last4058 = 16 ; size = 4
arg_s_arr4074 = 8 ; size = 4
arg_first4074 = 12 ; size = 4
arg_last4074 = 16 ; size = 4
arg_s_arr4090 = 8 ; size = 4
arg_first4090 = 12 ; size = 4
arg_last4090 = 16 ; size = 4
arg_s_arr4106 = 8 ; size = 4
arg_first4106 = 12 ; size = 4
arg_last4106 = 16 ; size = 4
arg_s_arr4122 = 8 ; size = 4
arg_first4122 = 12 ; size = 4
arg_last4122 = 16 ; size = 4
arg_s_arr4138 = 8 ; size = 4
arg_first4138 = 12 ; size = 4
arg_last4138 = 16 ; size = 4
arg_s_arr4154 = 8 ; size = 4
arg_first4154 = 12 ; size = 4
arg_last4154 = 16 ; size = 4
arg_s_arr4170 = 8 ; size = 4
arg_first4170 = 12 ; size = 4
arg_last4170 = 16 ; size = 4
arg_s_arr4186 = 8 ; size = 4
arg_first4186 = 12 ; size = 4
arg_last4186 = 16 ; size = 4
arg_s_arr4202 = 8 ; size = 4
arg_first4202 = 12 ; size = 4
arg_last4202 = 16 ; size = 4
arg_s_arr4218 = 8 ; size = 4
arg_first4218 = 12 ; size = 4
arg_last4218 = 16 ; size = 4
arg_s_arr4234 = 8 ; size = 4
arg_first4234 = 12 ; size = 4
arg_last4234 = 16 ; size = 4
arg_s_arr4250 = 8 ; size = 4
arg_first4250 = 12 ; size = 4
arg_last4250 = 16 ; size = 4
arg_s_arr4266 = 8 ; size = 4
arg_first4266 = 12 ; size = 4
arg_last4266 = 16 ; size = 4
arg_s_arr4282 = 8 ; size = 4
arg_first4282 = 12 ; size = 4
arg_last4282 = 16 ; size = 4
arg_s_arr4298 = 8 ; size = 4
arg_first4298 = 12 ; size = 4
arg_last4298 = 16 ; size = 4
arg_s_arr4314 = 8 ; size = 4
arg_first4314 = 12 ; size = 4
arg_last4314 = 16 ; size = 4
arg_s_arr4330 = 8 ; size = 4
arg_first4330 = 12 ; size = 4
arg_last4330 = 16 ; size = 4
arg_s_arr4346 = 8 ; size = 4
arg_first4346 = 12 ; size = 4
arg_last4346 = 16 ; size = 4
arg_s_arr4362 = 8 ; size = 4
arg_first4362 = 12 ; size = 4
arg_last4362 = 16 ; size = 4
arg_s_arr4378 = 8 ; size = 4
arg_first4378 = 12 ; size = 4
arg_last4378 = 16 ; size = 4
arg_s_arr4394 = 8 ; size = 4
arg_first4394 = 12 ; size = 4
arg_last4394 = 16 ; size = 4
arg_s_arr4410 = 8 ; size = 4
arg_first4410 = 12 ; size = 4
arg_last4410 = 16 ; size = 4
arg_s_arr4426 = 8 ; size = 4
arg_first4426 = 12 ; size = 4
arg_last4426 = 16 ; size = 4
arg_s_arr4442 = 8 ; size = 4
arg_first4442 = 12 ; size = 4
arg_last4442 = 16 ; size = 4
arg_s_arr4458 = 8 ; size = 4
arg_first4458 = 12 ; size = 4
arg_last4458 = 16 ; size = 4
arg_s_arr4474 = 8 ; size = 4
arg_first4474 = 12 ; size = 4
arg_last4474 = 16 ; size = 4
arg_s_arr4490 = 8 ; size = 4
arg_first4490 = 12 ; size = 4
arg_last4490 = 16 ; size = 4
arg_s_arr4506 = 8 ; size = 4
arg_first4506 = 12 ; size = 4
arg_last4506 = 16 ; size = 4
arg_s_arr4522 = 8 ; size = 4
arg_first4522 = 12 ; size = 4
arg_last4522 = 16 ; size = 4
arg_s_arr4538 = 8 ; size = 4
arg_first4538 = 12 ; size = 4
arg_last4538 = 16 ; size = 4
arg_s_arr4554 = 8 ; size = 4
arg_first4554 = 12 ; size = 4
arg_last4554 = 16 ; size = 4
arg_s_arr4570 = 8 ; size = 4
arg_first4570 = 12 ; size = 4
arg_last4570 = 16 ; size = 4
arg_s_arr4586 = 8 ; size = 4
arg_first4586 = 12 ; size = 4
arg_last4586 = 16 ; size = 4
arg_s_arr4602 = 8 ; size = 4
arg_first4602 = 12 ; size = 4
arg_last4602 = 16 ; size = 4
arg_s_arr4618 = 8 ; size = 4
arg_first4618 = 12 ; size = 4
arg_last4618 = 16 ; size = 4
arg_s_arr4634 = 8 ; size = 4
arg_first4634 = 12 ; size = 4
arg_last4634 = 16 ; size = 4
arg_s_arr4650 = 8 ; size = 4
arg_first4650 = 12 ; size = 4
arg_last4650 = 16 ; size = 4
arg_s_arr4666 = 8 ; size = 4
arg_first4666 = 12 ; size = 4
arg_last4666 = 16 ; size = 4
arg_s_arr4682 = 8 ; size = 4
arg_first4682 = 12 ; size = 4
arg_last4682 = 16 ; size = 4
arg_s_arr4698 = 8 ; size = 4
arg_first4698 = 12 ; size = 4
arg_last4698 = 16 ; size = 4
arg_s_arr4714 = 8 ; size = 4
arg_first4714 = 12 ; size = 4
arg_last4714 = 16 ; size = 4
arg_s_arr4730 = 8 ; size = 4
arg_first4730 = 12 ; size = 4
arg_last4730 = 16 ; size = 4
arg_s_arr4746 = 8 ; size = 4
arg_first4746 = 12 ; size = 4
arg_last4746 = 16 ; size = 4
arg_s_arr4762 = 8 ; size = 4
arg_first4762 = 12 ; size = 4
arg_last4762 = 16 ; size = 4
arg_s_arr4778 = 8 ; size = 4
arg_first4778 = 12 ; size = 4
arg_last4778 = 16 ; size = 4
arg_s_arr4794 = 8 ; size = 4
arg_first4794 = 12 ; size = 4
arg_last4794 = 16 ; size = 4
arg_s_arr4810 = 8 ; size = 4
arg_first4810 = 12 ; size = 4
arg_last4810 = 16 ; size = 4
arg_s_arr4826 = 8 ; size = 4
arg_first4826 = 12 ; size = 4
arg_last4826 = 16 ; size = 4
arg_s_arr4842 = 8 ; size = 4
arg_first4842 = 12 ; size = 4
arg_last4842 = 16 ; size = 4
arg_s_arr4858 = 8 ; size = 4
arg_first4858 = 12 ; size = 4
arg_last4858 = 16 ; size = 4
arg_s_arr4874 = 8 ; size = 4
arg_first4874 = 12 ; size = 4
arg_last4874 = 16 ; size = 4
arg_s_arr4890 = 8 ; size = 4
arg_first4890 = 12 ; size = 4
arg_last4890 = 16 ; size = 4
arg_s_arr4906 = 8 ; size = 4
arg_first4906 = 12 ; size = 4
arg_last4906 = 16 ; size = 4
arg_s_arr4922 = 8 ; size = 4
arg_first4922 = 12 ; size = 4
arg_last4922 = 16 ; size = 4
arg_s_arr4938 = 8 ; size = 4
arg_first4938 = 12 ; size = 4
arg_last4938 = 16 ; size = 4
arg_s_arr4954 = 8 ; size = 4
arg_first4954 = 12 ; size = 4
arg_last4954 = 16 ; size = 4
arg_s_arr4970 = 8 ; size = 4
arg_first4970 = 12 ; size = 4
arg_last4970 = 16 ; size = 4
arg_s_arr4986 = 8 ; size = 4
arg_first4986 = 12 ; size = 4
arg_last4986 = 16 ; size = 4
arg_s_arr5002 = 8 ; size = 4
arg_first5002 = 12 ; size = 4
arg_last5002 = 16 ; size = 4
arg_s_arr5018 = 8 ; size = 4
arg_first5018 = 12 ; size = 4
arg_last5018 = 16 ; size = 4
arg_s_arr5034 = 8 ; size = 4
arg_first5034 = 12 ; size = 4
arg_last5034 = 16 ; size = 4
arg_s_arr5050 = 8 ; size = 4
arg_first5050 = 12 ; size = 4
arg_last5050 = 16 ; size = 4
arg_s_arr5066 = 8 ; size = 4
arg_first5066 = 12 ; size = 4
arg_last5066 = 16 ; size = 4
arg_s_arr5082 = 8 ; size = 4
arg_first5082 = 12 ; size = 4
arg_last5082 = 16 ; size = 4
arg_s_arr5098 = 8 ; size = 4
arg_first5098 = 12 ; size = 4
arg_last5098 = 16 ; size = 4
arg_s_arr5114 = 8 ; size = 4
arg_first5114 = 12 ; size = 4
arg_last5114 = 16 ; size = 4
arg_s_arr5130 = 8 ; size = 4
arg_first5130 = 12 ; size = 4
arg_last5130 = 16 ; size = 4
arg_s_arr5146 = 8 ; size = 4
arg_first5146 = 12 ; size = 4
arg_last5146 = 16 ; size = 4
arg_s_arr5162 = 8 ; size = 4
arg_first5162 = 12 ; size = 4
arg_last5162 = 16 ; size = 4
arg_s_arr5178 = 8 ; size = 4
arg_first5178 = 12 ; size = 4
arg_last5178 = 16 ; size = 4
arg_s_arr5194 = 8 ; size = 4
arg_first5194 = 12 ; size = 4
arg_last5194 = 16 ; size = 4
arg_s_arr5210 = 8 ; size = 4
arg_first5210 = 12 ; size = 4
arg_last5210 = 16 ; size = 4
arg_s_arr5226 = 8 ; size = 4
arg_first5226 = 12 ; size = 4
arg_last5226 = 16 ; size = 4
arg_s_arr5242 = 8 ; size = 4
arg_first5242 = 12 ; size = 4
arg_last5242 = 16 ; size = 4
arg_s_arr5258 = 8 ; size = 4
arg_first5258 = 12 ; size = 4
arg_last5258 = 16 ; size = 4
arg_s_arr5274 = 8 ; size = 4
arg_first5274 = 12 ; size = 4
arg_last5274 = 16 ; size = 4
arg_s_arr5290 = 8 ; size = 4
arg_first5290 = 12 ; size = 4
arg_last5290 = 16 ; size = 4
arg_s_arr5306 = 8 ; size = 4
arg_first5306 = 12 ; size = 4
arg_last5306 = 16 ; size = 4
arg_s_arr5322 = 8 ; size = 4
arg_first5322 = 12 ; size = 4
arg_last5322 = 16 ; size = 4
arg_s_arr5338 = 8 ; size = 4
arg_first5338 = 12 ; size = 4
arg_last5338 = 16 ; size = 4
arg_s_arr5354 = 8 ; size = 4
arg_first5354 = 12 ; size = 4
arg_last5354 = 16 ; size = 4
arg_s_arr5370 = 8 ; size = 4
arg_first5370 = 12 ; size = 4
arg_last5370 = 16 ; size = 4
arg_s_arr5386 = 8 ; size = 4
arg_first5386 = 12 ; size = 4
arg_last5386 = 16 ; size = 4
arg_s_arr5402 = 8 ; size = 4
arg_first5402 = 12 ; size = 4
arg_last5402 = 16 ; size = 4
arg_s_arr5418 = 8 ; size = 4
arg_first5418 = 12 ; size = 4
arg_last5418 = 16 ; size = 4
arg_s_arr5434 = 8 ; size = 4
arg_first5434 = 12 ; size = 4
arg_last5434 = 16 ; size = 4

print PROC
   enter 0, 0
   mov eax, [ebp + 8]
   invoke crt_printf, offset print_format, eax
   leave
   ret 4
print ENDP
println PROC
   enter 0, 0
   mov eax, [ebp + 8]
   invoke crt_printf, offset println_format, eax
   leave
   ret 4
println ENDP
input PROC
   enter 0, 0
   invoke crt_scanf, offset input_format, offset input_result
   mov eax, input_result
   leave
   ret 
input ENDP
sqrt PROC
   enter 0, 0
   mov eax, [ebp + 8]
   mov sqrt_result, eax
   finit
   fild sqrt_result
   fsqrt
   fist sqrt_result
   mov eax, sqrt_result
   leave
   ret 4
sqrt ENDP
qs PROC
   enter 0, 16
   push arg_first10[ebp]
   pop ecx
   push arg_last10[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349616038957
   push 1
   jmp _compare_end604349616038957
_compare_not_equal604349616038957:
   push 0
_compare_end604349616038957:
   pop eax
   cmp eax, 0
   je _if_end_14
_if_start_14:
   push arg_first10[ebp]
   pop eax
   mov left14[ebp], eax
   push arg_last10[ebp]
   pop eax
   mov right14[ebp], eax
   push left14[ebp]
   push right14[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr10[ebp]
   push [esi[edx]]
   pop eax
   mov middle14[ebp], eax
_loop_start_17:
_loop_aftereffects_17:
_loop_start_20:
_loop_aftereffects_20:
   push left14[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr10[ebp]
   push [esi[edx]]
   pop ecx
   push middle14[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349616164259
   push 1
   jmp _compare_end604349616164259
_compare_not_equal604349616164259:
   push 0
_compare_end604349616164259:
   pop eax
   cmp eax, 0
   je _loop_end_20
   push left14[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left14[ebp], eax
   jmp _loop_start_20
_loop_end_20:
_loop_start_23:
_loop_aftereffects_23:
   push right14[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr10[ebp]
   push [esi[edx]]
   pop ecx
   push middle14[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349616210446
   push 1
   jmp _compare_end604349616210446
_compare_not_equal604349616210446:
   push 0
_compare_end604349616210446:
   pop eax
   cmp eax, 0
   je _loop_end_23
   push right14[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right14[ebp], eax
   jmp _loop_start_23
_loop_end_23:
   push left14[ebp]
   pop ecx
   push right14[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349616254494
   push 1
   jmp _compare_end604349616254494
_compare_not_equal604349616254494:
   push 0
_compare_end604349616254494:
   pop eax
   cmp eax, 0
   je _if_end_25
_if_start_25:
   push left14[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr10[ebp]
   push [esi[edx]]
   pop eax
   mov tmp25[ebp], eax
   push right14[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr10[ebp]
   push [esi[edx]]
   pop edx
   push left14[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr10[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp25[ebp]
   pop edx
   push right14[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr10[ebp]
   add esi, ecx
   mov [esi], edx
   push left14[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left14[ebp], eax
   push right14[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right14[ebp], eax
_if_end_25:
   push left14[ebp]
   pop ecx
   push right14[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349616347295
   push 1
   jmp _compare_end604349616347295
_compare_not_equal604349616347295:
   push 0
_compare_end604349616347295:
   pop eax
   cmp eax, 0
   je _loop_end_17
   jmp _loop_start_17
_loop_end_17:

   ; init stack for qs
   push right14[ebp]
   push arg_first10[ebp]
   push arg_s_arr10[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last10[ebp]
   push left14[ebp]
   push arg_s_arr10[ebp]
   ; call qs
   call qs

_if_end_14:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first26[ebp]
   pop ecx
   push arg_last26[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349616408877
   push 1
   jmp _compare_end604349616408877
_compare_not_equal604349616408877:
   push 0
_compare_end604349616408877:
   pop eax
   cmp eax, 0
   je _if_end_30
_if_start_30:
   push arg_first26[ebp]
   pop eax
   mov left30[ebp], eax
   push arg_last26[ebp]
   pop eax
   mov right30[ebp], eax
   push left30[ebp]
   push right30[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr26[ebp]
   push [esi[edx]]
   pop eax
   mov middle30[ebp], eax
_loop_start_33:
_loop_aftereffects_33:
_loop_start_36:
_loop_aftereffects_36:
   push left30[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr26[ebp]
   push [esi[edx]]
   pop ecx
   push middle30[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349616489703
   push 1
   jmp _compare_end604349616489703
_compare_not_equal604349616489703:
   push 0
_compare_end604349616489703:
   pop eax
   cmp eax, 0
   je _loop_end_36
   push left30[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left30[ebp], eax
   jmp _loop_start_36
_loop_end_36:
_loop_start_39:
_loop_aftereffects_39:
   push right30[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr26[ebp]
   push [esi[edx]]
   pop ecx
   push middle30[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349616540594
   push 1
   jmp _compare_end604349616540594
_compare_not_equal604349616540594:
   push 0
_compare_end604349616540594:
   pop eax
   cmp eax, 0
   je _loop_end_39
   push right30[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right30[ebp], eax
   jmp _loop_start_39
_loop_end_39:
   push left30[ebp]
   pop ecx
   push right30[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349616587636
   push 1
   jmp _compare_end604349616587636
_compare_not_equal604349616587636:
   push 0
_compare_end604349616587636:
   pop eax
   cmp eax, 0
   je _if_end_41
_if_start_41:
   push left30[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr26[ebp]
   push [esi[edx]]
   pop eax
   mov tmp41[ebp], eax
   push right30[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr26[ebp]
   push [esi[edx]]
   pop edx
   push left30[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr26[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp41[ebp]
   pop edx
   push right30[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr26[ebp]
   add esi, ecx
   mov [esi], edx
   push left30[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left30[ebp], eax
   push right30[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right30[ebp], eax
_if_end_41:
   push left30[ebp]
   pop ecx
   push right30[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349616691983
   push 1
   jmp _compare_end604349616691983
_compare_not_equal604349616691983:
   push 0
_compare_end604349616691983:
   pop eax
   cmp eax, 0
   je _loop_end_33
   jmp _loop_start_33
_loop_end_33:

   ; init stack for qs
   push right30[ebp]
   push arg_first26[ebp]
   push arg_s_arr26[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last26[ebp]
   push left30[ebp]
   push arg_s_arr26[ebp]
   ; call qs
   call qs

_if_end_30:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first42[ebp]
   pop ecx
   push arg_last42[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349616755704
   push 1
   jmp _compare_end604349616755704
_compare_not_equal604349616755704:
   push 0
_compare_end604349616755704:
   pop eax
   cmp eax, 0
   je _if_end_46
_if_start_46:
   push arg_first42[ebp]
   pop eax
   mov left46[ebp], eax
   push arg_last42[ebp]
   pop eax
   mov right46[ebp], eax
   push left46[ebp]
   push right46[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr42[ebp]
   push [esi[edx]]
   pop eax
   mov middle46[ebp], eax
_loop_start_49:
_loop_aftereffects_49:
_loop_start_52:
_loop_aftereffects_52:
   push left46[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr42[ebp]
   push [esi[edx]]
   pop ecx
   push middle46[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349616846794
   push 1
   jmp _compare_end604349616846794
_compare_not_equal604349616846794:
   push 0
_compare_end604349616846794:
   pop eax
   cmp eax, 0
   je _loop_end_52
   push left46[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left46[ebp], eax
   jmp _loop_start_52
_loop_end_52:
_loop_start_55:
_loop_aftereffects_55:
   push right46[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr42[ebp]
   push [esi[edx]]
   pop ecx
   push middle46[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349616897257
   push 1
   jmp _compare_end604349616897257
_compare_not_equal604349616897257:
   push 0
_compare_end604349616897257:
   pop eax
   cmp eax, 0
   je _loop_end_55
   push right46[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right46[ebp], eax
   jmp _loop_start_55
_loop_end_55:
   push left46[ebp]
   pop ecx
   push right46[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349616945582
   push 1
   jmp _compare_end604349616945582
_compare_not_equal604349616945582:
   push 0
_compare_end604349616945582:
   pop eax
   cmp eax, 0
   je _if_end_57
_if_start_57:
   push left46[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr42[ebp]
   push [esi[edx]]
   pop eax
   mov tmp57[ebp], eax
   push right46[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr42[ebp]
   push [esi[edx]]
   pop edx
   push left46[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr42[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp57[ebp]
   pop edx
   push right46[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr42[ebp]
   add esi, ecx
   mov [esi], edx
   push left46[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left46[ebp], eax
   push right46[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right46[ebp], eax
_if_end_57:
   push left46[ebp]
   pop ecx
   push right46[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349617073450
   push 1
   jmp _compare_end604349617073450
_compare_not_equal604349617073450:
   push 0
_compare_end604349617073450:
   pop eax
   cmp eax, 0
   je _loop_end_49
   jmp _loop_start_49
_loop_end_49:

   ; init stack for qs
   push right46[ebp]
   push arg_first42[ebp]
   push arg_s_arr42[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last42[ebp]
   push left46[ebp]
   push arg_s_arr42[ebp]
   ; call qs
   call qs

_if_end_46:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first58[ebp]
   pop ecx
   push arg_last58[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349617144440
   push 1
   jmp _compare_end604349617144440
_compare_not_equal604349617144440:
   push 0
_compare_end604349617144440:
   pop eax
   cmp eax, 0
   je _if_end_62
_if_start_62:
   push arg_first58[ebp]
   pop eax
   mov left62[ebp], eax
   push arg_last58[ebp]
   pop eax
   mov right62[ebp], eax
   push left62[ebp]
   push right62[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr58[ebp]
   push [esi[edx]]
   pop eax
   mov middle62[ebp], eax
_loop_start_65:
_loop_aftereffects_65:
_loop_start_68:
_loop_aftereffects_68:
   push left62[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr58[ebp]
   push [esi[edx]]
   pop ecx
   push middle62[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349617244939
   push 1
   jmp _compare_end604349617244939
_compare_not_equal604349617244939:
   push 0
_compare_end604349617244939:
   pop eax
   cmp eax, 0
   je _loop_end_68
   push left62[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left62[ebp], eax
   jmp _loop_start_68
_loop_end_68:
_loop_start_71:
_loop_aftereffects_71:
   push right62[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr58[ebp]
   push [esi[edx]]
   pop ecx
   push middle62[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349617301389
   push 1
   jmp _compare_end604349617301389
_compare_not_equal604349617301389:
   push 0
_compare_end604349617301389:
   pop eax
   cmp eax, 0
   je _loop_end_71
   push right62[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right62[ebp], eax
   jmp _loop_start_71
_loop_end_71:
   push left62[ebp]
   pop ecx
   push right62[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349617355273
   push 1
   jmp _compare_end604349617355273
_compare_not_equal604349617355273:
   push 0
_compare_end604349617355273:
   pop eax
   cmp eax, 0
   je _if_end_73
_if_start_73:
   push left62[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr58[ebp]
   push [esi[edx]]
   pop eax
   mov tmp73[ebp], eax
   push right62[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr58[ebp]
   push [esi[edx]]
   pop edx
   push left62[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr58[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp73[ebp]
   pop edx
   push right62[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr58[ebp]
   add esi, ecx
   mov [esi], edx
   push left62[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left62[ebp], eax
   push right62[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right62[ebp], eax
_if_end_73:
   push left62[ebp]
   pop ecx
   push right62[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349617489984
   push 1
   jmp _compare_end604349617489984
_compare_not_equal604349617489984:
   push 0
_compare_end604349617489984:
   pop eax
   cmp eax, 0
   je _loop_end_65
   jmp _loop_start_65
_loop_end_65:

   ; init stack for qs
   push right62[ebp]
   push arg_first58[ebp]
   push arg_s_arr58[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last58[ebp]
   push left62[ebp]
   push arg_s_arr58[ebp]
   ; call qs
   call qs

_if_end_62:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first74[ebp]
   pop ecx
   push arg_last74[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349617570383
   push 1
   jmp _compare_end604349617570383
_compare_not_equal604349617570383:
   push 0
_compare_end604349617570383:
   pop eax
   cmp eax, 0
   je _if_end_78
_if_start_78:
   push arg_first74[ebp]
   pop eax
   mov left78[ebp], eax
   push arg_last74[ebp]
   pop eax
   mov right78[ebp], eax
   push left78[ebp]
   push right78[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr74[ebp]
   push [esi[edx]]
   pop eax
   mov middle78[ebp], eax
_loop_start_81:
_loop_aftereffects_81:
_loop_start_84:
_loop_aftereffects_84:
   push left78[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr74[ebp]
   push [esi[edx]]
   pop ecx
   push middle78[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349617676868
   push 1
   jmp _compare_end604349617676868
_compare_not_equal604349617676868:
   push 0
_compare_end604349617676868:
   pop eax
   cmp eax, 0
   je _loop_end_84
   push left78[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left78[ebp], eax
   jmp _loop_start_84
_loop_end_84:
_loop_start_87:
_loop_aftereffects_87:
   push right78[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr74[ebp]
   push [esi[edx]]
   pop ecx
   push middle78[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349617707659
   push 1
   jmp _compare_end604349617707659
_compare_not_equal604349617707659:
   push 0
_compare_end604349617707659:
   pop eax
   cmp eax, 0
   je _loop_end_87
   push right78[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right78[ebp], eax
   jmp _loop_start_87
_loop_end_87:
   push left78[ebp]
   pop ecx
   push right78[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349617726048
   push 1
   jmp _compare_end604349617726048
_compare_not_equal604349617726048:
   push 0
_compare_end604349617726048:
   pop eax
   cmp eax, 0
   je _if_end_89
_if_start_89:
   push left78[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr74[ebp]
   push [esi[edx]]
   pop eax
   mov tmp89[ebp], eax
   push right78[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr74[ebp]
   push [esi[edx]]
   pop edx
   push left78[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr74[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp89[ebp]
   pop edx
   push right78[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr74[ebp]
   add esi, ecx
   mov [esi], edx
   push left78[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left78[ebp], eax
   push right78[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right78[ebp], eax
_if_end_89:
   push left78[ebp]
   pop ecx
   push right78[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349617766248
   push 1
   jmp _compare_end604349617766248
_compare_not_equal604349617766248:
   push 0
_compare_end604349617766248:
   pop eax
   cmp eax, 0
   je _loop_end_81
   jmp _loop_start_81
_loop_end_81:

   ; init stack for qs
   push right78[ebp]
   push arg_first74[ebp]
   push arg_s_arr74[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last74[ebp]
   push left78[ebp]
   push arg_s_arr74[ebp]
   ; call qs
   call qs

_if_end_78:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first90[ebp]
   pop ecx
   push arg_last90[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349617795756
   push 1
   jmp _compare_end604349617795756
_compare_not_equal604349617795756:
   push 0
_compare_end604349617795756:
   pop eax
   cmp eax, 0
   je _if_end_94
_if_start_94:
   push arg_first90[ebp]
   pop eax
   mov left94[ebp], eax
   push arg_last90[ebp]
   pop eax
   mov right94[ebp], eax
   push left94[ebp]
   push right94[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr90[ebp]
   push [esi[edx]]
   pop eax
   mov middle94[ebp], eax
_loop_start_97:
_loop_aftereffects_97:
_loop_start_100:
_loop_aftereffects_100:
   push left94[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr90[ebp]
   push [esi[edx]]
   pop ecx
   push middle94[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349617871450
   push 1
   jmp _compare_end604349617871450
_compare_not_equal604349617871450:
   push 0
_compare_end604349617871450:
   pop eax
   cmp eax, 0
   je _loop_end_100
   push left94[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left94[ebp], eax
   jmp _loop_start_100
_loop_end_100:
_loop_start_103:
_loop_aftereffects_103:
   push right94[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr90[ebp]
   push [esi[edx]]
   pop ecx
   push middle94[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349617934743
   push 1
   jmp _compare_end604349617934743
_compare_not_equal604349617934743:
   push 0
_compare_end604349617934743:
   pop eax
   cmp eax, 0
   je _loop_end_103
   push right94[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right94[ebp], eax
   jmp _loop_start_103
_loop_end_103:
   push left94[ebp]
   pop ecx
   push right94[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349617995897
   push 1
   jmp _compare_end604349617995897
_compare_not_equal604349617995897:
   push 0
_compare_end604349617995897:
   pop eax
   cmp eax, 0
   je _if_end_105
_if_start_105:
   push left94[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr90[ebp]
   push [esi[edx]]
   pop eax
   mov tmp105[ebp], eax
   push right94[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr90[ebp]
   push [esi[edx]]
   pop edx
   push left94[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr90[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp105[ebp]
   pop edx
   push right94[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr90[ebp]
   add esi, ecx
   mov [esi], edx
   push left94[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left94[ebp], eax
   push right94[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right94[ebp], eax
_if_end_105:
   push left94[ebp]
   pop ecx
   push right94[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349618122483
   push 1
   jmp _compare_end604349618122483
_compare_not_equal604349618122483:
   push 0
_compare_end604349618122483:
   pop eax
   cmp eax, 0
   je _loop_end_97
   jmp _loop_start_97
_loop_end_97:

   ; init stack for qs
   push right94[ebp]
   push arg_first90[ebp]
   push arg_s_arr90[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last90[ebp]
   push left94[ebp]
   push arg_s_arr90[ebp]
   ; call qs
   call qs

_if_end_94:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first106[ebp]
   pop ecx
   push arg_last106[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349618156267
   push 1
   jmp _compare_end604349618156267
_compare_not_equal604349618156267:
   push 0
_compare_end604349618156267:
   pop eax
   cmp eax, 0
   je _if_end_110
_if_start_110:
   push arg_first106[ebp]
   pop eax
   mov left110[ebp], eax
   push arg_last106[ebp]
   pop eax
   mov right110[ebp], eax
   push left110[ebp]
   push right110[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr106[ebp]
   push [esi[edx]]
   pop eax
   mov middle110[ebp], eax
_loop_start_113:
_loop_aftereffects_113:
_loop_start_116:
_loop_aftereffects_116:
   push left110[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr106[ebp]
   push [esi[edx]]
   pop ecx
   push middle110[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349618268740
   push 1
   jmp _compare_end604349618268740
_compare_not_equal604349618268740:
   push 0
_compare_end604349618268740:
   pop eax
   cmp eax, 0
   je _loop_end_116
   push left110[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left110[ebp], eax
   jmp _loop_start_116
_loop_end_116:
_loop_start_119:
_loop_aftereffects_119:
   push right110[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr106[ebp]
   push [esi[edx]]
   pop ecx
   push middle110[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349618335454
   push 1
   jmp _compare_end604349618335454
_compare_not_equal604349618335454:
   push 0
_compare_end604349618335454:
   pop eax
   cmp eax, 0
   je _loop_end_119
   push right110[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right110[ebp], eax
   jmp _loop_start_119
_loop_end_119:
   push left110[ebp]
   pop ecx
   push right110[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349618400885
   push 1
   jmp _compare_end604349618400885
_compare_not_equal604349618400885:
   push 0
_compare_end604349618400885:
   pop eax
   cmp eax, 0
   je _if_end_121
_if_start_121:
   push left110[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr106[ebp]
   push [esi[edx]]
   pop eax
   mov tmp121[ebp], eax
   push right110[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr106[ebp]
   push [esi[edx]]
   pop edx
   push left110[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr106[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp121[ebp]
   pop edx
   push right110[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr106[ebp]
   add esi, ecx
   mov [esi], edx
   push left110[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left110[ebp], eax
   push right110[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right110[ebp], eax
_if_end_121:
   push left110[ebp]
   pop ecx
   push right110[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349618580072
   push 1
   jmp _compare_end604349618580072
_compare_not_equal604349618580072:
   push 0
_compare_end604349618580072:
   pop eax
   cmp eax, 0
   je _loop_end_113
   jmp _loop_start_113
_loop_end_113:

   ; init stack for qs
   push right110[ebp]
   push arg_first106[ebp]
   push arg_s_arr106[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last106[ebp]
   push left110[ebp]
   push arg_s_arr106[ebp]
   ; call qs
   call qs

_if_end_110:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first122[ebp]
   pop ecx
   push arg_last122[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349618675011
   push 1
   jmp _compare_end604349618675011
_compare_not_equal604349618675011:
   push 0
_compare_end604349618675011:
   pop eax
   cmp eax, 0
   je _if_end_126
_if_start_126:
   push arg_first122[ebp]
   pop eax
   mov left126[ebp], eax
   push arg_last122[ebp]
   pop eax
   mov right126[ebp], eax
   push left126[ebp]
   push right126[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr122[ebp]
   push [esi[edx]]
   pop eax
   mov middle126[ebp], eax
_loop_start_129:
_loop_aftereffects_129:
_loop_start_132:
_loop_aftereffects_132:
   push left126[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr122[ebp]
   push [esi[edx]]
   pop ecx
   push middle126[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349618801168
   push 1
   jmp _compare_end604349618801168
_compare_not_equal604349618801168:
   push 0
_compare_end604349618801168:
   pop eax
   cmp eax, 0
   je _loop_end_132
   push left126[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left126[ebp], eax
   jmp _loop_start_132
_loop_end_132:
_loop_start_135:
_loop_aftereffects_135:
   push right126[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr122[ebp]
   push [esi[edx]]
   pop ecx
   push middle126[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349618871303
   push 1
   jmp _compare_end604349618871303
_compare_not_equal604349618871303:
   push 0
_compare_end604349618871303:
   pop eax
   cmp eax, 0
   je _loop_end_135
   push right126[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right126[ebp], eax
   jmp _loop_start_135
_loop_end_135:
   push left126[ebp]
   pop ecx
   push right126[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349618989763
   push 1
   jmp _compare_end604349618989763
_compare_not_equal604349618989763:
   push 0
_compare_end604349618989763:
   pop eax
   cmp eax, 0
   je _if_end_137
_if_start_137:
   push left126[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr122[ebp]
   push [esi[edx]]
   pop eax
   mov tmp137[ebp], eax
   push right126[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr122[ebp]
   push [esi[edx]]
   pop edx
   push left126[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr122[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp137[ebp]
   pop edx
   push right126[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr122[ebp]
   add esi, ecx
   mov [esi], edx
   push left126[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left126[ebp], eax
   push right126[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right126[ebp], eax
_if_end_137:
   push left126[ebp]
   pop ecx
   push right126[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349619185201
   push 1
   jmp _compare_end604349619185201
_compare_not_equal604349619185201:
   push 0
_compare_end604349619185201:
   pop eax
   cmp eax, 0
   je _loop_end_129
   jmp _loop_start_129
_loop_end_129:

   ; init stack for qs
   push right126[ebp]
   push arg_first122[ebp]
   push arg_s_arr122[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last122[ebp]
   push left126[ebp]
   push arg_s_arr122[ebp]
   ; call qs
   call qs

_if_end_126:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first138[ebp]
   pop ecx
   push arg_last138[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349619284416
   push 1
   jmp _compare_end604349619284416
_compare_not_equal604349619284416:
   push 0
_compare_end604349619284416:
   pop eax
   cmp eax, 0
   je _if_end_142
_if_start_142:
   push arg_first138[ebp]
   pop eax
   mov left142[ebp], eax
   push arg_last138[ebp]
   pop eax
   mov right142[ebp], eax
   push left142[ebp]
   push right142[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr138[ebp]
   push [esi[edx]]
   pop eax
   mov middle142[ebp], eax
_loop_start_145:
_loop_aftereffects_145:
_loop_start_148:
_loop_aftereffects_148:
   push left142[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr138[ebp]
   push [esi[edx]]
   pop ecx
   push middle142[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349619420837
   push 1
   jmp _compare_end604349619420837
_compare_not_equal604349619420837:
   push 0
_compare_end604349619420837:
   pop eax
   cmp eax, 0
   je _loop_end_148
   push left142[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left142[ebp], eax
   jmp _loop_start_148
_loop_end_148:
_loop_start_151:
_loop_aftereffects_151:
   push right142[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr138[ebp]
   push [esi[edx]]
   pop ecx
   push middle142[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349619496960
   push 1
   jmp _compare_end604349619496960
_compare_not_equal604349619496960:
   push 0
_compare_end604349619496960:
   pop eax
   cmp eax, 0
   je _loop_end_151
   push right142[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right142[ebp], eax
   jmp _loop_start_151
_loop_end_151:
   push left142[ebp]
   pop ecx
   push right142[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349619582063
   push 1
   jmp _compare_end604349619582063
_compare_not_equal604349619582063:
   push 0
_compare_end604349619582063:
   pop eax
   cmp eax, 0
   je _if_end_153
_if_start_153:
   push left142[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr138[ebp]
   push [esi[edx]]
   pop eax
   mov tmp153[ebp], eax
   push right142[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr138[ebp]
   push [esi[edx]]
   pop edx
   push left142[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr138[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp153[ebp]
   pop edx
   push right142[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr138[ebp]
   add esi, ecx
   mov [esi], edx
   push left142[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left142[ebp], eax
   push right142[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right142[ebp], eax
_if_end_153:
   push left142[ebp]
   pop ecx
   push right142[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349619784770
   push 1
   jmp _compare_end604349619784770
_compare_not_equal604349619784770:
   push 0
_compare_end604349619784770:
   pop eax
   cmp eax, 0
   je _loop_end_145
   jmp _loop_start_145
_loop_end_145:

   ; init stack for qs
   push right142[ebp]
   push arg_first138[ebp]
   push arg_s_arr138[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last138[ebp]
   push left142[ebp]
   push arg_s_arr138[ebp]
   ; call qs
   call qs

_if_end_142:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first154[ebp]
   pop ecx
   push arg_last154[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349619887407
   push 1
   jmp _compare_end604349619887407
_compare_not_equal604349619887407:
   push 0
_compare_end604349619887407:
   pop eax
   cmp eax, 0
   je _if_end_158
_if_start_158:
   push arg_first154[ebp]
   pop eax
   mov left158[ebp], eax
   push arg_last154[ebp]
   pop eax
   mov right158[ebp], eax
   push left158[ebp]
   push right158[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr154[ebp]
   push [esi[edx]]
   pop eax
   mov middle158[ebp], eax
_loop_start_161:
_loop_aftereffects_161:
_loop_start_164:
_loop_aftereffects_164:
   push left158[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr154[ebp]
   push [esi[edx]]
   pop ecx
   push middle158[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349620040507
   push 1
   jmp _compare_end604349620040507
_compare_not_equal604349620040507:
   push 0
_compare_end604349620040507:
   pop eax
   cmp eax, 0
   je _loop_end_164
   push left158[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left158[ebp], eax
   jmp _loop_start_164
_loop_end_164:
_loop_start_167:
_loop_aftereffects_167:
   push right158[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr154[ebp]
   push [esi[edx]]
   pop ecx
   push middle158[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349620127320
   push 1
   jmp _compare_end604349620127320
_compare_not_equal604349620127320:
   push 0
_compare_end604349620127320:
   pop eax
   cmp eax, 0
   je _loop_end_167
   push right158[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right158[ebp], eax
   jmp _loop_start_167
_loop_end_167:
   push left158[ebp]
   pop ecx
   push right158[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349620206864
   push 1
   jmp _compare_end604349620206864
_compare_not_equal604349620206864:
   push 0
_compare_end604349620206864:
   pop eax
   cmp eax, 0
   je _if_end_169
_if_start_169:
   push left158[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr154[ebp]
   push [esi[edx]]
   pop eax
   mov tmp169[ebp], eax
   push right158[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr154[ebp]
   push [esi[edx]]
   pop edx
   push left158[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr154[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp169[ebp]
   pop edx
   push right158[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr154[ebp]
   add esi, ecx
   mov [esi], edx
   push left158[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left158[ebp], eax
   push right158[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right158[ebp], eax
_if_end_169:
   push left158[ebp]
   pop ecx
   push right158[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349620444211
   push 1
   jmp _compare_end604349620444211
_compare_not_equal604349620444211:
   push 0
_compare_end604349620444211:
   pop eax
   cmp eax, 0
   je _loop_end_161
   jmp _loop_start_161
_loop_end_161:

   ; init stack for qs
   push right158[ebp]
   push arg_first154[ebp]
   push arg_s_arr154[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last154[ebp]
   push left158[ebp]
   push arg_s_arr154[ebp]
   ; call qs
   call qs

_if_end_158:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first170[ebp]
   pop ecx
   push arg_last170[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349620560105
   push 1
   jmp _compare_end604349620560105
_compare_not_equal604349620560105:
   push 0
_compare_end604349620560105:
   pop eax
   cmp eax, 0
   je _if_end_174
_if_start_174:
   push arg_first170[ebp]
   pop eax
   mov left174[ebp], eax
   push arg_last170[ebp]
   pop eax
   mov right174[ebp], eax
   push left174[ebp]
   push right174[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr170[ebp]
   push [esi[edx]]
   pop eax
   mov middle174[ebp], eax
_loop_start_177:
_loop_aftereffects_177:
_loop_start_180:
_loop_aftereffects_180:
   push left174[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr170[ebp]
   push [esi[edx]]
   pop ecx
   push middle174[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349620658893
   push 1
   jmp _compare_end604349620658893
_compare_not_equal604349620658893:
   push 0
_compare_end604349620658893:
   pop eax
   cmp eax, 0
   je _loop_end_180
   push left174[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left174[ebp], eax
   jmp _loop_start_180
_loop_end_180:
_loop_start_183:
_loop_aftereffects_183:
   push right174[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr170[ebp]
   push [esi[edx]]
   pop ecx
   push middle174[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349620735015
   push 1
   jmp _compare_end604349620735015
_compare_not_equal604349620735015:
   push 0
_compare_end604349620735015:
   pop eax
   cmp eax, 0
   je _loop_end_183
   push right174[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right174[ebp], eax
   jmp _loop_start_183
_loop_end_183:
   push left174[ebp]
   pop ecx
   push right174[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349620817125
   push 1
   jmp _compare_end604349620817125
_compare_not_equal604349620817125:
   push 0
_compare_end604349620817125:
   pop eax
   cmp eax, 0
   je _if_end_185
_if_start_185:
   push left174[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr170[ebp]
   push [esi[edx]]
   pop eax
   mov tmp185[ebp], eax
   push right174[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr170[ebp]
   push [esi[edx]]
   pop edx
   push left174[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr170[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp185[ebp]
   pop edx
   push right174[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr170[ebp]
   add esi, ecx
   mov [esi], edx
   push left174[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left174[ebp], eax
   push right174[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right174[ebp], eax
_if_end_185:
   push left174[ebp]
   pop ecx
   push right174[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349621058321
   push 1
   jmp _compare_end604349621058321
_compare_not_equal604349621058321:
   push 0
_compare_end604349621058321:
   pop eax
   cmp eax, 0
   je _loop_end_177
   jmp _loop_start_177
_loop_end_177:

   ; init stack for qs
   push right174[ebp]
   push arg_first170[ebp]
   push arg_s_arr170[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last170[ebp]
   push left174[ebp]
   push arg_s_arr170[ebp]
   ; call qs
   call qs

_if_end_174:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first186[ebp]
   pop ecx
   push arg_last186[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349621177209
   push 1
   jmp _compare_end604349621177209
_compare_not_equal604349621177209:
   push 0
_compare_end604349621177209:
   pop eax
   cmp eax, 0
   je _if_end_190
_if_start_190:
   push arg_first186[ebp]
   pop eax
   mov left190[ebp], eax
   push arg_last186[ebp]
   pop eax
   mov right190[ebp], eax
   push left190[ebp]
   push right190[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr186[ebp]
   push [esi[edx]]
   pop eax
   mov middle190[ebp], eax
_loop_start_193:
_loop_aftereffects_193:
_loop_start_196:
_loop_aftereffects_196:
   push left190[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr186[ebp]
   push [esi[edx]]
   pop ecx
   push middle190[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349621400444
   push 1
   jmp _compare_end604349621400444
_compare_not_equal604349621400444:
   push 0
_compare_end604349621400444:
   pop eax
   cmp eax, 0
   je _loop_end_196
   push left190[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left190[ebp], eax
   jmp _loop_start_196
_loop_end_196:
_loop_start_199:
_loop_aftereffects_199:
   push right190[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr186[ebp]
   push [esi[edx]]
   pop ecx
   push middle190[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349621491106
   push 1
   jmp _compare_end604349621491106
_compare_not_equal604349621491106:
   push 0
_compare_end604349621491106:
   pop eax
   cmp eax, 0
   je _loop_end_199
   push right190[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right190[ebp], eax
   jmp _loop_start_199
_loop_end_199:
   push left190[ebp]
   pop ecx
   push right190[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349621566373
   push 1
   jmp _compare_end604349621566373
_compare_not_equal604349621566373:
   push 0
_compare_end604349621566373:
   pop eax
   cmp eax, 0
   je _if_end_201
_if_start_201:
   push left190[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr186[ebp]
   push [esi[edx]]
   pop eax
   mov tmp201[ebp], eax
   push right190[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr186[ebp]
   push [esi[edx]]
   pop edx
   push left190[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr186[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp201[ebp]
   pop edx
   push right190[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr186[ebp]
   add esi, ecx
   mov [esi], edx
   push left190[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left190[ebp], eax
   push right190[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right190[ebp], eax
_if_end_201:
   push left190[ebp]
   pop ecx
   push right190[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349621690392
   push 1
   jmp _compare_end604349621690392
_compare_not_equal604349621690392:
   push 0
_compare_end604349621690392:
   pop eax
   cmp eax, 0
   je _loop_end_193
   jmp _loop_start_193
_loop_end_193:

   ; init stack for qs
   push right190[ebp]
   push arg_first186[ebp]
   push arg_s_arr186[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last186[ebp]
   push left190[ebp]
   push arg_s_arr186[ebp]
   ; call qs
   call qs

_if_end_190:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first202[ebp]
   pop ecx
   push arg_last202[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349621726315
   push 1
   jmp _compare_end604349621726315
_compare_not_equal604349621726315:
   push 0
_compare_end604349621726315:
   pop eax
   cmp eax, 0
   je _if_end_206
_if_start_206:
   push arg_first202[ebp]
   pop eax
   mov left206[ebp], eax
   push arg_last202[ebp]
   pop eax
   mov right206[ebp], eax
   push left206[ebp]
   push right206[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr202[ebp]
   push [esi[edx]]
   pop eax
   mov middle206[ebp], eax
_loop_start_209:
_loop_aftereffects_209:
_loop_start_212:
_loop_aftereffects_212:
   push left206[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr202[ebp]
   push [esi[edx]]
   pop ecx
   push middle206[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349621893528
   push 1
   jmp _compare_end604349621893528
_compare_not_equal604349621893528:
   push 0
_compare_end604349621893528:
   pop eax
   cmp eax, 0
   je _loop_end_212
   push left206[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left206[ebp], eax
   jmp _loop_start_212
_loop_end_212:
_loop_start_215:
_loop_aftereffects_215:
   push right206[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr202[ebp]
   push [esi[edx]]
   pop ecx
   push middle206[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349621985901
   push 1
   jmp _compare_end604349621985901
_compare_not_equal604349621985901:
   push 0
_compare_end604349621985901:
   pop eax
   cmp eax, 0
   je _loop_end_215
   push right206[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right206[ebp], eax
   jmp _loop_start_215
_loop_end_215:
   push left206[ebp]
   pop ecx
   push right206[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349622082123
   push 1
   jmp _compare_end604349622082123
_compare_not_equal604349622082123:
   push 0
_compare_end604349622082123:
   pop eax
   cmp eax, 0
   je _if_end_217
_if_start_217:
   push left206[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr202[ebp]
   push [esi[edx]]
   pop eax
   mov tmp217[ebp], eax
   push right206[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr202[ebp]
   push [esi[edx]]
   pop edx
   push left206[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr202[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp217[ebp]
   pop edx
   push right206[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr202[ebp]
   add esi, ecx
   mov [esi], edx
   push left206[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left206[ebp], eax
   push right206[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right206[ebp], eax
_if_end_217:
   push left206[ebp]
   pop ecx
   push right206[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349622345557
   push 1
   jmp _compare_end604349622345557
_compare_not_equal604349622345557:
   push 0
_compare_end604349622345557:
   pop eax
   cmp eax, 0
   je _loop_end_209
   jmp _loop_start_209
_loop_end_209:

   ; init stack for qs
   push right206[ebp]
   push arg_first202[ebp]
   push arg_s_arr202[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last202[ebp]
   push left206[ebp]
   push arg_s_arr202[ebp]
   ; call qs
   call qs

_if_end_206:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first218[ebp]
   pop ecx
   push arg_last218[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349622476419
   push 1
   jmp _compare_end604349622476419
_compare_not_equal604349622476419:
   push 0
_compare_end604349622476419:
   pop eax
   cmp eax, 0
   je _if_end_222
_if_start_222:
   push arg_first218[ebp]
   pop eax
   mov left222[ebp], eax
   push arg_last218[ebp]
   pop eax
   mov right222[ebp], eax
   push left222[ebp]
   push right222[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr218[ebp]
   push [esi[edx]]
   pop eax
   mov middle222[ebp], eax
_loop_start_225:
_loop_aftereffects_225:
_loop_start_228:
_loop_aftereffects_228:
   push left222[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr218[ebp]
   push [esi[edx]]
   pop ecx
   push middle222[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349622656033
   push 1
   jmp _compare_end604349622656033
_compare_not_equal604349622656033:
   push 0
_compare_end604349622656033:
   pop eax
   cmp eax, 0
   je _loop_end_228
   push left222[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left222[ebp], eax
   jmp _loop_start_228
_loop_end_228:
_loop_start_231:
_loop_aftereffects_231:
   push right222[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr218[ebp]
   push [esi[edx]]
   pop ecx
   push middle222[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349622755249
   push 1
   jmp _compare_end604349622755249
_compare_not_equal604349622755249:
   push 0
_compare_end604349622755249:
   pop eax
   cmp eax, 0
   je _loop_end_231
   push right222[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right222[ebp], eax
   jmp _loop_start_231
_loop_end_231:
   push left222[ebp]
   pop ecx
   push right222[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349622854892
   push 1
   jmp _compare_end604349622854892
_compare_not_equal604349622854892:
   push 0
_compare_end604349622854892:
   pop eax
   cmp eax, 0
   je _if_end_233
_if_start_233:
   push left222[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr218[ebp]
   push [esi[edx]]
   pop eax
   mov tmp233[ebp], eax
   push right222[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr218[ebp]
   push [esi[edx]]
   pop edx
   push left222[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr218[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp233[ebp]
   pop edx
   push right222[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr218[ebp]
   add esi, ecx
   mov [esi], edx
   push left222[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left222[ebp], eax
   push right222[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right222[ebp], eax
_if_end_233:
   push left222[ebp]
   pop ecx
   push right222[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349623138853
   push 1
   jmp _compare_end604349623138853
_compare_not_equal604349623138853:
   push 0
_compare_end604349623138853:
   pop eax
   cmp eax, 0
   je _loop_end_225
   jmp _loop_start_225
_loop_end_225:

   ; init stack for qs
   push right222[ebp]
   push arg_first218[ebp]
   push arg_s_arr218[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last218[ebp]
   push left222[ebp]
   push arg_s_arr218[ebp]
   ; call qs
   call qs

_if_end_222:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first234[ebp]
   pop ecx
   push arg_last234[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349623285111
   push 1
   jmp _compare_end604349623285111
_compare_not_equal604349623285111:
   push 0
_compare_end604349623285111:
   pop eax
   cmp eax, 0
   je _if_end_238
_if_start_238:
   push arg_first234[ebp]
   pop eax
   mov left238[ebp], eax
   push arg_last234[ebp]
   pop eax
   mov right238[ebp], eax
   push left238[ebp]
   push right238[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr234[ebp]
   push [esi[edx]]
   pop eax
   mov middle238[ebp], eax
_loop_start_241:
_loop_aftereffects_241:
_loop_start_244:
_loop_aftereffects_244:
   push left238[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr234[ebp]
   push [esi[edx]]
   pop ecx
   push middle238[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349623468574
   push 1
   jmp _compare_end604349623468574
_compare_not_equal604349623468574:
   push 0
_compare_end604349623468574:
   pop eax
   cmp eax, 0
   je _loop_end_244
   push left238[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left238[ebp], eax
   jmp _loop_start_244
_loop_end_244:
_loop_start_247:
_loop_aftereffects_247:
   push right238[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr234[ebp]
   push [esi[edx]]
   pop ecx
   push middle238[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349623581047
   push 1
   jmp _compare_end604349623581047
_compare_not_equal604349623581047:
   push 0
_compare_end604349623581047:
   pop eax
   cmp eax, 0
   je _loop_end_247
   push right238[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right238[ebp], eax
   jmp _loop_start_247
_loop_end_247:
   push left238[ebp]
   pop ecx
   push right238[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349623684111
   push 1
   jmp _compare_end604349623684111
_compare_not_equal604349623684111:
   push 0
_compare_end604349623684111:
   pop eax
   cmp eax, 0
   je _if_end_249
_if_start_249:
   push left238[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr234[ebp]
   push [esi[edx]]
   pop eax
   mov tmp249[ebp], eax
   push right238[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr234[ebp]
   push [esi[edx]]
   pop edx
   push left238[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr234[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp249[ebp]
   pop edx
   push right238[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr234[ebp]
   add esi, ecx
   mov [esi], edx
   push left238[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left238[ebp], eax
   push right238[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right238[ebp], eax
_if_end_249:
   push left238[ebp]
   pop ecx
   push right238[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349623980475
   push 1
   jmp _compare_end604349623980475
_compare_not_equal604349623980475:
   push 0
_compare_end604349623980475:
   pop eax
   cmp eax, 0
   je _loop_end_241
   jmp _loop_start_241
_loop_end_241:

   ; init stack for qs
   push right238[ebp]
   push arg_first234[ebp]
   push arg_s_arr234[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last234[ebp]
   push left238[ebp]
   push arg_s_arr234[ebp]
   ; call qs
   call qs

_if_end_238:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first250[ebp]
   pop ecx
   push arg_last250[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349624128443
   push 1
   jmp _compare_end604349624128443
_compare_not_equal604349624128443:
   push 0
_compare_end604349624128443:
   pop eax
   cmp eax, 0
   je _if_end_254
_if_start_254:
   push arg_first250[ebp]
   pop eax
   mov left254[ebp], eax
   push arg_last250[ebp]
   pop eax
   mov right254[ebp], eax
   push left254[ebp]
   push right254[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr250[ebp]
   push [esi[edx]]
   pop eax
   mov middle254[ebp], eax
_loop_start_257:
_loop_aftereffects_257:
_loop_start_260:
_loop_aftereffects_260:
   push left254[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr250[ebp]
   push [esi[edx]]
   pop ecx
   push middle254[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349624325163
   push 1
   jmp _compare_end604349624325163
_compare_not_equal604349624325163:
   push 0
_compare_end604349624325163:
   pop eax
   cmp eax, 0
   je _loop_end_260
   push left254[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left254[ebp], eax
   jmp _loop_start_260
_loop_end_260:
_loop_start_263:
_loop_aftereffects_263:
   push right254[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr250[ebp]
   push [esi[edx]]
   pop ecx
   push middle254[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349624432932
   push 1
   jmp _compare_end604349624432932
_compare_not_equal604349624432932:
   push 0
_compare_end604349624432932:
   pop eax
   cmp eax, 0
   je _loop_end_263
   push right254[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right254[ebp], eax
   jmp _loop_start_263
_loop_end_263:
   push left254[ebp]
   pop ecx
   push right254[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349624538562
   push 1
   jmp _compare_end604349624538562
_compare_not_equal604349624538562:
   push 0
_compare_end604349624538562:
   pop eax
   cmp eax, 0
   je _if_end_265
_if_start_265:
   push left254[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr250[ebp]
   push [esi[edx]]
   pop eax
   mov tmp265[ebp], eax
   push right254[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr250[ebp]
   push [esi[edx]]
   pop edx
   push left254[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr250[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp265[ebp]
   pop edx
   push right254[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr250[ebp]
   add esi, ecx
   mov [esi], edx
   push left254[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left254[ebp], eax
   push right254[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right254[ebp], eax
_if_end_265:
   push left254[ebp]
   pop ecx
   push right254[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349624850749
   push 1
   jmp _compare_end604349624850749
_compare_not_equal604349624850749:
   push 0
_compare_end604349624850749:
   pop eax
   cmp eax, 0
   je _loop_end_257
   jmp _loop_start_257
_loop_end_257:

   ; init stack for qs
   push right254[ebp]
   push arg_first250[ebp]
   push arg_s_arr250[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last250[ebp]
   push left254[ebp]
   push arg_s_arr250[ebp]
   ; call qs
   call qs

_if_end_254:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first266[ebp]
   pop ecx
   push arg_last266[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349624984604
   push 1
   jmp _compare_end604349624984604
_compare_not_equal604349624984604:
   push 0
_compare_end604349624984604:
   pop eax
   cmp eax, 0
   je _if_end_270
_if_start_270:
   push arg_first266[ebp]
   pop eax
   mov left270[ebp], eax
   push arg_last266[ebp]
   pop eax
   mov right270[ebp], eax
   push left270[ebp]
   push right270[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr266[ebp]
   push [esi[edx]]
   pop eax
   mov middle270[ebp], eax
_loop_start_273:
_loop_aftereffects_273:
_loop_start_276:
_loop_aftereffects_276:
   push left270[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr266[ebp]
   push [esi[edx]]
   pop ecx
   push middle270[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349625190733
   push 1
   jmp _compare_end604349625190733
_compare_not_equal604349625190733:
   push 0
_compare_end604349625190733:
   pop eax
   cmp eax, 0
   je _loop_end_276
   push left270[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left270[ebp], eax
   jmp _loop_start_276
_loop_end_276:
_loop_start_279:
_loop_aftereffects_279:
   push right270[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr266[ebp]
   push [esi[edx]]
   pop ecx
   push middle270[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349625301923
   push 1
   jmp _compare_end604349625301923
_compare_not_equal604349625301923:
   push 0
_compare_end604349625301923:
   pop eax
   cmp eax, 0
   je _loop_end_279
   push right270[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right270[ebp], eax
   jmp _loop_start_279
_loop_end_279:
   push left270[ebp]
   pop ecx
   push right270[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349625413112
   push 1
   jmp _compare_end604349625413112
_compare_not_equal604349625413112:
   push 0
_compare_end604349625413112:
   pop eax
   cmp eax, 0
   je _if_end_281
_if_start_281:
   push left270[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr266[ebp]
   push [esi[edx]]
   pop eax
   mov tmp281[ebp], eax
   push right270[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr266[ebp]
   push [esi[edx]]
   pop edx
   push left270[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr266[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp281[ebp]
   pop edx
   push right270[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr266[ebp]
   add esi, ecx
   mov [esi], edx
   push left270[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left270[ebp], eax
   push right270[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right270[ebp], eax
_if_end_281:
   push left270[ebp]
   pop ecx
   push right270[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349625742405
   push 1
   jmp _compare_end604349625742405
_compare_not_equal604349625742405:
   push 0
_compare_end604349625742405:
   pop eax
   cmp eax, 0
   je _loop_end_273
   jmp _loop_start_273
_loop_end_273:

   ; init stack for qs
   push right270[ebp]
   push arg_first266[ebp]
   push arg_s_arr266[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last266[ebp]
   push left270[ebp]
   push arg_s_arr266[ebp]
   ; call qs
   call qs

_if_end_270:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first282[ebp]
   pop ecx
   push arg_last282[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349625908762
   push 1
   jmp _compare_end604349625908762
_compare_not_equal604349625908762:
   push 0
_compare_end604349625908762:
   pop eax
   cmp eax, 0
   je _if_end_286
_if_start_286:
   push arg_first282[ebp]
   pop eax
   mov left286[ebp], eax
   push arg_last282[ebp]
   pop eax
   mov right286[ebp], eax
   push left286[ebp]
   push right286[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr282[ebp]
   push [esi[edx]]
   pop eax
   mov middle286[ebp], eax
_loop_start_289:
_loop_aftereffects_289:
_loop_start_292:
_loop_aftereffects_292:
   push left286[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr282[ebp]
   push [esi[edx]]
   pop ecx
   push middle286[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349626142261
   push 1
   jmp _compare_end604349626142261
_compare_not_equal604349626142261:
   push 0
_compare_end604349626142261:
   pop eax
   cmp eax, 0
   je _loop_end_292
   push left286[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left286[ebp], eax
   jmp _loop_start_292
_loop_end_292:
_loop_start_295:
_loop_aftereffects_295:
   push right286[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr282[ebp]
   push [esi[edx]]
   pop ecx
   push middle286[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349626260293
   push 1
   jmp _compare_end604349626260293
_compare_not_equal604349626260293:
   push 0
_compare_end604349626260293:
   pop eax
   cmp eax, 0
   je _loop_end_295
   push right286[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right286[ebp], eax
   jmp _loop_start_295
_loop_end_295:
   push left286[ebp]
   pop ecx
   push right286[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349626374904
   push 1
   jmp _compare_end604349626374904
_compare_not_equal604349626374904:
   push 0
_compare_end604349626374904:
   pop eax
   cmp eax, 0
   je _if_end_297
_if_start_297:
   push left286[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr282[ebp]
   push [esi[edx]]
   pop eax
   mov tmp297[ebp], eax
   push right286[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr282[ebp]
   push [esi[edx]]
   pop edx
   push left286[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr282[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp297[ebp]
   pop edx
   push right286[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr282[ebp]
   add esi, ecx
   mov [esi], edx
   push left286[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left286[ebp], eax
   push right286[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right286[ebp], eax
_if_end_297:
   push left286[ebp]
   pop ecx
   push right286[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349626692650
   push 1
   jmp _compare_end604349626692650
_compare_not_equal604349626692650:
   push 0
_compare_end604349626692650:
   pop eax
   cmp eax, 0
   je _loop_end_289
   jmp _loop_start_289
_loop_end_289:

   ; init stack for qs
   push right286[ebp]
   push arg_first282[ebp]
   push arg_s_arr282[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last282[ebp]
   push left286[ebp]
   push arg_s_arr282[ebp]
   ; call qs
   call qs

_if_end_286:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first298[ebp]
   pop ecx
   push arg_last298[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349626852165
   push 1
   jmp _compare_end604349626852165
_compare_not_equal604349626852165:
   push 0
_compare_end604349626852165:
   pop eax
   cmp eax, 0
   je _if_end_302
_if_start_302:
   push arg_first298[ebp]
   pop eax
   mov left302[ebp], eax
   push arg_last298[ebp]
   pop eax
   mov right302[ebp], eax
   push left302[ebp]
   push right302[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr298[ebp]
   push [esi[edx]]
   pop eax
   mov middle302[ebp], eax
_loop_start_305:
_loop_aftereffects_305:
_loop_start_308:
_loop_aftereffects_308:
   push left302[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr298[ebp]
   push [esi[edx]]
   pop ecx
   push middle302[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349627071551
   push 1
   jmp _compare_end604349627071551
_compare_not_equal604349627071551:
   push 0
_compare_end604349627071551:
   pop eax
   cmp eax, 0
   je _loop_end_308
   push left302[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left302[ebp], eax
   jmp _loop_start_308
_loop_end_308:
_loop_start_311:
_loop_aftereffects_311:
   push right302[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr298[ebp]
   push [esi[edx]]
   pop ecx
   push middle302[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349627190866
   push 1
   jmp _compare_end604349627190866
_compare_not_equal604349627190866:
   push 0
_compare_end604349627190866:
   pop eax
   cmp eax, 0
   je _loop_end_311
   push right302[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right302[ebp], eax
   jmp _loop_start_311
_loop_end_311:
   push left302[ebp]
   pop ecx
   push right302[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349627303767
   push 1
   jmp _compare_end604349627303767
_compare_not_equal604349627303767:
   push 0
_compare_end604349627303767:
   pop eax
   cmp eax, 0
   je _if_end_313
_if_start_313:
   push left302[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr298[ebp]
   push [esi[edx]]
   pop eax
   mov tmp313[ebp], eax
   push right302[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr298[ebp]
   push [esi[edx]]
   pop edx
   push left302[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr298[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp313[ebp]
   pop edx
   push right302[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr298[ebp]
   add esi, ecx
   mov [esi], edx
   push left302[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left302[ebp], eax
   push right302[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right302[ebp], eax
_if_end_313:
   push left302[ebp]
   pop ecx
   push right302[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349627661712
   push 1
   jmp _compare_end604349627661712
_compare_not_equal604349627661712:
   push 0
_compare_end604349627661712:
   pop eax
   cmp eax, 0
   je _loop_end_305
   jmp _loop_start_305
_loop_end_305:

   ; init stack for qs
   push right302[ebp]
   push arg_first298[ebp]
   push arg_s_arr298[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last298[ebp]
   push left302[ebp]
   push arg_s_arr298[ebp]
   ; call qs
   call qs

_if_end_302:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first314[ebp]
   pop ecx
   push arg_last314[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349627826786
   push 1
   jmp _compare_end604349627826786
_compare_not_equal604349627826786:
   push 0
_compare_end604349627826786:
   pop eax
   cmp eax, 0
   je _if_end_318
_if_start_318:
   push arg_first314[ebp]
   pop eax
   mov left318[ebp], eax
   push arg_last314[ebp]
   pop eax
   mov right318[ebp], eax
   push left318[ebp]
   push right318[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr314[ebp]
   push [esi[edx]]
   pop eax
   mov middle318[ebp], eax
_loop_start_321:
_loop_aftereffects_321:
_loop_start_324:
_loop_aftereffects_324:
   push left318[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr314[ebp]
   push [esi[edx]]
   pop ecx
   push middle318[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349628041041
   push 1
   jmp _compare_end604349628041041
_compare_not_equal604349628041041:
   push 0
_compare_end604349628041041:
   pop eax
   cmp eax, 0
   je _loop_end_324
   push left318[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left318[ebp], eax
   jmp _loop_start_324
_loop_end_324:
_loop_start_327:
_loop_aftereffects_327:
   push right318[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr314[ebp]
   push [esi[edx]]
   pop ecx
   push middle318[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349628159928
   push 1
   jmp _compare_end604349628159928
_compare_not_equal604349628159928:
   push 0
_compare_end604349628159928:
   pop eax
   cmp eax, 0
   je _loop_end_327
   push right318[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right318[ebp], eax
   jmp _loop_start_327
_loop_end_327:
   push left318[ebp]
   pop ecx
   push right318[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349628223648
   push 1
   jmp _compare_end604349628223648
_compare_not_equal604349628223648:
   push 0
_compare_end604349628223648:
   pop eax
   cmp eax, 0
   je _if_end_329
_if_start_329:
   push left318[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr314[ebp]
   push [esi[edx]]
   pop eax
   mov tmp329[ebp], eax
   push right318[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr314[ebp]
   push [esi[edx]]
   pop edx
   push left318[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr314[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp329[ebp]
   pop edx
   push right318[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr314[ebp]
   add esi, ecx
   mov [esi], edx
   push left318[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left318[ebp], eax
   push right318[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right318[ebp], eax
_if_end_329:
   push left318[ebp]
   pop ecx
   push right318[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349628384874
   push 1
   jmp _compare_end604349628384874
_compare_not_equal604349628384874:
   push 0
_compare_end604349628384874:
   pop eax
   cmp eax, 0
   je _loop_end_321
   jmp _loop_start_321
_loop_end_321:

   ; init stack for qs
   push right318[ebp]
   push arg_first314[ebp]
   push arg_s_arr314[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last314[ebp]
   push left318[ebp]
   push arg_s_arr314[ebp]
   ; call qs
   call qs

_if_end_318:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first330[ebp]
   pop ecx
   push arg_last330[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349628492215
   push 1
   jmp _compare_end604349628492215
_compare_not_equal604349628492215:
   push 0
_compare_end604349628492215:
   pop eax
   cmp eax, 0
   je _if_end_334
_if_start_334:
   push arg_first330[ebp]
   pop eax
   mov left334[ebp], eax
   push arg_last330[ebp]
   pop eax
   mov right334[ebp], eax
   push left334[ebp]
   push right334[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr330[ebp]
   push [esi[edx]]
   pop eax
   mov middle334[ebp], eax
_loop_start_337:
_loop_aftereffects_337:
_loop_start_340:
_loop_aftereffects_340:
   push left334[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr330[ebp]
   push [esi[edx]]
   pop ecx
   push middle334[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349628721009
   push 1
   jmp _compare_end604349628721009
_compare_not_equal604349628721009:
   push 0
_compare_end604349628721009:
   pop eax
   cmp eax, 0
   je _loop_end_340
   push left334[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left334[ebp], eax
   jmp _loop_start_340
_loop_end_340:
_loop_start_343:
_loop_aftereffects_343:
   push right334[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr330[ebp]
   push [esi[edx]]
   pop ecx
   push middle334[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349628848022
   push 1
   jmp _compare_end604349628848022
_compare_not_equal604349628848022:
   push 0
_compare_end604349628848022:
   pop eax
   cmp eax, 0
   je _loop_end_343
   push right334[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right334[ebp], eax
   jmp _loop_start_343
_loop_end_343:
   push left334[ebp]
   pop ecx
   push right334[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349628974607
   push 1
   jmp _compare_end604349628974607
_compare_not_equal604349628974607:
   push 0
_compare_end604349628974607:
   pop eax
   cmp eax, 0
   je _if_end_345
_if_start_345:
   push left334[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr330[ebp]
   push [esi[edx]]
   pop eax
   mov tmp345[ebp], eax
   push right334[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr330[ebp]
   push [esi[edx]]
   pop edx
   push left334[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr330[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp345[ebp]
   pop edx
   push right334[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr330[ebp]
   add esi, ecx
   mov [esi], edx
   push left334[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left334[ebp], eax
   push right334[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right334[ebp], eax
_if_end_345:
   push left334[ebp]
   pop ecx
   push right334[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349629363344
   push 1
   jmp _compare_end604349629363344
_compare_not_equal604349629363344:
   push 0
_compare_end604349629363344:
   pop eax
   cmp eax, 0
   je _loop_end_337
   jmp _loop_start_337
_loop_end_337:

   ; init stack for qs
   push right334[ebp]
   push arg_first330[ebp]
   push arg_s_arr330[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last330[ebp]
   push left334[ebp]
   push arg_s_arr330[ebp]
   ; call qs
   call qs

_if_end_334:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first346[ebp]
   pop ecx
   push arg_last346[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349629540392
   push 1
   jmp _compare_end604349629540392
_compare_not_equal604349629540392:
   push 0
_compare_end604349629540392:
   pop eax
   cmp eax, 0
   je _if_end_350
_if_start_350:
   push arg_first346[ebp]
   pop eax
   mov left350[ebp], eax
   push arg_last346[ebp]
   pop eax
   mov right350[ebp], eax
   push left350[ebp]
   push right350[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr346[ebp]
   push [esi[edx]]
   pop eax
   mov middle350[ebp], eax
_loop_start_353:
_loop_aftereffects_353:
_loop_start_356:
_loop_aftereffects_356:
   push left350[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr346[ebp]
   push [esi[edx]]
   pop ecx
   push middle350[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349629788003
   push 1
   jmp _compare_end604349629788003
_compare_not_equal604349629788003:
   push 0
_compare_end604349629788003:
   pop eax
   cmp eax, 0
   je _loop_end_356
   push left350[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left350[ebp], eax
   jmp _loop_start_356
_loop_end_356:
_loop_start_359:
_loop_aftereffects_359:
   push right350[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr346[ebp]
   push [esi[edx]]
   pop ecx
   push middle350[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349629921431
   push 1
   jmp _compare_end604349629921431
_compare_not_equal604349629921431:
   push 0
_compare_end604349629921431:
   pop eax
   cmp eax, 0
   je _loop_end_359
   push right350[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right350[ebp], eax
   jmp _loop_start_359
_loop_end_359:
   push left350[ebp]
   pop ecx
   push right350[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349630054004
   push 1
   jmp _compare_end604349630054004
_compare_not_equal604349630054004:
   push 0
_compare_end604349630054004:
   pop eax
   cmp eax, 0
   je _if_end_361
_if_start_361:
   push left350[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr346[ebp]
   push [esi[edx]]
   pop eax
   mov tmp361[ebp], eax
   push right350[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr346[ebp]
   push [esi[edx]]
   pop edx
   push left350[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr346[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp361[ebp]
   pop edx
   push right350[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr346[ebp]
   add esi, ecx
   mov [esi], edx
   push left350[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left350[ebp], eax
   push right350[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right350[ebp], eax
_if_end_361:
   push left350[ebp]
   pop ecx
   push right350[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349630450438
   push 1
   jmp _compare_end604349630450438
_compare_not_equal604349630450438:
   push 0
_compare_end604349630450438:
   pop eax
   cmp eax, 0
   je _loop_end_353
   jmp _loop_start_353
_loop_end_353:

   ; init stack for qs
   push right350[ebp]
   push arg_first346[ebp]
   push arg_s_arr346[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last346[ebp]
   push left350[ebp]
   push arg_s_arr346[ebp]
   ; call qs
   call qs

_if_end_350:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first362[ebp]
   pop ecx
   push arg_last362[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349630594129
   push 1
   jmp _compare_end604349630594129
_compare_not_equal604349630594129:
   push 0
_compare_end604349630594129:
   pop eax
   cmp eax, 0
   je _if_end_366
_if_start_366:
   push arg_first362[ebp]
   pop eax
   mov left366[ebp], eax
   push arg_last362[ebp]
   pop eax
   mov right366[ebp], eax
   push left366[ebp]
   push right366[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr362[ebp]
   push [esi[edx]]
   pop eax
   mov middle366[ebp], eax
_loop_start_369:
_loop_aftereffects_369:
_loop_start_372:
_loop_aftereffects_372:
   push left366[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr362[ebp]
   push [esi[edx]]
   pop ecx
   push middle366[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349630830622
   push 1
   jmp _compare_end604349630830622
_compare_not_equal604349630830622:
   push 0
_compare_end604349630830622:
   pop eax
   cmp eax, 0
   je _loop_end_372
   push left366[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left366[ebp], eax
   jmp _loop_start_372
_loop_end_372:
_loop_start_375:
_loop_aftereffects_375:
   push right366[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr362[ebp]
   push [esi[edx]]
   pop ecx
   push middle366[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349630970892
   push 1
   jmp _compare_end604349630970892
_compare_not_equal604349630970892:
   push 0
_compare_end604349630970892:
   pop eax
   cmp eax, 0
   je _loop_end_375
   push right366[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right366[ebp], eax
   jmp _loop_start_375
_loop_end_375:
   push left366[ebp]
   pop ecx
   push right366[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349631112017
   push 1
   jmp _compare_end604349631112017
_compare_not_equal604349631112017:
   push 0
_compare_end604349631112017:
   pop eax
   cmp eax, 0
   je _if_end_377
_if_start_377:
   push left366[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr362[ebp]
   push [esi[edx]]
   pop eax
   mov tmp377[ebp], eax
   push right366[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr362[ebp]
   push [esi[edx]]
   pop edx
   push left366[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr362[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp377[ebp]
   pop edx
   push right366[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr362[ebp]
   add esi, ecx
   mov [esi], edx
   push left366[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left366[ebp], eax
   push right366[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right366[ebp], eax
_if_end_377:
   push left366[ebp]
   pop ecx
   push right366[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349631526841
   push 1
   jmp _compare_end604349631526841
_compare_not_equal604349631526841:
   push 0
_compare_end604349631526841:
   pop eax
   cmp eax, 0
   je _loop_end_369
   jmp _loop_start_369
_loop_end_369:

   ; init stack for qs
   push right366[ebp]
   push arg_first362[ebp]
   push arg_s_arr362[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last362[ebp]
   push left366[ebp]
   push arg_s_arr362[ebp]
   ; call qs
   call qs

_if_end_366:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first378[ebp]
   pop ecx
   push arg_last378[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349631715436
   push 1
   jmp _compare_end604349631715436
_compare_not_equal604349631715436:
   push 0
_compare_end604349631715436:
   pop eax
   cmp eax, 0
   je _if_end_382
_if_start_382:
   push arg_first378[ebp]
   pop eax
   mov left382[ebp], eax
   push arg_last378[ebp]
   pop eax
   mov right382[ebp], eax
   push left382[ebp]
   push right382[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr378[ebp]
   push [esi[edx]]
   pop eax
   mov middle382[ebp], eax
_loop_start_385:
_loop_aftereffects_385:
_loop_start_388:
_loop_aftereffects_388:
   push left382[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr378[ebp]
   push [esi[edx]]
   pop ecx
   push middle382[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349631974593
   push 1
   jmp _compare_end604349631974593
_compare_not_equal604349631974593:
   push 0
_compare_end604349631974593:
   pop eax
   cmp eax, 0
   je _loop_end_388
   push left382[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left382[ebp], eax
   jmp _loop_start_388
_loop_end_388:
_loop_start_391:
_loop_aftereffects_391:
   push right382[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr378[ebp]
   push [esi[edx]]
   pop ecx
   push middle382[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349632118713
   push 1
   jmp _compare_end604349632118713
_compare_not_equal604349632118713:
   push 0
_compare_end604349632118713:
   pop eax
   cmp eax, 0
   je _loop_end_391
   push right382[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right382[ebp], eax
   jmp _loop_start_391
_loop_end_391:
   push left382[ebp]
   pop ecx
   push right382[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349632259838
   push 1
   jmp _compare_end604349632259838
_compare_not_equal604349632259838:
   push 0
_compare_end604349632259838:
   pop eax
   cmp eax, 0
   je _if_end_393
_if_start_393:
   push left382[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr378[ebp]
   push [esi[edx]]
   pop eax
   mov tmp393[ebp], eax
   push right382[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr378[ebp]
   push [esi[edx]]
   pop edx
   push left382[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr378[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp393[ebp]
   pop edx
   push right382[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr378[ebp]
   add esi, ecx
   mov [esi], edx
   push left382[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left382[ebp], eax
   push right382[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right382[ebp], eax
_if_end_393:
   push left382[ebp]
   pop ecx
   push right382[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349632699038
   push 1
   jmp _compare_end604349632699038
_compare_not_equal604349632699038:
   push 0
_compare_end604349632699038:
   pop eax
   cmp eax, 0
   je _loop_end_385
   jmp _loop_start_385
_loop_end_385:

   ; init stack for qs
   push right382[ebp]
   push arg_first378[ebp]
   push arg_s_arr378[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last378[ebp]
   push left382[ebp]
   push arg_s_arr378[ebp]
   ; call qs
   call qs

_if_end_382:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first394[ebp]
   pop ecx
   push arg_last394[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349632895331
   push 1
   jmp _compare_end604349632895331
_compare_not_equal604349632895331:
   push 0
_compare_end604349632895331:
   pop eax
   cmp eax, 0
   je _if_end_398
_if_start_398:
   push arg_first394[ebp]
   pop eax
   mov left398[ebp], eax
   push arg_last394[ebp]
   pop eax
   mov right398[ebp], eax
   push left398[ebp]
   push right398[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr394[ebp]
   push [esi[edx]]
   pop eax
   mov middle398[ebp], eax
_loop_start_401:
_loop_aftereffects_401:
_loop_start_404:
_loop_aftereffects_404:
   push left398[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr394[ebp]
   push [esi[edx]]
   pop ecx
   push middle398[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349633134389
   push 1
   jmp _compare_end604349633134389
_compare_not_equal604349633134389:
   push 0
_compare_end604349633134389:
   pop eax
   cmp eax, 0
   je _loop_end_404
   push left398[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left398[ebp], eax
   jmp _loop_start_404
_loop_end_404:
_loop_start_407:
_loop_aftereffects_407:
   push right398[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr394[ebp]
   push [esi[edx]]
   pop ecx
   push middle398[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349633201958
   push 1
   jmp _compare_end604349633201958
_compare_not_equal604349633201958:
   push 0
_compare_end604349633201958:
   pop eax
   cmp eax, 0
   je _loop_end_407
   push right398[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right398[ebp], eax
   jmp _loop_start_407
_loop_end_407:
   push left398[ebp]
   pop ecx
   push right398[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349633252421
   push 1
   jmp _compare_end604349633252421
_compare_not_equal604349633252421:
   push 0
_compare_end604349633252421:
   pop eax
   cmp eax, 0
   je _if_end_409
_if_start_409:
   push left398[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr394[ebp]
   push [esi[edx]]
   pop eax
   mov tmp409[ebp], eax
   push right398[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr394[ebp]
   push [esi[edx]]
   pop edx
   push left398[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr394[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp409[ebp]
   pop edx
   push right398[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr394[ebp]
   add esi, ecx
   mov [esi], edx
   push left398[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left398[ebp], eax
   push right398[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right398[ebp], eax
_if_end_409:
   push left398[ebp]
   pop ecx
   push right398[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349633667244
   push 1
   jmp _compare_end604349633667244
_compare_not_equal604349633667244:
   push 0
_compare_end604349633667244:
   pop eax
   cmp eax, 0
   je _loop_end_401
   jmp _loop_start_401
_loop_end_401:

   ; init stack for qs
   push right398[ebp]
   push arg_first394[ebp]
   push arg_s_arr394[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last394[ebp]
   push left398[ebp]
   push arg_s_arr394[ebp]
   ; call qs
   call qs

_if_end_398:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first410[ebp]
   pop ecx
   push arg_last410[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349633869097
   push 1
   jmp _compare_end604349633869097
_compare_not_equal604349633869097:
   push 0
_compare_end604349633869097:
   pop eax
   cmp eax, 0
   je _if_end_414
_if_start_414:
   push arg_first410[ebp]
   pop eax
   mov left414[ebp], eax
   push arg_last410[ebp]
   pop eax
   mov right414[ebp], eax
   push left414[ebp]
   push right414[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr410[ebp]
   push [esi[edx]]
   pop eax
   mov middle414[ebp], eax
_loop_start_417:
_loop_aftereffects_417:
_loop_start_420:
_loop_aftereffects_420:
   push left414[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr410[ebp]
   push [esi[edx]]
   pop ecx
   push middle414[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349634125688
   push 1
   jmp _compare_end604349634125688
_compare_not_equal604349634125688:
   push 0
_compare_end604349634125688:
   pop eax
   cmp eax, 0
   je _loop_end_420
   push left414[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left414[ebp], eax
   jmp _loop_start_420
_loop_end_420:
_loop_start_423:
_loop_aftereffects_423:
   push right414[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr410[ebp]
   push [esi[edx]]
   pop ecx
   push middle414[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349634345502
   push 1
   jmp _compare_end604349634345502
_compare_not_equal604349634345502:
   push 0
_compare_end604349634345502:
   pop eax
   cmp eax, 0
   je _loop_end_423
   push right414[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right414[ebp], eax
   jmp _loop_start_423
_loop_end_423:
   push left414[ebp]
   pop ecx
   push right414[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349634495608
   push 1
   jmp _compare_end604349634495608
_compare_not_equal604349634495608:
   push 0
_compare_end604349634495608:
   pop eax
   cmp eax, 0
   je _if_end_425
_if_start_425:
   push left414[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr410[ebp]
   push [esi[edx]]
   pop eax
   mov tmp425[ebp], eax
   push right414[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr410[ebp]
   push [esi[edx]]
   pop edx
   push left414[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr410[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp425[ebp]
   pop edx
   push right414[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr410[ebp]
   add esi, ecx
   mov [esi], edx
   push left414[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left414[ebp], eax
   push right414[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right414[ebp], eax
_if_end_425:
   push left414[ebp]
   pop ecx
   push right414[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349634827895
   push 1
   jmp _compare_end604349634827895
_compare_not_equal604349634827895:
   push 0
_compare_end604349634827895:
   pop eax
   cmp eax, 0
   je _loop_end_417
   jmp _loop_start_417
_loop_end_417:

   ; init stack for qs
   push right414[ebp]
   push arg_first410[ebp]
   push arg_s_arr410[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last410[ebp]
   push left414[ebp]
   push arg_s_arr410[ebp]
   ; call qs
   call qs

_if_end_414:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first426[ebp]
   pop ecx
   push arg_last426[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349634885628
   push 1
   jmp _compare_end604349634885628
_compare_not_equal604349634885628:
   push 0
_compare_end604349634885628:
   pop eax
   cmp eax, 0
   je _if_end_430
_if_start_430:
   push arg_first426[ebp]
   pop eax
   mov left430[ebp], eax
   push arg_last426[ebp]
   pop eax
   mov right430[ebp], eax
   push left430[ebp]
   push right430[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr426[ebp]
   push [esi[edx]]
   pop eax
   mov middle430[ebp], eax
_loop_start_433:
_loop_aftereffects_433:
_loop_start_436:
_loop_aftereffects_436:
   push left430[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr426[ebp]
   push [esi[edx]]
   pop ecx
   push middle430[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349634959612
   push 1
   jmp _compare_end604349634959612
_compare_not_equal604349634959612:
   push 0
_compare_end604349634959612:
   pop eax
   cmp eax, 0
   je _loop_end_436
   push left430[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left430[ebp], eax
   jmp _loop_start_436
_loop_end_436:
_loop_start_439:
_loop_aftereffects_439:
   push right430[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr426[ebp]
   push [esi[edx]]
   pop ecx
   push middle430[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349635004088
   push 1
   jmp _compare_end604349635004088
_compare_not_equal604349635004088:
   push 0
_compare_end604349635004088:
   pop eax
   cmp eax, 0
   je _loop_end_439
   push right430[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right430[ebp], eax
   jmp _loop_start_439
_loop_end_439:
   push left430[ebp]
   pop ecx
   push right430[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349635041721
   push 1
   jmp _compare_end604349635041721
_compare_not_equal604349635041721:
   push 0
_compare_end604349635041721:
   pop eax
   cmp eax, 0
   je _if_end_441
_if_start_441:
   push left430[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr426[ebp]
   push [esi[edx]]
   pop eax
   mov tmp441[ebp], eax
   push right430[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr426[ebp]
   push [esi[edx]]
   pop edx
   push left430[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr426[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp441[ebp]
   pop edx
   push right430[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr426[ebp]
   add esi, ecx
   mov [esi], edx
   push left430[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left430[ebp], eax
   push right430[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right430[ebp], eax
_if_end_441:
   push left430[ebp]
   pop ecx
   push right430[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349635155049
   push 1
   jmp _compare_end604349635155049
_compare_not_equal604349635155049:
   push 0
_compare_end604349635155049:
   pop eax
   cmp eax, 0
   je _loop_end_433
   jmp _loop_start_433
_loop_end_433:

   ; init stack for qs
   push right430[ebp]
   push arg_first426[ebp]
   push arg_s_arr426[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last426[ebp]
   push left430[ebp]
   push arg_s_arr426[ebp]
   ; call qs
   call qs

_if_end_430:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first442[ebp]
   pop ecx
   push arg_last442[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349635207651
   push 1
   jmp _compare_end604349635207651
_compare_not_equal604349635207651:
   push 0
_compare_end604349635207651:
   pop eax
   cmp eax, 0
   je _if_end_446
_if_start_446:
   push arg_first442[ebp]
   pop eax
   mov left446[ebp], eax
   push arg_last442[ebp]
   pop eax
   mov right446[ebp], eax
   push left446[ebp]
   push right446[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr442[ebp]
   push [esi[edx]]
   pop eax
   mov middle446[ebp], eax
_loop_start_449:
_loop_aftereffects_449:
_loop_start_452:
_loop_aftereffects_452:
   push left446[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr442[ebp]
   push [esi[edx]]
   pop ecx
   push middle446[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349635351342
   push 1
   jmp _compare_end604349635351342
_compare_not_equal604349635351342:
   push 0
_compare_end604349635351342:
   pop eax
   cmp eax, 0
   je _loop_end_452
   push left446[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left446[ebp], eax
   jmp _loop_start_452
_loop_end_452:
_loop_start_455:
_loop_aftereffects_455:
   push right446[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr442[ebp]
   push [esi[edx]]
   pop ecx
   push middle446[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349635530101
   push 1
   jmp _compare_end604349635530101
_compare_not_equal604349635530101:
   push 0
_compare_end604349635530101:
   pop eax
   cmp eax, 0
   je _loop_end_455
   push right446[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right446[ebp], eax
   jmp _loop_start_455
_loop_end_455:
   push left446[ebp]
   pop ecx
   push right446[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349635687477
   push 1
   jmp _compare_end604349635687477
_compare_not_equal604349635687477:
   push 0
_compare_end604349635687477:
   pop eax
   cmp eax, 0
   je _if_end_457
_if_start_457:
   push left446[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr442[ebp]
   push [esi[edx]]
   pop eax
   mov tmp457[ebp], eax
   push right446[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr442[ebp]
   push [esi[edx]]
   pop edx
   push left446[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr442[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp457[ebp]
   pop edx
   push right446[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr442[ebp]
   add esi, ecx
   mov [esi], edx
   push left446[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left446[ebp], eax
   push right446[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right446[ebp], eax
_if_end_457:
   push left446[ebp]
   pop ecx
   push right446[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349636169870
   push 1
   jmp _compare_end604349636169870
_compare_not_equal604349636169870:
   push 0
_compare_end604349636169870:
   pop eax
   cmp eax, 0
   je _loop_end_449
   jmp _loop_start_449
_loop_end_449:

   ; init stack for qs
   push right446[ebp]
   push arg_first442[ebp]
   push arg_s_arr442[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last442[ebp]
   push left446[ebp]
   push arg_s_arr442[ebp]
   ; call qs
   call qs

_if_end_446:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first458[ebp]
   pop ecx
   push arg_last458[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349636384552
   push 1
   jmp _compare_end604349636384552
_compare_not_equal604349636384552:
   push 0
_compare_end604349636384552:
   pop eax
   cmp eax, 0
   je _if_end_462
_if_start_462:
   push arg_first458[ebp]
   pop eax
   mov left462[ebp], eax
   push arg_last458[ebp]
   pop eax
   mov right462[ebp], eax
   push left462[ebp]
   push right462[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr458[ebp]
   push [esi[edx]]
   pop eax
   mov middle462[ebp], eax
_loop_start_465:
_loop_aftereffects_465:
_loop_start_468:
_loop_aftereffects_468:
   push left462[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr458[ebp]
   push [esi[edx]]
   pop ecx
   push middle462[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349636665520
   push 1
   jmp _compare_end604349636665520
_compare_not_equal604349636665520:
   push 0
_compare_end604349636665520:
   pop eax
   cmp eax, 0
   je _loop_end_468
   push left462[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left462[ebp], eax
   jmp _loop_start_468
_loop_end_468:
_loop_start_471:
_loop_aftereffects_471:
   push right462[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr458[ebp]
   push [esi[edx]]
   pop ecx
   push middle462[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349636827601
   push 1
   jmp _compare_end604349636827601
_compare_not_equal604349636827601:
   push 0
_compare_end604349636827601:
   pop eax
   cmp eax, 0
   je _loop_end_471
   push right462[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right462[ebp], eax
   jmp _loop_start_471
_loop_end_471:
   push left462[ebp]
   pop ecx
   push right462[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349636994813
   push 1
   jmp _compare_end604349636994813
_compare_not_equal604349636994813:
   push 0
_compare_end604349636994813:
   pop eax
   cmp eax, 0
   je _if_end_473
_if_start_473:
   push left462[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr458[ebp]
   push [esi[edx]]
   pop eax
   mov tmp473[ebp], eax
   push right462[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr458[ebp]
   push [esi[edx]]
   pop edx
   push left462[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr458[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp473[ebp]
   pop edx
   push right462[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr458[ebp]
   add esi, ecx
   mov [esi], edx
   push left462[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left462[ebp], eax
   push right462[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right462[ebp], eax
_if_end_473:
   push left462[ebp]
   pop ecx
   push right462[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349637490035
   push 1
   jmp _compare_end604349637490035
_compare_not_equal604349637490035:
   push 0
_compare_end604349637490035:
   pop eax
   cmp eax, 0
   je _loop_end_465
   jmp _loop_start_465
_loop_end_465:

   ; init stack for qs
   push right462[ebp]
   push arg_first458[ebp]
   push arg_s_arr458[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last458[ebp]
   push left462[ebp]
   push arg_s_arr458[ebp]
   ; call qs
   call qs

_if_end_462:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first474[ebp]
   pop ecx
   push arg_last474[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349637714981
   push 1
   jmp _compare_end604349637714981
_compare_not_equal604349637714981:
   push 0
_compare_end604349637714981:
   pop eax
   cmp eax, 0
   je _if_end_478
_if_start_478:
   push arg_first474[ebp]
   pop eax
   mov left478[ebp], eax
   push arg_last474[ebp]
   pop eax
   mov right478[ebp], eax
   push left478[ebp]
   push right478[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr474[ebp]
   push [esi[edx]]
   pop eax
   mov middle478[ebp], eax
_loop_start_481:
_loop_aftereffects_481:
_loop_start_484:
_loop_aftereffects_484:
   push left478[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr474[ebp]
   push [esi[edx]]
   pop ecx
   push middle478[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349638019042
   push 1
   jmp _compare_end604349638019042
_compare_not_equal604349638019042:
   push 0
_compare_end604349638019042:
   pop eax
   cmp eax, 0
   je _loop_end_484
   push left478[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left478[ebp], eax
   jmp _loop_start_484
_loop_end_484:
_loop_start_487:
_loop_aftereffects_487:
   push right478[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr474[ebp]
   push [esi[edx]]
   pop ecx
   push middle478[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349638162733
   push 1
   jmp _compare_end604349638162733
_compare_not_equal604349638162733:
   push 0
_compare_end604349638162733:
   pop eax
   cmp eax, 0
   je _loop_end_487
   push right478[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right478[ebp], eax
   jmp _loop_start_487
_loop_end_487:
   push left478[ebp]
   pop ecx
   push right478[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349638254679
   push 1
   jmp _compare_end604349638254679
_compare_not_equal604349638254679:
   push 0
_compare_end604349638254679:
   pop eax
   cmp eax, 0
   je _if_end_489
_if_start_489:
   push left478[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr474[ebp]
   push [esi[edx]]
   pop eax
   mov tmp489[ebp], eax
   push right478[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr474[ebp]
   push [esi[edx]]
   pop edx
   push left478[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr474[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp489[ebp]
   pop edx
   push right478[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr474[ebp]
   add esi, ecx
   mov [esi], edx
   push left478[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left478[ebp], eax
   push right478[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right478[ebp], eax
_if_end_489:
   push left478[ebp]
   pop ecx
   push right478[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349638519396
   push 1
   jmp _compare_end604349638519396
_compare_not_equal604349638519396:
   push 0
_compare_end604349638519396:
   pop eax
   cmp eax, 0
   je _loop_end_481
   jmp _loop_start_481
_loop_end_481:

   ; init stack for qs
   push right478[ebp]
   push arg_first474[ebp]
   push arg_s_arr474[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last474[ebp]
   push left478[ebp]
   push arg_s_arr474[ebp]
   ; call qs
   call qs

_if_end_478:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first490[ebp]
   pop ecx
   push arg_last490[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349638598512
   push 1
   jmp _compare_end604349638598512
_compare_not_equal604349638598512:
   push 0
_compare_end604349638598512:
   pop eax
   cmp eax, 0
   je _if_end_494
_if_start_494:
   push arg_first490[ebp]
   pop eax
   mov left494[ebp], eax
   push arg_last490[ebp]
   pop eax
   mov right494[ebp], eax
   push left494[ebp]
   push right494[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr490[ebp]
   push [esi[edx]]
   pop eax
   mov middle494[ebp], eax
_loop_start_497:
_loop_aftereffects_497:
_loop_start_500:
_loop_aftereffects_500:
   push left494[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr490[ebp]
   push [esi[edx]]
   pop ecx
   push middle494[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349638685753
   push 1
   jmp _compare_end604349638685753
_compare_not_equal604349638685753:
   push 0
_compare_end604349638685753:
   pop eax
   cmp eax, 0
   je _loop_end_500
   push left494[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left494[ebp], eax
   jmp _loop_start_500
_loop_end_500:
_loop_start_503:
_loop_aftereffects_503:
   push right494[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr490[ebp]
   push [esi[edx]]
   pop ecx
   push middle494[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349638731084
   push 1
   jmp _compare_end604349638731084
_compare_not_equal604349638731084:
   push 0
_compare_end604349638731084:
   pop eax
   cmp eax, 0
   je _loop_end_503
   push right494[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right494[ebp], eax
   jmp _loop_start_503
_loop_end_503:
   push left494[ebp]
   pop ecx
   push right494[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349638775133
   push 1
   jmp _compare_end604349638775133
_compare_not_equal604349638775133:
   push 0
_compare_end604349638775133:
   pop eax
   cmp eax, 0
   je _if_end_505
_if_start_505:
   push left494[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr490[ebp]
   push [esi[edx]]
   pop eax
   mov tmp505[ebp], eax
   push right494[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr490[ebp]
   push [esi[edx]]
   pop edx
   push left494[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr490[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp505[ebp]
   pop edx
   push right494[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr490[ebp]
   add esi, ecx
   mov [esi], edx
   push left494[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left494[ebp], eax
   push right494[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right494[ebp], eax
_if_end_505:
   push left494[ebp]
   pop ecx
   push right494[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349638910699
   push 1
   jmp _compare_end604349638910699
_compare_not_equal604349638910699:
   push 0
_compare_end604349638910699:
   pop eax
   cmp eax, 0
   je _loop_end_497
   jmp _loop_start_497
_loop_end_497:

   ; init stack for qs
   push right494[ebp]
   push arg_first490[ebp]
   push arg_s_arr490[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last490[ebp]
   push left494[ebp]
   push arg_s_arr490[ebp]
   ; call qs
   call qs

_if_end_494:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first506[ebp]
   pop ecx
   push arg_last506[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349638971425
   push 1
   jmp _compare_end604349638971425
_compare_not_equal604349638971425:
   push 0
_compare_end604349638971425:
   pop eax
   cmp eax, 0
   je _if_end_510
_if_start_510:
   push arg_first506[ebp]
   pop eax
   mov left510[ebp], eax
   push arg_last506[ebp]
   pop eax
   mov right510[ebp], eax
   push left510[ebp]
   push right510[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr506[ebp]
   push [esi[edx]]
   pop eax
   mov middle510[ebp], eax
_loop_start_513:
_loop_aftereffects_513:
_loop_start_516:
_loop_aftereffects_516:
   push left510[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr506[ebp]
   push [esi[edx]]
   pop ecx
   push middle510[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349639102287
   push 1
   jmp _compare_end604349639102287
_compare_not_equal604349639102287:
   push 0
_compare_end604349639102287:
   pop eax
   cmp eax, 0
   je _loop_end_516
   push left510[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left510[ebp], eax
   jmp _loop_start_516
_loop_end_516:
_loop_start_519:
_loop_aftereffects_519:
   push right510[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr506[ebp]
   push [esi[edx]]
   pop ecx
   push middle510[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349639154461
   push 1
   jmp _compare_end604349639154461
_compare_not_equal604349639154461:
   push 0
_compare_end604349639154461:
   pop eax
   cmp eax, 0
   je _loop_end_519
   push right510[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right510[ebp], eax
   jmp _loop_start_519
_loop_end_519:
   push left510[ebp]
   pop ecx
   push right510[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349639199365
   push 1
   jmp _compare_end604349639199365
_compare_not_equal604349639199365:
   push 0
_compare_end604349639199365:
   pop eax
   cmp eax, 0
   je _if_end_521
_if_start_521:
   push left510[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr506[ebp]
   push [esi[edx]]
   pop eax
   mov tmp521[ebp], eax
   push right510[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr506[ebp]
   push [esi[edx]]
   pop edx
   push left510[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr506[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp521[ebp]
   pop edx
   push right510[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr506[ebp]
   add esi, ecx
   mov [esi], edx
   push left510[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left510[ebp], eax
   push right510[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right510[ebp], eax
_if_end_521:
   push left510[ebp]
   pop ecx
   push right510[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349639330654
   push 1
   jmp _compare_end604349639330654
_compare_not_equal604349639330654:
   push 0
_compare_end604349639330654:
   pop eax
   cmp eax, 0
   je _loop_end_513
   jmp _loop_start_513
_loop_end_513:

   ; init stack for qs
   push right510[ebp]
   push arg_first506[ebp]
   push arg_s_arr506[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last506[ebp]
   push left510[ebp]
   push arg_s_arr506[ebp]
   ; call qs
   call qs

_if_end_510:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first522[ebp]
   pop ecx
   push arg_last522[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349639400361
   push 1
   jmp _compare_end604349639400361
_compare_not_equal604349639400361:
   push 0
_compare_end604349639400361:
   pop eax
   cmp eax, 0
   je _if_end_526
_if_start_526:
   push arg_first522[ebp]
   pop eax
   mov left526[ebp], eax
   push arg_last522[ebp]
   pop eax
   mov right526[ebp], eax
   push left526[ebp]
   push right526[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr522[ebp]
   push [esi[edx]]
   pop eax
   mov middle526[ebp], eax
_loop_start_529:
_loop_aftereffects_529:
_loop_start_532:
_loop_aftereffects_532:
   push left526[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr522[ebp]
   push [esi[edx]]
   pop ecx
   push middle526[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349639483326
   push 1
   jmp _compare_end604349639483326
_compare_not_equal604349639483326:
   push 0
_compare_end604349639483326:
   pop eax
   cmp eax, 0
   je _loop_end_532
   push left526[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left526[ebp], eax
   jmp _loop_start_532
_loop_end_532:
_loop_start_535:
_loop_aftereffects_535:
   push right526[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr522[ebp]
   push [esi[edx]]
   pop ecx
   push middle526[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349639526947
   push 1
   jmp _compare_end604349639526947
_compare_not_equal604349639526947:
   push 0
_compare_end604349639526947:
   pop eax
   cmp eax, 0
   je _loop_end_535
   push right526[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right526[ebp], eax
   jmp _loop_start_535
_loop_end_535:
   push left526[ebp]
   pop ecx
   push right526[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349639571850
   push 1
   jmp _compare_end604349639571850
_compare_not_equal604349639571850:
   push 0
_compare_end604349639571850:
   pop eax
   cmp eax, 0
   je _if_end_537
_if_start_537:
   push left526[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr522[ebp]
   push [esi[edx]]
   pop eax
   mov tmp537[ebp], eax
   push right526[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr522[ebp]
   push [esi[edx]]
   pop edx
   push left526[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr522[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp537[ebp]
   pop edx
   push right526[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr522[ebp]
   add esi, ecx
   mov [esi], edx
   push left526[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left526[ebp], eax
   push right526[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right526[ebp], eax
_if_end_537:
   push left526[ebp]
   pop ecx
   push right526[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349639698436
   push 1
   jmp _compare_end604349639698436
_compare_not_equal604349639698436:
   push 0
_compare_end604349639698436:
   pop eax
   cmp eax, 0
   je _loop_end_529
   jmp _loop_start_529
_loop_end_529:

   ; init stack for qs
   push right526[ebp]
   push arg_first522[ebp]
   push arg_s_arr522[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last522[ebp]
   push left526[ebp]
   push arg_s_arr522[ebp]
   ; call qs
   call qs

_if_end_526:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first538[ebp]
   pop ecx
   push arg_last538[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349639766005
   push 1
   jmp _compare_end604349639766005
_compare_not_equal604349639766005:
   push 0
_compare_end604349639766005:
   pop eax
   cmp eax, 0
   je _if_end_542
_if_start_542:
   push arg_first538[ebp]
   pop eax
   mov left542[ebp], eax
   push arg_last538[ebp]
   pop eax
   mov right542[ebp], eax
   push left542[ebp]
   push right542[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr538[ebp]
   push [esi[edx]]
   pop eax
   mov middle542[ebp], eax
_loop_start_545:
_loop_aftereffects_545:
_loop_start_548:
_loop_aftereffects_548:
   push left542[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr538[ebp]
   push [esi[edx]]
   pop ecx
   push middle542[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349639848970
   push 1
   jmp _compare_end604349639848970
_compare_not_equal604349639848970:
   push 0
_compare_end604349639848970:
   pop eax
   cmp eax, 0
   je _loop_end_548
   push left542[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left542[ebp], eax
   jmp _loop_start_548
_loop_end_548:
_loop_start_551:
_loop_aftereffects_551:
   push right542[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr538[ebp]
   push [esi[edx]]
   pop ecx
   push middle542[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349639894301
   push 1
   jmp _compare_end604349639894301
_compare_not_equal604349639894301:
   push 0
_compare_end604349639894301:
   pop eax
   cmp eax, 0
   je _loop_end_551
   push right542[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right542[ebp], eax
   jmp _loop_start_551
_loop_end_551:
   push left542[ebp]
   pop ecx
   push right542[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349639938777
   push 1
   jmp _compare_end604349639938777
_compare_not_equal604349639938777:
   push 0
_compare_end604349639938777:
   pop eax
   cmp eax, 0
   je _if_end_553
_if_start_553:
   push left542[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr538[ebp]
   push [esi[edx]]
   pop eax
   mov tmp553[ebp], eax
   push right542[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr538[ebp]
   push [esi[edx]]
   pop edx
   push left542[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr538[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp553[ebp]
   pop edx
   push right542[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr538[ebp]
   add esi, ecx
   mov [esi], edx
   push left542[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left542[ebp], eax
   push right542[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right542[ebp], eax
_if_end_553:
   push left542[ebp]
   pop ecx
   push right542[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349640097864
   push 1
   jmp _compare_end604349640097864
_compare_not_equal604349640097864:
   push 0
_compare_end604349640097864:
   pop eax
   cmp eax, 0
   je _loop_end_545
   jmp _loop_start_545
_loop_end_545:

   ; init stack for qs
   push right542[ebp]
   push arg_first538[ebp]
   push arg_s_arr538[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last538[ebp]
   push left542[ebp]
   push arg_s_arr538[ebp]
   ; call qs
   call qs

_if_end_542:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first554[ebp]
   pop ecx
   push arg_last554[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349640159446
   push 1
   jmp _compare_end604349640159446
_compare_not_equal604349640159446:
   push 0
_compare_end604349640159446:
   pop eax
   cmp eax, 0
   je _if_end_558
_if_start_558:
   push arg_first554[ebp]
   pop eax
   mov left558[ebp], eax
   push arg_last554[ebp]
   pop eax
   mov right558[ebp], eax
   push left558[ebp]
   push right558[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr554[ebp]
   push [esi[edx]]
   pop eax
   mov middle558[ebp], eax
_loop_start_561:
_loop_aftereffects_561:
_loop_start_564:
_loop_aftereffects_564:
   push left558[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr554[ebp]
   push [esi[edx]]
   pop ecx
   push middle558[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349640247115
   push 1
   jmp _compare_end604349640247115
_compare_not_equal604349640247115:
   push 0
_compare_end604349640247115:
   pop eax
   cmp eax, 0
   je _loop_end_564
   push left558[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left558[ebp], eax
   jmp _loop_start_564
_loop_end_564:
_loop_start_567:
_loop_aftereffects_567:
   push right558[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr554[ebp]
   push [esi[edx]]
   pop ecx
   push middle558[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349640293729
   push 1
   jmp _compare_end604349640293729
_compare_not_equal604349640293729:
   push 0
_compare_end604349640293729:
   pop eax
   cmp eax, 0
   je _loop_end_567
   push right558[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right558[ebp], eax
   jmp _loop_start_567
_loop_end_567:
   push left558[ebp]
   pop ecx
   push right558[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349640339488
   push 1
   jmp _compare_end604349640339488
_compare_not_equal604349640339488:
   push 0
_compare_end604349640339488:
   pop eax
   cmp eax, 0
   je _if_end_569
_if_start_569:
   push left558[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr554[ebp]
   push [esi[edx]]
   pop eax
   mov tmp569[ebp], eax
   push right558[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr554[ebp]
   push [esi[edx]]
   pop edx
   push left558[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr554[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp569[ebp]
   pop edx
   push right558[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr554[ebp]
   add esi, ecx
   mov [esi], edx
   push left558[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left558[ebp], eax
   push right558[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right558[ebp], eax
_if_end_569:
   push left558[ebp]
   pop ecx
   push right558[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349640812900
   push 1
   jmp _compare_end604349640812900
_compare_not_equal604349640812900:
   push 0
_compare_end604349640812900:
   pop eax
   cmp eax, 0
   je _loop_end_561
   jmp _loop_start_561
_loop_end_561:

   ; init stack for qs
   push right558[ebp]
   push arg_first554[ebp]
   push arg_s_arr554[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last554[ebp]
   push left558[ebp]
   push arg_s_arr554[ebp]
   ; call qs
   call qs

_if_end_558:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first570[ebp]
   pop ecx
   push arg_last570[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349641084459
   push 1
   jmp _compare_end604349641084459
_compare_not_equal604349641084459:
   push 0
_compare_end604349641084459:
   pop eax
   cmp eax, 0
   je _if_end_574
_if_start_574:
   push arg_first570[ebp]
   pop eax
   mov left574[ebp], eax
   push arg_last570[ebp]
   pop eax
   mov right574[ebp], eax
   push left574[ebp]
   push right574[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr570[ebp]
   push [esi[edx]]
   pop eax
   mov middle574[ebp], eax
_loop_start_577:
_loop_aftereffects_577:
_loop_start_580:
_loop_aftereffects_580:
   push left574[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr570[ebp]
   push [esi[edx]]
   pop ecx
   push middle574[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349641455234
   push 1
   jmp _compare_end604349641455234
_compare_not_equal604349641455234:
   push 0
_compare_end604349641455234:
   pop eax
   cmp eax, 0
   je _loop_end_580
   push left574[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left574[ebp], eax
   jmp _loop_start_580
_loop_end_580:
_loop_start_583:
_loop_aftereffects_583:
   push right574[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr570[ebp]
   push [esi[edx]]
   pop ecx
   push middle574[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349641616460
   push 1
   jmp _compare_end604349641616460
_compare_not_equal604349641616460:
   push 0
_compare_end604349641616460:
   pop eax
   cmp eax, 0
   je _loop_end_583
   push right574[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right574[ebp], eax
   jmp _loop_start_583
_loop_end_583:
   push left574[ebp]
   pop ecx
   push right574[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349641814035
   push 1
   jmp _compare_end604349641814035
_compare_not_equal604349641814035:
   push 0
_compare_end604349641814035:
   pop eax
   cmp eax, 0
   je _if_end_585
_if_start_585:
   push left574[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr570[ebp]
   push [esi[edx]]
   pop eax
   mov tmp585[ebp], eax
   push right574[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr570[ebp]
   push [esi[edx]]
   pop edx
   push left574[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr570[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp585[ebp]
   pop edx
   push right574[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr570[ebp]
   add esi, ecx
   mov [esi], edx
   push left574[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left574[ebp], eax
   push right574[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right574[ebp], eax
_if_end_585:
   push left574[ebp]
   pop ecx
   push right574[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349642439692
   push 1
   jmp _compare_end604349642439692
_compare_not_equal604349642439692:
   push 0
_compare_end604349642439692:
   pop eax
   cmp eax, 0
   je _loop_end_577
   jmp _loop_start_577
_loop_end_577:

   ; init stack for qs
   push right574[ebp]
   push arg_first570[ebp]
   push arg_s_arr570[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last570[ebp]
   push left574[ebp]
   push arg_s_arr570[ebp]
   ; call qs
   call qs

_if_end_574:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first586[ebp]
   pop ecx
   push arg_last586[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349642653518
   push 1
   jmp _compare_end604349642653518
_compare_not_equal604349642653518:
   push 0
_compare_end604349642653518:
   pop eax
   cmp eax, 0
   je _if_end_590
_if_start_590:
   push arg_first586[ebp]
   pop eax
   mov left590[ebp], eax
   push arg_last586[ebp]
   pop eax
   mov right590[ebp], eax
   push left590[ebp]
   push right590[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr586[ebp]
   push [esi[edx]]
   pop eax
   mov middle590[ebp], eax
_loop_start_593:
_loop_aftereffects_593:
_loop_start_596:
_loop_aftereffects_596:
   push left590[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr586[ebp]
   push [esi[edx]]
   pop ecx
   push middle590[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349643044393
   push 1
   jmp _compare_end604349643044393
_compare_not_equal604349643044393:
   push 0
_compare_end604349643044393:
   pop eax
   cmp eax, 0
   je _loop_end_596
   push left590[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left590[ebp], eax
   jmp _loop_start_596
_loop_end_596:
_loop_start_599:
_loop_aftereffects_599:
   push right590[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr586[ebp]
   push [esi[edx]]
   pop ecx
   push middle590[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349643257792
   push 1
   jmp _compare_end604349643257792
_compare_not_equal604349643257792:
   push 0
_compare_end604349643257792:
   pop eax
   cmp eax, 0
   je _loop_end_599
   push right590[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right590[ebp], eax
   jmp _loop_start_599
_loop_end_599:
   push left590[ebp]
   pop ecx
   push right590[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349643457079
   push 1
   jmp _compare_end604349643457079
_compare_not_equal604349643457079:
   push 0
_compare_end604349643457079:
   pop eax
   cmp eax, 0
   je _if_end_601
_if_start_601:
   push left590[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr586[ebp]
   push [esi[edx]]
   pop eax
   mov tmp601[ebp], eax
   push right590[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr586[ebp]
   push [esi[edx]]
   pop edx
   push left590[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr586[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp601[ebp]
   pop edx
   push right590[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr586[ebp]
   add esi, ecx
   mov [esi], edx
   push left590[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left590[ebp], eax
   push right590[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right590[ebp], eax
_if_end_601:
   push left590[ebp]
   pop ecx
   push right590[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349644068195
   push 1
   jmp _compare_end604349644068195
_compare_not_equal604349644068195:
   push 0
_compare_end604349644068195:
   pop eax
   cmp eax, 0
   je _loop_end_593
   jmp _loop_start_593
_loop_end_593:

   ; init stack for qs
   push right590[ebp]
   push arg_first586[ebp]
   push arg_s_arr586[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last586[ebp]
   push left590[ebp]
   push arg_s_arr586[ebp]
   ; call qs
   call qs

_if_end_590:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first602[ebp]
   pop ecx
   push arg_last602[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349644337189
   push 1
   jmp _compare_end604349644337189
_compare_not_equal604349644337189:
   push 0
_compare_end604349644337189:
   pop eax
   cmp eax, 0
   je _if_end_606
_if_start_606:
   push arg_first602[ebp]
   pop eax
   mov left606[ebp], eax
   push arg_last602[ebp]
   pop eax
   mov right606[ebp], eax
   push left606[ebp]
   push right606[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr602[ebp]
   push [esi[edx]]
   pop eax
   mov middle606[ebp], eax
_loop_start_609:
_loop_aftereffects_609:
_loop_start_612:
_loop_aftereffects_612:
   push left606[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr602[ebp]
   push [esi[edx]]
   pop ecx
   push middle606[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349644445812
   push 1
   jmp _compare_end604349644445812
_compare_not_equal604349644445812:
   push 0
_compare_end604349644445812:
   pop eax
   cmp eax, 0
   je _loop_end_612
   push left606[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left606[ebp], eax
   jmp _loop_start_612
_loop_end_612:
_loop_start_615:
_loop_aftereffects_615:
   push right606[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr602[ebp]
   push [esi[edx]]
   pop ecx
   push middle606[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349644490716
   push 1
   jmp _compare_end604349644490716
_compare_not_equal604349644490716:
   push 0
_compare_end604349644490716:
   pop eax
   cmp eax, 0
   je _loop_end_615
   push right606[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right606[ebp], eax
   jmp _loop_start_615
_loop_end_615:
   push left606[ebp]
   pop ecx
   push right606[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349644535620
   push 1
   jmp _compare_end604349644535620
_compare_not_equal604349644535620:
   push 0
_compare_end604349644535620:
   pop eax
   cmp eax, 0
   je _if_end_617
_if_start_617:
   push left606[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr602[ebp]
   push [esi[edx]]
   pop eax
   mov tmp617[ebp], eax
   push right606[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr602[ebp]
   push [esi[edx]]
   pop edx
   push left606[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr602[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp617[ebp]
   pop edx
   push right606[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr602[ebp]
   add esi, ecx
   mov [esi], edx
   push left606[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left606[ebp], eax
   push right606[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right606[ebp], eax
_if_end_617:
   push left606[ebp]
   pop ecx
   push right606[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349644681022
   push 1
   jmp _compare_end604349644681022
_compare_not_equal604349644681022:
   push 0
_compare_end604349644681022:
   pop eax
   cmp eax, 0
   je _loop_end_609
   jmp _loop_start_609
_loop_end_609:

   ; init stack for qs
   push right606[ebp]
   push arg_first602[ebp]
   push arg_s_arr602[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last602[ebp]
   push left606[ebp]
   push arg_s_arr602[ebp]
   ; call qs
   call qs

_if_end_606:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first618[ebp]
   pop ecx
   push arg_last618[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349644913237
   push 1
   jmp _compare_end604349644913237
_compare_not_equal604349644913237:
   push 0
_compare_end604349644913237:
   pop eax
   cmp eax, 0
   je _if_end_622
_if_start_622:
   push arg_first618[ebp]
   pop eax
   mov left622[ebp], eax
   push arg_last618[ebp]
   pop eax
   mov right622[ebp], eax
   push left622[ebp]
   push right622[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr618[ebp]
   push [esi[edx]]
   pop eax
   mov middle622[ebp], eax
_loop_start_625:
_loop_aftereffects_625:
_loop_start_628:
_loop_aftereffects_628:
   push left622[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr618[ebp]
   push [esi[edx]]
   pop ecx
   push middle622[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349645004327
   push 1
   jmp _compare_end604349645004327
_compare_not_equal604349645004327:
   push 0
_compare_end604349645004327:
   pop eax
   cmp eax, 0
   je _loop_end_628
   push left622[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left622[ebp], eax
   jmp _loop_start_628
_loop_end_628:
_loop_start_631:
_loop_aftereffects_631:
   push right622[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr618[ebp]
   push [esi[edx]]
   pop ecx
   push middle622[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349645053080
   push 1
   jmp _compare_end604349645053080
_compare_not_equal604349645053080:
   push 0
_compare_end604349645053080:
   pop eax
   cmp eax, 0
   je _loop_end_631
   push right622[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right622[ebp], eax
   jmp _loop_start_631
_loop_end_631:
   push left622[ebp]
   pop ecx
   push right622[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349645107819
   push 1
   jmp _compare_end604349645107819
_compare_not_equal604349645107819:
   push 0
_compare_end604349645107819:
   pop eax
   cmp eax, 0
   je _if_end_633
_if_start_633:
   push left622[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr618[ebp]
   push [esi[edx]]
   pop eax
   mov tmp633[ebp], eax
   push right622[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr618[ebp]
   push [esi[edx]]
   pop edx
   push left622[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr618[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp633[ebp]
   pop edx
   push right622[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr618[ebp]
   add esi, ecx
   mov [esi], edx
   push left622[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left622[ebp], eax
   push right622[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right622[ebp], eax
_if_end_633:
   push left622[ebp]
   pop ecx
   push right622[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349645298553
   push 1
   jmp _compare_end604349645298553
_compare_not_equal604349645298553:
   push 0
_compare_end604349645298553:
   pop eax
   cmp eax, 0
   je _loop_end_625
   jmp _loop_start_625
_loop_end_625:

   ; init stack for qs
   push right622[ebp]
   push arg_first618[ebp]
   push arg_s_arr618[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last618[ebp]
   push left622[ebp]
   push arg_s_arr618[ebp]
   ; call qs
   call qs

_if_end_622:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first634[ebp]
   pop ecx
   push arg_last634[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349645372964
   push 1
   jmp _compare_end604349645372964
_compare_not_equal604349645372964:
   push 0
_compare_end604349645372964:
   pop eax
   cmp eax, 0
   je _if_end_638
_if_start_638:
   push arg_first634[ebp]
   pop eax
   mov left638[ebp], eax
   push arg_last634[ebp]
   pop eax
   mov right638[ebp], eax
   push left638[ebp]
   push right638[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr634[ebp]
   push [esi[edx]]
   pop eax
   mov middle638[ebp], eax
_loop_start_641:
_loop_aftereffects_641:
_loop_start_644:
_loop_aftereffects_644:
   push left638[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr634[ebp]
   push [esi[edx]]
   pop ecx
   push middle638[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349645468759
   push 1
   jmp _compare_end604349645468759
_compare_not_equal604349645468759:
   push 0
_compare_end604349645468759:
   pop eax
   cmp eax, 0
   je _loop_end_644
   push left638[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left638[ebp], eax
   jmp _loop_start_644
_loop_end_644:
_loop_start_647:
_loop_aftereffects_647:
   push right638[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr634[ebp]
   push [esi[edx]]
   pop ecx
   push middle638[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349645520505
   push 1
   jmp _compare_end604349645520505
_compare_not_equal604349645520505:
   push 0
_compare_end604349645520505:
   pop eax
   cmp eax, 0
   je _loop_end_647
   push right638[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right638[ebp], eax
   jmp _loop_start_647
_loop_end_647:
   push left638[ebp]
   pop ecx
   push right638[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349645574817
   push 1
   jmp _compare_end604349645574817
_compare_not_equal604349645574817:
   push 0
_compare_end604349645574817:
   pop eax
   cmp eax, 0
   je _if_end_649
_if_start_649:
   push left638[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr634[ebp]
   push [esi[edx]]
   pop eax
   mov tmp649[ebp], eax
   push right638[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr634[ebp]
   push [esi[edx]]
   pop edx
   push left638[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr634[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp649[ebp]
   pop edx
   push right638[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr634[ebp]
   add esi, ecx
   mov [esi], edx
   push left638[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left638[ebp], eax
   push right638[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right638[ebp], eax
_if_end_649:
   push left638[ebp]
   pop ecx
   push right638[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349645727061
   push 1
   jmp _compare_end604349645727061
_compare_not_equal604349645727061:
   push 0
_compare_end604349645727061:
   pop eax
   cmp eax, 0
   je _loop_end_641
   jmp _loop_start_641
_loop_end_641:

   ; init stack for qs
   push right638[ebp]
   push arg_first634[ebp]
   push arg_s_arr634[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last634[ebp]
   push left638[ebp]
   push arg_s_arr634[ebp]
   ; call qs
   call qs

_if_end_638:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first650[ebp]
   pop ecx
   push arg_last650[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349645795058
   push 1
   jmp _compare_end604349645795058
_compare_not_equal604349645795058:
   push 0
_compare_end604349645795058:
   pop eax
   cmp eax, 0
   je _if_end_654
_if_start_654:
   push arg_first650[ebp]
   pop eax
   mov left654[ebp], eax
   push arg_last650[ebp]
   pop eax
   mov right654[ebp], eax
   push left654[ebp]
   push right654[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr650[ebp]
   push [esi[edx]]
   pop eax
   mov middle654[ebp], eax
_loop_start_657:
_loop_aftereffects_657:
_loop_start_660:
_loop_aftereffects_660:
   push left654[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr650[ebp]
   push [esi[edx]]
   pop ecx
   push middle654[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349645889569
   push 1
   jmp _compare_end604349645889569
_compare_not_equal604349645889569:
   push 0
_compare_end604349645889569:
   pop eax
   cmp eax, 0
   je _loop_end_660
   push left654[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left654[ebp], eax
   jmp _loop_start_660
_loop_end_660:
_loop_start_663:
_loop_aftereffects_663:
   push right654[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr650[ebp]
   push [esi[edx]]
   pop ecx
   push middle654[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349645941315
   push 1
   jmp _compare_end604349645941315
_compare_not_equal604349645941315:
   push 0
_compare_end604349645941315:
   pop eax
   cmp eax, 0
   je _loop_end_663
   push right654[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right654[ebp], eax
   jmp _loop_start_663
_loop_end_663:
   push left654[ebp]
   pop ecx
   push right654[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349645991778
   push 1
   jmp _compare_end604349645991778
_compare_not_equal604349645991778:
   push 0
_compare_end604349645991778:
   pop eax
   cmp eax, 0
   je _if_end_665
_if_start_665:
   push left654[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr650[ebp]
   push [esi[edx]]
   pop eax
   mov tmp665[ebp], eax
   push right654[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr650[ebp]
   push [esi[edx]]
   pop edx
   push left654[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr650[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp665[ebp]
   pop edx
   push right654[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr650[ebp]
   add esi, ecx
   mov [esi], edx
   push left654[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left654[ebp], eax
   push right654[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right654[ebp], eax
_if_end_665:
   push left654[ebp]
   pop ecx
   push right654[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349646153859
   push 1
   jmp _compare_end604349646153859
_compare_not_equal604349646153859:
   push 0
_compare_end604349646153859:
   pop eax
   cmp eax, 0
   je _loop_end_657
   jmp _loop_start_657
_loop_end_657:

   ; init stack for qs
   push right654[ebp]
   push arg_first650[ebp]
   push arg_s_arr650[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last650[ebp]
   push left654[ebp]
   push arg_s_arr650[ebp]
   ; call qs
   call qs

_if_end_654:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first666[ebp]
   pop ecx
   push arg_last666[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349646226132
   push 1
   jmp _compare_end604349646226132
_compare_not_equal604349646226132:
   push 0
_compare_end604349646226132:
   pop eax
   cmp eax, 0
   je _if_end_670
_if_start_670:
   push arg_first666[ebp]
   pop eax
   mov left670[ebp], eax
   push arg_last666[ebp]
   pop eax
   mov right670[ebp], eax
   push left670[ebp]
   push right670[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr666[ebp]
   push [esi[edx]]
   pop eax
   mov middle670[ebp], eax
_loop_start_673:
_loop_aftereffects_673:
_loop_start_676:
_loop_aftereffects_676:
   push left670[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr666[ebp]
   push [esi[edx]]
   pop ecx
   push middle670[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349646324492
   push 1
   jmp _compare_end604349646324492
_compare_not_equal604349646324492:
   push 0
_compare_end604349646324492:
   pop eax
   cmp eax, 0
   je _loop_end_676
   push left670[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left670[ebp], eax
   jmp _loop_start_676
_loop_end_676:
_loop_start_679:
_loop_aftereffects_679:
   push right670[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr666[ebp]
   push [esi[edx]]
   pop ecx
   push middle670[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349646376238
   push 1
   jmp _compare_end604349646376238
_compare_not_equal604349646376238:
   push 0
_compare_end604349646376238:
   pop eax
   cmp eax, 0
   je _loop_end_679
   push right670[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right670[ebp], eax
   jmp _loop_start_679
_loop_end_679:
   push left670[ebp]
   pop ecx
   push right670[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349646429695
   push 1
   jmp _compare_end604349646429695
_compare_not_equal604349646429695:
   push 0
_compare_end604349646429695:
   pop eax
   cmp eax, 0
   je _if_end_681
_if_start_681:
   push left670[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr666[ebp]
   push [esi[edx]]
   pop eax
   mov tmp681[ebp], eax
   push right670[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr666[ebp]
   push [esi[edx]]
   pop edx
   push left670[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr666[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp681[ebp]
   pop edx
   push right670[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr666[ebp]
   add esi, ecx
   mov [esi], edx
   push left670[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left670[ebp], eax
   push right670[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right670[ebp], eax
_if_end_681:
   push left670[ebp]
   pop ecx
   push right670[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349646593914
   push 1
   jmp _compare_end604349646593914
_compare_not_equal604349646593914:
   push 0
_compare_end604349646593914:
   pop eax
   cmp eax, 0
   je _loop_end_673
   jmp _loop_start_673
_loop_end_673:

   ; init stack for qs
   push right670[ebp]
   push arg_first666[ebp]
   push arg_s_arr666[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last666[ebp]
   push left670[ebp]
   push arg_s_arr666[ebp]
   ; call qs
   call qs

_if_end_670:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first682[ebp]
   pop ecx
   push arg_last682[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349646671319
   push 1
   jmp _compare_end604349646671319
_compare_not_equal604349646671319:
   push 0
_compare_end604349646671319:
   pop eax
   cmp eax, 0
   je _if_end_686
_if_start_686:
   push arg_first682[ebp]
   pop eax
   mov left686[ebp], eax
   push arg_last682[ebp]
   pop eax
   mov right686[ebp], eax
   push left686[ebp]
   push right686[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr682[ebp]
   push [esi[edx]]
   pop eax
   mov middle686[ebp], eax
_loop_start_689:
_loop_aftereffects_689:
_loop_start_692:
_loop_aftereffects_692:
   push left686[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr682[ebp]
   push [esi[edx]]
   pop ecx
   push middle686[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349646769679
   push 1
   jmp _compare_end604349646769679
_compare_not_equal604349646769679:
   push 0
_compare_end604349646769679:
   pop eax
   cmp eax, 0
   je _loop_end_692
   push left686[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left686[ebp], eax
   jmp _loop_start_692
_loop_end_692:
_loop_start_695:
_loop_aftereffects_695:
   push right686[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr682[ebp]
   push [esi[edx]]
   pop ecx
   push middle686[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349646825702
   push 1
   jmp _compare_end604349646825702
_compare_not_equal604349646825702:
   push 0
_compare_end604349646825702:
   pop eax
   cmp eax, 0
   je _loop_end_695
   push right686[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right686[ebp], eax
   jmp _loop_start_695
_loop_end_695:
   push left686[ebp]
   pop ecx
   push right686[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349646879586
   push 1
   jmp _compare_end604349646879586
_compare_not_equal604349646879586:
   push 0
_compare_end604349646879586:
   pop eax
   cmp eax, 0
   je _if_end_697
_if_start_697:
   push left686[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr682[ebp]
   push [esi[edx]]
   pop eax
   mov tmp697[ebp], eax
   push right686[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr682[ebp]
   push [esi[edx]]
   pop edx
   push left686[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr682[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp697[ebp]
   pop edx
   push right686[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr682[ebp]
   add esi, ecx
   mov [esi], edx
   push left686[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left686[ebp], eax
   push right686[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right686[ebp], eax
_if_end_697:
   push left686[ebp]
   pop ecx
   push right686[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349647039528
   push 1
   jmp _compare_end604349647039528
_compare_not_equal604349647039528:
   push 0
_compare_end604349647039528:
   pop eax
   cmp eax, 0
   je _loop_end_689
   jmp _loop_start_689
_loop_end_689:

   ; init stack for qs
   push right686[ebp]
   push arg_first682[ebp]
   push arg_s_arr682[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last682[ebp]
   push left686[ebp]
   push arg_s_arr682[ebp]
   ; call qs
   call qs

_if_end_686:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first698[ebp]
   pop ecx
   push arg_last698[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349647124631
   push 1
   jmp _compare_end604349647124631
_compare_not_equal604349647124631:
   push 0
_compare_end604349647124631:
   pop eax
   cmp eax, 0
   je _if_end_702
_if_start_702:
   push arg_first698[ebp]
   pop eax
   mov left702[ebp], eax
   push arg_last698[ebp]
   pop eax
   mov right702[ebp], eax
   push left702[ebp]
   push right702[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr698[ebp]
   push [esi[edx]]
   pop eax
   mov middle702[ebp], eax
_loop_start_705:
_loop_aftereffects_705:
_loop_start_708:
_loop_aftereffects_708:
   push left702[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr698[ebp]
   push [esi[edx]]
   pop ecx
   push middle702[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349647224274
   push 1
   jmp _compare_end604349647224274
_compare_not_equal604349647224274:
   push 0
_compare_end604349647224274:
   pop eax
   cmp eax, 0
   je _loop_end_708
   push left702[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left702[ebp], eax
   jmp _loop_start_708
_loop_end_708:
_loop_start_711:
_loop_aftereffects_711:
   push right702[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr698[ebp]
   push [esi[edx]]
   pop ecx
   push middle702[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349647302963
   push 1
   jmp _compare_end604349647302963
_compare_not_equal604349647302963:
   push 0
_compare_end604349647302963:
   pop eax
   cmp eax, 0
   je _loop_end_711
   push right702[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right702[ebp], eax
   jmp _loop_start_711
_loop_end_711:
   push left702[ebp]
   pop ecx
   push right702[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349647372670
   push 1
   jmp _compare_end604349647372670
_compare_not_equal604349647372670:
   push 0
_compare_end604349647372670:
   pop eax
   cmp eax, 0
   je _if_end_713
_if_start_713:
   push left702[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr698[ebp]
   push [esi[edx]]
   pop eax
   mov tmp713[ebp], eax
   push right702[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr698[ebp]
   push [esi[edx]]
   pop edx
   push left702[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr698[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp713[ebp]
   pop edx
   push right702[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr698[ebp]
   add esi, ecx
   mov [esi], edx
   push left702[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left702[ebp], eax
   push right702[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right702[ebp], eax
_if_end_713:
   push left702[ebp]
   pop ecx
   push right702[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349647628407
   push 1
   jmp _compare_end604349647628407
_compare_not_equal604349647628407:
   push 0
_compare_end604349647628407:
   pop eax
   cmp eax, 0
   je _loop_end_705
   jmp _loop_start_705
_loop_end_705:

   ; init stack for qs
   push right702[ebp]
   push arg_first698[ebp]
   push arg_s_arr698[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last698[ebp]
   push left702[ebp]
   push arg_s_arr698[ebp]
   ; call qs
   call qs

_if_end_702:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first714[ebp]
   pop ecx
   push arg_last714[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349647766539
   push 1
   jmp _compare_end604349647766539
_compare_not_equal604349647766539:
   push 0
_compare_end604349647766539:
   pop eax
   cmp eax, 0
   je _if_end_718
_if_start_718:
   push arg_first714[ebp]
   pop eax
   mov left718[ebp], eax
   push arg_last714[ebp]
   pop eax
   mov right718[ebp], eax
   push left718[ebp]
   push right718[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr714[ebp]
   push [esi[edx]]
   pop eax
   mov middle718[ebp], eax
_loop_start_721:
_loop_aftereffects_721:
_loop_start_724:
_loop_aftereffects_724:
   push left718[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr714[ebp]
   push [esi[edx]]
   pop ecx
   push middle718[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349647960265
   push 1
   jmp _compare_end604349647960265
_compare_not_equal604349647960265:
   push 0
_compare_end604349647960265:
   pop eax
   cmp eax, 0
   je _loop_end_724
   push left718[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left718[ebp], eax
   jmp _loop_start_724
_loop_end_724:
_loop_start_727:
_loop_aftereffects_727:
   push right718[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr714[ebp]
   push [esi[edx]]
   pop ecx
   push middle718[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349648177941
   push 1
   jmp _compare_end604349648177941
_compare_not_equal604349648177941:
   push 0
_compare_end604349648177941:
   pop eax
   cmp eax, 0
   je _loop_end_727
   push right718[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right718[ebp], eax
   jmp _loop_start_727
_loop_end_727:
   push left718[ebp]
   pop ecx
   push right718[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349648357127
   push 1
   jmp _compare_end604349648357127
_compare_not_equal604349648357127:
   push 0
_compare_end604349648357127:
   pop eax
   cmp eax, 0
   je _if_end_729
_if_start_729:
   push left718[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr714[ebp]
   push [esi[edx]]
   pop eax
   mov tmp729[ebp], eax
   push right718[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr714[ebp]
   push [esi[edx]]
   pop edx
   push left718[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr714[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp729[ebp]
   pop edx
   push right718[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr714[ebp]
   add esi, ecx
   mov [esi], edx
   push left718[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left718[ebp], eax
   push right718[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right718[ebp], eax
_if_end_729:
   push left718[ebp]
   pop ecx
   push right718[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349649081572
   push 1
   jmp _compare_end604349649081572
_compare_not_equal604349649081572:
   push 0
_compare_end604349649081572:
   pop eax
   cmp eax, 0
   je _loop_end_721
   jmp _loop_start_721
_loop_end_721:

   ; init stack for qs
   push right718[ebp]
   push arg_first714[ebp]
   push arg_s_arr714[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last714[ebp]
   push left718[ebp]
   push arg_s_arr714[ebp]
   ; call qs
   call qs

_if_end_718:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first730[ebp]
   pop ecx
   push arg_last730[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349649398463
   push 1
   jmp _compare_end604349649398463
_compare_not_equal604349649398463:
   push 0
_compare_end604349649398463:
   pop eax
   cmp eax, 0
   je _if_end_734
_if_start_734:
   push arg_first730[ebp]
   pop eax
   mov left734[ebp], eax
   push arg_last730[ebp]
   pop eax
   mov right734[ebp], eax
   push left734[ebp]
   push right734[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr730[ebp]
   push [esi[edx]]
   pop eax
   mov middle734[ebp], eax
_loop_start_737:
_loop_aftereffects_737:
_loop_start_740:
_loop_aftereffects_740:
   push left734[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr730[ebp]
   push [esi[edx]]
   pop ecx
   push middle734[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349649818418
   push 1
   jmp _compare_end604349649818418
_compare_not_equal604349649818418:
   push 0
_compare_end604349649818418:
   pop eax
   cmp eax, 0
   je _loop_end_740
   push left734[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left734[ebp], eax
   jmp _loop_start_740
_loop_end_740:
_loop_start_743:
_loop_aftereffects_743:
   push right734[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr730[ebp]
   push [esi[edx]]
   pop ecx
   push middle734[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349650055765
   push 1
   jmp _compare_end604349650055765
_compare_not_equal604349650055765:
   push 0
_compare_end604349650055765:
   pop eax
   cmp eax, 0
   je _loop_end_743
   push right734[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right734[ebp], eax
   jmp _loop_start_743
_loop_end_743:
   push left734[ebp]
   pop ecx
   push right734[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349650213997
   push 1
   jmp _compare_end604349650213997
_compare_not_equal604349650213997:
   push 0
_compare_end604349650213997:
   pop eax
   cmp eax, 0
   je _if_end_745
_if_start_745:
   push left734[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr730[ebp]
   push [esi[edx]]
   pop eax
   mov tmp745[ebp], eax
   push right734[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr730[ebp]
   push [esi[edx]]
   pop edx
   push left734[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr730[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp745[ebp]
   pop edx
   push right734[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr730[ebp]
   add esi, ecx
   mov [esi], edx
   push left734[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left734[ebp], eax
   push right734[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right734[ebp], eax
_if_end_745:
   push left734[ebp]
   pop ecx
   push right734[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349650479570
   push 1
   jmp _compare_end604349650479570
_compare_not_equal604349650479570:
   push 0
_compare_end604349650479570:
   pop eax
   cmp eax, 0
   je _loop_end_737
   jmp _loop_start_737
_loop_end_737:

   ; init stack for qs
   push right734[ebp]
   push arg_first730[ebp]
   push arg_s_arr730[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last730[ebp]
   push left734[ebp]
   push arg_s_arr730[ebp]
   ; call qs
   call qs

_if_end_734:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first746[ebp]
   pop ecx
   push arg_last746[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349650623689
   push 1
   jmp _compare_end604349650623689
_compare_not_equal604349650623689:
   push 0
_compare_end604349650623689:
   pop eax
   cmp eax, 0
   je _if_end_750
_if_start_750:
   push arg_first746[ebp]
   pop eax
   mov left750[ebp], eax
   push arg_last746[ebp]
   pop eax
   mov right750[ebp], eax
   push left750[ebp]
   push right750[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr746[ebp]
   push [esi[edx]]
   pop eax
   mov middle750[ebp], eax
_loop_start_753:
_loop_aftereffects_753:
_loop_start_756:
_loop_aftereffects_756:
   push left750[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr746[ebp]
   push [esi[edx]]
   pop ecx
   push middle750[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349650796033
   push 1
   jmp _compare_end604349650796033
_compare_not_equal604349650796033:
   push 0
_compare_end604349650796033:
   pop eax
   cmp eax, 0
   je _loop_end_756
   push left750[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left750[ebp], eax
   jmp _loop_start_756
_loop_end_756:
_loop_start_759:
_loop_aftereffects_759:
   push right750[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr746[ebp]
   push [esi[edx]]
   pop ecx
   push middle750[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349650902946
   push 1
   jmp _compare_end604349650902946
_compare_not_equal604349650902946:
   push 0
_compare_end604349650902946:
   pop eax
   cmp eax, 0
   je _loop_end_759
   push right750[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right750[ebp], eax
   jmp _loop_start_759
_loop_end_759:
   push left750[ebp]
   pop ecx
   push right750[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349651003017
   push 1
   jmp _compare_end604349651003017
_compare_not_equal604349651003017:
   push 0
_compare_end604349651003017:
   pop eax
   cmp eax, 0
   je _if_end_761
_if_start_761:
   push left750[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr746[ebp]
   push [esi[edx]]
   pop eax
   mov tmp761[ebp], eax
   push right750[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr746[ebp]
   push [esi[edx]]
   pop edx
   push left750[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr746[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp761[ebp]
   pop edx
   push right750[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr746[ebp]
   add esi, ecx
   mov [esi], edx
   push left750[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left750[ebp], eax
   push right750[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right750[ebp], eax
_if_end_761:
   push left750[ebp]
   pop ecx
   push right750[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349651278426
   push 1
   jmp _compare_end604349651278426
_compare_not_equal604349651278426:
   push 0
_compare_end604349651278426:
   pop eax
   cmp eax, 0
   je _loop_end_753
   jmp _loop_start_753
_loop_end_753:

   ; init stack for qs
   push right750[ebp]
   push arg_first746[ebp]
   push arg_s_arr746[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last746[ebp]
   push left750[ebp]
   push arg_s_arr746[ebp]
   ; call qs
   call qs

_if_end_750:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first762[ebp]
   pop ecx
   push arg_last762[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349651432381
   push 1
   jmp _compare_end604349651432381
_compare_not_equal604349651432381:
   push 0
_compare_end604349651432381:
   pop eax
   cmp eax, 0
   je _if_end_766
_if_start_766:
   push arg_first762[ebp]
   pop eax
   mov left766[ebp], eax
   push arg_last762[ebp]
   pop eax
   mov right766[ebp], eax
   push left766[ebp]
   push right766[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr762[ebp]
   push [esi[edx]]
   pop eax
   mov middle766[ebp], eax
_loop_start_769:
_loop_aftereffects_769:
_loop_start_772:
_loop_aftereffects_772:
   push left766[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr762[ebp]
   push [esi[edx]]
   pop ecx
   push middle766[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349651859178
   push 1
   jmp _compare_end604349651859178
_compare_not_equal604349651859178:
   push 0
_compare_end604349651859178:
   pop eax
   cmp eax, 0
   je _loop_end_772
   push left766[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left766[ebp], eax
   jmp _loop_start_772
_loop_end_772:
_loop_start_775:
_loop_aftereffects_775:
   push right766[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr762[ebp]
   push [esi[edx]]
   pop ecx
   push middle766[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349652113204
   push 1
   jmp _compare_end604349652113204
_compare_not_equal604349652113204:
   push 0
_compare_end604349652113204:
   pop eax
   cmp eax, 0
   je _loop_end_775
   push right766[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right766[ebp], eax
   jmp _loop_start_775
_loop_end_775:
   push left766[ebp]
   pop ecx
   push right766[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349652367658
   push 1
   jmp _compare_end604349652367658
_compare_not_equal604349652367658:
   push 0
_compare_end604349652367658:
   pop eax
   cmp eax, 0
   je _if_end_777
_if_start_777:
   push left766[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr762[ebp]
   push [esi[edx]]
   pop eax
   mov tmp777[ebp], eax
   push right766[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr762[ebp]
   push [esi[edx]]
   pop edx
   push left766[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr762[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp777[ebp]
   pop edx
   push right766[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr762[ebp]
   add esi, ecx
   mov [esi], edx
   push left766[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left766[ebp], eax
   push right766[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right766[ebp], eax
_if_end_777:
   push left766[ebp]
   pop ecx
   push right766[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349653155823
   push 1
   jmp _compare_end604349653155823
_compare_not_equal604349653155823:
   push 0
_compare_end604349653155823:
   pop eax
   cmp eax, 0
   je _loop_end_769
   jmp _loop_start_769
_loop_end_769:

   ; init stack for qs
   push right766[ebp]
   push arg_first762[ebp]
   push arg_s_arr762[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last762[ebp]
   push left766[ebp]
   push arg_s_arr762[ebp]
   ; call qs
   call qs

_if_end_766:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first778[ebp]
   pop ecx
   push arg_last778[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349653493241
   push 1
   jmp _compare_end604349653493241
_compare_not_equal604349653493241:
   push 0
_compare_end604349653493241:
   pop eax
   cmp eax, 0
   je _if_end_782
_if_start_782:
   push arg_first778[ebp]
   pop eax
   mov left782[ebp], eax
   push arg_last778[ebp]
   pop eax
   mov right782[ebp], eax
   push left782[ebp]
   push right782[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr778[ebp]
   push [esi[edx]]
   pop eax
   mov middle782[ebp], eax
_loop_start_785:
_loop_aftereffects_785:
_loop_start_788:
_loop_aftereffects_788:
   push left782[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr778[ebp]
   push [esi[edx]]
   pop ecx
   push middle782[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349653954679
   push 1
   jmp _compare_end604349653954679
_compare_not_equal604349653954679:
   push 0
_compare_end604349653954679:
   pop eax
   cmp eax, 0
   je _loop_end_788
   push left782[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left782[ebp], eax
   jmp _loop_start_788
_loop_end_788:
_loop_start_791:
_loop_aftereffects_791:
   push right782[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr778[ebp]
   push [esi[edx]]
   pop ecx
   push middle782[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349654218968
   push 1
   jmp _compare_end604349654218968
_compare_not_equal604349654218968:
   push 0
_compare_end604349654218968:
   pop eax
   cmp eax, 0
   je _loop_end_791
   push right782[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right782[ebp], eax
   jmp _loop_start_791
_loop_end_791:
   push left782[ebp]
   pop ecx
   push right782[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349654446052
   push 1
   jmp _compare_end604349654446052
_compare_not_equal604349654446052:
   push 0
_compare_end604349654446052:
   pop eax
   cmp eax, 0
   je _if_end_793
_if_start_793:
   push left782[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr778[ebp]
   push [esi[edx]]
   pop eax
   mov tmp793[ebp], eax
   push right782[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr778[ebp]
   push [esi[edx]]
   pop edx
   push left782[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr778[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp793[ebp]
   pop edx
   push right782[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr778[ebp]
   add esi, ecx
   mov [esi], edx
   push left782[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left782[ebp], eax
   push right782[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right782[ebp], eax
_if_end_793:
   push left782[ebp]
   pop ecx
   push right782[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349655126448
   push 1
   jmp _compare_end604349655126448
_compare_not_equal604349655126448:
   push 0
_compare_end604349655126448:
   pop eax
   cmp eax, 0
   je _loop_end_785
   jmp _loop_start_785
_loop_end_785:

   ; init stack for qs
   push right782[ebp]
   push arg_first778[ebp]
   push arg_s_arr778[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last778[ebp]
   push left782[ebp]
   push arg_s_arr778[ebp]
   ; call qs
   call qs

_if_end_782:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first794[ebp]
   pop ecx
   push arg_last794[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349655200432
   push 1
   jmp _compare_end604349655200432
_compare_not_equal604349655200432:
   push 0
_compare_end604349655200432:
   pop eax
   cmp eax, 0
   je _if_end_798
_if_start_798:
   push arg_first794[ebp]
   pop eax
   mov left798[ebp], eax
   push arg_last794[ebp]
   pop eax
   mov right798[ebp], eax
   push left798[ebp]
   push right798[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr794[ebp]
   push [esi[edx]]
   pop eax
   mov middle798[ebp], eax
_loop_start_801:
_loop_aftereffects_801:
_loop_start_804:
_loop_aftereffects_804:
   push left798[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr794[ebp]
   push [esi[edx]]
   pop ecx
   push middle798[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349655303069
   push 1
   jmp _compare_end604349655303069
_compare_not_equal604349655303069:
   push 0
_compare_end604349655303069:
   pop eax
   cmp eax, 0
   je _loop_end_804
   push left798[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left798[ebp], eax
   jmp _loop_start_804
_loop_end_804:
_loop_start_807:
_loop_aftereffects_807:
   push right798[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr794[ebp]
   push [esi[edx]]
   pop ecx
   push middle798[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349655357808
   push 1
   jmp _compare_end604349655357808
_compare_not_equal604349655357808:
   push 0
_compare_end604349655357808:
   pop eax
   cmp eax, 0
   je _loop_end_807
   push right798[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right798[ebp], eax
   jmp _loop_start_807
_loop_end_807:
   push left798[ebp]
   pop ecx
   push right798[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349655410410
   push 1
   jmp _compare_end604349655410410
_compare_not_equal604349655410410:
   push 0
_compare_end604349655410410:
   pop eax
   cmp eax, 0
   je _if_end_809
_if_start_809:
   push left798[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr794[ebp]
   push [esi[edx]]
   pop eax
   mov tmp809[ebp], eax
   push right798[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr794[ebp]
   push [esi[edx]]
   pop edx
   push left798[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr794[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp809[ebp]
   pop edx
   push right798[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr794[ebp]
   add esi, ecx
   mov [esi], edx
   push left798[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left798[ebp], eax
   push right798[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right798[ebp], eax
_if_end_809:
   push left798[ebp]
   pop ecx
   push right798[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349655588313
   push 1
   jmp _compare_end604349655588313
_compare_not_equal604349655588313:
   push 0
_compare_end604349655588313:
   pop eax
   cmp eax, 0
   je _loop_end_801
   jmp _loop_start_801
_loop_end_801:

   ; init stack for qs
   push right798[ebp]
   push arg_first794[ebp]
   push arg_s_arr794[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last794[ebp]
   push left798[ebp]
   push arg_s_arr794[ebp]
   ; call qs
   call qs

_if_end_798:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first810[ebp]
   pop ecx
   push arg_last810[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349655669140
   push 1
   jmp _compare_end604349655669140
_compare_not_equal604349655669140:
   push 0
_compare_end604349655669140:
   pop eax
   cmp eax, 0
   je _if_end_814
_if_start_814:
   push arg_first810[ebp]
   pop eax
   mov left814[ebp], eax
   push arg_last810[ebp]
   pop eax
   mov right814[ebp], eax
   push left814[ebp]
   push right814[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr810[ebp]
   push [esi[edx]]
   pop eax
   mov middle814[ebp], eax
_loop_start_817:
_loop_aftereffects_817:
_loop_start_820:
_loop_aftereffects_820:
   push left814[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr810[ebp]
   push [esi[edx]]
   pop ecx
   push middle814[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349655768783
   push 1
   jmp _compare_end604349655768783
_compare_not_equal604349655768783:
   push 0
_compare_end604349655768783:
   pop eax
   cmp eax, 0
   je _loop_end_820
   push left814[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left814[ebp], eax
   jmp _loop_start_820
_loop_end_820:
_loop_start_823:
_loop_aftereffects_823:
   push right814[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr810[ebp]
   push [esi[edx]]
   pop ecx
   push middle814[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349655825233
   push 1
   jmp _compare_end604349655825233
_compare_not_equal604349655825233:
   push 0
_compare_end604349655825233:
   pop eax
   cmp eax, 0
   je _loop_end_823
   push right814[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right814[ebp], eax
   jmp _loop_start_823
_loop_end_823:
   push left814[ebp]
   pop ecx
   push right814[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349655879545
   push 1
   jmp _compare_end604349655879545
_compare_not_equal604349655879545:
   push 0
_compare_end604349655879545:
   pop eax
   cmp eax, 0
   je _if_end_825
_if_start_825:
   push left814[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr810[ebp]
   push [esi[edx]]
   pop eax
   mov tmp825[ebp], eax
   push right814[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr810[ebp]
   push [esi[edx]]
   pop edx
   push left814[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr810[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp825[ebp]
   pop edx
   push right814[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr810[ebp]
   add esi, ecx
   mov [esi], edx
   push left814[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left814[ebp], eax
   push right814[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right814[ebp], eax
_if_end_825:
   push left814[ebp]
   pop ecx
   push right814[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349657348106
   push 1
   jmp _compare_end604349657348106
_compare_not_equal604349657348106:
   push 0
_compare_end604349657348106:
   pop eax
   cmp eax, 0
   je _loop_end_817
   jmp _loop_start_817
_loop_end_817:

   ; init stack for qs
   push right814[ebp]
   push arg_first810[ebp]
   push arg_s_arr810[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last810[ebp]
   push left814[ebp]
   push arg_s_arr810[ebp]
   ; call qs
   call qs

_if_end_814:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first826[ebp]
   pop ecx
   push arg_last826[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349657696643
   push 1
   jmp _compare_end604349657696643
_compare_not_equal604349657696643:
   push 0
_compare_end604349657696643:
   pop eax
   cmp eax, 0
   je _if_end_830
_if_start_830:
   push arg_first826[ebp]
   pop eax
   mov left830[ebp], eax
   push arg_last826[ebp]
   pop eax
   mov right830[ebp], eax
   push left830[ebp]
   push right830[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr826[ebp]
   push [esi[edx]]
   pop eax
   mov middle830[ebp], eax
_loop_start_833:
_loop_aftereffects_833:
_loop_start_836:
_loop_aftereffects_836:
   push left830[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr826[ebp]
   push [esi[edx]]
   pop ecx
   push middle830[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349658018238
   push 1
   jmp _compare_end604349658018238
_compare_not_equal604349658018238:
   push 0
_compare_end604349658018238:
   pop eax
   cmp eax, 0
   je _loop_end_836
   push left830[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left830[ebp], eax
   jmp _loop_start_836
_loop_end_836:
_loop_start_839:
_loop_aftereffects_839:
   push right830[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr826[ebp]
   push [esi[edx]]
   pop ecx
   push middle830[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349658272264
   push 1
   jmp _compare_end604349658272264
_compare_not_equal604349658272264:
   push 0
_compare_end604349658272264:
   pop eax
   cmp eax, 0
   je _loop_end_839
   push right830[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right830[ebp], eax
   jmp _loop_start_839
_loop_end_839:
   push left830[ebp]
   pop ecx
   push right830[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349658333418
   push 1
   jmp _compare_end604349658333418
_compare_not_equal604349658333418:
   push 0
_compare_end604349658333418:
   pop eax
   cmp eax, 0
   je _if_end_841
_if_start_841:
   push left830[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr826[ebp]
   push [esi[edx]]
   pop eax
   mov tmp841[ebp], eax
   push right830[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr826[ebp]
   push [esi[edx]]
   pop edx
   push left830[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr826[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp841[ebp]
   pop edx
   push right830[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr826[ebp]
   add esi, ecx
   mov [esi], edx
   push left830[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left830[ebp], eax
   push right830[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right830[ebp], eax
_if_end_841:
   push left830[ebp]
   pop ecx
   push right830[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349658802981
   push 1
   jmp _compare_end604349658802981
_compare_not_equal604349658802981:
   push 0
_compare_end604349658802981:
   pop eax
   cmp eax, 0
   je _loop_end_833
   jmp _loop_start_833
_loop_end_833:

   ; init stack for qs
   push right830[ebp]
   push arg_first826[ebp]
   push arg_s_arr826[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last826[ebp]
   push left830[ebp]
   push arg_s_arr826[ebp]
   ; call qs
   call qs

_if_end_830:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first842[ebp]
   pop ecx
   push arg_last842[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349659109609
   push 1
   jmp _compare_end604349659109609
_compare_not_equal604349659109609:
   push 0
_compare_end604349659109609:
   pop eax
   cmp eax, 0
   je _if_end_846
_if_start_846:
   push arg_first842[ebp]
   pop eax
   mov left846[ebp], eax
   push arg_last842[ebp]
   pop eax
   mov right846[ebp], eax
   push left846[ebp]
   push right846[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr842[ebp]
   push [esi[edx]]
   pop eax
   mov middle846[ebp], eax
_loop_start_849:
_loop_aftereffects_849:
_loop_start_852:
_loop_aftereffects_852:
   push left846[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr842[ebp]
   push [esi[edx]]
   pop ecx
   push middle846[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349659459429
   push 1
   jmp _compare_end604349659459429
_compare_not_equal604349659459429:
   push 0
_compare_end604349659459429:
   pop eax
   cmp eax, 0
   je _loop_end_852
   push left846[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left846[ebp], eax
   jmp _loop_start_852
_loop_end_852:
_loop_start_855:
_loop_aftereffects_855:
   push right846[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr842[ebp]
   push [esi[edx]]
   pop ecx
   push middle846[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349659519300
   push 1
   jmp _compare_end604349659519300
_compare_not_equal604349659519300:
   push 0
_compare_end604349659519300:
   pop eax
   cmp eax, 0
   je _loop_end_855
   push right846[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right846[ebp], eax
   jmp _loop_start_855
_loop_end_855:
   push left846[ebp]
   pop ecx
   push right846[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349659758786
   push 1
   jmp _compare_end604349659758786
_compare_not_equal604349659758786:
   push 0
_compare_end604349659758786:
   pop eax
   cmp eax, 0
   je _if_end_857
_if_start_857:
   push left846[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr842[ebp]
   push [esi[edx]]
   pop eax
   mov tmp857[ebp], eax
   push right846[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr842[ebp]
   push [esi[edx]]
   pop edx
   push left846[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr842[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp857[ebp]
   pop edx
   push right846[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr842[ebp]
   add esi, ecx
   mov [esi], edx
   push left846[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left846[ebp], eax
   push right846[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right846[ebp], eax
_if_end_857:
   push left846[ebp]
   pop ecx
   push right846[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349660460992
   push 1
   jmp _compare_end604349660460992
_compare_not_equal604349660460992:
   push 0
_compare_end604349660460992:
   pop eax
   cmp eax, 0
   je _loop_end_849
   jmp _loop_start_849
_loop_end_849:

   ; init stack for qs
   push right846[ebp]
   push arg_first842[ebp]
   push arg_s_arr842[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last842[ebp]
   push left846[ebp]
   push arg_s_arr842[ebp]
   ; call qs
   call qs

_if_end_846:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first858[ebp]
   pop ecx
   push arg_last858[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349660726565
   push 1
   jmp _compare_end604349660726565
_compare_not_equal604349660726565:
   push 0
_compare_end604349660726565:
   pop eax
   cmp eax, 0
   je _if_end_862
_if_start_862:
   push arg_first858[ebp]
   pop eax
   mov left862[ebp], eax
   push arg_last858[ebp]
   pop eax
   mov right862[ebp], eax
   push left862[ebp]
   push right862[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr858[ebp]
   push [esi[edx]]
   pop eax
   mov middle862[ebp], eax
_loop_start_865:
_loop_aftereffects_865:
_loop_start_868:
_loop_aftereffects_868:
   push left862[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr858[ebp]
   push [esi[edx]]
   pop ecx
   push middle862[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349661247874
   push 1
   jmp _compare_end604349661247874
_compare_not_equal604349661247874:
   push 0
_compare_end604349661247874:
   pop eax
   cmp eax, 0
   je _loop_end_868
   push left862[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left862[ebp], eax
   jmp _loop_start_868
_loop_end_868:
_loop_start_871:
_loop_aftereffects_871:
   push right862[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr858[ebp]
   push [esi[edx]]
   pop ecx
   push middle862[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349661526276
   push 1
   jmp _compare_end604349661526276
_compare_not_equal604349661526276:
   push 0
_compare_end604349661526276:
   pop eax
   cmp eax, 0
   je _loop_end_871
   push right862[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right862[ebp], eax
   jmp _loop_start_871
_loop_end_871:
   push left862[ebp]
   pop ecx
   push right862[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349661613945
   push 1
   jmp _compare_end604349661613945
_compare_not_equal604349661613945:
   push 0
_compare_end604349661613945:
   pop eax
   cmp eax, 0
   je _if_end_873
_if_start_873:
   push left862[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr858[ebp]
   push [esi[edx]]
   pop eax
   mov tmp873[ebp], eax
   push right862[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr858[ebp]
   push [esi[edx]]
   pop edx
   push left862[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr858[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp873[ebp]
   pop edx
   push right862[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr858[ebp]
   add esi, ecx
   mov [esi], edx
   push left862[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left862[ebp], eax
   push right862[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right862[ebp], eax
_if_end_873:
   push left862[ebp]
   pop ecx
   push right862[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349661867543
   push 1
   jmp _compare_end604349661867543
_compare_not_equal604349661867543:
   push 0
_compare_end604349661867543:
   pop eax
   cmp eax, 0
   je _loop_end_865
   jmp _loop_start_865
_loop_end_865:

   ; init stack for qs
   push right862[ebp]
   push arg_first858[ebp]
   push arg_s_arr858[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last858[ebp]
   push left862[ebp]
   push arg_s_arr858[ebp]
   ; call qs
   call qs

_if_end_862:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first874[ebp]
   pop ecx
   push arg_last874[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349662056138
   push 1
   jmp _compare_end604349662056138
_compare_not_equal604349662056138:
   push 0
_compare_end604349662056138:
   pop eax
   cmp eax, 0
   je _if_end_878
_if_start_878:
   push arg_first874[ebp]
   pop eax
   mov left878[ebp], eax
   push arg_last874[ebp]
   pop eax
   mov right878[ebp], eax
   push left878[ebp]
   push right878[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr874[ebp]
   push [esi[edx]]
   pop eax
   mov middle878[ebp], eax
_loop_start_881:
_loop_aftereffects_881:
_loop_start_884:
_loop_aftereffects_884:
   push left878[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr874[ebp]
   push [esi[edx]]
   pop ecx
   push middle878[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349662388425
   push 1
   jmp _compare_end604349662388425
_compare_not_equal604349662388425:
   push 0
_compare_end604349662388425:
   pop eax
   cmp eax, 0
   je _loop_end_884
   push left878[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left878[ebp], eax
   jmp _loop_start_884
_loop_end_884:
_loop_start_887:
_loop_aftereffects_887:
   push right878[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr874[ebp]
   push [esi[edx]]
   pop ecx
   push middle878[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349662518004
   push 1
   jmp _compare_end604349662518004
_compare_not_equal604349662518004:
   push 0
_compare_end604349662518004:
   pop eax
   cmp eax, 0
   je _loop_end_887
   push right878[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right878[ebp], eax
   jmp _loop_start_887
_loop_end_887:
   push left878[ebp]
   pop ecx
   push right878[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349662655708
   push 1
   jmp _compare_end604349662655708
_compare_not_equal604349662655708:
   push 0
_compare_end604349662655708:
   pop eax
   cmp eax, 0
   je _if_end_889
_if_start_889:
   push left878[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr874[ebp]
   push [esi[edx]]
   pop eax
   mov tmp889[ebp], eax
   push right878[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr874[ebp]
   push [esi[edx]]
   pop edx
   push left878[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr874[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp889[ebp]
   pop edx
   push right878[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr874[ebp]
   add esi, ecx
   mov [esi], edx
   push left878[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left878[ebp], eax
   push right878[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right878[ebp], eax
_if_end_889:
   push left878[ebp]
   pop ecx
   push right878[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349663117573
   push 1
   jmp _compare_end604349663117573
_compare_not_equal604349663117573:
   push 0
_compare_end604349663117573:
   pop eax
   cmp eax, 0
   je _loop_end_881
   jmp _loop_start_881
_loop_end_881:

   ; init stack for qs
   push right878[ebp]
   push arg_first874[ebp]
   push arg_s_arr874[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last874[ebp]
   push left878[ebp]
   push arg_s_arr874[ebp]
   ; call qs
   call qs

_if_end_878:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first890[ebp]
   pop ecx
   push arg_last890[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349663496474
   push 1
   jmp _compare_end604349663496474
_compare_not_equal604349663496474:
   push 0
_compare_end604349663496474:
   pop eax
   cmp eax, 0
   je _if_end_894
_if_start_894:
   push arg_first890[ebp]
   pop eax
   mov left894[ebp], eax
   push arg_last890[ebp]
   pop eax
   mov right894[ebp], eax
   push left894[ebp]
   push right894[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr890[ebp]
   push [esi[edx]]
   pop eax
   mov middle894[ebp], eax
_loop_start_897:
_loop_aftereffects_897:
_loop_start_900:
_loop_aftereffects_900:
   push left894[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr890[ebp]
   push [esi[edx]]
   pop ecx
   push middle894[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349663986137
   push 1
   jmp _compare_end604349663986137
_compare_not_equal604349663986137:
   push 0
_compare_end604349663986137:
   pop eax
   cmp eax, 0
   je _loop_end_900
   push left894[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left894[ebp], eax
   jmp _loop_start_900
_loop_end_900:
_loop_start_903:
_loop_aftereffects_903:
   push right894[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr890[ebp]
   push [esi[edx]]
   pop ecx
   push middle894[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349664265822
   push 1
   jmp _compare_end604349664265822
_compare_not_equal604349664265822:
   push 0
_compare_end604349664265822:
   pop eax
   cmp eax, 0
   je _loop_end_903
   push right894[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right894[ebp], eax
   jmp _loop_start_903
_loop_end_903:
   push left894[ebp]
   pop ecx
   push right894[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349664544652
   push 1
   jmp _compare_end604349664544652
_compare_not_equal604349664544652:
   push 0
_compare_end604349664544652:
   pop eax
   cmp eax, 0
   je _if_end_905
_if_start_905:
   push left894[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr890[ebp]
   push [esi[edx]]
   pop eax
   mov tmp905[ebp], eax
   push right894[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr890[ebp]
   push [esi[edx]]
   pop edx
   push left894[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr890[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp905[ebp]
   pop edx
   push right894[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr890[ebp]
   add esi, ecx
   mov [esi], edx
   push left894[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left894[ebp], eax
   push right894[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right894[ebp], eax
_if_end_905:
   push left894[ebp]
   pop ecx
   push right894[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349665406800
   push 1
   jmp _compare_end604349665406800
_compare_not_equal604349665406800:
   push 0
_compare_end604349665406800:
   pop eax
   cmp eax, 0
   je _loop_end_897
   jmp _loop_start_897
_loop_end_897:

   ; init stack for qs
   push right894[ebp]
   push arg_first890[ebp]
   push arg_s_arr890[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last890[ebp]
   push left894[ebp]
   push arg_s_arr890[ebp]
   ; call qs
   call qs

_if_end_894:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first906[ebp]
   pop ecx
   push arg_last906[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349665651845
   push 1
   jmp _compare_end604349665651845
_compare_not_equal604349665651845:
   push 0
_compare_end604349665651845:
   pop eax
   cmp eax, 0
   je _if_end_910
_if_start_910:
   push arg_first906[ebp]
   pop eax
   mov left910[ebp], eax
   push arg_last906[ebp]
   pop eax
   mov right910[ebp], eax
   push left910[ebp]
   push right910[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr906[ebp]
   push [esi[edx]]
   pop eax
   mov middle910[ebp], eax
_loop_start_913:
_loop_aftereffects_913:
_loop_start_916:
_loop_aftereffects_916:
   push left910[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr906[ebp]
   push [esi[edx]]
   pop ecx
   push middle910[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349665906299
   push 1
   jmp _compare_end604349665906299
_compare_not_equal604349665906299:
   push 0
_compare_end604349665906299:
   pop eax
   cmp eax, 0
   je _loop_end_916
   push left910[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left910[ebp], eax
   jmp _loop_start_916
_loop_end_916:
_loop_start_919:
_loop_aftereffects_919:
   push right910[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr906[ebp]
   push [esi[edx]]
   pop ecx
   push middle910[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349666207367
   push 1
   jmp _compare_end604349666207367
_compare_not_equal604349666207367:
   push 0
_compare_end604349666207367:
   pop eax
   cmp eax, 0
   je _loop_end_919
   push right910[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right910[ebp], eax
   jmp _loop_start_919
_loop_end_919:
   push left910[ebp]
   pop ecx
   push right910[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349666486197
   push 1
   jmp _compare_end604349666486197
_compare_not_equal604349666486197:
   push 0
_compare_end604349666486197:
   pop eax
   cmp eax, 0
   je _if_end_921
_if_start_921:
   push left910[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr906[ebp]
   push [esi[edx]]
   pop eax
   mov tmp921[ebp], eax
   push right910[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr906[ebp]
   push [esi[edx]]
   pop edx
   push left910[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr906[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp921[ebp]
   pop edx
   push right910[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr906[ebp]
   add esi, ecx
   mov [esi], edx
   push left910[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left910[ebp], eax
   push right910[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right910[ebp], eax
_if_end_921:
   push left910[ebp]
   pop ecx
   push right910[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349667360747
   push 1
   jmp _compare_end604349667360747
_compare_not_equal604349667360747:
   push 0
_compare_end604349667360747:
   pop eax
   cmp eax, 0
   je _loop_end_913
   jmp _loop_start_913
_loop_end_913:

   ; init stack for qs
   push right910[ebp]
   push arg_first906[ebp]
   push arg_s_arr906[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last906[ebp]
   push left910[ebp]
   push arg_s_arr906[ebp]
   ; call qs
   call qs

_if_end_910:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first922[ebp]
   pop ecx
   push arg_last922[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349667851265
   push 1
   jmp _compare_end604349667851265
_compare_not_equal604349667851265:
   push 0
_compare_end604349667851265:
   pop eax
   cmp eax, 0
   je _if_end_926
_if_start_926:
   push arg_first922[ebp]
   pop eax
   mov left926[ebp], eax
   push arg_last922[ebp]
   pop eax
   mov right926[ebp], eax
   push left926[ebp]
   push right926[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr922[ebp]
   push [esi[edx]]
   pop eax
   mov middle926[ebp], eax
_loop_start_929:
_loop_aftereffects_929:
_loop_start_932:
_loop_aftereffects_932:
   push left926[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr922[ebp]
   push [esi[edx]]
   pop ecx
   push middle926[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349668261812
   push 1
   jmp _compare_end604349668261812
_compare_not_equal604349668261812:
   push 0
_compare_end604349668261812:
   pop eax
   cmp eax, 0
   je _loop_end_932
   push left926[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left926[ebp], eax
   jmp _loop_start_932
_loop_end_932:
_loop_start_935:
_loop_aftereffects_935:
   push right926[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr922[ebp]
   push [esi[edx]]
   pop ecx
   push middle926[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349668557320
   push 1
   jmp _compare_end604349668557320
_compare_not_equal604349668557320:
   push 0
_compare_end604349668557320:
   pop eax
   cmp eax, 0
   je _loop_end_935
   push right926[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right926[ebp], eax
   jmp _loop_start_935
_loop_end_935:
   push left926[ebp]
   pop ecx
   push right926[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349668770292
   push 1
   jmp _compare_end604349668770292
_compare_not_equal604349668770292:
   push 0
_compare_end604349668770292:
   pop eax
   cmp eax, 0
   je _if_end_937
_if_start_937:
   push left926[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr922[ebp]
   push [esi[edx]]
   pop eax
   mov tmp937[ebp], eax
   push right926[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr922[ebp]
   push [esi[edx]]
   pop edx
   push left926[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr922[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp937[ebp]
   pop edx
   push right926[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr922[ebp]
   add esi, ecx
   mov [esi], edx
   push left926[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left926[ebp], eax
   push right926[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right926[ebp], eax
_if_end_937:
   push left926[ebp]
   pop ecx
   push right926[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349670852962
   push 1
   jmp _compare_end604349670852962
_compare_not_equal604349670852962:
   push 0
_compare_end604349670852962:
   pop eax
   cmp eax, 0
   je _loop_end_929
   jmp _loop_start_929
_loop_end_929:

   ; init stack for qs
   push right926[ebp]
   push arg_first922[ebp]
   push arg_s_arr922[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last922[ebp]
   push left926[ebp]
   push arg_s_arr922[ebp]
   ; call qs
   call qs

_if_end_926:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first938[ebp]
   pop ecx
   push arg_last938[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349671355027
   push 1
   jmp _compare_end604349671355027
_compare_not_equal604349671355027:
   push 0
_compare_end604349671355027:
   pop eax
   cmp eax, 0
   je _if_end_942
_if_start_942:
   push arg_first938[ebp]
   pop eax
   mov left942[ebp], eax
   push arg_last938[ebp]
   pop eax
   mov right942[ebp], eax
   push left942[ebp]
   push right942[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr938[ebp]
   push [esi[edx]]
   pop eax
   mov middle942[ebp], eax
_loop_start_945:
_loop_aftereffects_945:
_loop_start_948:
_loop_aftereffects_948:
   push left942[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr938[ebp]
   push [esi[edx]]
   pop ecx
   push middle942[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349671888738
   push 1
   jmp _compare_end604349671888738
_compare_not_equal604349671888738:
   push 0
_compare_end604349671888738:
   pop eax
   cmp eax, 0
   je _loop_end_948
   push left942[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left942[ebp], eax
   jmp _loop_start_948
_loop_end_948:
_loop_start_951:
_loop_aftereffects_951:
   push right942[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr938[ebp]
   push [esi[edx]]
   pop ecx
   push middle942[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349672183391
   push 1
   jmp _compare_end604349672183391
_compare_not_equal604349672183391:
   push 0
_compare_end604349672183391:
   pop eax
   cmp eax, 0
   je _loop_end_951
   push right942[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right942[ebp], eax
   jmp _loop_start_951
_loop_end_951:
   push left942[ebp]
   pop ecx
   push right942[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349672485742
   push 1
   jmp _compare_end604349672485742
_compare_not_equal604349672485742:
   push 0
_compare_end604349672485742:
   pop eax
   cmp eax, 0
   je _if_end_953
_if_start_953:
   push left942[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr938[ebp]
   push [esi[edx]]
   pop eax
   mov tmp953[ebp], eax
   push right942[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr938[ebp]
   push [esi[edx]]
   pop edx
   push left942[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr938[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp953[ebp]
   pop edx
   push right942[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr938[ebp]
   add esi, ecx
   mov [esi], edx
   push left942[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left942[ebp], eax
   push right942[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right942[ebp], eax
_if_end_953:
   push left942[ebp]
   pop ecx
   push right942[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349673430855
   push 1
   jmp _compare_end604349673430855
_compare_not_equal604349673430855:
   push 0
_compare_end604349673430855:
   pop eax
   cmp eax, 0
   je _loop_end_945
   jmp _loop_start_945
_loop_end_945:

   ; init stack for qs
   push right942[ebp]
   push arg_first938[ebp]
   push arg_s_arr938[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last938[ebp]
   push left942[ebp]
   push arg_s_arr938[ebp]
   ; call qs
   call qs

_if_end_942:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first954[ebp]
   pop ecx
   push arg_last954[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349673834132
   push 1
   jmp _compare_end604349673834132
_compare_not_equal604349673834132:
   push 0
_compare_end604349673834132:
   pop eax
   cmp eax, 0
   je _if_end_958
_if_start_958:
   push arg_first954[ebp]
   pop eax
   mov left958[ebp], eax
   push arg_last954[ebp]
   pop eax
   mov right958[ebp], eax
   push left958[ebp]
   push right958[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr954[ebp]
   push [esi[edx]]
   pop eax
   mov middle958[ebp], eax
_loop_start_961:
_loop_aftereffects_961:
_loop_start_964:
_loop_aftereffects_964:
   push left958[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr954[ebp]
   push [esi[edx]]
   pop ecx
   push middle958[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349674225434
   push 1
   jmp _compare_end604349674225434
_compare_not_equal604349674225434:
   push 0
_compare_end604349674225434:
   pop eax
   cmp eax, 0
   je _loop_end_964
   push left958[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left958[ebp], eax
   jmp _loop_start_964
_loop_end_964:
_loop_start_967:
_loop_aftereffects_967:
   push right958[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr954[ebp]
   push [esi[edx]]
   pop ecx
   push middle958[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349674402910
   push 1
   jmp _compare_end604349674402910
_compare_not_equal604349674402910:
   push 0
_compare_end604349674402910:
   pop eax
   cmp eax, 0
   je _loop_end_967
   push right958[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right958[ebp], eax
   jmp _loop_start_967
_loop_end_967:
   push left958[ebp]
   pop ecx
   push right958[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349674469624
   push 1
   jmp _compare_end604349674469624
_compare_not_equal604349674469624:
   push 0
_compare_end604349674469624:
   pop eax
   cmp eax, 0
   je _if_end_969
_if_start_969:
   push left958[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr954[ebp]
   push [esi[edx]]
   pop eax
   mov tmp969[ebp], eax
   push right958[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr954[ebp]
   push [esi[edx]]
   pop edx
   push left958[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr954[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp969[ebp]
   pop edx
   push right958[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr954[ebp]
   add esi, ecx
   mov [esi], edx
   push left958[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left958[ebp], eax
   push right958[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right958[ebp], eax
_if_end_969:
   push left958[ebp]
   pop ecx
   push right958[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349674686872
   push 1
   jmp _compare_end604349674686872
_compare_not_equal604349674686872:
   push 0
_compare_end604349674686872:
   pop eax
   cmp eax, 0
   je _loop_end_961
   jmp _loop_start_961
_loop_end_961:

   ; init stack for qs
   push right958[ebp]
   push arg_first954[ebp]
   push arg_s_arr954[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last954[ebp]
   push left958[ebp]
   push arg_s_arr954[ebp]
   ; call qs
   call qs

_if_end_958:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first970[ebp]
   pop ecx
   push arg_last970[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349674783522
   push 1
   jmp _compare_end604349674783522
_compare_not_equal604349674783522:
   push 0
_compare_end604349674783522:
   pop eax
   cmp eax, 0
   je _if_end_974
_if_start_974:
   push arg_first970[ebp]
   pop eax
   mov left974[ebp], eax
   push arg_last970[ebp]
   pop eax
   mov right974[ebp], eax
   push left974[ebp]
   push right974[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr970[ebp]
   push [esi[edx]]
   pop eax
   mov middle974[ebp], eax
_loop_start_977:
_loop_aftereffects_977:
_loop_start_980:
_loop_aftereffects_980:
   push left974[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr970[ebp]
   push [esi[edx]]
   pop ecx
   push middle974[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349674913956
   push 1
   jmp _compare_end604349674913956
_compare_not_equal604349674913956:
   push 0
_compare_end604349674913956:
   pop eax
   cmp eax, 0
   je _loop_end_980
   push left974[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left974[ebp], eax
   jmp _loop_start_980
_loop_end_980:
_loop_start_983:
_loop_aftereffects_983:
   push right974[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr970[ebp]
   push [esi[edx]]
   pop ecx
   push middle974[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349674982808
   push 1
   jmp _compare_end604349674982808
_compare_not_equal604349674982808:
   push 0
_compare_end604349674982808:
   pop eax
   cmp eax, 0
   je _loop_end_983
   push right974[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right974[ebp], eax
   jmp _loop_start_983
_loop_end_983:
   push left974[ebp]
   pop ecx
   push right974[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349675051660
   push 1
   jmp _compare_end604349675051660
_compare_not_equal604349675051660:
   push 0
_compare_end604349675051660:
   pop eax
   cmp eax, 0
   je _if_end_985
_if_start_985:
   push left974[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr970[ebp]
   push [esi[edx]]
   pop eax
   mov tmp985[ebp], eax
   push right974[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr970[ebp]
   push [esi[edx]]
   pop edx
   push left974[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr970[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp985[ebp]
   pop edx
   push right974[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr970[ebp]
   add esi, ecx
   mov [esi], edx
   push left974[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left974[ebp], eax
   push right974[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right974[ebp], eax
_if_end_985:
   push left974[ebp]
   pop ecx
   push right974[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349675472898
   push 1
   jmp _compare_end604349675472898
_compare_not_equal604349675472898:
   push 0
_compare_end604349675472898:
   pop eax
   cmp eax, 0
   je _loop_end_977
   jmp _loop_start_977
_loop_end_977:

   ; init stack for qs
   push right974[ebp]
   push arg_first970[ebp]
   push arg_s_arr970[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last970[ebp]
   push left974[ebp]
   push arg_s_arr970[ebp]
   ; call qs
   call qs

_if_end_974:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first986[ebp]
   pop ecx
   push arg_last986[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349675703831
   push 1
   jmp _compare_end604349675703831
_compare_not_equal604349675703831:
   push 0
_compare_end604349675703831:
   pop eax
   cmp eax, 0
   je _if_end_990
_if_start_990:
   push arg_first986[ebp]
   pop eax
   mov left990[ebp], eax
   push arg_last986[ebp]
   pop eax
   mov right990[ebp], eax
   push left990[ebp]
   push right990[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr986[ebp]
   push [esi[edx]]
   pop eax
   mov middle990[ebp], eax
_loop_start_993:
_loop_aftereffects_993:
_loop_start_996:
_loop_aftereffects_996:
   push left990[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr986[ebp]
   push [esi[edx]]
   pop ecx
   push middle990[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349675981805
   push 1
   jmp _compare_end604349675981805
_compare_not_equal604349675981805:
   push 0
_compare_end604349675981805:
   pop eax
   cmp eax, 0
   je _loop_end_996
   push left990[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left990[ebp], eax
   jmp _loop_start_996
_loop_end_996:
_loop_start_999:
_loop_aftereffects_999:
   push right990[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr986[ebp]
   push [esi[edx]]
   pop ecx
   push middle990[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349676123359
   push 1
   jmp _compare_end604349676123359
_compare_not_equal604349676123359:
   push 0
_compare_end604349676123359:
   pop eax
   cmp eax, 0
   je _loop_end_999
   push right990[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right990[ebp], eax
   jmp _loop_start_999
_loop_end_999:
   push left990[ebp]
   pop ecx
   push right990[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349676283301
   push 1
   jmp _compare_end604349676283301
_compare_not_equal604349676283301:
   push 0
_compare_end604349676283301:
   pop eax
   cmp eax, 0
   je _if_end_1001
_if_start_1001:
   push left990[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr986[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1001[ebp], eax
   push right990[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr986[ebp]
   push [esi[edx]]
   pop edx
   push left990[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr986[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1001[ebp]
   pop edx
   push right990[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr986[ebp]
   add esi, ecx
   mov [esi], edx
   push left990[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left990[ebp], eax
   push right990[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right990[ebp], eax
_if_end_1001:
   push left990[ebp]
   pop ecx
   push right990[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349677265192
   push 1
   jmp _compare_end604349677265192
_compare_not_equal604349677265192:
   push 0
_compare_end604349677265192:
   pop eax
   cmp eax, 0
   je _loop_end_993
   jmp _loop_start_993
_loop_end_993:

   ; init stack for qs
   push right990[ebp]
   push arg_first986[ebp]
   push arg_s_arr986[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last986[ebp]
   push left990[ebp]
   push arg_s_arr986[ebp]
   ; call qs
   call qs

_if_end_990:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1002[ebp]
   pop ecx
   push arg_last1002[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349677683865
   push 1
   jmp _compare_end604349677683865
_compare_not_equal604349677683865:
   push 0
_compare_end604349677683865:
   pop eax
   cmp eax, 0
   je _if_end_1006
_if_start_1006:
   push arg_first1002[ebp]
   pop eax
   mov left1006[ebp], eax
   push arg_last1002[ebp]
   pop eax
   mov right1006[ebp], eax
   push left1006[ebp]
   push right1006[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1002[ebp]
   push [esi[edx]]
   pop eax
   mov middle1006[ebp], eax
_loop_start_1009:
_loop_aftereffects_1009:
_loop_start_1012:
_loop_aftereffects_1012:
   push left1006[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1002[ebp]
   push [esi[edx]]
   pop ecx
   push middle1006[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349678158987
   push 1
   jmp _compare_end604349678158987
_compare_not_equal604349678158987:
   push 0
_compare_end604349678158987:
   pop eax
   cmp eax, 0
   je _loop_end_1012
   push left1006[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1006[ebp], eax
   jmp _loop_start_1012
_loop_end_1012:
_loop_start_1015:
_loop_aftereffects_1015:
   push right1006[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1002[ebp]
   push [esi[edx]]
   pop ecx
   push middle1006[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349678301823
   push 1
   jmp _compare_end604349678301823
_compare_not_equal604349678301823:
   push 0
_compare_end604349678301823:
   pop eax
   cmp eax, 0
   je _loop_end_1015
   push right1006[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1006[ebp], eax
   jmp _loop_start_1015
_loop_end_1015:
   push left1006[ebp]
   pop ecx
   push right1006[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349678584930
   push 1
   jmp _compare_end604349678584930
_compare_not_equal604349678584930:
   push 0
_compare_end604349678584930:
   pop eax
   cmp eax, 0
   je _if_end_1017
_if_start_1017:
   push left1006[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1002[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1017[ebp], eax
   push right1006[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1002[ebp]
   push [esi[edx]]
   pop edx
   push left1006[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1002[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1017[ebp]
   pop edx
   push right1006[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1002[ebp]
   add esi, ecx
   mov [esi], edx
   push left1006[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1006[ebp], eax
   push right1006[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1006[ebp], eax
_if_end_1017:
   push left1006[ebp]
   pop ecx
   push right1006[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349679619850
   push 1
   jmp _compare_end604349679619850
_compare_not_equal604349679619850:
   push 0
_compare_end604349679619850:
   pop eax
   cmp eax, 0
   je _loop_end_1009
   jmp _loop_start_1009
_loop_end_1009:

   ; init stack for qs
   push right1006[ebp]
   push arg_first1002[ebp]
   push arg_s_arr1002[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1002[ebp]
   push left1006[ebp]
   push arg_s_arr1002[ebp]
   ; call qs
   call qs

_if_end_1006:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1018[ebp]
   pop ecx
   push arg_last1018[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349680050497
   push 1
   jmp _compare_end604349680050497
_compare_not_equal604349680050497:
   push 0
_compare_end604349680050497:
   pop eax
   cmp eax, 0
   je _if_end_1022
_if_start_1022:
   push arg_first1018[ebp]
   pop eax
   mov left1022[ebp], eax
   push arg_last1018[ebp]
   pop eax
   mov right1022[ebp], eax
   push left1022[ebp]
   push right1022[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1018[ebp]
   push [esi[edx]]
   pop eax
   mov middle1022[ebp], eax
_loop_start_1025:
_loop_aftereffects_1025:
_loop_start_1028:
_loop_aftereffects_1028:
   push left1022[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1018[ebp]
   push [esi[edx]]
   pop ecx
   push middle1022[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349680391764
   push 1
   jmp _compare_end604349680391764
_compare_not_equal604349680391764:
   push 0
_compare_end604349680391764:
   pop eax
   cmp eax, 0
   je _loop_end_1028
   push left1022[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1022[ebp], eax
   jmp _loop_start_1028
_loop_end_1028:
_loop_start_1031:
_loop_aftereffects_1031:
   push right1022[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1018[ebp]
   push [esi[edx]]
   pop ecx
   push middle1022[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349680711221
   push 1
   jmp _compare_end604349680711221
_compare_not_equal604349680711221:
   push 0
_compare_end604349680711221:
   pop eax
   cmp eax, 0
   je _loop_end_1031
   push right1022[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1022[ebp], eax
   jmp _loop_start_1031
_loop_end_1031:
   push left1022[ebp]
   pop ecx
   push right1022[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349681030250
   push 1
   jmp _compare_end604349681030250
_compare_not_equal604349681030250:
   push 0
_compare_end604349681030250:
   pop eax
   cmp eax, 0
   je _if_end_1033
_if_start_1033:
   push left1022[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1018[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1033[ebp], eax
   push right1022[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1018[ebp]
   push [esi[edx]]
   pop edx
   push left1022[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1018[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1033[ebp]
   pop edx
   push right1022[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1018[ebp]
   add esi, ecx
   mov [esi], edx
   push left1022[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1022[ebp], eax
   push right1022[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1022[ebp], eax
_if_end_1033:
   push left1022[ebp]
   pop ecx
   push right1022[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349682037801
   push 1
   jmp _compare_end604349682037801
_compare_not_equal604349682037801:
   push 0
_compare_end604349682037801:
   pop eax
   cmp eax, 0
   je _loop_end_1025
   jmp _loop_start_1025
_loop_end_1025:

   ; init stack for qs
   push right1022[ebp]
   push arg_first1018[ebp]
   push arg_s_arr1018[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1018[ebp]
   push left1022[ebp]
   push arg_s_arr1018[ebp]
   ; call qs
   call qs

_if_end_1022:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1034[ebp]
   pop ecx
   push arg_last1034[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349682462460
   push 1
   jmp _compare_end604349682462460
_compare_not_equal604349682462460:
   push 0
_compare_end604349682462460:
   pop eax
   cmp eax, 0
   je _if_end_1038
_if_start_1038:
   push arg_first1034[ebp]
   pop eax
   mov left1038[ebp], eax
   push arg_last1034[ebp]
   pop eax
   mov right1038[ebp], eax
   push left1038[ebp]
   push right1038[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1034[ebp]
   push [esi[edx]]
   pop eax
   mov middle1038[ebp], eax
_loop_start_1041:
_loop_aftereffects_1041:
_loop_start_1044:
_loop_aftereffects_1044:
   push left1038[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1034[ebp]
   push [esi[edx]]
   pop ecx
   push middle1038[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349683062457
   push 1
   jmp _compare_end604349683062457
_compare_not_equal604349683062457:
   push 0
_compare_end604349683062457:
   pop eax
   cmp eax, 0
   je _loop_end_1044
   push left1038[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1038[ebp], eax
   jmp _loop_start_1044
_loop_end_1044:
_loop_start_1047:
_loop_aftereffects_1047:
   push right1038[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1034[ebp]
   push [esi[edx]]
   pop ecx
   push middle1038[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349683384480
   push 1
   jmp _compare_end604349683384480
_compare_not_equal604349683384480:
   push 0
_compare_end604349683384480:
   pop eax
   cmp eax, 0
   je _loop_end_1047
   push right1038[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1038[ebp], eax
   jmp _loop_start_1047
_loop_end_1047:
   push left1038[ebp]
   pop ecx
   push right1038[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349683711635
   push 1
   jmp _compare_end604349683711635
_compare_not_equal604349683711635:
   push 0
_compare_end604349683711635:
   pop eax
   cmp eax, 0
   je _if_end_1049
_if_start_1049:
   push left1038[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1034[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1049[ebp], eax
   push right1038[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1034[ebp]
   push [esi[edx]]
   pop edx
   push left1038[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1034[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1049[ebp]
   pop edx
   push right1038[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1034[ebp]
   add esi, ecx
   mov [esi], edx
   push left1038[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1038[ebp], eax
   push right1038[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1038[ebp], eax
_if_end_1049:
   push left1038[ebp]
   pop ecx
   push right1038[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349684744845
   push 1
   jmp _compare_end604349684744845
_compare_not_equal604349684744845:
   push 0
_compare_end604349684744845:
   pop eax
   cmp eax, 0
   je _loop_end_1041
   jmp _loop_start_1041
_loop_end_1041:

   ; init stack for qs
   push right1038[ebp]
   push arg_first1034[ebp]
   push arg_s_arr1034[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1034[ebp]
   push left1038[ebp]
   push arg_s_arr1034[ebp]
   ; call qs
   call qs

_if_end_1038:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1050[ebp]
   pop ecx
   push arg_last1050[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349685097658
   push 1
   jmp _compare_end604349685097658
_compare_not_equal604349685097658:
   push 0
_compare_end604349685097658:
   pop eax
   cmp eax, 0
   je _if_end_1054
_if_start_1054:
   push arg_first1050[ebp]
   pop eax
   mov left1054[ebp], eax
   push arg_last1050[ebp]
   pop eax
   mov right1054[ebp], eax
   push left1054[ebp]
   push right1054[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1050[ebp]
   push [esi[edx]]
   pop eax
   mov middle1054[ebp], eax
_loop_start_1057:
_loop_aftereffects_1057:
_loop_start_1060:
_loop_aftereffects_1060:
   push left1054[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1050[ebp]
   push [esi[edx]]
   pop ecx
   push middle1054[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349685701932
   push 1
   jmp _compare_end604349685701932
_compare_not_equal604349685701932:
   push 0
_compare_end604349685701932:
   pop eax
   cmp eax, 0
   je _loop_end_1060
   push left1054[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1054[ebp], eax
   jmp _loop_start_1060
_loop_end_1060:
_loop_start_1063:
_loop_aftereffects_1063:
   push right1054[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1050[ebp]
   push [esi[edx]]
   pop ecx
   push middle1054[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349686045338
   push 1
   jmp _compare_end604349686045338
_compare_not_equal604349686045338:
   push 0
_compare_end604349686045338:
   pop eax
   cmp eax, 0
   je _loop_end_1063
   push right1054[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1054[ebp], eax
   jmp _loop_start_1063
_loop_end_1063:
   push left1054[ebp]
   pop ecx
   push right1054[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349686351965
   push 1
   jmp _compare_end604349686351965
_compare_not_equal604349686351965:
   push 0
_compare_end604349686351965:
   pop eax
   cmp eax, 0
   je _if_end_1065
_if_start_1065:
   push left1054[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1050[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1065[ebp], eax
   push right1054[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1050[ebp]
   push [esi[edx]]
   pop edx
   push left1054[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1050[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1065[ebp]
   pop edx
   push right1054[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1050[ebp]
   add esi, ecx
   mov [esi], edx
   push left1054[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1054[ebp], eax
   push right1054[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1054[ebp], eax
_if_end_1065:
   push left1054[ebp]
   pop ecx
   push right1054[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349687385602
   push 1
   jmp _compare_end604349687385602
_compare_not_equal604349687385602:
   push 0
_compare_end604349687385602:
   pop eax
   cmp eax, 0
   je _loop_end_1057
   jmp _loop_start_1057
_loop_end_1057:

   ; init stack for qs
   push right1054[ebp]
   push arg_first1050[ebp]
   push arg_s_arr1050[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1050[ebp]
   push left1054[ebp]
   push arg_s_arr1050[ebp]
   ; call qs
   call qs

_if_end_1054:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1066[ebp]
   pop ecx
   push arg_last1066[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349687834638
   push 1
   jmp _compare_end604349687834638
_compare_not_equal604349687834638:
   push 0
_compare_end604349687834638:
   pop eax
   cmp eax, 0
   je _if_end_1070
_if_start_1070:
   push arg_first1066[ebp]
   pop eax
   mov left1070[ebp], eax
   push arg_last1066[ebp]
   pop eax
   mov right1070[ebp], eax
   push left1070[ebp]
   push right1070[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1066[ebp]
   push [esi[edx]]
   pop eax
   mov middle1070[ebp], eax
_loop_start_1073:
_loop_aftereffects_1073:
_loop_start_1076:
_loop_aftereffects_1076:
   push left1070[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1066[ebp]
   push [esi[edx]]
   pop ecx
   push middle1070[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349688343118
   push 1
   jmp _compare_end604349688343118
_compare_not_equal604349688343118:
   push 0
_compare_end604349688343118:
   pop eax
   cmp eax, 0
   je _loop_end_1076
   push left1070[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1070[ebp], eax
   jmp _loop_start_1076
_loop_end_1076:
_loop_start_1079:
_loop_aftereffects_1079:
   push right1070[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1066[ebp]
   push [esi[edx]]
   pop ecx
   push middle1070[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349688486381
   push 1
   jmp _compare_end604349688486381
_compare_not_equal604349688486381:
   push 0
_compare_end604349688486381:
   pop eax
   cmp eax, 0
   je _loop_end_1079
   push right1070[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1070[ebp], eax
   jmp _loop_start_1079
_loop_end_1079:
   push left1070[ebp]
   pop ecx
   push right1070[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349688815674
   push 1
   jmp _compare_end604349688815674
_compare_not_equal604349688815674:
   push 0
_compare_end604349688815674:
   pop eax
   cmp eax, 0
   je _if_end_1081
_if_start_1081:
   push left1070[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1066[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1081[ebp], eax
   push right1070[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1066[ebp]
   push [esi[edx]]
   pop edx
   push left1070[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1066[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1081[ebp]
   pop edx
   push right1070[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1066[ebp]
   add esi, ecx
   mov [esi], edx
   push left1070[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1070[ebp], eax
   push right1070[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1070[ebp], eax
_if_end_1081:
   push left1070[ebp]
   pop ecx
   push right1070[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349689886945
   push 1
   jmp _compare_end604349689886945
_compare_not_equal604349689886945:
   push 0
_compare_end604349689886945:
   pop eax
   cmp eax, 0
   je _loop_end_1073
   jmp _loop_start_1073
_loop_end_1073:

   ; init stack for qs
   push right1070[ebp]
   push arg_first1066[ebp]
   push arg_s_arr1066[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1066[ebp]
   push left1070[ebp]
   push arg_s_arr1066[ebp]
   ; call qs
   call qs

_if_end_1070:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1082[ebp]
   pop ecx
   push arg_last1082[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349690326145
   push 1
   jmp _compare_end604349690326145
_compare_not_equal604349690326145:
   push 0
_compare_end604349690326145:
   pop eax
   cmp eax, 0
   je _if_end_1086
_if_start_1086:
   push arg_first1082[ebp]
   pop eax
   mov left1086[ebp], eax
   push arg_last1082[ebp]
   pop eax
   mov right1086[ebp], eax
   push left1086[ebp]
   push right1086[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1082[ebp]
   push [esi[edx]]
   pop eax
   mov middle1086[ebp], eax
_loop_start_1089:
_loop_aftereffects_1089:
_loop_start_1092:
_loop_aftereffects_1092:
   push left1086[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1082[ebp]
   push [esi[edx]]
   pop ecx
   push middle1086[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349690785872
   push 1
   jmp _compare_end604349690785872
_compare_not_equal604349690785872:
   push 0
_compare_end604349690785872:
   pop eax
   cmp eax, 0
   je _loop_end_1092
   push left1086[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1086[ebp], eax
   jmp _loop_start_1092
_loop_end_1092:
_loop_start_1095:
_loop_aftereffects_1095:
   push right1086[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1082[ebp]
   push [esi[edx]]
   pop ecx
   push middle1086[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349691128850
   push 1
   jmp _compare_end604349691128850
_compare_not_equal604349691128850:
   push 0
_compare_end604349691128850:
   pop eax
   cmp eax, 0
   je _loop_end_1095
   push right1086[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1086[ebp], eax
   jmp _loop_start_1095
_loop_end_1095:
   push left1086[ebp]
   pop ecx
   push right1086[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349691463274
   push 1
   jmp _compare_end604349691463274
_compare_not_equal604349691463274:
   push 0
_compare_end604349691463274:
   pop eax
   cmp eax, 0
   je _if_end_1097
_if_start_1097:
   push left1086[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1082[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1097[ebp], eax
   push right1086[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1082[ebp]
   push [esi[edx]]
   pop edx
   push left1086[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1082[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1097[ebp]
   pop edx
   push right1086[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1082[ebp]
   add esi, ecx
   mov [esi], edx
   push left1086[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1086[ebp], eax
   push right1086[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1086[ebp], eax
_if_end_1097:
   push left1086[ebp]
   pop ecx
   push right1086[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349692505037
   push 1
   jmp _compare_end604349692505037
_compare_not_equal604349692505037:
   push 0
_compare_end604349692505037:
   pop eax
   cmp eax, 0
   je _loop_end_1089
   jmp _loop_start_1089
_loop_end_1089:

   ; init stack for qs
   push right1086[ebp]
   push arg_first1082[ebp]
   push arg_s_arr1082[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1082[ebp]
   push left1086[ebp]
   push arg_s_arr1082[ebp]
   ; call qs
   call qs

_if_end_1086:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1098[ebp]
   pop ecx
   push arg_last1098[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349692936967
   push 1
   jmp _compare_end604349692936967
_compare_not_equal604349692936967:
   push 0
_compare_end604349692936967:
   pop eax
   cmp eax, 0
   je _if_end_1102
_if_start_1102:
   push arg_first1098[ebp]
   pop eax
   mov left1102[ebp], eax
   push arg_last1098[ebp]
   pop eax
   mov right1102[ebp], eax
   push left1102[ebp]
   push right1102[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1098[ebp]
   push [esi[edx]]
   pop eax
   mov middle1102[ebp], eax
_loop_start_1105:
_loop_aftereffects_1105:
_loop_start_1108:
_loop_aftereffects_1108:
   push left1102[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1098[ebp]
   push [esi[edx]]
   pop ecx
   push middle1102[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349693560913
   push 1
   jmp _compare_end604349693560913
_compare_not_equal604349693560913:
   push 0
_compare_end604349693560913:
   pop eax
   cmp eax, 0
   je _loop_end_1108
   push left1102[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1102[ebp], eax
   jmp _loop_start_1108
_loop_end_1108:
_loop_start_1111:
_loop_aftereffects_1111:
   push right1102[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1098[ebp]
   push [esi[edx]]
   pop ecx
   push middle1102[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349693900897
   push 1
   jmp _compare_end604349693900897
_compare_not_equal604349693900897:
   push 0
_compare_end604349693900897:
   pop eax
   cmp eax, 0
   je _loop_end_1111
   push right1102[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1102[ebp], eax
   jmp _loop_start_1111
_loop_end_1111:
   push left1102[ebp]
   pop ecx
   push right1102[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349694148508
   push 1
   jmp _compare_end604349694148508
_compare_not_equal604349694148508:
   push 0
_compare_end604349694148508:
   pop eax
   cmp eax, 0
   je _if_end_1113
_if_start_1113:
   push left1102[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1098[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1113[ebp], eax
   push right1102[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1098[ebp]
   push [esi[edx]]
   pop edx
   push left1102[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1098[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1113[ebp]
   pop edx
   push right1102[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1098[ebp]
   add esi, ecx
   mov [esi], edx
   push left1102[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1102[ebp], eax
   push right1102[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1102[ebp], eax
_if_end_1113:
   push left1102[ebp]
   pop ecx
   push right1102[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349694537245
   push 1
   jmp _compare_end604349694537245
_compare_not_equal604349694537245:
   push 0
_compare_end604349694537245:
   pop eax
   cmp eax, 0
   je _loop_end_1105
   jmp _loop_start_1105
_loop_end_1105:

   ; init stack for qs
   push right1102[ebp]
   push arg_first1098[ebp]
   push arg_s_arr1098[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1098[ebp]
   push left1102[ebp]
   push arg_s_arr1098[ebp]
   ; call qs
   call qs

_if_end_1102:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1114[ebp]
   pop ecx
   push arg_last1114[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349694653566
   push 1
   jmp _compare_end604349694653566
_compare_not_equal604349694653566:
   push 0
_compare_end604349694653566:
   pop eax
   cmp eax, 0
   je _if_end_1118
_if_start_1118:
   push arg_first1114[ebp]
   pop eax
   mov left1118[ebp], eax
   push arg_last1114[ebp]
   pop eax
   mov right1118[ebp], eax
   push left1118[ebp]
   push right1118[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1114[ebp]
   push [esi[edx]]
   pop eax
   mov middle1118[ebp], eax
_loop_start_1121:
_loop_aftereffects_1121:
_loop_start_1124:
_loop_aftereffects_1124:
   push left1118[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1114[ebp]
   push [esi[edx]]
   pop ecx
   push middle1118[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349694799396
   push 1
   jmp _compare_end604349694799396
_compare_not_equal604349694799396:
   push 0
_compare_end604349694799396:
   pop eax
   cmp eax, 0
   je _loop_end_1124
   push left1118[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1118[ebp], eax
   jmp _loop_start_1124
_loop_end_1124:
_loop_start_1127:
_loop_aftereffects_1127:
   push right1118[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1114[ebp]
   push [esi[edx]]
   pop ecx
   push middle1118[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349694878512
   push 1
   jmp _compare_end604349694878512
_compare_not_equal604349694878512:
   push 0
_compare_end604349694878512:
   pop eax
   cmp eax, 0
   je _loop_end_1127
   push right1118[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1118[ebp], eax
   jmp _loop_start_1127
_loop_end_1127:
   push left1118[ebp]
   pop ecx
   push right1118[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349694961904
   push 1
   jmp _compare_end604349694961904
_compare_not_equal604349694961904:
   push 0
_compare_end604349694961904:
   pop eax
   cmp eax, 0
   je _if_end_1129
_if_start_1129:
   push left1118[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1114[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1129[ebp], eax
   push right1118[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1114[ebp]
   push [esi[edx]]
   pop edx
   push left1118[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1114[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1129[ebp]
   pop edx
   push right1118[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1114[ebp]
   add esi, ecx
   mov [esi], edx
   push left1118[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1118[ebp], eax
   push right1118[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1118[ebp], eax
_if_end_1129:
   push left1118[ebp]
   pop ecx
   push right1118[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349696147786
   push 1
   jmp _compare_end604349696147786
_compare_not_equal604349696147786:
   push 0
_compare_end604349696147786:
   pop eax
   cmp eax, 0
   je _loop_end_1121
   jmp _loop_start_1121
_loop_end_1121:

   ; init stack for qs
   push right1118[ebp]
   push arg_first1114[ebp]
   push arg_s_arr1114[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1114[ebp]
   push left1118[ebp]
   push arg_s_arr1114[ebp]
   ; call qs
   call qs

_if_end_1118:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1130[ebp]
   pop ecx
   push arg_last1130[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349696400957
   push 1
   jmp _compare_end604349696400957
_compare_not_equal604349696400957:
   push 0
_compare_end604349696400957:
   pop eax
   cmp eax, 0
   je _if_end_1134
_if_start_1134:
   push arg_first1130[ebp]
   pop eax
   mov left1134[ebp], eax
   push arg_last1130[ebp]
   pop eax
   mov right1134[ebp], eax
   push left1134[ebp]
   push right1134[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1130[ebp]
   push [esi[edx]]
   pop eax
   mov middle1134[ebp], eax
_loop_start_1137:
_loop_aftereffects_1137:
_loop_start_1140:
_loop_aftereffects_1140:
   push left1134[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1130[ebp]
   push [esi[edx]]
   pop ecx
   push middle1134[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349697036877
   push 1
   jmp _compare_end604349697036877
_compare_not_equal604349697036877:
   push 0
_compare_end604349697036877:
   pop eax
   cmp eax, 0
   je _loop_end_1140
   push left1134[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1134[ebp], eax
   jmp _loop_start_1140
_loop_end_1140:
_loop_start_1143:
_loop_aftereffects_1143:
   push right1134[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1130[ebp]
   push [esi[edx]]
   pop ecx
   push middle1134[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349697399527
   push 1
   jmp _compare_end604349697399527
_compare_not_equal604349697399527:
   push 0
_compare_end604349697399527:
   pop eax
   cmp eax, 0
   je _loop_end_1143
   push right1134[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1134[ebp], eax
   jmp _loop_start_1143
_loop_end_1143:
   push left1134[ebp]
   pop ecx
   push right1134[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349697709575
   push 1
   jmp _compare_end604349697709575
_compare_not_equal604349697709575:
   push 0
_compare_end604349697709575:
   pop eax
   cmp eax, 0
   je _if_end_1145
_if_start_1145:
   push left1134[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1130[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1145[ebp], eax
   push right1134[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1130[ebp]
   push [esi[edx]]
   pop edx
   push left1134[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1130[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1145[ebp]
   pop edx
   push right1134[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1130[ebp]
   add esi, ecx
   mov [esi], edx
   push left1134[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1134[ebp], eax
   push right1134[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1134[ebp], eax
_if_end_1145:
   push left1134[ebp]
   pop ecx
   push right1134[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349698311711
   push 1
   jmp _compare_end604349698311711
_compare_not_equal604349698311711:
   push 0
_compare_end604349698311711:
   pop eax
   cmp eax, 0
   je _loop_end_1137
   jmp _loop_start_1137
_loop_end_1137:

   ; init stack for qs
   push right1134[ebp]
   push arg_first1130[ebp]
   push arg_s_arr1130[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1130[ebp]
   push left1134[ebp]
   push arg_s_arr1130[ebp]
   ; call qs
   call qs

_if_end_1134:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1146[ebp]
   pop ecx
   push arg_last1146[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349698798808
   push 1
   jmp _compare_end604349698798808
_compare_not_equal604349698798808:
   push 0
_compare_end604349698798808:
   pop eax
   cmp eax, 0
   je _if_end_1150
_if_start_1150:
   push arg_first1146[ebp]
   pop eax
   mov left1150[ebp], eax
   push arg_last1146[ebp]
   pop eax
   mov right1150[ebp], eax
   push left1150[ebp]
   push right1150[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1146[ebp]
   push [esi[edx]]
   pop eax
   mov middle1150[ebp], eax
_loop_start_1153:
_loop_aftereffects_1153:
_loop_start_1156:
_loop_aftereffects_1156:
   push left1150[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1146[ebp]
   push [esi[edx]]
   pop ecx
   push middle1150[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349699491178
   push 1
   jmp _compare_end604349699491178
_compare_not_equal604349699491178:
   push 0
_compare_end604349699491178:
   pop eax
   cmp eax, 0
   je _loop_end_1156
   push left1150[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1150[ebp], eax
   jmp _loop_start_1156
_loop_end_1156:
_loop_start_1159:
_loop_aftereffects_1159:
   push right1150[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1146[ebp]
   push [esi[edx]]
   pop ecx
   push middle1150[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349699827313
   push 1
   jmp _compare_end604349699827313
_compare_not_equal604349699827313:
   push 0
_compare_end604349699827313:
   pop eax
   cmp eax, 0
   je _loop_end_1159
   push right1150[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1150[ebp], eax
   jmp _loop_start_1159
_loop_end_1159:
   push left1150[ebp]
   pop ecx
   push right1150[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349700178844
   push 1
   jmp _compare_end604349700178844
_compare_not_equal604349700178844:
   push 0
_compare_end604349700178844:
   pop eax
   cmp eax, 0
   je _if_end_1161
_if_start_1161:
   push left1150[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1146[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1161[ebp], eax
   push right1150[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1146[ebp]
   push [esi[edx]]
   pop edx
   push left1150[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1146[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1161[ebp]
   pop edx
   push right1150[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1146[ebp]
   add esi, ecx
   mov [esi], edx
   push left1150[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1150[ebp], eax
   push right1150[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1150[ebp], eax
_if_end_1161:
   push left1150[ebp]
   pop ecx
   push right1150[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349701262517
   push 1
   jmp _compare_end604349701262517
_compare_not_equal604349701262517:
   push 0
_compare_end604349701262517:
   pop eax
   cmp eax, 0
   je _loop_end_1153
   jmp _loop_start_1153
_loop_end_1153:

   ; init stack for qs
   push right1150[ebp]
   push arg_first1146[ebp]
   push arg_s_arr1146[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1146[ebp]
   push left1150[ebp]
   push arg_s_arr1146[ebp]
   ; call qs
   call qs

_if_end_1150:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1162[ebp]
   pop ecx
   push arg_last1162[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349701731225
   push 1
   jmp _compare_end604349701731225
_compare_not_equal604349701731225:
   push 0
_compare_end604349701731225:
   pop eax
   cmp eax, 0
   je _if_end_1166
_if_start_1166:
   push arg_first1162[ebp]
   pop eax
   mov left1166[ebp], eax
   push arg_last1162[ebp]
   pop eax
   mov right1166[ebp], eax
   push left1166[ebp]
   push right1166[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1162[ebp]
   push [esi[edx]]
   pop eax
   mov middle1166[ebp], eax
_loop_start_1169:
_loop_aftereffects_1169:
_loop_start_1172:
_loop_aftereffects_1172:
   push left1166[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1162[ebp]
   push [esi[edx]]
   pop ecx
   push middle1166[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349702171280
   push 1
   jmp _compare_end604349702171280
_compare_not_equal604349702171280:
   push 0
_compare_end604349702171280:
   pop eax
   cmp eax, 0
   je _loop_end_1172
   push left1166[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1166[ebp], eax
   jmp _loop_start_1172
_loop_end_1172:
_loop_start_1175:
_loop_aftereffects_1175:
   push right1166[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1162[ebp]
   push [esi[edx]]
   pop ecx
   push middle1166[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349702243125
   push 1
   jmp _compare_end604349702243125
_compare_not_equal604349702243125:
   push 0
_compare_end604349702243125:
   pop eax
   cmp eax, 0
   je _loop_end_1175
   push right1166[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1166[ebp], eax
   jmp _loop_start_1175
_loop_end_1175:
   push left1166[ebp]
   pop ecx
   push right1166[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349702320531
   push 1
   jmp _compare_end604349702320531
_compare_not_equal604349702320531:
   push 0
_compare_end604349702320531:
   pop eax
   cmp eax, 0
   je _if_end_1177
_if_start_1177:
   push left1166[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1162[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1177[ebp], eax
   push right1166[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1162[ebp]
   push [esi[edx]]
   pop edx
   push left1166[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1162[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1177[ebp]
   pop edx
   push right1166[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1162[ebp]
   add esi, ecx
   mov [esi], edx
   push left1166[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1166[ebp], eax
   push right1166[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1166[ebp], eax
_if_end_1177:
   push left1166[ebp]
   pop ecx
   push right1166[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349703182252
   push 1
   jmp _compare_end604349703182252
_compare_not_equal604349703182252:
   push 0
_compare_end604349703182252:
   pop eax
   cmp eax, 0
   je _loop_end_1169
   jmp _loop_start_1169
_loop_end_1169:

   ; init stack for qs
   push right1166[ebp]
   push arg_first1162[ebp]
   push arg_s_arr1162[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1162[ebp]
   push left1166[ebp]
   push arg_s_arr1162[ebp]
   ; call qs
   call qs

_if_end_1166:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1178[ebp]
   pop ecx
   push arg_last1178[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349703651815
   push 1
   jmp _compare_end604349703651815
_compare_not_equal604349703651815:
   push 0
_compare_end604349703651815:
   pop eax
   cmp eax, 0
   je _if_end_1182
_if_start_1182:
   push arg_first1178[ebp]
   pop eax
   mov left1182[ebp], eax
   push arg_last1178[ebp]
   pop eax
   mov right1182[ebp], eax
   push left1182[ebp]
   push right1182[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1178[ebp]
   push [esi[edx]]
   pop eax
   mov middle1182[ebp], eax
_loop_start_1185:
_loop_aftereffects_1185:
_loop_start_1188:
_loop_aftereffects_1188:
   push left1182[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1178[ebp]
   push [esi[edx]]
   pop ecx
   push middle1182[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349704165426
   push 1
   jmp _compare_end604349704165426
_compare_not_equal604349704165426:
   push 0
_compare_end604349704165426:
   pop eax
   cmp eax, 0
   je _loop_end_1188
   push left1182[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1182[ebp], eax
   jmp _loop_start_1188
_loop_end_1188:
_loop_start_1191:
_loop_aftereffects_1191:
   push right1182[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1178[ebp]
   push [esi[edx]]
   pop ecx
   push middle1182[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349704256516
   push 1
   jmp _compare_end604349704256516
_compare_not_equal604349704256516:
   push 0
_compare_end604349704256516:
   pop eax
   cmp eax, 0
   je _loop_end_1191
   push right1182[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1182[ebp], eax
   jmp _loop_start_1191
_loop_end_1191:
   push left1182[ebp]
   pop ecx
   push right1182[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349704333066
   push 1
   jmp _compare_end604349704333066
_compare_not_equal604349704333066:
   push 0
_compare_end604349704333066:
   pop eax
   cmp eax, 0
   je _if_end_1193
_if_start_1193:
   push left1182[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1178[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1193[ebp], eax
   push right1182[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1178[ebp]
   push [esi[edx]]
   pop edx
   push left1182[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1178[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1193[ebp]
   pop edx
   push right1182[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1178[ebp]
   add esi, ecx
   mov [esi], edx
   push left1182[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1182[ebp], eax
   push right1182[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1182[ebp], eax
_if_end_1193:
   push left1182[ebp]
   pop ecx
   push right1182[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349704598639
   push 1
   jmp _compare_end604349704598639
_compare_not_equal604349704598639:
   push 0
_compare_end604349704598639:
   pop eax
   cmp eax, 0
   je _loop_end_1185
   jmp _loop_start_1185
_loop_end_1185:

   ; init stack for qs
   push right1182[ebp]
   push arg_first1178[ebp]
   push arg_s_arr1178[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1178[ebp]
   push left1182[ebp]
   push arg_s_arr1178[ebp]
   ; call qs
   call qs

_if_end_1182:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1194[ebp]
   pop ecx
   push arg_last1194[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349704725224
   push 1
   jmp _compare_end604349704725224
_compare_not_equal604349704725224:
   push 0
_compare_end604349704725224:
   pop eax
   cmp eax, 0
   je _if_end_1198
_if_start_1198:
   push arg_first1194[ebp]
   pop eax
   mov left1198[ebp], eax
   push arg_last1194[ebp]
   pop eax
   mov right1198[ebp], eax
   push left1198[ebp]
   push right1198[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1194[ebp]
   push [esi[edx]]
   pop eax
   mov middle1198[ebp], eax
_loop_start_1201:
_loop_aftereffects_1201:
_loop_start_1204:
_loop_aftereffects_1204:
   push left1198[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1194[ebp]
   push [esi[edx]]
   pop ecx
   push middle1198[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349704880034
   push 1
   jmp _compare_end604349704880034
_compare_not_equal604349704880034:
   push 0
_compare_end604349704880034:
   pop eax
   cmp eax, 0
   je _loop_end_1204
   push left1198[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1198[ebp], eax
   jmp _loop_start_1204
_loop_end_1204:
_loop_start_1207:
_loop_aftereffects_1207:
   push right1198[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1194[ebp]
   push [esi[edx]]
   pop ecx
   push middle1198[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349704963854
   push 1
   jmp _compare_end604349704963854
_compare_not_equal604349704963854:
   push 0
_compare_end604349704963854:
   pop eax
   cmp eax, 0
   je _loop_end_1207
   push right1198[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1198[ebp], eax
   jmp _loop_start_1207
_loop_end_1207:
   push left1198[ebp]
   pop ecx
   push right1198[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349705046391
   push 1
   jmp _compare_end604349705046391
_compare_not_equal604349705046391:
   push 0
_compare_end604349705046391:
   pop eax
   cmp eax, 0
   je _if_end_1209
_if_start_1209:
   push left1198[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1194[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1209[ebp], eax
   push right1198[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1194[ebp]
   push [esi[edx]]
   pop edx
   push left1198[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1194[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1209[ebp]
   pop edx
   push right1198[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1194[ebp]
   add esi, ecx
   mov [esi], edx
   push left1198[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1198[ebp], eax
   push right1198[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1198[ebp], eax
_if_end_1209:
   push left1198[ebp]
   pop ecx
   push right1198[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349706154440
   push 1
   jmp _compare_end604349706154440
_compare_not_equal604349706154440:
   push 0
_compare_end604349706154440:
   pop eax
   cmp eax, 0
   je _loop_end_1201
   jmp _loop_start_1201
_loop_end_1201:

   ; init stack for qs
   push right1198[ebp]
   push arg_first1194[ebp]
   push arg_s_arr1194[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1194[ebp]
   push left1198[ebp]
   push arg_s_arr1194[ebp]
   ; call qs
   call qs

_if_end_1198:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1210[ebp]
   pop ecx
   push arg_last1210[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349706652656
   push 1
   jmp _compare_end604349706652656
_compare_not_equal604349706652656:
   push 0
_compare_end604349706652656:
   pop eax
   cmp eax, 0
   je _if_end_1214
_if_start_1214:
   push arg_first1210[ebp]
   pop eax
   mov left1214[ebp], eax
   push arg_last1210[ebp]
   pop eax
   mov right1214[ebp], eax
   push left1214[ebp]
   push right1214[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1210[ebp]
   push [esi[edx]]
   pop eax
   mov middle1214[ebp], eax
_loop_start_1217:
_loop_aftereffects_1217:
_loop_start_1220:
_loop_aftereffects_1220:
   push left1214[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1210[ebp]
   push [esi[edx]]
   pop ecx
   push middle1214[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349707291998
   push 1
   jmp _compare_end604349707291998
_compare_not_equal604349707291998:
   push 0
_compare_end604349707291998:
   pop eax
   cmp eax, 0
   je _loop_end_1220
   push left1214[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1214[ebp], eax
   jmp _loop_start_1220
_loop_end_1220:
_loop_start_1223:
_loop_aftereffects_1223:
   push right1214[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1210[ebp]
   push [esi[edx]]
   pop ecx
   push middle1214[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349707557998
   push 1
   jmp _compare_end604349707557998
_compare_not_equal604349707557998:
   push 0
_compare_end604349707557998:
   pop eax
   cmp eax, 0
   je _loop_end_1223
   push right1214[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1214[ebp], eax
   jmp _loop_start_1223
_loop_end_1223:
   push left1214[ebp]
   pop ecx
   push right1214[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349707847091
   push 1
   jmp _compare_end604349707847091
_compare_not_equal604349707847091:
   push 0
_compare_end604349707847091:
   pop eax
   cmp eax, 0
   je _if_end_1225
_if_start_1225:
   push left1214[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1210[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1225[ebp], eax
   push right1214[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1210[ebp]
   push [esi[edx]]
   pop edx
   push left1214[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1210[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1225[ebp]
   pop edx
   push right1214[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1210[ebp]
   add esi, ecx
   mov [esi], edx
   push left1214[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1214[ebp], eax
   push right1214[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1214[ebp], eax
_if_end_1225:
   push left1214[ebp]
   pop ecx
   push right1214[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349708871748
   push 1
   jmp _compare_end604349708871748
_compare_not_equal604349708871748:
   push 0
_compare_end604349708871748:
   pop eax
   cmp eax, 0
   je _loop_end_1217
   jmp _loop_start_1217
_loop_end_1217:

   ; init stack for qs
   push right1214[ebp]
   push arg_first1210[ebp]
   push arg_s_arr1210[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1210[ebp]
   push left1214[ebp]
   push arg_s_arr1210[ebp]
   ; call qs
   call qs

_if_end_1214:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1226[ebp]
   pop ecx
   push arg_last1226[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349709349009
   push 1
   jmp _compare_end604349709349009
_compare_not_equal604349709349009:
   push 0
_compare_end604349709349009:
   pop eax
   cmp eax, 0
   je _if_end_1230
_if_start_1230:
   push arg_first1226[ebp]
   pop eax
   mov left1230[ebp], eax
   push arg_last1226[ebp]
   pop eax
   mov right1230[ebp], eax
   push left1230[ebp]
   push right1230[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1226[ebp]
   push [esi[edx]]
   pop eax
   mov middle1230[ebp], eax
_loop_start_1233:
_loop_aftereffects_1233:
_loop_start_1236:
_loop_aftereffects_1236:
   push left1230[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1226[ebp]
   push [esi[edx]]
   pop ecx
   push middle1230[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349710015720
   push 1
   jmp _compare_end604349710015720
_compare_not_equal604349710015720:
   push 0
_compare_end604349710015720:
   pop eax
   cmp eax, 0
   je _loop_end_1236
   push left1230[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1230[ebp], eax
   jmp _loop_start_1236
_loop_end_1236:
_loop_start_1239:
_loop_aftereffects_1239:
   push right1230[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1226[ebp]
   push [esi[edx]]
   pop ecx
   push middle1230[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349710392055
   push 1
   jmp _compare_end604349710392055
_compare_not_equal604349710392055:
   push 0
_compare_end604349710392055:
   pop eax
   cmp eax, 0
   je _loop_end_1239
   push right1230[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1230[ebp], eax
   jmp _loop_start_1239
_loop_end_1239:
   push left1230[ebp]
   pop ecx
   push right1230[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349710755132
   push 1
   jmp _compare_end604349710755132
_compare_not_equal604349710755132:
   push 0
_compare_end604349710755132:
   pop eax
   cmp eax, 0
   je _if_end_1241
_if_start_1241:
   push left1230[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1226[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1241[ebp], eax
   push right1230[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1226[ebp]
   push [esi[edx]]
   pop edx
   push left1230[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1226[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1241[ebp]
   pop edx
   push right1230[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1226[ebp]
   add esi, ecx
   mov [esi], edx
   push left1230[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1230[ebp], eax
   push right1230[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1230[ebp], eax
_if_end_1241:
   push left1230[ebp]
   pop ecx
   push right1230[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349711955127
   push 1
   jmp _compare_end604349711955127
_compare_not_equal604349711955127:
   push 0
_compare_end604349711955127:
   pop eax
   cmp eax, 0
   je _loop_end_1233
   jmp _loop_start_1233
_loop_end_1233:

   ; init stack for qs
   push right1230[ebp]
   push arg_first1226[ebp]
   push arg_s_arr1226[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1226[ebp]
   push left1230[ebp]
   push arg_s_arr1226[ebp]
   ; call qs
   call qs

_if_end_1230:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1242[ebp]
   pop ecx
   push arg_last1242[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349712425545
   push 1
   jmp _compare_end604349712425545
_compare_not_equal604349712425545:
   push 0
_compare_end604349712425545:
   pop eax
   cmp eax, 0
   je _if_end_1246
_if_start_1246:
   push arg_first1242[ebp]
   pop eax
   mov left1246[ebp], eax
   push arg_last1242[ebp]
   pop eax
   mov right1246[ebp], eax
   push left1246[ebp]
   push right1246[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1242[ebp]
   push [esi[edx]]
   pop eax
   mov middle1246[ebp], eax
_loop_start_1249:
_loop_aftereffects_1249:
_loop_start_1252:
_loop_aftereffects_1252:
   push left1246[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1242[ebp]
   push [esi[edx]]
   pop ecx
   push middle1246[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349713127751
   push 1
   jmp _compare_end604349713127751
_compare_not_equal604349713127751:
   push 0
_compare_end604349713127751:
   pop eax
   cmp eax, 0
   je _loop_end_1252
   push left1246[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1246[ebp], eax
   jmp _loop_start_1252
_loop_end_1252:
_loop_start_1255:
_loop_aftereffects_1255:
   push right1246[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1242[ebp]
   push [esi[edx]]
   pop ecx
   push middle1246[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349713501948
   push 1
   jmp _compare_end604349713501948
_compare_not_equal604349713501948:
   push 0
_compare_end604349713501948:
   pop eax
   cmp eax, 0
   je _loop_end_1255
   push right1246[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1246[ebp], eax
   jmp _loop_start_1255
_loop_end_1255:
   push left1246[ebp]
   pop ecx
   push right1246[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349713817556
   push 1
   jmp _compare_end604349713817556
_compare_not_equal604349713817556:
   push 0
_compare_end604349713817556:
   pop eax
   cmp eax, 0
   je _if_end_1257
_if_start_1257:
   push left1246[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1242[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1257[ebp], eax
   push right1246[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1242[ebp]
   push [esi[edx]]
   pop edx
   push left1246[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1242[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1257[ebp]
   pop edx
   push right1246[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1242[ebp]
   add esi, ecx
   mov [esi], edx
   push left1246[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1246[ebp], eax
   push right1246[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1246[ebp], eax
_if_end_1257:
   push left1246[ebp]
   pop ecx
   push right1246[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349715032091
   push 1
   jmp _compare_end604349715032091
_compare_not_equal604349715032091:
   push 0
_compare_end604349715032091:
   pop eax
   cmp eax, 0
   je _loop_end_1249
   jmp _loop_start_1249
_loop_end_1249:

   ; init stack for qs
   push right1246[ebp]
   push arg_first1242[ebp]
   push arg_s_arr1242[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1242[ebp]
   push left1246[ebp]
   push arg_s_arr1242[ebp]
   ; call qs
   call qs

_if_end_1246:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1258[ebp]
   pop ecx
   push arg_last1258[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349715268583
   push 1
   jmp _compare_end604349715268583
_compare_not_equal604349715268583:
   push 0
_compare_end604349715268583:
   pop eax
   cmp eax, 0
   je _if_end_1262
_if_start_1262:
   push arg_first1258[ebp]
   pop eax
   mov left1262[ebp], eax
   push arg_last1258[ebp]
   pop eax
   mov right1262[ebp], eax
   push left1262[ebp]
   push right1262[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1258[ebp]
   push [esi[edx]]
   pop eax
   mov middle1262[ebp], eax
_loop_start_1265:
_loop_aftereffects_1265:
_loop_start_1268:
_loop_aftereffects_1268:
   push left1262[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1258[ebp]
   push [esi[edx]]
   pop ecx
   push middle1262[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349715433229
   push 1
   jmp _compare_end604349715433229
_compare_not_equal604349715433229:
   push 0
_compare_end604349715433229:
   pop eax
   cmp eax, 0
   je _loop_end_1268
   push left1262[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1262[ebp], eax
   jmp _loop_start_1268
_loop_end_1268:
_loop_start_1271:
_loop_aftereffects_1271:
   push right1262[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1258[ebp]
   push [esi[edx]]
   pop ecx
   push middle1262[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349715588895
   push 1
   jmp _compare_end604349715588895
_compare_not_equal604349715588895:
   push 0
_compare_end604349715588895:
   pop eax
   cmp eax, 0
   je _loop_end_1271
   push right1262[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1262[ebp], eax
   jmp _loop_start_1271
_loop_end_1271:
   push left1262[ebp]
   pop ecx
   push right1262[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349715947268
   push 1
   jmp _compare_end604349715947268
_compare_not_equal604349715947268:
   push 0
_compare_end604349715947268:
   pop eax
   cmp eax, 0
   je _if_end_1273
_if_start_1273:
   push left1262[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1258[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1273[ebp], eax
   push right1262[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1258[ebp]
   push [esi[edx]]
   pop edx
   push left1262[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1258[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1273[ebp]
   pop edx
   push right1262[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1258[ebp]
   add esi, ecx
   mov [esi], edx
   push left1262[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1262[ebp], eax
   push right1262[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1262[ebp], eax
_if_end_1273:
   push left1262[ebp]
   pop ecx
   push right1262[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349717007420
   push 1
   jmp _compare_end604349717007420
_compare_not_equal604349717007420:
   push 0
_compare_end604349717007420:
   pop eax
   cmp eax, 0
   je _loop_end_1265
   jmp _loop_start_1265
_loop_end_1265:

   ; init stack for qs
   push right1262[ebp]
   push arg_first1258[ebp]
   push arg_s_arr1258[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1258[ebp]
   push left1262[ebp]
   push arg_s_arr1258[ebp]
   ; call qs
   call qs

_if_end_1262:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1274[ebp]
   pop ecx
   push arg_last1274[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349717263584
   push 1
   jmp _compare_end604349717263584
_compare_not_equal604349717263584:
   push 0
_compare_end604349717263584:
   pop eax
   cmp eax, 0
   je _if_end_1278
_if_start_1278:
   push arg_first1274[ebp]
   pop eax
   mov left1278[ebp], eax
   push arg_last1274[ebp]
   pop eax
   mov right1278[ebp], eax
   push left1278[ebp]
   push right1278[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1274[ebp]
   push [esi[edx]]
   pop eax
   mov middle1278[ebp], eax
_loop_start_1281:
_loop_aftereffects_1281:
_loop_start_1284:
_loop_aftereffects_1284:
   push left1278[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1274[ebp]
   push [esi[edx]]
   pop ecx
   push middle1278[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349717770781
   push 1
   jmp _compare_end604349717770781
_compare_not_equal604349717770781:
   push 0
_compare_end604349717770781:
   pop eax
   cmp eax, 0
   je _loop_end_1284
   push left1278[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1278[ebp], eax
   jmp _loop_start_1284
_loop_end_1284:
_loop_start_1287:
_loop_aftereffects_1287:
   push right1278[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1274[ebp]
   push [esi[edx]]
   pop ecx
   push middle1278[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349718159090
   push 1
   jmp _compare_end604349718159090
_compare_not_equal604349718159090:
   push 0
_compare_end604349718159090:
   pop eax
   cmp eax, 0
   je _loop_end_1287
   push right1278[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1278[ebp], eax
   jmp _loop_start_1287
_loop_end_1287:
   push left1278[ebp]
   pop ecx
   push right1278[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349718539701
   push 1
   jmp _compare_end604349718539701
_compare_not_equal604349718539701:
   push 0
_compare_end604349718539701:
   pop eax
   cmp eax, 0
   je _if_end_1289
_if_start_1289:
   push left1278[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1274[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1289[ebp], eax
   push right1278[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1274[ebp]
   push [esi[edx]]
   pop edx
   push left1278[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1274[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1289[ebp]
   pop edx
   push right1278[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1274[ebp]
   add esi, ecx
   mov [esi], edx
   push left1278[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1278[ebp], eax
   push right1278[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1278[ebp], eax
_if_end_1289:
   push left1278[ebp]
   pop ecx
   push right1278[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349719739268
   push 1
   jmp _compare_end604349719739268
_compare_not_equal604349719739268:
   push 0
_compare_end604349719739268:
   pop eax
   cmp eax, 0
   je _loop_end_1281
   jmp _loop_start_1281
_loop_end_1281:

   ; init stack for qs
   push right1278[ebp]
   push arg_first1274[ebp]
   push arg_s_arr1274[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1274[ebp]
   push left1278[ebp]
   push arg_s_arr1274[ebp]
   ; call qs
   call qs

_if_end_1278:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1290[ebp]
   pop ecx
   push arg_last1290[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349720259294
   push 1
   jmp _compare_end604349720259294
_compare_not_equal604349720259294:
   push 0
_compare_end604349720259294:
   pop eax
   cmp eax, 0
   je _if_end_1294
_if_start_1294:
   push arg_first1290[ebp]
   pop eax
   mov left1294[ebp], eax
   push arg_last1290[ebp]
   pop eax
   mov right1294[ebp], eax
   push left1294[ebp]
   push right1294[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1290[ebp]
   push [esi[edx]]
   pop eax
   mov middle1294[ebp], eax
_loop_start_1297:
_loop_aftereffects_1297:
_loop_start_1300:
_loop_aftereffects_1300:
   push left1294[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1290[ebp]
   push [esi[edx]]
   pop ecx
   push middle1294[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349720895214
   push 1
   jmp _compare_end604349720895214
_compare_not_equal604349720895214:
   push 0
_compare_end604349720895214:
   pop eax
   cmp eax, 0
   je _loop_end_1300
   push left1294[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1294[ebp], eax
   jmp _loop_start_1300
_loop_end_1300:
_loop_start_1303:
_loop_aftereffects_1303:
   push right1294[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1290[ebp]
   push [esi[edx]]
   pop ecx
   push middle1294[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349721194999
   push 1
   jmp _compare_end604349721194999
_compare_not_equal604349721194999:
   push 0
_compare_end604349721194999:
   pop eax
   cmp eax, 0
   je _loop_end_1303
   push right1294[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1294[ebp], eax
   jmp _loop_start_1303
_loop_end_1303:
   push left1294[ebp]
   pop ecx
   push right1294[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349721436623
   push 1
   jmp _compare_end604349721436623
_compare_not_equal604349721436623:
   push 0
_compare_end604349721436623:
   pop eax
   cmp eax, 0
   je _if_end_1305
_if_start_1305:
   push left1294[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1290[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1305[ebp], eax
   push right1294[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1290[ebp]
   push [esi[edx]]
   pop edx
   push left1294[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1290[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1305[ebp]
   pop edx
   push right1294[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1290[ebp]
   add esi, ecx
   mov [esi], edx
   push left1294[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1294[ebp], eax
   push right1294[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1294[ebp], eax
_if_end_1305:
   push left1294[ebp]
   pop ecx
   push right1294[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349722687081
   push 1
   jmp _compare_end604349722687081
_compare_not_equal604349722687081:
   push 0
_compare_end604349722687081:
   pop eax
   cmp eax, 0
   je _loop_end_1297
   jmp _loop_start_1297
_loop_end_1297:

   ; init stack for qs
   push right1294[ebp]
   push arg_first1290[ebp]
   push arg_s_arr1290[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1290[ebp]
   push left1294[ebp]
   push arg_s_arr1290[ebp]
   ; call qs
   call qs

_if_end_1294:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1306[ebp]
   pop ecx
   push arg_last1306[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349723191284
   push 1
   jmp _compare_end604349723191284
_compare_not_equal604349723191284:
   push 0
_compare_end604349723191284:
   pop eax
   cmp eax, 0
   je _if_end_1310
_if_start_1310:
   push arg_first1306[ebp]
   pop eax
   mov left1310[ebp], eax
   push arg_last1306[ebp]
   pop eax
   mov right1310[ebp], eax
   push left1310[ebp]
   push right1310[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1306[ebp]
   push [esi[edx]]
   pop eax
   mov middle1310[ebp], eax
_loop_start_1313:
_loop_aftereffects_1313:
_loop_start_1316:
_loop_aftereffects_1316:
   push left1310[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1306[ebp]
   push [esi[edx]]
   pop ecx
   push middle1310[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349723890924
   push 1
   jmp _compare_end604349723890924
_compare_not_equal604349723890924:
   push 0
_compare_end604349723890924:
   pop eax
   cmp eax, 0
   je _loop_end_1316
   push left1310[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1310[ebp], eax
   jmp _loop_start_1316
_loop_end_1316:
_loop_start_1319:
_loop_aftereffects_1319:
   push right1310[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1306[ebp]
   push [esi[edx]]
   pop ecx
   push middle1310[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349724285648
   push 1
   jmp _compare_end604349724285648
_compare_not_equal604349724285648:
   push 0
_compare_end604349724285648:
   pop eax
   cmp eax, 0
   je _loop_end_1319
   push right1310[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1310[ebp], eax
   jmp _loop_start_1319
_loop_end_1319:
   push left1310[ebp]
   pop ecx
   push right1310[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349724679089
   push 1
   jmp _compare_end604349724679089
_compare_not_equal604349724679089:
   push 0
_compare_end604349724679089:
   pop eax
   cmp eax, 0
   je _if_end_1321
_if_start_1321:
   push left1310[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1306[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1321[ebp], eax
   push right1310[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1306[ebp]
   push [esi[edx]]
   pop edx
   push left1310[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1306[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1321[ebp]
   pop edx
   push right1310[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1306[ebp]
   add esi, ecx
   mov [esi], edx
   push left1310[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1310[ebp], eax
   push right1310[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1310[ebp], eax
_if_end_1321:
   push left1310[ebp]
   pop ecx
   push right1310[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349725771742
   push 1
   jmp _compare_end604349725771742
_compare_not_equal604349725771742:
   push 0
_compare_end604349725771742:
   pop eax
   cmp eax, 0
   je _loop_end_1313
   jmp _loop_start_1313
_loop_end_1313:

   ; init stack for qs
   push right1310[ebp]
   push arg_first1306[ebp]
   push arg_s_arr1306[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1306[ebp]
   push left1310[ebp]
   push arg_s_arr1306[ebp]
   ; call qs
   call qs

_if_end_1310:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1322[ebp]
   pop ecx
   push arg_last1322[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349726284498
   push 1
   jmp _compare_end604349726284498
_compare_not_equal604349726284498:
   push 0
_compare_end604349726284498:
   pop eax
   cmp eax, 0
   je _if_end_1326
_if_start_1326:
   push arg_first1322[ebp]
   pop eax
   mov left1326[ebp], eax
   push arg_last1322[ebp]
   pop eax
   mov right1326[ebp], eax
   push left1326[ebp]
   push right1326[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1322[ebp]
   push [esi[edx]]
   pop eax
   mov middle1326[ebp], eax
_loop_start_1329:
_loop_aftereffects_1329:
_loop_start_1332:
_loop_aftereffects_1332:
   push left1326[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1322[ebp]
   push [esi[edx]]
   pop ecx
   push middle1326[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349727023483
   push 1
   jmp _compare_end604349727023483
_compare_not_equal604349727023483:
   push 0
_compare_end604349727023483:
   pop eax
   cmp eax, 0
   je _loop_end_1332
   push left1326[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1326[ebp], eax
   jmp _loop_start_1332
_loop_end_1332:
_loop_start_1335:
_loop_aftereffects_1335:
   push right1326[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1322[ebp]
   push [esi[edx]]
   pop ecx
   push middle1326[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349727426760
   push 1
   jmp _compare_end604349727426760
_compare_not_equal604349727426760:
   push 0
_compare_end604349727426760:
   pop eax
   cmp eax, 0
   je _loop_end_1335
   push right1326[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1326[ebp], eax
   jmp _loop_start_1335
_loop_end_1335:
   push left1326[ebp]
   pop ecx
   push right1326[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349727728255
   push 1
   jmp _compare_end604349727728255
_compare_not_equal604349727728255:
   push 0
_compare_end604349727728255:
   pop eax
   cmp eax, 0
   je _if_end_1337
_if_start_1337:
   push left1326[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1322[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1337[ebp], eax
   push right1326[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1322[ebp]
   push [esi[edx]]
   pop edx
   push left1326[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1322[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1337[ebp]
   pop edx
   push right1326[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1322[ebp]
   add esi, ecx
   mov [esi], edx
   push left1326[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1326[ebp], eax
   push right1326[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1326[ebp], eax
_if_end_1337:
   push left1326[ebp]
   pop ecx
   push right1326[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349728404802
   push 1
   jmp _compare_end604349728404802
_compare_not_equal604349728404802:
   push 0
_compare_end604349728404802:
   pop eax
   cmp eax, 0
   je _loop_end_1329
   jmp _loop_start_1329
_loop_end_1329:

   ; init stack for qs
   push right1326[ebp]
   push arg_first1322[ebp]
   push arg_s_arr1322[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1322[ebp]
   push left1326[ebp]
   push arg_s_arr1322[ebp]
   ; call qs
   call qs

_if_end_1326:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1338[ebp]
   pop ecx
   push arg_last1338[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349728476648
   push 1
   jmp _compare_end604349728476648
_compare_not_equal604349728476648:
   push 0
_compare_end604349728476648:
   pop eax
   cmp eax, 0
   je _if_end_1342
_if_start_1342:
   push arg_first1338[ebp]
   pop eax
   mov left1342[ebp], eax
   push arg_last1338[ebp]
   pop eax
   mov right1342[ebp], eax
   push left1342[ebp]
   push right1342[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1338[ebp]
   push [esi[edx]]
   pop eax
   mov middle1342[ebp], eax
_loop_start_1345:
_loop_aftereffects_1345:
_loop_start_1348:
_loop_aftereffects_1348:
   push left1342[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1338[ebp]
   push [esi[edx]]
   pop ecx
   push middle1342[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349728748635
   push 1
   jmp _compare_end604349728748635
_compare_not_equal604349728748635:
   push 0
_compare_end604349728748635:
   pop eax
   cmp eax, 0
   je _loop_end_1348
   push left1342[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1342[ebp], eax
   jmp _loop_start_1348
_loop_end_1348:
_loop_start_1351:
_loop_aftereffects_1351:
   push right1342[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1338[ebp]
   push [esi[edx]]
   pop ecx
   push middle1342[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349728940224
   push 1
   jmp _compare_end604349728940224
_compare_not_equal604349728940224:
   push 0
_compare_end604349728940224:
   pop eax
   cmp eax, 0
   je _loop_end_1351
   push right1342[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1342[ebp], eax
   jmp _loop_start_1351
_loop_end_1351:
   push left1342[ebp]
   pop ecx
   push right1342[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349729352481
   push 1
   jmp _compare_end604349729352481
_compare_not_equal604349729352481:
   push 0
_compare_end604349729352481:
   pop eax
   cmp eax, 0
   je _if_end_1353
_if_start_1353:
   push left1342[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1338[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1353[ebp], eax
   push right1342[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1338[ebp]
   push [esi[edx]]
   pop edx
   push left1342[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1338[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1353[ebp]
   pop edx
   push right1342[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1338[ebp]
   add esi, ecx
   mov [esi], edx
   push left1342[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1342[ebp], eax
   push right1342[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1342[ebp], eax
_if_end_1353:
   push left1342[ebp]
   pop ecx
   push right1342[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349729809215
   push 1
   jmp _compare_end604349729809215
_compare_not_equal604349729809215:
   push 0
_compare_end604349729809215:
   pop eax
   cmp eax, 0
   je _loop_end_1345
   jmp _loop_start_1345
_loop_end_1345:

   ; init stack for qs
   push right1342[ebp]
   push arg_first1338[ebp]
   push arg_s_arr1338[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1338[ebp]
   push left1342[ebp]
   push arg_s_arr1338[ebp]
   ; call qs
   call qs

_if_end_1342:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1354[ebp]
   pop ecx
   push arg_last1354[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349730332662
   push 1
   jmp _compare_end604349730332662
_compare_not_equal604349730332662:
   push 0
_compare_end604349730332662:
   pop eax
   cmp eax, 0
   je _if_end_1358
_if_start_1358:
   push arg_first1354[ebp]
   pop eax
   mov left1358[ebp], eax
   push arg_last1354[ebp]
   pop eax
   mov right1358[ebp], eax
   push left1358[ebp]
   push right1358[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1354[ebp]
   push [esi[edx]]
   pop eax
   mov middle1358[ebp], eax
_loop_start_1361:
_loop_aftereffects_1361:
_loop_start_1364:
_loop_aftereffects_1364:
   push left1358[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1354[ebp]
   push [esi[edx]]
   pop ecx
   push middle1358[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349731056251
   push 1
   jmp _compare_end604349731056251
_compare_not_equal604349731056251:
   push 0
_compare_end604349731056251:
   pop eax
   cmp eax, 0
   je _loop_end_1364
   push left1358[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1358[ebp], eax
   jmp _loop_start_1364
_loop_end_1364:
_loop_start_1367:
_loop_aftereffects_1367:
   push right1358[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1354[ebp]
   push [esi[edx]]
   pop ecx
   push middle1358[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349731424888
   push 1
   jmp _compare_end604349731424888
_compare_not_equal604349731424888:
   push 0
_compare_end604349731424888:
   pop eax
   cmp eax, 0
   je _loop_end_1367
   push right1358[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1358[ebp], eax
   jmp _loop_start_1367
_loop_end_1367:
   push left1358[ebp]
   pop ecx
   push right1358[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349731826027
   push 1
   jmp _compare_end604349731826027
_compare_not_equal604349731826027:
   push 0
_compare_end604349731826027:
   pop eax
   cmp eax, 0
   je _if_end_1369
_if_start_1369:
   push left1358[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1354[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1369[ebp], eax
   push right1358[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1354[ebp]
   push [esi[edx]]
   pop edx
   push left1358[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1354[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1369[ebp]
   pop edx
   push right1358[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1354[ebp]
   add esi, ecx
   mov [esi], edx
   push left1358[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1358[ebp], eax
   push right1358[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1358[ebp], eax
_if_end_1369:
   push left1358[ebp]
   pop ecx
   push right1358[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349733196227
   push 1
   jmp _compare_end604349733196227
_compare_not_equal604349733196227:
   push 0
_compare_end604349733196227:
   pop eax
   cmp eax, 0
   je _loop_end_1361
   jmp _loop_start_1361
_loop_end_1361:

   ; init stack for qs
   push right1358[ebp]
   push arg_first1354[ebp]
   push arg_s_arr1354[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1354[ebp]
   push left1358[ebp]
   push arg_s_arr1354[ebp]
   ; call qs
   call qs

_if_end_1358:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1370[ebp]
   pop ecx
   push arg_last1370[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349733566147
   push 1
   jmp _compare_end604349733566147
_compare_not_equal604349733566147:
   push 0
_compare_end604349733566147:
   pop eax
   cmp eax, 0
   je _if_end_1374
_if_start_1374:
   push arg_first1370[ebp]
   pop eax
   mov left1374[ebp], eax
   push arg_last1370[ebp]
   pop eax
   mov right1374[ebp], eax
   push left1374[ebp]
   push right1374[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1370[ebp]
   push [esi[edx]]
   pop eax
   mov middle1374[ebp], eax
_loop_start_1377:
_loop_aftereffects_1377:
_loop_start_1380:
_loop_aftereffects_1380:
   push left1374[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1370[ebp]
   push [esi[edx]]
   pop ecx
   push middle1374[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349734315395
   push 1
   jmp _compare_end604349734315395
_compare_not_equal604349734315395:
   push 0
_compare_end604349734315395:
   pop eax
   cmp eax, 0
   je _loop_end_1380
   push left1374[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1374[ebp], eax
   jmp _loop_start_1380
_loop_end_1380:
_loop_start_1383:
_loop_aftereffects_1383:
   push right1374[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1370[ebp]
   push [esi[edx]]
   pop ecx
   push middle1374[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349734395794
   push 1
   jmp _compare_end604349734395794
_compare_not_equal604349734395794:
   push 0
_compare_end604349734395794:
   pop eax
   cmp eax, 0
   je _loop_end_1383
   push right1374[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1374[ebp], eax
   jmp _loop_start_1383
_loop_end_1383:
   push left1374[ebp]
   pop ecx
   push right1374[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349734484746
   push 1
   jmp _compare_end604349734484746
_compare_not_equal604349734484746:
   push 0
_compare_end604349734484746:
   pop eax
   cmp eax, 0
   je _if_end_1385
_if_start_1385:
   push left1374[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1370[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1385[ebp], eax
   push right1374[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1370[ebp]
   push [esi[edx]]
   pop edx
   push left1374[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1370[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1385[ebp]
   pop edx
   push right1374[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1370[ebp]
   add esi, ecx
   mov [esi], edx
   push left1374[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1374[ebp], eax
   push right1374[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1374[ebp], eax
_if_end_1385:
   push left1374[ebp]
   pop ecx
   push right1374[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349734779827
   push 1
   jmp _compare_end604349734779827
_compare_not_equal604349734779827:
   push 0
_compare_end604349734779827:
   pop eax
   cmp eax, 0
   je _loop_end_1377
   jmp _loop_start_1377
_loop_end_1377:

   ; init stack for qs
   push right1374[ebp]
   push arg_first1370[ebp]
   push arg_s_arr1370[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1370[ebp]
   push left1374[ebp]
   push arg_s_arr1370[ebp]
   ; call qs
   call qs

_if_end_1374:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1386[ebp]
   pop ecx
   push arg_last1386[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349734909833
   push 1
   jmp _compare_end604349734909833
_compare_not_equal604349734909833:
   push 0
_compare_end604349734909833:
   pop eax
   cmp eax, 0
   je _if_end_1390
_if_start_1390:
   push arg_first1386[ebp]
   pop eax
   mov left1390[ebp], eax
   push arg_last1386[ebp]
   pop eax
   mov right1390[ebp], eax
   push left1390[ebp]
   push right1390[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1386[ebp]
   push [esi[edx]]
   pop eax
   mov middle1390[ebp], eax
_loop_start_1393:
_loop_aftereffects_1393:
_loop_start_1396:
_loop_aftereffects_1396:
   push left1390[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1386[ebp]
   push [esi[edx]]
   pop ecx
   push middle1390[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349735129219
   push 1
   jmp _compare_end604349735129219
_compare_not_equal604349735129219:
   push 0
_compare_end604349735129219:
   pop eax
   cmp eax, 0
   je _loop_end_1396
   push left1390[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1390[ebp], eax
   jmp _loop_start_1396
_loop_end_1396:
_loop_start_1399:
_loop_aftereffects_1399:
   push right1390[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1386[ebp]
   push [esi[edx]]
   pop ecx
   push middle1390[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349735398641
   push 1
   jmp _compare_end604349735398641
_compare_not_equal604349735398641:
   push 0
_compare_end604349735398641:
   pop eax
   cmp eax, 0
   je _loop_end_1399
   push right1390[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1390[ebp], eax
   jmp _loop_start_1399
_loop_end_1399:
   push left1390[ebp]
   pop ecx
   push right1390[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349735456801
   push 1
   jmp _compare_end604349735456801
_compare_not_equal604349735456801:
   push 0
_compare_end604349735456801:
   pop eax
   cmp eax, 0
   je _if_end_1401
_if_start_1401:
   push left1390[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1386[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1401[ebp], eax
   push right1390[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1386[ebp]
   push [esi[edx]]
   pop edx
   push left1390[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1386[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1401[ebp]
   pop edx
   push right1390[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1386[ebp]
   add esi, ecx
   mov [esi], edx
   push left1390[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1390[ebp], eax
   push right1390[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1390[ebp], eax
_if_end_1401:
   push left1390[ebp]
   pop ecx
   push right1390[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349736221445
   push 1
   jmp _compare_end604349736221445
_compare_not_equal604349736221445:
   push 0
_compare_end604349736221445:
   pop eax
   cmp eax, 0
   je _loop_end_1393
   jmp _loop_start_1393
_loop_end_1393:

   ; init stack for qs
   push right1390[ebp]
   push arg_first1386[ebp]
   push arg_s_arr1386[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1386[ebp]
   push left1390[ebp]
   push arg_s_arr1386[ebp]
   ; call qs
   call qs

_if_end_1390:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1402[ebp]
   pop ecx
   push arg_last1402[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349736295429
   push 1
   jmp _compare_end604349736295429
_compare_not_equal604349736295429:
   push 0
_compare_end604349736295429:
   pop eax
   cmp eax, 0
   je _if_end_1406
_if_start_1406:
   push arg_first1402[ebp]
   pop eax
   mov left1406[ebp], eax
   push arg_last1402[ebp]
   pop eax
   mov right1406[ebp], eax
   push left1406[ebp]
   push right1406[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1402[ebp]
   push [esi[edx]]
   pop eax
   mov middle1406[ebp], eax
_loop_start_1409:
_loop_aftereffects_1409:
_loop_start_1412:
_loop_aftereffects_1412:
   push left1406[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1402[ebp]
   push [esi[edx]]
   pop ecx
   push middle1406[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349736394217
   push 1
   jmp _compare_end604349736394217
_compare_not_equal604349736394217:
   push 0
_compare_end604349736394217:
   pop eax
   cmp eax, 0
   je _loop_end_1412
   push left1406[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1406[ebp], eax
   jmp _loop_start_1412
_loop_end_1412:
_loop_start_1415:
_loop_aftereffects_1415:
   push right1406[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1402[ebp]
   push [esi[edx]]
   pop ecx
   push middle1406[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349736447246
   push 1
   jmp _compare_end604349736447246
_compare_not_equal604349736447246:
   push 0
_compare_end604349736447246:
   pop eax
   cmp eax, 0
   je _loop_end_1415
   push right1406[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1406[ebp], eax
   jmp _loop_start_1415
_loop_end_1415:
   push left1406[ebp]
   pop ecx
   push right1406[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349736504124
   push 1
   jmp _compare_end604349736504124
_compare_not_equal604349736504124:
   push 0
_compare_end604349736504124:
   pop eax
   cmp eax, 0
   je _if_end_1417
_if_start_1417:
   push left1406[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1402[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1417[ebp], eax
   push right1406[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1402[ebp]
   push [esi[edx]]
   pop edx
   push left1406[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1402[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1417[ebp]
   pop edx
   push right1406[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1402[ebp]
   add esi, ecx
   mov [esi], edx
   push left1406[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1406[ebp], eax
   push right1406[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1406[ebp], eax
_if_end_1417:
   push left1406[ebp]
   pop ecx
   push right1406[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349736676896
   push 1
   jmp _compare_end604349736676896
_compare_not_equal604349736676896:
   push 0
_compare_end604349736676896:
   pop eax
   cmp eax, 0
   je _loop_end_1409
   jmp _loop_start_1409
_loop_end_1409:

   ; init stack for qs
   push right1406[ebp]
   push arg_first1402[ebp]
   push arg_s_arr1402[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1402[ebp]
   push left1406[ebp]
   push arg_s_arr1402[ebp]
   ; call qs
   call qs

_if_end_1406:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1418[ebp]
   pop ecx
   push arg_last1418[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349736748741
   push 1
   jmp _compare_end604349736748741
_compare_not_equal604349736748741:
   push 0
_compare_end604349736748741:
   pop eax
   cmp eax, 0
   je _if_end_1422
_if_start_1422:
   push arg_first1418[ebp]
   pop eax
   mov left1422[ebp], eax
   push arg_last1418[ebp]
   pop eax
   mov right1422[ebp], eax
   push left1422[ebp]
   push right1422[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1418[ebp]
   push [esi[edx]]
   pop eax
   mov middle1422[ebp], eax
_loop_start_1425:
_loop_aftereffects_1425:
_loop_start_1428:
_loop_aftereffects_1428:
   push left1422[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1418[ebp]
   push [esi[edx]]
   pop ecx
   push middle1422[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349736847102
   push 1
   jmp _compare_end604349736847102
_compare_not_equal604349736847102:
   push 0
_compare_end604349736847102:
   pop eax
   cmp eax, 0
   je _loop_end_1428
   push left1422[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1422[ebp], eax
   jmp _loop_start_1428
_loop_end_1428:
_loop_start_1431:
_loop_aftereffects_1431:
   push right1422[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1418[ebp]
   push [esi[edx]]
   pop ecx
   push middle1422[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349736900131
   push 1
   jmp _compare_end604349736900131
_compare_not_equal604349736900131:
   push 0
_compare_end604349736900131:
   pop eax
   cmp eax, 0
   je _loop_end_1431
   push right1422[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1422[ebp], eax
   jmp _loop_start_1431
_loop_end_1431:
   push left1422[ebp]
   pop ecx
   push right1422[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349736952732
   push 1
   jmp _compare_end604349736952732
_compare_not_equal604349736952732:
   push 0
_compare_end604349736952732:
   pop eax
   cmp eax, 0
   je _if_end_1433
_if_start_1433:
   push left1422[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1418[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1433[ebp], eax
   push right1422[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1418[ebp]
   push [esi[edx]]
   pop edx
   push left1422[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1418[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1433[ebp]
   pop edx
   push right1422[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1418[ebp]
   add esi, ecx
   mov [esi], edx
   push left1422[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1422[ebp], eax
   push right1422[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1422[ebp], eax
_if_end_1433:
   push left1422[ebp]
   pop ecx
   push right1422[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349737125504
   push 1
   jmp _compare_end604349737125504
_compare_not_equal604349737125504:
   push 0
_compare_end604349737125504:
   pop eax
   cmp eax, 0
   je _loop_end_1425
   jmp _loop_start_1425
_loop_end_1425:

   ; init stack for qs
   push right1422[ebp]
   push arg_first1418[ebp]
   push arg_s_arr1418[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1418[ebp]
   push left1422[ebp]
   push arg_s_arr1418[ebp]
   ; call qs
   call qs

_if_end_1422:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1434[ebp]
   pop ecx
   push arg_last1434[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349737242253
   push 1
   jmp _compare_end604349737242253
_compare_not_equal604349737242253:
   push 0
_compare_end604349737242253:
   pop eax
   cmp eax, 0
   je _if_end_1438
_if_start_1438:
   push arg_first1434[ebp]
   pop eax
   mov left1438[ebp], eax
   push arg_last1434[ebp]
   pop eax
   mov right1438[ebp], eax
   push left1438[ebp]
   push right1438[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1434[ebp]
   push [esi[edx]]
   pop eax
   mov middle1438[ebp], eax
_loop_start_1441:
_loop_aftereffects_1441:
_loop_start_1444:
_loop_aftereffects_1444:
   push left1438[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1434[ebp]
   push [esi[edx]]
   pop ecx
   push middle1438[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349737352160
   push 1
   jmp _compare_end604349737352160
_compare_not_equal604349737352160:
   push 0
_compare_end604349737352160:
   pop eax
   cmp eax, 0
   je _loop_end_1444
   push left1438[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1438[ebp], eax
   jmp _loop_start_1444
_loop_end_1444:
_loop_start_1447:
_loop_aftereffects_1447:
   push right1438[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1434[ebp]
   push [esi[edx]]
   pop ecx
   push middle1438[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349737409893
   push 1
   jmp _compare_end604349737409893
_compare_not_equal604349737409893:
   push 0
_compare_end604349737409893:
   pop eax
   cmp eax, 0
   je _loop_end_1447
   push right1438[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1438[ebp], eax
   jmp _loop_start_1447
_loop_end_1447:
   push left1438[ebp]
   pop ecx
   push right1438[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349737464205
   push 1
   jmp _compare_end604349737464205
_compare_not_equal604349737464205:
   push 0
_compare_end604349737464205:
   pop eax
   cmp eax, 0
   je _if_end_1449
_if_start_1449:
   push left1438[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1434[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1449[ebp], eax
   push right1438[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1434[ebp]
   push [esi[edx]]
   pop edx
   push left1438[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1434[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1449[ebp]
   pop edx
   push right1438[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1434[ebp]
   add esi, ecx
   mov [esi], edx
   push left1438[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1438[ebp], eax
   push right1438[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1438[ebp], eax
_if_end_1449:
   push left1438[ebp]
   pop ecx
   push right1438[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349737647668
   push 1
   jmp _compare_end604349737647668
_compare_not_equal604349737647668:
   push 0
_compare_end604349737647668:
   pop eax
   cmp eax, 0
   je _loop_end_1441
   jmp _loop_start_1441
_loop_end_1441:

   ; init stack for qs
   push right1438[ebp]
   push arg_first1434[ebp]
   push arg_s_arr1434[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1434[ebp]
   push left1438[ebp]
   push arg_s_arr1434[ebp]
   ; call qs
   call qs

_if_end_1438:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1450[ebp]
   pop ecx
   push arg_last1450[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349737762279
   push 1
   jmp _compare_end604349737762279
_compare_not_equal604349737762279:
   push 0
_compare_end604349737762279:
   pop eax
   cmp eax, 0
   je _if_end_1454
_if_start_1454:
   push arg_first1450[ebp]
   pop eax
   mov left1454[ebp], eax
   push arg_last1450[ebp]
   pop eax
   mov right1454[ebp], eax
   push left1454[ebp]
   push right1454[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1450[ebp]
   push [esi[edx]]
   pop eax
   mov middle1454[ebp], eax
_loop_start_1457:
_loop_aftereffects_1457:
_loop_start_1460:
_loop_aftereffects_1460:
   push left1454[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1450[ebp]
   push [esi[edx]]
   pop ecx
   push middle1454[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349737892286
   push 1
   jmp _compare_end604349737892286
_compare_not_equal604349737892286:
   push 0
_compare_end604349737892286:
   pop eax
   cmp eax, 0
   je _loop_end_1460
   push left1454[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1454[ebp], eax
   jmp _loop_start_1460
_loop_end_1460:
_loop_start_1463:
_loop_aftereffects_1463:
   push right1454[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1450[ebp]
   push [esi[edx]]
   pop ecx
   push middle1454[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349738148022
   push 1
   jmp _compare_end604349738148022
_compare_not_equal604349738148022:
   push 0
_compare_end604349738148022:
   pop eax
   cmp eax, 0
   je _loop_end_1463
   push right1454[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1454[ebp], eax
   jmp _loop_start_1463
_loop_end_1463:
   push left1454[ebp]
   pop ecx
   push right1454[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349738265627
   push 1
   jmp _compare_end604349738265627
_compare_not_equal604349738265627:
   push 0
_compare_end604349738265627:
   pop eax
   cmp eax, 0
   je _if_end_1465
_if_start_1465:
   push left1454[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1450[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1465[ebp], eax
   push right1454[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1450[ebp]
   push [esi[edx]]
   pop edx
   push left1454[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1450[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1465[ebp]
   pop edx
   push right1454[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1450[ebp]
   add esi, ecx
   mov [esi], edx
   push left1454[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1454[ebp], eax
   push right1454[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1454[ebp], eax
_if_end_1465:
   push left1454[ebp]
   pop ecx
   push right1454[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349738759566
   push 1
   jmp _compare_end604349738759566
_compare_not_equal604349738759566:
   push 0
_compare_end604349738759566:
   pop eax
   cmp eax, 0
   je _loop_end_1457
   jmp _loop_start_1457
_loop_end_1457:

   ; init stack for qs
   push right1454[ebp]
   push arg_first1450[ebp]
   push arg_s_arr1450[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1450[ebp]
   push left1454[ebp]
   push arg_s_arr1450[ebp]
   ; call qs
   call qs

_if_end_1454:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1466[ebp]
   pop ecx
   push arg_last1466[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349738909672
   push 1
   jmp _compare_end604349738909672
_compare_not_equal604349738909672:
   push 0
_compare_end604349738909672:
   pop eax
   cmp eax, 0
   je _if_end_1470
_if_start_1470:
   push arg_first1466[ebp]
   pop eax
   mov left1470[ebp], eax
   push arg_last1466[ebp]
   pop eax
   mov right1470[ebp], eax
   push left1470[ebp]
   push right1470[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1466[ebp]
   push [esi[edx]]
   pop eax
   mov middle1470[ebp], eax
_loop_start_1473:
_loop_aftereffects_1473:
_loop_start_1476:
_loop_aftereffects_1476:
   push left1470[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1466[ebp]
   push [esi[edx]]
   pop ecx
   push middle1470[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349739103827
   push 1
   jmp _compare_end604349739103827
_compare_not_equal604349739103827:
   push 0
_compare_end604349739103827:
   pop eax
   cmp eax, 0
   je _loop_end_1476
   push left1470[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1470[ebp], eax
   jmp _loop_start_1476
_loop_end_1476:
_loop_start_1479:
_loop_aftereffects_1479:
   push right1470[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1466[ebp]
   push [esi[edx]]
   pop ecx
   push middle1470[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349739213306
   push 1
   jmp _compare_end604349739213306
_compare_not_equal604349739213306:
   push 0
_compare_end604349739213306:
   pop eax
   cmp eax, 0
   je _loop_end_1479
   push right1470[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1470[ebp], eax
   jmp _loop_start_1479
_loop_end_1479:
   push left1470[ebp]
   pop ecx
   push right1470[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349739317226
   push 1
   jmp _compare_end604349739317226
_compare_not_equal604349739317226:
   push 0
_compare_end604349739317226:
   pop eax
   cmp eax, 0
   je _if_end_1481
_if_start_1481:
   push left1470[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1466[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1481[ebp], eax
   push right1470[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1466[ebp]
   push [esi[edx]]
   pop edx
   push left1470[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1466[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1481[ebp]
   pop edx
   push right1470[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1466[ebp]
   add esi, ecx
   mov [esi], edx
   push left1470[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1470[ebp], eax
   push right1470[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1470[ebp], eax
_if_end_1481:
   push left1470[ebp]
   pop ecx
   push right1470[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349739686718
   push 1
   jmp _compare_end604349739686718
_compare_not_equal604349739686718:
   push 0
_compare_end604349739686718:
   pop eax
   cmp eax, 0
   je _loop_end_1473
   jmp _loop_start_1473
_loop_end_1473:

   ; init stack for qs
   push right1470[ebp]
   push arg_first1466[ebp]
   push arg_s_arr1466[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1466[ebp]
   push left1470[ebp]
   push arg_s_arr1466[ebp]
   ; call qs
   call qs

_if_end_1470:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1482[ebp]
   pop ecx
   push arg_last1482[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349739831692
   push 1
   jmp _compare_end604349739831692
_compare_not_equal604349739831692:
   push 0
_compare_end604349739831692:
   pop eax
   cmp eax, 0
   je _if_end_1486
_if_start_1486:
   push arg_first1482[ebp]
   pop eax
   mov left1486[ebp], eax
   push arg_last1482[ebp]
   pop eax
   mov right1486[ebp], eax
   push left1486[ebp]
   push right1486[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1482[ebp]
   push [esi[edx]]
   pop eax
   mov middle1486[ebp], eax
_loop_start_1489:
_loop_aftereffects_1489:
_loop_start_1492:
_loop_aftereffects_1492:
   push left1486[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1482[ebp]
   push [esi[edx]]
   pop ecx
   push middle1486[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349740021570
   push 1
   jmp _compare_end604349740021570
_compare_not_equal604349740021570:
   push 0
_compare_end604349740021570:
   pop eax
   cmp eax, 0
   je _loop_end_1492
   push left1486[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1486[ebp], eax
   jmp _loop_start_1492
_loop_end_1492:
_loop_start_1495:
_loop_aftereffects_1495:
   push right1486[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1482[ebp]
   push [esi[edx]]
   pop ecx
   push middle1486[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349740123779
   push 1
   jmp _compare_end604349740123779
_compare_not_equal604349740123779:
   push 0
_compare_end604349740123779:
   pop eax
   cmp eax, 0
   je _loop_end_1495
   push right1486[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1486[ebp], eax
   jmp _loop_start_1495
_loop_end_1495:
   push left1486[ebp]
   pop ecx
   push right1486[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349740229837
   push 1
   jmp _compare_end604349740229837
_compare_not_equal604349740229837:
   push 0
_compare_end604349740229837:
   pop eax
   cmp eax, 0
   je _if_end_1497
_if_start_1497:
   push left1486[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1482[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1497[ebp], eax
   push right1486[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1482[ebp]
   push [esi[edx]]
   pop edx
   push left1486[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1482[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1497[ebp]
   pop edx
   push right1486[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1482[ebp]
   add esi, ecx
   mov [esi], edx
   push left1486[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1486[ebp], eax
   push right1486[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1486[ebp], eax
_if_end_1497:
   push left1486[ebp]
   pop ecx
   push right1486[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349740549722
   push 1
   jmp _compare_end604349740549722
_compare_not_equal604349740549722:
   push 0
_compare_end604349740549722:
   pop eax
   cmp eax, 0
   je _loop_end_1489
   jmp _loop_start_1489
_loop_end_1489:

   ; init stack for qs
   push right1486[ebp]
   push arg_first1482[ebp]
   push arg_s_arr1482[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1482[ebp]
   push left1486[ebp]
   push arg_s_arr1482[ebp]
   ; call qs
   call qs

_if_end_1486:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1498[ebp]
   pop ecx
   push arg_last1498[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349740687426
   push 1
   jmp _compare_end604349740687426
_compare_not_equal604349740687426:
   push 0
_compare_end604349740687426:
   pop eax
   cmp eax, 0
   je _if_end_1502
_if_start_1502:
   push arg_first1498[ebp]
   pop eax
   mov left1502[ebp], eax
   push arg_last1498[ebp]
   pop eax
   mov right1502[ebp], eax
   push left1502[ebp]
   push right1502[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1498[ebp]
   push [esi[edx]]
   pop eax
   mov middle1502[ebp], eax
_loop_start_1505:
_loop_aftereffects_1505:
_loop_start_1508:
_loop_aftereffects_1508:
   push left1502[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1498[ebp]
   push [esi[edx]]
   pop ecx
   push middle1502[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349740881581
   push 1
   jmp _compare_end604349740881581
_compare_not_equal604349740881581:
   push 0
_compare_end604349740881581:
   pop eax
   cmp eax, 0
   je _loop_end_1508
   push left1502[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1502[ebp], eax
   jmp _loop_start_1508
_loop_end_1508:
_loop_start_1511:
_loop_aftereffects_1511:
   push right1502[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1498[ebp]
   push [esi[edx]]
   pop ecx
   push middle1502[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349740985073
   push 1
   jmp _compare_end604349740985073
_compare_not_equal604349740985073:
   push 0
_compare_end604349740985073:
   pop eax
   cmp eax, 0
   je _loop_end_1511
   push right1502[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1502[ebp], eax
   jmp _loop_start_1511
_loop_end_1511:
   push left1502[ebp]
   pop ecx
   push right1502[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349741088137
   push 1
   jmp _compare_end604349741088137
_compare_not_equal604349741088137:
   push 0
_compare_end604349741088137:
   pop eax
   cmp eax, 0
   je _if_end_1513
_if_start_1513:
   push left1502[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1498[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1513[ebp], eax
   push right1502[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1498[ebp]
   push [esi[edx]]
   pop edx
   push left1502[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1498[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1513[ebp]
   pop edx
   push right1502[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1498[ebp]
   add esi, ecx
   mov [esi], edx
   push left1502[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1502[ebp], eax
   push right1502[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1502[ebp], eax
_if_end_1513:
   push left1502[ebp]
   pop ecx
   push right1502[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349741404173
   push 1
   jmp _compare_end604349741404173
_compare_not_equal604349741404173:
   push 0
_compare_end604349741404173:
   pop eax
   cmp eax, 0
   je _loop_end_1505
   jmp _loop_start_1505
_loop_end_1505:

   ; init stack for qs
   push right1502[ebp]
   push arg_first1498[ebp]
   push arg_s_arr1498[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1498[ebp]
   push left1502[ebp]
   push arg_s_arr1498[ebp]
   ; call qs
   call qs

_if_end_1502:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1514[ebp]
   pop ecx
   push arg_last1514[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349741482006
   push 1
   jmp _compare_end604349741482006
_compare_not_equal604349741482006:
   push 0
_compare_end604349741482006:
   pop eax
   cmp eax, 0
   je _if_end_1518
_if_start_1518:
   push arg_first1514[ebp]
   pop eax
   mov left1518[ebp], eax
   push arg_last1514[ebp]
   pop eax
   mov right1518[ebp], eax
   push left1518[ebp]
   push right1518[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1514[ebp]
   push [esi[edx]]
   pop eax
   mov middle1518[ebp], eax
_loop_start_1521:
_loop_aftereffects_1521:
_loop_start_1524:
_loop_aftereffects_1524:
   push left1518[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1514[ebp]
   push [esi[edx]]
   pop ecx
   push middle1518[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349741591057
   push 1
   jmp _compare_end604349741591057
_compare_not_equal604349741591057:
   push 0
_compare_end604349741591057:
   pop eax
   cmp eax, 0
   je _loop_end_1524
   push left1518[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1518[ebp], eax
   jmp _loop_start_1524
_loop_end_1524:
_loop_start_1527:
_loop_aftereffects_1527:
   push right1518[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1514[ebp]
   push [esi[edx]]
   pop ecx
   push middle1518[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349741790343
   push 1
   jmp _compare_end604349741790343
_compare_not_equal604349741790343:
   push 0
_compare_end604349741790343:
   pop eax
   cmp eax, 0
   je _loop_end_1527
   push right1518[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1518[ebp], eax
   jmp _loop_start_1527
_loop_end_1527:
   push left1518[ebp]
   pop ecx
   push right1518[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349742247505
   push 1
   jmp _compare_end604349742247505
_compare_not_equal604349742247505:
   push 0
_compare_end604349742247505:
   pop eax
   cmp eax, 0
   je _if_end_1529
_if_start_1529:
   push left1518[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1514[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1529[ebp], eax
   push right1518[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1514[ebp]
   push [esi[edx]]
   pop edx
   push left1518[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1514[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1529[ebp]
   pop edx
   push right1518[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1514[ebp]
   add esi, ecx
   mov [esi], edx
   push left1518[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1518[ebp], eax
   push right1518[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1518[ebp], eax
_if_end_1529:
   push left1518[ebp]
   pop ecx
   push right1518[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349743770805
   push 1
   jmp _compare_end604349743770805
_compare_not_equal604349743770805:
   push 0
_compare_end604349743770805:
   pop eax
   cmp eax, 0
   je _loop_end_1521
   jmp _loop_start_1521
_loop_end_1521:

   ; init stack for qs
   push right1518[ebp]
   push arg_first1514[ebp]
   push arg_s_arr1514[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1514[ebp]
   push left1518[ebp]
   push arg_s_arr1514[ebp]
   ; call qs
   call qs

_if_end_1518:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1530[ebp]
   pop ecx
   push arg_last1530[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349744406725
   push 1
   jmp _compare_end604349744406725
_compare_not_equal604349744406725:
   push 0
_compare_end604349744406725:
   pop eax
   cmp eax, 0
   je _if_end_1534
_if_start_1534:
   push arg_first1530[ebp]
   pop eax
   mov left1534[ebp], eax
   push arg_last1530[ebp]
   pop eax
   mov right1534[ebp], eax
   push left1534[ebp]
   push right1534[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1530[ebp]
   push [esi[edx]]
   pop eax
   mov middle1534[ebp], eax
_loop_start_1537:
_loop_aftereffects_1537:
_loop_start_1540:
_loop_aftereffects_1540:
   push left1534[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1530[ebp]
   push [esi[edx]]
   pop ecx
   push middle1534[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349745288973
   push 1
   jmp _compare_end604349745288973
_compare_not_equal604349745288973:
   push 0
_compare_end604349745288973:
   pop eax
   cmp eax, 0
   je _loop_end_1540
   push left1534[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1534[ebp], eax
   jmp _loop_start_1540
_loop_end_1540:
_loop_start_1543:
_loop_aftereffects_1543:
   push right1534[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1530[ebp]
   push [esi[edx]]
   pop ecx
   push middle1534[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349745685835
   push 1
   jmp _compare_end604349745685835
_compare_not_equal604349745685835:
   push 0
_compare_end604349745685835:
   pop eax
   cmp eax, 0
   je _loop_end_1543
   push right1534[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1534[ebp], eax
   jmp _loop_start_1543
_loop_end_1543:
   push left1534[ebp]
   pop ecx
   push right1534[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349746131877
   push 1
   jmp _compare_end604349746131877
_compare_not_equal604349746131877:
   push 0
_compare_end604349746131877:
   pop eax
   cmp eax, 0
   je _if_end_1545
_if_start_1545:
   push left1534[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1530[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1545[ebp], eax
   push right1534[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1530[ebp]
   push [esi[edx]]
   pop edx
   push left1534[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1530[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1545[ebp]
   pop edx
   push right1534[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1530[ebp]
   add esi, ecx
   mov [esi], edx
   push left1534[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1534[ebp], eax
   push right1534[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1534[ebp], eax
_if_end_1545:
   push left1534[ebp]
   pop ecx
   push right1534[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349747413981
   push 1
   jmp _compare_end604349747413981
_compare_not_equal604349747413981:
   push 0
_compare_end604349747413981:
   pop eax
   cmp eax, 0
   je _loop_end_1537
   jmp _loop_start_1537
_loop_end_1537:

   ; init stack for qs
   push right1534[ebp]
   push arg_first1530[ebp]
   push arg_s_arr1530[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1530[ebp]
   push left1534[ebp]
   push arg_s_arr1530[ebp]
   ; call qs
   call qs

_if_end_1534:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1546[ebp]
   pop ecx
   push arg_last1546[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349747775776
   push 1
   jmp _compare_end604349747775776
_compare_not_equal604349747775776:
   push 0
_compare_end604349747775776:
   pop eax
   cmp eax, 0
   je _if_end_1550
_if_start_1550:
   push arg_first1546[ebp]
   pop eax
   mov left1550[ebp], eax
   push arg_last1546[ebp]
   pop eax
   mov right1550[ebp], eax
   push left1550[ebp]
   push right1550[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1546[ebp]
   push [esi[edx]]
   pop eax
   mov middle1550[ebp], eax
_loop_start_1553:
_loop_aftereffects_1553:
_loop_start_1556:
_loop_aftereffects_1556:
   push left1550[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1546[ebp]
   push [esi[edx]]
   pop ecx
   push middle1550[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349748543413
   push 1
   jmp _compare_end604349748543413
_compare_not_equal604349748543413:
   push 0
_compare_end604349748543413:
   pop eax
   cmp eax, 0
   je _loop_end_1556
   push left1550[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1550[ebp], eax
   jmp _loop_start_1556
_loop_end_1556:
_loop_start_1559:
_loop_aftereffects_1559:
   push right1550[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1546[ebp]
   push [esi[edx]]
   pop ecx
   push middle1550[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349749027516
   push 1
   jmp _compare_end604349749027516
_compare_not_equal604349749027516:
   push 0
_compare_end604349749027516:
   pop eax
   cmp eax, 0
   je _loop_end_1559
   push right1550[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1550[ebp], eax
   jmp _loop_start_1559
_loop_end_1559:
   push left1550[ebp]
   pop ecx
   push right1550[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349749386317
   push 1
   jmp _compare_end604349749386317
_compare_not_equal604349749386317:
   push 0
_compare_end604349749386317:
   pop eax
   cmp eax, 0
   je _if_end_1561
_if_start_1561:
   push left1550[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1546[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1561[ebp], eax
   push right1550[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1546[ebp]
   push [esi[edx]]
   pop edx
   push left1550[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1546[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1561[ebp]
   pop edx
   push right1550[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1546[ebp]
   add esi, ecx
   mov [esi], edx
   push left1550[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1550[ebp], eax
   push right1550[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1550[ebp], eax
_if_end_1561:
   push left1550[ebp]
   pop ecx
   push right1550[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349749571919
   push 1
   jmp _compare_end604349749571919
_compare_not_equal604349749571919:
   push 0
_compare_end604349749571919:
   pop eax
   cmp eax, 0
   je _loop_end_1553
   jmp _loop_start_1553
_loop_end_1553:

   ; init stack for qs
   push right1550[ebp]
   push arg_first1546[ebp]
   push arg_s_arr1546[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1546[ebp]
   push left1550[ebp]
   push arg_s_arr1546[ebp]
   ; call qs
   call qs

_if_end_1550:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1562[ebp]
   pop ecx
   push arg_last1562[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349749654883
   push 1
   jmp _compare_end604349749654883
_compare_not_equal604349749654883:
   push 0
_compare_end604349749654883:
   pop eax
   cmp eax, 0
   je _if_end_1566
_if_start_1566:
   push arg_first1562[ebp]
   pop eax
   mov left1566[ebp], eax
   push arg_last1562[ebp]
   pop eax
   mov right1566[ebp], eax
   push left1566[ebp]
   push right1566[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1562[ebp]
   push [esi[edx]]
   pop eax
   mov middle1566[ebp], eax
_loop_start_1569:
_loop_aftereffects_1569:
_loop_start_1572:
_loop_aftereffects_1572:
   push left1566[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1562[ebp]
   push [esi[edx]]
   pop ecx
   push middle1566[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349749763507
   push 1
   jmp _compare_end604349749763507
_compare_not_equal604349749763507:
   push 0
_compare_end604349749763507:
   pop eax
   cmp eax, 0
   je _loop_end_1572
   push left1566[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1566[ebp], eax
   jmp _loop_start_1572
_loop_end_1572:
_loop_start_1575:
_loop_aftereffects_1575:
   push right1566[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1562[ebp]
   push [esi[edx]]
   pop ecx
   push middle1566[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349749822096
   push 1
   jmp _compare_end604349749822096
_compare_not_equal604349749822096:
   push 0
_compare_end604349749822096:
   pop eax
   cmp eax, 0
   je _loop_end_1575
   push right1566[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1566[ebp], eax
   jmp _loop_start_1575
_loop_end_1575:
   push left1566[ebp]
   pop ecx
   push right1566[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349749884533
   push 1
   jmp _compare_end604349749884533
_compare_not_equal604349749884533:
   push 0
_compare_end604349749884533:
   pop eax
   cmp eax, 0
   je _if_end_1577
_if_start_1577:
   push left1566[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1562[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1577[ebp], eax
   push right1566[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1562[ebp]
   push [esi[edx]]
   pop edx
   push left1566[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1562[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1577[ebp]
   pop edx
   push right1566[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1562[ebp]
   add esi, ecx
   mov [esi], edx
   push left1566[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1566[ebp], eax
   push right1566[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1566[ebp], eax
_if_end_1577:
   push left1566[ebp]
   pop ecx
   push right1566[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349750069279
   push 1
   jmp _compare_end604349750069279
_compare_not_equal604349750069279:
   push 0
_compare_end604349750069279:
   pop eax
   cmp eax, 0
   je _loop_end_1569
   jmp _loop_start_1569
_loop_end_1569:

   ; init stack for qs
   push right1566[ebp]
   push arg_first1562[ebp]
   push arg_s_arr1562[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1562[ebp]
   push left1566[ebp]
   push arg_s_arr1562[ebp]
   ; call qs
   call qs

_if_end_1566:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1578[ebp]
   pop ecx
   push arg_last1578[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349750434495
   push 1
   jmp _compare_end604349750434495
_compare_not_equal604349750434495:
   push 0
_compare_end604349750434495:
   pop eax
   cmp eax, 0
   je _if_end_1582
_if_start_1582:
   push arg_first1578[ebp]
   pop eax
   mov left1582[ebp], eax
   push arg_last1578[ebp]
   pop eax
   mov right1582[ebp], eax
   push left1582[ebp]
   push right1582[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1578[ebp]
   push [esi[edx]]
   pop eax
   mov middle1582[ebp], eax
_loop_start_1585:
_loop_aftereffects_1585:
_loop_start_1588:
_loop_aftereffects_1588:
   push left1582[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1578[ebp]
   push [esi[edx]]
   pop ecx
   push middle1582[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349751239766
   push 1
   jmp _compare_end604349751239766
_compare_not_equal604349751239766:
   push 0
_compare_end604349751239766:
   pop eax
   cmp eax, 0
   je _loop_end_1588
   push left1582[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1582[ebp], eax
   jmp _loop_start_1588
_loop_end_1588:
_loop_start_1591:
_loop_aftereffects_1591:
   push right1582[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1578[ebp]
   push [esi[edx]]
   pop ecx
   push middle1582[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349751719593
   push 1
   jmp _compare_end604349751719593
_compare_not_equal604349751719593:
   push 0
_compare_end604349751719593:
   pop eax
   cmp eax, 0
   je _loop_end_1591
   push right1582[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1582[ebp], eax
   jmp _loop_start_1591
_loop_end_1591:
   push left1582[ebp]
   pop ecx
   push right1582[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349752027503
   push 1
   jmp _compare_end604349752027503
_compare_not_equal604349752027503:
   push 0
_compare_end604349752027503:
   pop eax
   cmp eax, 0
   je _if_end_1593
_if_start_1593:
   push left1582[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1578[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1593[ebp], eax
   push right1582[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1578[ebp]
   push [esi[edx]]
   pop edx
   push left1582[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1578[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1593[ebp]
   pop edx
   push right1582[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1578[ebp]
   add esi, ecx
   mov [esi], edx
   push left1582[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1582[ebp], eax
   push right1582[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1582[ebp], eax
_if_end_1593:
   push left1582[ebp]
   pop ecx
   push right1582[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349752663850
   push 1
   jmp _compare_end604349752663850
_compare_not_equal604349752663850:
   push 0
_compare_end604349752663850:
   pop eax
   cmp eax, 0
   je _loop_end_1585
   jmp _loop_start_1585
_loop_end_1585:

   ; init stack for qs
   push right1582[ebp]
   push arg_first1578[ebp]
   push arg_s_arr1578[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1578[ebp]
   push left1582[ebp]
   push arg_s_arr1578[ebp]
   ; call qs
   call qs

_if_end_1582:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1594[ebp]
   pop ecx
   push arg_last1594[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349752745960
   push 1
   jmp _compare_end604349752745960
_compare_not_equal604349752745960:
   push 0
_compare_end604349752745960:
   pop eax
   cmp eax, 0
   je _if_end_1598
_if_start_1598:
   push arg_first1594[ebp]
   pop eax
   mov left1598[ebp], eax
   push arg_last1594[ebp]
   pop eax
   mov right1598[ebp], eax
   push left1598[ebp]
   push right1598[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1594[ebp]
   push [esi[edx]]
   pop eax
   mov middle1598[ebp], eax
_loop_start_1601:
_loop_aftereffects_1601:
_loop_start_1604:
_loop_aftereffects_1604:
   push left1598[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1594[ebp]
   push [esi[edx]]
   pop ecx
   push middle1598[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349753248880
   push 1
   jmp _compare_end604349753248880
_compare_not_equal604349753248880:
   push 0
_compare_end604349753248880:
   pop eax
   cmp eax, 0
   je _loop_end_1604
   push left1598[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1598[ebp], eax
   jmp _loop_start_1604
_loop_end_1604:
_loop_start_1607:
_loop_aftereffects_1607:
   push right1598[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1594[ebp]
   push [esi[edx]]
   pop ecx
   push middle1598[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349753670546
   push 1
   jmp _compare_end604349753670546
_compare_not_equal604349753670546:
   push 0
_compare_end604349753670546:
   pop eax
   cmp eax, 0
   je _loop_end_1607
   push right1598[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1598[ebp], eax
   jmp _loop_start_1607
_loop_end_1607:
   push left1598[ebp]
   pop ecx
   push right1598[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349753763347
   push 1
   jmp _compare_end604349753763347
_compare_not_equal604349753763347:
   push 0
_compare_end604349753763347:
   pop eax
   cmp eax, 0
   je _if_end_1609
_if_start_1609:
   push left1598[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1594[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1609[ebp], eax
   push right1598[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1594[ebp]
   push [esi[edx]]
   pop edx
   push left1598[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1594[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1609[ebp]
   pop edx
   push right1598[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1594[ebp]
   add esi, ecx
   mov [esi], edx
   push left1598[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1598[ebp], eax
   push right1598[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1598[ebp], eax
_if_end_1609:
   push left1598[ebp]
   pop ecx
   push right1598[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349754633621
   push 1
   jmp _compare_end604349754633621
_compare_not_equal604349754633621:
   push 0
_compare_end604349754633621:
   pop eax
   cmp eax, 0
   je _loop_end_1601
   jmp _loop_start_1601
_loop_end_1601:

   ; init stack for qs
   push right1598[ebp]
   push arg_first1594[ebp]
   push arg_s_arr1594[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1594[ebp]
   push left1598[ebp]
   push arg_s_arr1594[ebp]
   ; call qs
   call qs

_if_end_1598:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1610[ebp]
   pop ecx
   push arg_last1610[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349755239177
   push 1
   jmp _compare_end604349755239177
_compare_not_equal604349755239177:
   push 0
_compare_end604349755239177:
   pop eax
   cmp eax, 0
   je _if_end_1614
_if_start_1614:
   push arg_first1610[ebp]
   pop eax
   mov left1614[ebp], eax
   push arg_last1610[ebp]
   pop eax
   mov right1614[ebp], eax
   push left1614[ebp]
   push right1614[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1610[ebp]
   push [esi[edx]]
   pop eax
   mov middle1614[ebp], eax
_loop_start_1617:
_loop_aftereffects_1617:
_loop_start_1620:
_loop_aftereffects_1620:
   push left1614[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1610[ebp]
   push [esi[edx]]
   pop ecx
   push middle1614[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349755470538
   push 1
   jmp _compare_end604349755470538
_compare_not_equal604349755470538:
   push 0
_compare_end604349755470538:
   pop eax
   cmp eax, 0
   je _loop_end_1620
   push left1614[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1614[ebp], eax
   jmp _loop_start_1620
_loop_end_1620:
_loop_start_1623:
_loop_aftereffects_1623:
   push right1614[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1610[ebp]
   push [esi[edx]]
   pop ecx
   push middle1614[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349755570181
   push 1
   jmp _compare_end604349755570181
_compare_not_equal604349755570181:
   push 0
_compare_end604349755570181:
   pop eax
   cmp eax, 0
   je _loop_end_1623
   push right1614[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1614[ebp], eax
   jmp _loop_start_1623
_loop_end_1623:
   push left1614[ebp]
   pop ecx
   push right1614[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349755673673
   push 1
   jmp _compare_end604349755673673
_compare_not_equal604349755673673:
   push 0
_compare_end604349755673673:
   pop eax
   cmp eax, 0
   je _if_end_1625
_if_start_1625:
   push left1614[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1610[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1625[ebp], eax
   push right1614[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1610[ebp]
   push [esi[edx]]
   pop edx
   push left1614[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1610[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1625[ebp]
   pop edx
   push right1614[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1610[ebp]
   add esi, ecx
   mov [esi], edx
   push left1614[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1614[ebp], eax
   push right1614[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1614[ebp], eax
_if_end_1625:
   push left1614[ebp]
   pop ecx
   push right1614[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349756473384
   push 1
   jmp _compare_end604349756473384
_compare_not_equal604349756473384:
   push 0
_compare_end604349756473384:
   pop eax
   cmp eax, 0
   je _loop_end_1617
   jmp _loop_start_1617
_loop_end_1617:

   ; init stack for qs
   push right1614[ebp]
   push arg_first1610[ebp]
   push arg_s_arr1610[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1610[ebp]
   push left1614[ebp]
   push arg_s_arr1610[ebp]
   ; call qs
   call qs

_if_end_1614:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1626[ebp]
   pop ecx
   push arg_last1626[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349756670960
   push 1
   jmp _compare_end604349756670960
_compare_not_equal604349756670960:
   push 0
_compare_end604349756670960:
   pop eax
   cmp eax, 0
   je _if_end_1630
_if_start_1630:
   push arg_first1626[ebp]
   pop eax
   mov left1630[ebp], eax
   push arg_last1626[ebp]
   pop eax
   mov right1630[ebp], eax
   push left1630[ebp]
   push right1630[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1626[ebp]
   push [esi[edx]]
   pop eax
   mov middle1630[ebp], eax
_loop_start_1633:
_loop_aftereffects_1633:
_loop_start_1636:
_loop_aftereffects_1636:
   push left1630[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1626[ebp]
   push [esi[edx]]
   pop ecx
   push middle1630[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349757578012
   push 1
   jmp _compare_end604349757578012
_compare_not_equal604349757578012:
   push 0
_compare_end604349757578012:
   pop eax
   cmp eax, 0
   je _loop_end_1636
   push left1630[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1630[ebp], eax
   jmp _loop_start_1636
_loop_end_1636:
_loop_start_1639:
_loop_aftereffects_1639:
   push right1630[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1626[ebp]
   push [esi[edx]]
   pop ecx
   push middle1630[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349758012935
   push 1
   jmp _compare_end604349758012935
_compare_not_equal604349758012935:
   push 0
_compare_end604349758012935:
   pop eax
   cmp eax, 0
   je _loop_end_1639
   push right1630[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1630[ebp], eax
   jmp _loop_start_1639
_loop_end_1639:
   push left1630[ebp]
   pop ecx
   push right1630[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349758288771
   push 1
   jmp _compare_end604349758288771
_compare_not_equal604349758288771:
   push 0
_compare_end604349758288771:
   pop eax
   cmp eax, 0
   je _if_end_1641
_if_start_1641:
   push left1630[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1626[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1641[ebp], eax
   push right1630[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1626[ebp]
   push [esi[edx]]
   pop edx
   push left1630[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1626[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1641[ebp]
   pop edx
   push right1630[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1626[ebp]
   add esi, ecx
   mov [esi], edx
   push left1630[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1630[ebp], eax
   push right1630[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1630[ebp], eax
_if_end_1641:
   push left1630[ebp]
   pop ecx
   push right1630[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349759842863
   push 1
   jmp _compare_end604349759842863
_compare_not_equal604349759842863:
   push 0
_compare_end604349759842863:
   pop eax
   cmp eax, 0
   je _loop_end_1633
   jmp _loop_start_1633
_loop_end_1633:

   ; init stack for qs
   push right1630[ebp]
   push arg_first1626[ebp]
   push arg_s_arr1626[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1626[ebp]
   push left1630[ebp]
   push arg_s_arr1626[ebp]
   ; call qs
   call qs

_if_end_1630:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1642[ebp]
   pop ecx
   push arg_last1642[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349760508718
   push 1
   jmp _compare_end604349760508718
_compare_not_equal604349760508718:
   push 0
_compare_end604349760508718:
   pop eax
   cmp eax, 0
   je _if_end_1646
_if_start_1646:
   push arg_first1642[ebp]
   pop eax
   mov left1646[ebp], eax
   push arg_last1642[ebp]
   pop eax
   mov right1646[ebp], eax
   push left1646[ebp]
   push right1646[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1642[ebp]
   push [esi[edx]]
   pop eax
   mov middle1646[ebp], eax
_loop_start_1649:
_loop_aftereffects_1649:
_loop_start_1652:
_loop_aftereffects_1652:
   push left1646[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1642[ebp]
   push [esi[edx]]
   pop ecx
   push middle1646[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349761371722
   push 1
   jmp _compare_end604349761371722
_compare_not_equal604349761371722:
   push 0
_compare_end604349761371722:
   pop eax
   cmp eax, 0
   je _loop_end_1652
   push left1646[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1646[ebp], eax
   jmp _loop_start_1652
_loop_end_1652:
_loop_start_1655:
_loop_aftereffects_1655:
   push right1646[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1642[ebp]
   push [esi[edx]]
   pop ecx
   push middle1646[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349761852404
   push 1
   jmp _compare_end604349761852404
_compare_not_equal604349761852404:
   push 0
_compare_end604349761852404:
   pop eax
   cmp eax, 0
   je _loop_end_1655
   push right1646[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1646[ebp], eax
   jmp _loop_start_1655
_loop_end_1655:
   push left1646[ebp]
   pop ecx
   push right1646[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349762363450
   push 1
   jmp _compare_end604349762363450
_compare_not_equal604349762363450:
   push 0
_compare_end604349762363450:
   pop eax
   cmp eax, 0
   je _if_end_1657
_if_start_1657:
   push left1646[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1642[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1657[ebp], eax
   push right1646[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1642[ebp]
   push [esi[edx]]
   pop edx
   push left1646[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1642[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1657[ebp]
   pop edx
   push right1646[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1642[ebp]
   add esi, ecx
   mov [esi], edx
   push left1646[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1646[ebp], eax
   push right1646[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1646[ebp], eax
_if_end_1657:
   push left1646[ebp]
   pop ecx
   push right1646[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349763267081
   push 1
   jmp _compare_end604349763267081
_compare_not_equal604349763267081:
   push 0
_compare_end604349763267081:
   pop eax
   cmp eax, 0
   je _loop_end_1649
   jmp _loop_start_1649
_loop_end_1649:

   ; init stack for qs
   push right1646[ebp]
   push arg_first1642[ebp]
   push arg_s_arr1642[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1642[ebp]
   push left1646[ebp]
   push arg_s_arr1642[ebp]
   ; call qs
   call qs

_if_end_1646:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1658[ebp]
   pop ecx
   push arg_last1658[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349763767435
   push 1
   jmp _compare_end604349763767435
_compare_not_equal604349763767435:
   push 0
_compare_end604349763767435:
   pop eax
   cmp eax, 0
   je _if_end_1662
_if_start_1662:
   push arg_first1658[ebp]
   pop eax
   mov left1662[ebp], eax
   push arg_last1658[ebp]
   pop eax
   mov right1662[ebp], eax
   push left1662[ebp]
   push right1662[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1658[ebp]
   push [esi[edx]]
   pop eax
   mov middle1662[ebp], eax
_loop_start_1665:
_loop_aftereffects_1665:
_loop_start_1668:
_loop_aftereffects_1668:
   push left1662[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1658[ebp]
   push [esi[edx]]
   pop ecx
   push middle1662[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349764438850
   push 1
   jmp _compare_end604349764438850
_compare_not_equal604349764438850:
   push 0
_compare_end604349764438850:
   pop eax
   cmp eax, 0
   je _loop_end_1668
   push left1662[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1662[ebp], eax
   jmp _loop_start_1668
_loop_end_1668:
_loop_start_1671:
_loop_aftereffects_1671:
   push right1662[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1658[ebp]
   push [esi[edx]]
   pop ecx
   push middle1662[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349764755741
   push 1
   jmp _compare_end604349764755741
_compare_not_equal604349764755741:
   push 0
_compare_end604349764755741:
   pop eax
   cmp eax, 0
   je _loop_end_1671
   push right1662[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1662[ebp], eax
   jmp _loop_start_1671
_loop_end_1671:
   push left1662[ebp]
   pop ecx
   push right1662[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349765116253
   push 1
   jmp _compare_end604349765116253
_compare_not_equal604349765116253:
   push 0
_compare_end604349765116253:
   pop eax
   cmp eax, 0
   je _if_end_1673
_if_start_1673:
   push left1662[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1658[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1673[ebp], eax
   push right1662[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1658[ebp]
   push [esi[edx]]
   pop edx
   push left1662[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1658[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1673[ebp]
   pop edx
   push right1662[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1658[ebp]
   add esi, ecx
   mov [esi], edx
   push left1662[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1662[ebp], eax
   push right1662[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1662[ebp], eax
_if_end_1673:
   push left1662[ebp]
   pop ecx
   push right1662[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349766301707
   push 1
   jmp _compare_end604349766301707
_compare_not_equal604349766301707:
   push 0
_compare_end604349766301707:
   pop eax
   cmp eax, 0
   je _loop_end_1665
   jmp _loop_start_1665
_loop_end_1665:

   ; init stack for qs
   push right1662[ebp]
   push arg_first1658[ebp]
   push arg_s_arr1658[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1658[ebp]
   push left1662[ebp]
   push arg_s_arr1658[ebp]
   ; call qs
   call qs

_if_end_1662:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1674[ebp]
   pop ecx
   push arg_last1674[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349766987235
   push 1
   jmp _compare_end604349766987235
_compare_not_equal604349766987235:
   push 0
_compare_end604349766987235:
   pop eax
   cmp eax, 0
   je _if_end_1678
_if_start_1678:
   push arg_first1674[ebp]
   pop eax
   mov left1678[ebp], eax
   push arg_last1674[ebp]
   pop eax
   mov right1678[ebp], eax
   push left1678[ebp]
   push right1678[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1674[ebp]
   push [esi[edx]]
   pop eax
   mov middle1678[ebp], eax
_loop_start_1681:
_loop_aftereffects_1681:
_loop_start_1684:
_loop_aftereffects_1684:
   push left1678[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1674[ebp]
   push [esi[edx]]
   pop ecx
   push middle1678[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349767720660
   push 1
   jmp _compare_end604349767720660
_compare_not_equal604349767720660:
   push 0
_compare_end604349767720660:
   pop eax
   cmp eax, 0
   je _loop_end_1684
   push left1678[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1678[ebp], eax
   jmp _loop_start_1684
_loop_end_1684:
_loop_start_1687:
_loop_aftereffects_1687:
   push right1678[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1674[ebp]
   push [esi[edx]]
   pop ecx
   push middle1678[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349767936197
   push 1
   jmp _compare_end604349767936197
_compare_not_equal604349767936197:
   push 0
_compare_end604349767936197:
   pop eax
   cmp eax, 0
   je _loop_end_1687
   push right1678[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1678[ebp], eax
   jmp _loop_start_1687
_loop_end_1687:
   push left1678[ebp]
   pop ecx
   push right1678[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349768446387
   push 1
   jmp _compare_end604349768446387
_compare_not_equal604349768446387:
   push 0
_compare_end604349768446387:
   pop eax
   cmp eax, 0
   je _if_end_1689
_if_start_1689:
   push left1678[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1674[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1689[ebp], eax
   push right1678[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1674[ebp]
   push [esi[edx]]
   pop edx
   push left1678[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1674[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1689[ebp]
   pop edx
   push right1678[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1674[ebp]
   add esi, ecx
   mov [esi], edx
   push left1678[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1678[ebp], eax
   push right1678[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1678[ebp], eax
_if_end_1689:
   push left1678[ebp]
   pop ecx
   push right1678[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349770029987
   push 1
   jmp _compare_end604349770029987
_compare_not_equal604349770029987:
   push 0
_compare_end604349770029987:
   pop eax
   cmp eax, 0
   je _loop_end_1681
   jmp _loop_start_1681
_loop_end_1681:

   ; init stack for qs
   push right1678[ebp]
   push arg_first1674[ebp]
   push arg_s_arr1674[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1674[ebp]
   push left1678[ebp]
   push arg_s_arr1674[ebp]
   ; call qs
   call qs

_if_end_1678:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1690[ebp]
   pop ecx
   push arg_last1690[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349770432408
   push 1
   jmp _compare_end604349770432408
_compare_not_equal604349770432408:
   push 0
_compare_end604349770432408:
   pop eax
   cmp eax, 0
   je _if_end_1694
_if_start_1694:
   push arg_first1690[ebp]
   pop eax
   mov left1694[ebp], eax
   push arg_last1690[ebp]
   pop eax
   mov right1694[ebp], eax
   push left1694[ebp]
   push right1694[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1690[ebp]
   push [esi[edx]]
   pop eax
   mov middle1694[ebp], eax
_loop_start_1697:
_loop_aftereffects_1697:
_loop_start_1700:
_loop_aftereffects_1700:
   push left1694[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1690[ebp]
   push [esi[edx]]
   pop ecx
   push middle1694[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349770973817
   push 1
   jmp _compare_end604349770973817
_compare_not_equal604349770973817:
   push 0
_compare_end604349770973817:
   pop eax
   cmp eax, 0
   je _loop_end_1700
   push left1694[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1694[ebp], eax
   jmp _loop_start_1700
_loop_end_1700:
_loop_start_1703:
_loop_aftereffects_1703:
   push right1694[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1690[ebp]
   push [esi[edx]]
   pop ecx
   push middle1694[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349771247515
   push 1
   jmp _compare_end604349771247515
_compare_not_equal604349771247515:
   push 0
_compare_end604349771247515:
   pop eax
   cmp eax, 0
   je _loop_end_1703
   push right1694[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1694[ebp], eax
   jmp _loop_start_1703
_loop_end_1703:
   push left1694[ebp]
   pop ecx
   push right1694[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349771742309
   push 1
   jmp _compare_end604349771742309
_compare_not_equal604349771742309:
   push 0
_compare_end604349771742309:
   pop eax
   cmp eax, 0
   je _if_end_1705
_if_start_1705:
   push left1694[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1690[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1705[ebp], eax
   push right1694[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1690[ebp]
   push [esi[edx]]
   pop edx
   push left1694[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1690[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1705[ebp]
   pop edx
   push right1694[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1690[ebp]
   add esi, ecx
   mov [esi], edx
   push left1694[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1694[ebp], eax
   push right1694[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1694[ebp], eax
_if_end_1705:
   push left1694[ebp]
   pop ecx
   push right1694[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349773006452
   push 1
   jmp _compare_end604349773006452
_compare_not_equal604349773006452:
   push 0
_compare_end604349773006452:
   pop eax
   cmp eax, 0
   je _loop_end_1697
   jmp _loop_start_1697
_loop_end_1697:

   ; init stack for qs
   push right1694[ebp]
   push arg_first1690[ebp]
   push arg_s_arr1690[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1690[ebp]
   push left1694[ebp]
   push arg_s_arr1690[ebp]
   ; call qs
   call qs

_if_end_1694:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1706[ebp]
   pop ecx
   push arg_last1706[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349773674018
   push 1
   jmp _compare_end604349773674018
_compare_not_equal604349773674018:
   push 0
_compare_end604349773674018:
   pop eax
   cmp eax, 0
   je _if_end_1710
_if_start_1710:
   push arg_first1706[ebp]
   pop eax
   mov left1710[ebp], eax
   push arg_last1706[ebp]
   pop eax
   mov right1710[ebp], eax
   push left1710[ebp]
   push right1710[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1706[ebp]
   push [esi[edx]]
   pop eax
   mov middle1710[ebp], eax
_loop_start_1713:
_loop_aftereffects_1713:
_loop_start_1716:
_loop_aftereffects_1716:
   push left1710[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1706[ebp]
   push [esi[edx]]
   pop ecx
   push middle1710[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349774406588
   push 1
   jmp _compare_end604349774406588
_compare_not_equal604349774406588:
   push 0
_compare_end604349774406588:
   pop eax
   cmp eax, 0
   je _loop_end_1716
   push left1710[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1710[ebp], eax
   jmp _loop_start_1716
_loop_end_1716:
_loop_start_1719:
_loop_aftereffects_1719:
   push right1710[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1706[ebp]
   push [esi[edx]]
   pop ecx
   push middle1710[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349774516495
   push 1
   jmp _compare_end604349774516495
_compare_not_equal604349774516495:
   push 0
_compare_end604349774516495:
   pop eax
   cmp eax, 0
   je _loop_end_1719
   push right1710[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1710[ebp], eax
   jmp _loop_start_1719
_loop_end_1719:
   push left1710[ebp]
   pop ecx
   push right1710[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349774628540
   push 1
   jmp _compare_end604349774628540
_compare_not_equal604349774628540:
   push 0
_compare_end604349774628540:
   pop eax
   cmp eax, 0
   je _if_end_1721
_if_start_1721:
   push left1710[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1706[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1721[ebp], eax
   push right1710[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1706[ebp]
   push [esi[edx]]
   pop edx
   push left1710[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1706[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1721[ebp]
   pop edx
   push right1710[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1706[ebp]
   add esi, ecx
   mov [esi], edx
   push left1710[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1710[ebp], eax
   push right1710[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1710[ebp], eax
_if_end_1721:
   push left1710[ebp]
   pop ecx
   push right1710[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349775028396
   push 1
   jmp _compare_end604349775028396
_compare_not_equal604349775028396:
   push 0
_compare_end604349775028396:
   pop eax
   cmp eax, 0
   je _loop_end_1713
   jmp _loop_start_1713
_loop_end_1713:

   ; init stack for qs
   push right1710[ebp]
   push arg_first1706[ebp]
   push arg_s_arr1706[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1706[ebp]
   push left1710[ebp]
   push arg_s_arr1706[ebp]
   ; call qs
   call qs

_if_end_1710:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1722[ebp]
   pop ecx
   push arg_last1722[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349775357261
   push 1
   jmp _compare_end604349775357261
_compare_not_equal604349775357261:
   push 0
_compare_end604349775357261:
   pop eax
   cmp eax, 0
   je _if_end_1726
_if_start_1726:
   push arg_first1722[ebp]
   pop eax
   mov left1726[ebp], eax
   push arg_last1722[ebp]
   pop eax
   mov right1726[ebp], eax
   push left1726[ebp]
   push right1726[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1722[ebp]
   push [esi[edx]]
   pop eax
   mov middle1726[ebp], eax
_loop_start_1729:
_loop_aftereffects_1729:
_loop_start_1732:
_loop_aftereffects_1732:
   push left1726[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1722[ebp]
   push [esi[edx]]
   pop ecx
   push middle1726[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349775836660
   push 1
   jmp _compare_end604349775836660
_compare_not_equal604349775836660:
   push 0
_compare_end604349775836660:
   pop eax
   cmp eax, 0
   je _loop_end_1732
   push left1726[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1726[ebp], eax
   jmp _loop_start_1732
_loop_end_1732:
_loop_start_1735:
_loop_aftereffects_1735:
   push right1726[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1722[ebp]
   push [esi[edx]]
   pop ecx
   push middle1726[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349776171085
   push 1
   jmp _compare_end604349776171085
_compare_not_equal604349776171085:
   push 0
_compare_end604349776171085:
   pop eax
   cmp eax, 0
   je _loop_end_1735
   push right1726[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1726[ebp], eax
   jmp _loop_start_1735
_loop_end_1735:
   push left1726[ebp]
   pop ecx
   push right1726[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349776668445
   push 1
   jmp _compare_end604349776668445
_compare_not_equal604349776668445:
   push 0
_compare_end604349776668445:
   pop eax
   cmp eax, 0
   je _if_end_1737
_if_start_1737:
   push left1726[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1722[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1737[ebp], eax
   push right1726[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1722[ebp]
   push [esi[edx]]
   pop edx
   push left1726[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1722[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1737[ebp]
   pop edx
   push right1726[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1722[ebp]
   add esi, ecx
   mov [esi], edx
   push left1726[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1726[ebp], eax
   push right1726[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1726[ebp], eax
_if_end_1737:
   push left1726[ebp]
   pop ecx
   push right1726[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349778156250
   push 1
   jmp _compare_end604349778156250
_compare_not_equal604349778156250:
   push 0
_compare_end604349778156250:
   pop eax
   cmp eax, 0
   je _loop_end_1729
   jmp _loop_start_1729
_loop_end_1729:

   ; init stack for qs
   push right1726[ebp]
   push arg_first1722[ebp]
   push arg_s_arr1722[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1722[ebp]
   push left1726[ebp]
   push arg_s_arr1722[ebp]
   ; call qs
   call qs

_if_end_1726:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1738[ebp]
   pop ecx
   push arg_last1738[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349778697659
   push 1
   jmp _compare_end604349778697659
_compare_not_equal604349778697659:
   push 0
_compare_end604349778697659:
   pop eax
   cmp eax, 0
   je _if_end_1742
_if_start_1742:
   push arg_first1738[ebp]
   pop eax
   mov left1742[ebp], eax
   push arg_last1738[ebp]
   pop eax
   mov right1742[ebp], eax
   push left1742[ebp]
   push right1742[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1738[ebp]
   push [esi[edx]]
   pop eax
   mov middle1742[ebp], eax
_loop_start_1745:
_loop_aftereffects_1745:
_loop_start_1748:
_loop_aftereffects_1748:
   push left1742[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1738[ebp]
   push [esi[edx]]
   pop ecx
   push middle1742[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349779329303
   push 1
   jmp _compare_end604349779329303
_compare_not_equal604349779329303:
   push 0
_compare_end604349779329303:
   pop eax
   cmp eax, 0
   je _loop_end_1748
   push left1742[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1742[ebp], eax
   jmp _loop_start_1748
_loop_end_1748:
_loop_start_1751:
_loop_aftereffects_1751:
   push right1742[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1738[ebp]
   push [esi[edx]]
   pop ecx
   push middle1742[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349779617113
   push 1
   jmp _compare_end604349779617113
_compare_not_equal604349779617113:
   push 0
_compare_end604349779617113:
   pop eax
   cmp eax, 0
   je _loop_end_1751
   push right1742[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1742[ebp], eax
   jmp _loop_start_1751
_loop_end_1751:
   push left1742[ebp]
   pop ecx
   push right1742[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349779877554
   push 1
   jmp _compare_end604349779877554
_compare_not_equal604349779877554:
   push 0
_compare_end604349779877554:
   pop eax
   cmp eax, 0
   je _if_end_1753
_if_start_1753:
   push left1742[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1738[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1753[ebp], eax
   push right1742[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1738[ebp]
   push [esi[edx]]
   pop edx
   push left1742[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1738[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1753[ebp]
   pop edx
   push right1742[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1738[ebp]
   add esi, ecx
   mov [esi], edx
   push left1742[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1742[ebp], eax
   push right1742[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1742[ebp], eax
_if_end_1753:
   push left1742[ebp]
   pop ecx
   push right1742[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349780716182
   push 1
   jmp _compare_end604349780716182
_compare_not_equal604349780716182:
   push 0
_compare_end604349780716182:
   pop eax
   cmp eax, 0
   je _loop_end_1745
   jmp _loop_start_1745
_loop_end_1745:

   ; init stack for qs
   push right1742[ebp]
   push arg_first1738[ebp]
   push arg_s_arr1738[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1738[ebp]
   push left1742[ebp]
   push arg_s_arr1738[ebp]
   ; call qs
   call qs

_if_end_1742:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1754[ebp]
   pop ecx
   push arg_last1754[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349781089523
   push 1
   jmp _compare_end604349781089523
_compare_not_equal604349781089523:
   push 0
_compare_end604349781089523:
   pop eax
   cmp eax, 0
   je _if_end_1758
_if_start_1758:
   push arg_first1754[ebp]
   pop eax
   mov left1758[ebp], eax
   push arg_last1754[ebp]
   pop eax
   mov right1758[ebp], eax
   push left1758[ebp]
   push right1758[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1754[ebp]
   push [esi[edx]]
   pop eax
   mov middle1758[ebp], eax
_loop_start_1761:
_loop_aftereffects_1761:
_loop_start_1764:
_loop_aftereffects_1764:
   push left1758[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1754[ebp]
   push [esi[edx]]
   pop ecx
   push middle1758[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349781552671
   push 1
   jmp _compare_end604349781552671
_compare_not_equal604349781552671:
   push 0
_compare_end604349781552671:
   pop eax
   cmp eax, 0
   je _loop_end_1764
   push left1758[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1758[ebp], eax
   jmp _loop_start_1764
_loop_end_1764:
_loop_start_1767:
_loop_aftereffects_1767:
   push right1758[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1754[ebp]
   push [esi[edx]]
   pop ecx
   push middle1758[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349781831073
   push 1
   jmp _compare_end604349781831073
_compare_not_equal604349781831073:
   push 0
_compare_end604349781831073:
   pop eax
   cmp eax, 0
   je _loop_end_1767
   push right1758[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1758[ebp], eax
   jmp _loop_start_1767
_loop_end_1767:
   push left1758[ebp]
   pop ecx
   push right1758[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349782094507
   push 1
   jmp _compare_end604349782094507
_compare_not_equal604349782094507:
   push 0
_compare_end604349782094507:
   pop eax
   cmp eax, 0
   je _if_end_1769
_if_start_1769:
   push left1758[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1754[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1769[ebp], eax
   push right1758[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1754[ebp]
   push [esi[edx]]
   pop edx
   push left1758[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1754[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1769[ebp]
   pop edx
   push right1758[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1754[ebp]
   add esi, ecx
   mov [esi], edx
   push left1758[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1758[ebp], eax
   push right1758[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1758[ebp], eax
_if_end_1769:
   push left1758[ebp]
   pop ecx
   push right1758[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349782827077
   push 1
   jmp _compare_end604349782827077
_compare_not_equal604349782827077:
   push 0
_compare_end604349782827077:
   pop eax
   cmp eax, 0
   je _loop_end_1761
   jmp _loop_start_1761
_loop_end_1761:

   ; init stack for qs
   push right1758[ebp]
   push arg_first1754[ebp]
   push arg_s_arr1754[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1754[ebp]
   push left1758[ebp]
   push arg_s_arr1754[ebp]
   ; call qs
   call qs

_if_end_1758:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1770[ebp]
   pop ecx
   push arg_last1770[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349782918595
   push 1
   jmp _compare_end604349782918595
_compare_not_equal604349782918595:
   push 0
_compare_end604349782918595:
   pop eax
   cmp eax, 0
   je _if_end_1774
_if_start_1774:
   push arg_first1770[ebp]
   pop eax
   mov left1774[ebp], eax
   push arg_last1770[ebp]
   pop eax
   mov right1774[ebp], eax
   push left1774[ebp]
   push right1774[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1770[ebp]
   push [esi[edx]]
   pop eax
   mov middle1774[ebp], eax
_loop_start_1777:
_loop_aftereffects_1777:
_loop_start_1780:
_loop_aftereffects_1780:
   push left1774[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1770[ebp]
   push [esi[edx]]
   pop ecx
   push middle1774[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349783044753
   push 1
   jmp _compare_end604349783044753
_compare_not_equal604349783044753:
   push 0
_compare_end604349783044753:
   pop eax
   cmp eax, 0
   je _loop_end_1780
   push left1774[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1774[ebp], eax
   jmp _loop_start_1780
_loop_end_1780:
_loop_start_1783:
_loop_aftereffects_1783:
   push right1774[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1770[ebp]
   push [esi[edx]]
   pop ecx
   push middle1774[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349783110611
   push 1
   jmp _compare_end604349783110611
_compare_not_equal604349783110611:
   push 0
_compare_end604349783110611:
   pop eax
   cmp eax, 0
   je _loop_end_1783
   push right1774[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1774[ebp], eax
   jmp _loop_start_1783
_loop_end_1783:
   push left1774[ebp]
   pop ecx
   push right1774[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349783570338
   push 1
   jmp _compare_end604349783570338
_compare_not_equal604349783570338:
   push 0
_compare_end604349783570338:
   pop eax
   cmp eax, 0
   je _if_end_1785
_if_start_1785:
   push left1774[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1770[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1785[ebp], eax
   push right1774[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1770[ebp]
   push [esi[edx]]
   pop edx
   push left1774[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1770[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1785[ebp]
   pop edx
   push right1774[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1770[ebp]
   add esi, ecx
   mov [esi], edx
   push left1774[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1774[ebp], eax
   push right1774[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1774[ebp], eax
_if_end_1785:
   push left1774[ebp]
   pop ecx
   push right1774[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349783794001
   push 1
   jmp _compare_end604349783794001
_compare_not_equal604349783794001:
   push 0
_compare_end604349783794001:
   pop eax
   cmp eax, 0
   je _loop_end_1777
   jmp _loop_start_1777
_loop_end_1777:

   ; init stack for qs
   push right1774[ebp]
   push arg_first1770[ebp]
   push arg_s_arr1770[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1770[ebp]
   push left1774[ebp]
   push arg_s_arr1770[ebp]
   ; call qs
   call qs

_if_end_1774:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1786[ebp]
   pop ecx
   push arg_last1786[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349783883808
   push 1
   jmp _compare_end604349783883808
_compare_not_equal604349783883808:
   push 0
_compare_end604349783883808:
   pop eax
   cmp eax, 0
   je _if_end_1790
_if_start_1790:
   push arg_first1786[ebp]
   pop eax
   mov left1790[ebp], eax
   push arg_last1786[ebp]
   pop eax
   mov right1790[ebp], eax
   push left1790[ebp]
   push right1790[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1786[ebp]
   push [esi[edx]]
   pop eax
   mov middle1790[ebp], eax
_loop_start_1793:
_loop_aftereffects_1793:
_loop_start_1796:
_loop_aftereffects_1796:
   push left1790[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1786[ebp]
   push [esi[edx]]
   pop ecx
   push middle1790[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349784005261
   push 1
   jmp _compare_end604349784005261
_compare_not_equal604349784005261:
   push 0
_compare_end604349784005261:
   pop eax
   cmp eax, 0
   je _loop_end_1796
   push left1790[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1790[ebp], eax
   jmp _loop_start_1796
_loop_end_1796:
_loop_start_1799:
_loop_aftereffects_1799:
   push right1790[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1786[ebp]
   push [esi[edx]]
   pop ecx
   push middle1790[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349784071120
   push 1
   jmp _compare_end604349784071120
_compare_not_equal604349784071120:
   push 0
_compare_end604349784071120:
   pop eax
   cmp eax, 0
   je _loop_end_1799
   push right1790[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1790[ebp], eax
   jmp _loop_start_1799
_loop_end_1799:
   push left1790[ebp]
   pop ecx
   push right1790[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349784136551
   push 1
   jmp _compare_end604349784136551
_compare_not_equal604349784136551:
   push 0
_compare_end604349784136551:
   pop eax
   cmp eax, 0
   je _if_end_1801
_if_start_1801:
   push left1790[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1786[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1801[ebp], eax
   push right1790[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1786[ebp]
   push [esi[edx]]
   pop edx
   push left1790[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1786[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1801[ebp]
   pop edx
   push right1790[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1786[ebp]
   add esi, ecx
   mov [esi], edx
   push left1790[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1790[ebp], eax
   push right1790[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1790[ebp], eax
_if_end_1801:
   push left1790[ebp]
   pop ecx
   push right1790[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349784429066
   push 1
   jmp _compare_end604349784429066
_compare_not_equal604349784429066:
   push 0
_compare_end604349784429066:
   pop eax
   cmp eax, 0
   je _loop_end_1793
   jmp _loop_start_1793
_loop_end_1793:

   ; init stack for qs
   push right1790[ebp]
   push arg_first1786[ebp]
   push arg_s_arr1786[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1786[ebp]
   push left1790[ebp]
   push arg_s_arr1786[ebp]
   ; call qs
   call qs

_if_end_1790:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1802[ebp]
   pop ecx
   push arg_last1802[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349784585159
   push 1
   jmp _compare_end604349784585159
_compare_not_equal604349784585159:
   push 0
_compare_end604349784585159:
   pop eax
   cmp eax, 0
   je _if_end_1806
_if_start_1806:
   push arg_first1802[ebp]
   pop eax
   mov left1806[ebp], eax
   push arg_last1802[ebp]
   pop eax
   mov right1806[ebp], eax
   push left1806[ebp]
   push right1806[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1802[ebp]
   push [esi[edx]]
   pop eax
   mov middle1806[ebp], eax
_loop_start_1809:
_loop_aftereffects_1809:
_loop_start_1812:
_loop_aftereffects_1812:
   push left1806[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1802[ebp]
   push [esi[edx]]
   pop ecx
   push middle1806[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349784806256
   push 1
   jmp _compare_end604349784806256
_compare_not_equal604349784806256:
   push 0
_compare_end604349784806256:
   pop eax
   cmp eax, 0
   je _loop_end_1812
   push left1806[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1806[ebp], eax
   jmp _loop_start_1812
_loop_end_1812:
_loop_start_1815:
_loop_aftereffects_1815:
   push right1806[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1802[ebp]
   push [esi[edx]]
   pop ecx
   push middle1806[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349784925571
   push 1
   jmp _compare_end604349784925571
_compare_not_equal604349784925571:
   push 0
_compare_end604349784925571:
   pop eax
   cmp eax, 0
   je _loop_end_1815
   push right1806[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1806[ebp], eax
   jmp _loop_start_1815
_loop_end_1815:
   push left1806[ebp]
   pop ecx
   push right1806[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349785045314
   push 1
   jmp _compare_end604349785045314
_compare_not_equal604349785045314:
   push 0
_compare_end604349785045314:
   pop eax
   cmp eax, 0
   je _if_end_1817
_if_start_1817:
   push left1806[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1802[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1817[ebp], eax
   push right1806[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1802[ebp]
   push [esi[edx]]
   pop edx
   push left1806[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1802[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1817[ebp]
   pop edx
   push right1806[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1802[ebp]
   add esi, ecx
   mov [esi], edx
   push left1806[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1806[ebp], eax
   push right1806[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1806[ebp], eax
_if_end_1817:
   push left1806[ebp]
   pop ecx
   push right1806[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349785443886
   push 1
   jmp _compare_end604349785443886
_compare_not_equal604349785443886:
   push 0
_compare_end604349785443886:
   pop eax
   cmp eax, 0
   je _loop_end_1809
   jmp _loop_start_1809
_loop_end_1809:

   ; init stack for qs
   push right1806[ebp]
   push arg_first1802[ebp]
   push arg_s_arr1802[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1802[ebp]
   push left1806[ebp]
   push arg_s_arr1802[ebp]
   ; call qs
   call qs

_if_end_1806:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1818[ebp]
   pop ecx
   push arg_last1818[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349785536687
   push 1
   jmp _compare_end604349785536687
_compare_not_equal604349785536687:
   push 0
_compare_end604349785536687:
   pop eax
   cmp eax, 0
   je _if_end_1822
_if_start_1822:
   push arg_first1818[ebp]
   pop eax
   mov left1822[ebp], eax
   push arg_last1818[ebp]
   pop eax
   mov right1822[ebp], eax
   push left1822[ebp]
   push right1822[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1818[ebp]
   push [esi[edx]]
   pop eax
   mov middle1822[ebp], eax
_loop_start_1825:
_loop_aftereffects_1825:
_loop_start_1828:
_loop_aftereffects_1828:
   push left1822[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1818[ebp]
   push [esi[edx]]
   pop ecx
   push middle1822[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349785660706
   push 1
   jmp _compare_end604349785660706
_compare_not_equal604349785660706:
   push 0
_compare_end604349785660706:
   pop eax
   cmp eax, 0
   je _loop_end_1828
   push left1822[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1822[ebp], eax
   jmp _loop_start_1828
_loop_end_1828:
_loop_start_1831:
_loop_aftereffects_1831:
   push right1822[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1818[ebp]
   push [esi[edx]]
   pop ecx
   push middle1822[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349785745809
   push 1
   jmp _compare_end604349785745809
_compare_not_equal604349785745809:
   push 0
_compare_end604349785745809:
   pop eax
   cmp eax, 0
   je _loop_end_1831
   push right1822[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1822[ebp], eax
   jmp _loop_start_1831
_loop_end_1831:
   push left1822[ebp]
   pop ecx
   push right1822[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349785812523
   push 1
   jmp _compare_end604349785812523
_compare_not_equal604349785812523:
   push 0
_compare_end604349785812523:
   pop eax
   cmp eax, 0
   je _if_end_1833
_if_start_1833:
   push left1822[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1818[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1833[ebp], eax
   push right1822[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1818[ebp]
   push [esi[edx]]
   pop edx
   push left1822[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1818[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1833[ebp]
   pop edx
   push right1822[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1818[ebp]
   add esi, ecx
   mov [esi], edx
   push left1822[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1822[ebp], eax
   push right1822[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1822[ebp], eax
_if_end_1833:
   push left1822[ebp]
   pop ecx
   push right1822[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349786025922
   push 1
   jmp _compare_end604349786025922
_compare_not_equal604349786025922:
   push 0
_compare_end604349786025922:
   pop eax
   cmp eax, 0
   je _loop_end_1825
   jmp _loop_start_1825
_loop_end_1825:

   ; init stack for qs
   push right1822[ebp]
   push arg_first1818[ebp]
   push arg_s_arr1818[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1818[ebp]
   push left1822[ebp]
   push arg_s_arr1818[ebp]
   ; call qs
   call qs

_if_end_1822:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1834[ebp]
   pop ecx
   push arg_last1834[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349786120006
   push 1
   jmp _compare_end604349786120006
_compare_not_equal604349786120006:
   push 0
_compare_end604349786120006:
   pop eax
   cmp eax, 0
   je _if_end_1838
_if_start_1838:
   push arg_first1834[ebp]
   pop eax
   mov left1838[ebp], eax
   push arg_last1834[ebp]
   pop eax
   mov right1838[ebp], eax
   push left1838[ebp]
   push right1838[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1834[ebp]
   push [esi[edx]]
   pop eax
   mov middle1838[ebp], eax
_loop_start_1841:
_loop_aftereffects_1841:
_loop_start_1844:
_loop_aftereffects_1844:
   push left1838[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1834[ebp]
   push [esi[edx]]
   pop ecx
   push middle1838[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349786281231
   push 1
   jmp _compare_end604349786281231
_compare_not_equal604349786281231:
   push 0
_compare_end604349786281231:
   pop eax
   cmp eax, 0
   je _loop_end_1844
   push left1838[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1838[ebp], eax
   jmp _loop_start_1844
_loop_end_1844:
_loop_start_1847:
_loop_aftereffects_1847:
   push right1838[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1834[ebp]
   push [esi[edx]]
   pop ecx
   push middle1838[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349786349228
   push 1
   jmp _compare_end604349786349228
_compare_not_equal604349786349228:
   push 0
_compare_end604349786349228:
   pop eax
   cmp eax, 0
   je _loop_end_1847
   push right1838[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1838[ebp], eax
   jmp _loop_start_1847
_loop_end_1847:
   push left1838[ebp]
   pop ecx
   push right1838[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349786416797
   push 1
   jmp _compare_end604349786416797
_compare_not_equal604349786416797:
   push 0
_compare_end604349786416797:
   pop eax
   cmp eax, 0
   je _if_end_1849
_if_start_1849:
   push left1838[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1834[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1849[ebp], eax
   push right1838[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1834[ebp]
   push [esi[edx]]
   pop edx
   push left1838[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1834[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1849[ebp]
   pop edx
   push right1838[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1834[ebp]
   add esi, ecx
   mov [esi], edx
   push left1838[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1838[ebp], eax
   push right1838[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1838[ebp], eax
_if_end_1849:
   push left1838[ebp]
   pop ecx
   push right1838[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349786631051
   push 1
   jmp _compare_end604349786631051
_compare_not_equal604349786631051:
   push 0
_compare_end604349786631051:
   pop eax
   cmp eax, 0
   je _loop_end_1841
   jmp _loop_start_1841
_loop_end_1841:

   ; init stack for qs
   push right1838[ebp]
   push arg_first1834[ebp]
   push arg_s_arr1834[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1834[ebp]
   push left1838[ebp]
   push arg_s_arr1834[ebp]
   ; call qs
   call qs

_if_end_1838:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1850[ebp]
   pop ecx
   push arg_last1850[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349786727273
   push 1
   jmp _compare_end604349786727273
_compare_not_equal604349786727273:
   push 0
_compare_end604349786727273:
   pop eax
   cmp eax, 0
   je _if_end_1854
_if_start_1854:
   push arg_first1850[ebp]
   pop eax
   mov left1854[ebp], eax
   push arg_last1850[ebp]
   pop eax
   mov right1854[ebp], eax
   push left1854[ebp]
   push right1854[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1850[ebp]
   push [esi[edx]]
   pop eax
   mov middle1854[ebp], eax
_loop_start_1857:
_loop_aftereffects_1857:
_loop_start_1860:
_loop_aftereffects_1860:
   push left1854[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1850[ebp]
   push [esi[edx]]
   pop ecx
   push middle1854[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349786852148
   push 1
   jmp _compare_end604349786852148
_compare_not_equal604349786852148:
   push 0
_compare_end604349786852148:
   pop eax
   cmp eax, 0
   je _loop_end_1860
   push left1854[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1854[ebp], eax
   jmp _loop_start_1860
_loop_end_1860:
_loop_start_1863:
_loop_aftereffects_1863:
   push right1854[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1850[ebp]
   push [esi[edx]]
   pop ecx
   push middle1854[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349786919717
   push 1
   jmp _compare_end604349786919717
_compare_not_equal604349786919717:
   push 0
_compare_end604349786919717:
   pop eax
   cmp eax, 0
   je _loop_end_1863
   push right1854[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1854[ebp], eax
   jmp _loop_start_1863
_loop_end_1863:
   push left1854[ebp]
   pop ecx
   push right1854[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349786987286
   push 1
   jmp _compare_end604349786987286
_compare_not_equal604349786987286:
   push 0
_compare_end604349786987286:
   pop eax
   cmp eax, 0
   je _if_end_1865
_if_start_1865:
   push left1854[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1850[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1865[ebp], eax
   push right1854[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1850[ebp]
   push [esi[edx]]
   pop edx
   push left1854[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1850[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1865[ebp]
   pop edx
   push right1854[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1850[ebp]
   add esi, ecx
   mov [esi], edx
   push left1854[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1854[ebp], eax
   push right1854[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1854[ebp], eax
_if_end_1865:
   push left1854[ebp]
   pop ecx
   push right1854[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349787204962
   push 1
   jmp _compare_end604349787204962
_compare_not_equal604349787204962:
   push 0
_compare_end604349787204962:
   pop eax
   cmp eax, 0
   je _loop_end_1857
   jmp _loop_start_1857
_loop_end_1857:

   ; init stack for qs
   push right1854[ebp]
   push arg_first1850[ebp]
   push arg_s_arr1850[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1850[ebp]
   push left1854[ebp]
   push arg_s_arr1850[ebp]
   ; call qs
   call qs

_if_end_1854:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1866[ebp]
   pop ecx
   push arg_last1866[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349787297335
   push 1
   jmp _compare_end604349787297335
_compare_not_equal604349787297335:
   push 0
_compare_end604349787297335:
   pop eax
   cmp eax, 0
   je _if_end_1870
_if_start_1870:
   push arg_first1866[ebp]
   pop eax
   mov left1870[ebp], eax
   push arg_last1866[ebp]
   pop eax
   mov right1870[ebp], eax
   push left1870[ebp]
   push right1870[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1866[ebp]
   push [esi[edx]]
   pop eax
   mov middle1870[ebp], eax
_loop_start_1873:
_loop_aftereffects_1873:
_loop_start_1876:
_loop_aftereffects_1876:
   push left1870[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1866[ebp]
   push [esi[edx]]
   pop ecx
   push middle1870[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349787430335
   push 1
   jmp _compare_end604349787430335
_compare_not_equal604349787430335:
   push 0
_compare_end604349787430335:
   pop eax
   cmp eax, 0
   je _loop_end_1876
   push left1870[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1870[ebp], eax
   jmp _loop_start_1876
_loop_end_1876:
_loop_start_1879:
_loop_aftereffects_1879:
   push right1870[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1866[ebp]
   push [esi[edx]]
   pop ecx
   push middle1870[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349787498759
   push 1
   jmp _compare_end604349787498759
_compare_not_equal604349787498759:
   push 0
_compare_end604349787498759:
   pop eax
   cmp eax, 0
   je _loop_end_1879
   push right1870[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1870[ebp], eax
   jmp _loop_start_1879
_loop_end_1879:
   push left1870[ebp]
   pop ecx
   push right1870[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349787567184
   push 1
   jmp _compare_end604349787567184
_compare_not_equal604349787567184:
   push 0
_compare_end604349787567184:
   pop eax
   cmp eax, 0
   je _if_end_1881
_if_start_1881:
   push left1870[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1866[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1881[ebp], eax
   push right1870[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1866[ebp]
   push [esi[edx]]
   pop edx
   push left1870[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1866[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1881[ebp]
   pop edx
   push right1870[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1866[ebp]
   add esi, ecx
   mov [esi], edx
   push left1870[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1870[ebp], eax
   push right1870[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1870[ebp], eax
_if_end_1881:
   push left1870[ebp]
   pop ecx
   push right1870[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349788080367
   push 1
   jmp _compare_end604349788080367
_compare_not_equal604349788080367:
   push 0
_compare_end604349788080367:
   pop eax
   cmp eax, 0
   je _loop_end_1873
   jmp _loop_start_1873
_loop_end_1873:

   ; init stack for qs
   push right1870[ebp]
   push arg_first1866[ebp]
   push arg_s_arr1866[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1866[ebp]
   push left1870[ebp]
   push arg_s_arr1866[ebp]
   ; call qs
   call qs

_if_end_1870:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1882[ebp]
   pop ecx
   push arg_last1882[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349788175306
   push 1
   jmp _compare_end604349788175306
_compare_not_equal604349788175306:
   push 0
_compare_end604349788175306:
   pop eax
   cmp eax, 0
   je _if_end_1886
_if_start_1886:
   push arg_first1882[ebp]
   pop eax
   mov left1886[ebp], eax
   push arg_last1882[ebp]
   pop eax
   mov right1886[ebp], eax
   push left1886[ebp]
   push right1886[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1882[ebp]
   push [esi[edx]]
   pop eax
   mov middle1886[ebp], eax
_loop_start_1889:
_loop_aftereffects_1889:
_loop_start_1892:
_loop_aftereffects_1892:
   push left1886[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1882[ebp]
   push [esi[edx]]
   pop ecx
   push middle1886[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349788305313
   push 1
   jmp _compare_end604349788305313
_compare_not_equal604349788305313:
   push 0
_compare_end604349788305313:
   pop eax
   cmp eax, 0
   je _loop_end_1892
   push left1886[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1886[ebp], eax
   jmp _loop_start_1892
_loop_end_1892:
_loop_start_1895:
_loop_aftereffects_1895:
   push right1886[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1882[ebp]
   push [esi[edx]]
   pop ecx
   push middle1886[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349788374165
   push 1
   jmp _compare_end604349788374165
_compare_not_equal604349788374165:
   push 0
_compare_end604349788374165:
   pop eax
   cmp eax, 0
   je _loop_end_1895
   push right1886[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1886[ebp], eax
   jmp _loop_start_1895
_loop_end_1895:
   push left1886[ebp]
   pop ecx
   push right1886[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349788443445
   push 1
   jmp _compare_end604349788443445
_compare_not_equal604349788443445:
   push 0
_compare_end604349788443445:
   pop eax
   cmp eax, 0
   je _if_end_1897
_if_start_1897:
   push left1886[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1882[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1897[ebp], eax
   push right1886[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1882[ebp]
   push [esi[edx]]
   pop edx
   push left1886[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1882[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1897[ebp]
   pop edx
   push right1886[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1882[ebp]
   add esi, ecx
   mov [esi], edx
   push left1886[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1886[ebp], eax
   push right1886[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1886[ebp], eax
_if_end_1897:
   push left1886[ebp]
   pop ecx
   push right1886[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349788700892
   push 1
   jmp _compare_end604349788700892
_compare_not_equal604349788700892:
   push 0
_compare_end604349788700892:
   pop eax
   cmp eax, 0
   je _loop_end_1889
   jmp _loop_start_1889
_loop_end_1889:

   ; init stack for qs
   push right1886[ebp]
   push arg_first1882[ebp]
   push arg_s_arr1882[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1882[ebp]
   push left1886[ebp]
   push arg_s_arr1882[ebp]
   ; call qs
   call qs

_if_end_1886:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1898[ebp]
   pop ecx
   push arg_last1898[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349788794976
   push 1
   jmp _compare_end604349788794976
_compare_not_equal604349788794976:
   push 0
_compare_end604349788794976:
   pop eax
   cmp eax, 0
   je _if_end_1902
_if_start_1902:
   push arg_first1898[ebp]
   pop eax
   mov left1902[ebp], eax
   push arg_last1898[ebp]
   pop eax
   mov right1902[ebp], eax
   push left1902[ebp]
   push right1902[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1898[ebp]
   push [esi[edx]]
   pop eax
   mov middle1902[ebp], eax
_loop_start_1905:
_loop_aftereffects_1905:
_loop_start_1908:
_loop_aftereffects_1908:
   push left1902[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1898[ebp]
   push [esi[edx]]
   pop ecx
   push middle1902[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349788925410
   push 1
   jmp _compare_end604349788925410
_compare_not_equal604349788925410:
   push 0
_compare_end604349788925410:
   pop eax
   cmp eax, 0
   je _loop_end_1908
   push left1902[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1902[ebp], eax
   jmp _loop_start_1908
_loop_end_1908:
_loop_start_1911:
_loop_aftereffects_1911:
   push right1902[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1898[ebp]
   push [esi[edx]]
   pop ecx
   push middle1902[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349788995117
   push 1
   jmp _compare_end604349788995117
_compare_not_equal604349788995117:
   push 0
_compare_end604349788995117:
   pop eax
   cmp eax, 0
   je _loop_end_1911
   push right1902[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1902[ebp], eax
   jmp _loop_start_1911
_loop_end_1911:
   push left1902[ebp]
   pop ecx
   push right1902[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349789064397
   push 1
   jmp _compare_end604349789064397
_compare_not_equal604349789064397:
   push 0
_compare_end604349789064397:
   pop eax
   cmp eax, 0
   je _if_end_1913
_if_start_1913:
   push left1902[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1898[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1913[ebp], eax
   push right1902[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1898[ebp]
   push [esi[edx]]
   pop edx
   push left1902[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1898[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1913[ebp]
   pop edx
   push right1902[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1898[ebp]
   add esi, ecx
   mov [esi], edx
   push left1902[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1902[ebp], eax
   push right1902[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1902[ebp], eax
_if_end_1913:
   push left1902[ebp]
   pop ecx
   push right1902[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349789307304
   push 1
   jmp _compare_end604349789307304
_compare_not_equal604349789307304:
   push 0
_compare_end604349789307304:
   pop eax
   cmp eax, 0
   je _loop_end_1905
   jmp _loop_start_1905
_loop_end_1905:

   ; init stack for qs
   push right1902[ebp]
   push arg_first1898[ebp]
   push arg_s_arr1898[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1898[ebp]
   push left1902[ebp]
   push arg_s_arr1898[ebp]
   ; call qs
   call qs

_if_end_1902:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1914[ebp]
   pop ecx
   push arg_last1914[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349789402671
   push 1
   jmp _compare_end604349789402671
_compare_not_equal604349789402671:
   push 0
_compare_end604349789402671:
   pop eax
   cmp eax, 0
   je _if_end_1918
_if_start_1918:
   push arg_first1914[ebp]
   pop eax
   mov left1918[ebp], eax
   push arg_last1914[ebp]
   pop eax
   mov right1918[ebp], eax
   push left1918[ebp]
   push right1918[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1914[ebp]
   push [esi[edx]]
   pop eax
   mov middle1918[ebp], eax
_loop_start_1921:
_loop_aftereffects_1921:
_loop_start_1924:
_loop_aftereffects_1924:
   push left1918[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1914[ebp]
   push [esi[edx]]
   pop ecx
   push middle1918[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349789531822
   push 1
   jmp _compare_end604349789531822
_compare_not_equal604349789531822:
   push 0
_compare_end604349789531822:
   pop eax
   cmp eax, 0
   je _loop_end_1924
   push left1918[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1918[ebp], eax
   jmp _loop_start_1924
_loop_end_1924:
_loop_start_1927:
_loop_aftereffects_1927:
   push right1918[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1914[ebp]
   push [esi[edx]]
   pop ecx
   push middle1918[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349789604951
   push 1
   jmp _compare_end604349789604951
_compare_not_equal604349789604951:
   push 0
_compare_end604349789604951:
   pop eax
   cmp eax, 0
   je _loop_end_1927
   push right1918[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1918[ebp], eax
   jmp _loop_start_1927
_loop_end_1927:
   push left1918[ebp]
   pop ecx
   push right1918[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349789676369
   push 1
   jmp _compare_end604349789676369
_compare_not_equal604349789676369:
   push 0
_compare_end604349789676369:
   pop eax
   cmp eax, 0
   je _if_end_1929
_if_start_1929:
   push left1918[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1914[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1929[ebp], eax
   push right1918[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1914[ebp]
   push [esi[edx]]
   pop edx
   push left1918[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1914[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1929[ebp]
   pop edx
   push right1918[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1914[ebp]
   add esi, ecx
   mov [esi], edx
   push left1918[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1918[ebp], eax
   push right1918[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1918[ebp], eax
_if_end_1929:
   push left1918[ebp]
   pop ecx
   push right1918[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349789899604
   push 1
   jmp _compare_end604349789899604
_compare_not_equal604349789899604:
   push 0
_compare_end604349789899604:
   pop eax
   cmp eax, 0
   je _loop_end_1921
   jmp _loop_start_1921
_loop_end_1921:

   ; init stack for qs
   push right1918[ebp]
   push arg_first1914[ebp]
   push arg_s_arr1914[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1914[ebp]
   push left1918[ebp]
   push arg_s_arr1914[ebp]
   ; call qs
   call qs

_if_end_1918:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1930[ebp]
   pop ecx
   push arg_last1930[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349789994115
   push 1
   jmp _compare_end604349789994115
_compare_not_equal604349789994115:
   push 0
_compare_end604349789994115:
   pop eax
   cmp eax, 0
   je _if_end_1934
_if_start_1934:
   push arg_first1930[ebp]
   pop eax
   mov left1934[ebp], eax
   push arg_last1930[ebp]
   pop eax
   mov right1934[ebp], eax
   push left1934[ebp]
   push right1934[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1930[ebp]
   push [esi[edx]]
   pop eax
   mov middle1934[ebp], eax
_loop_start_1937:
_loop_aftereffects_1937:
_loop_start_1940:
_loop_aftereffects_1940:
   push left1934[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1930[ebp]
   push [esi[edx]]
   pop ecx
   push middle1934[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349790123266
   push 1
   jmp _compare_end604349790123266
_compare_not_equal604349790123266:
   push 0
_compare_end604349790123266:
   pop eax
   cmp eax, 0
   je _loop_end_1940
   push left1934[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1934[ebp], eax
   jmp _loop_start_1940
_loop_end_1940:
_loop_start_1943:
_loop_aftereffects_1943:
   push right1934[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1930[ebp]
   push [esi[edx]]
   pop ecx
   push middle1934[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349790195112
   push 1
   jmp _compare_end604349790195112
_compare_not_equal604349790195112:
   push 0
_compare_end604349790195112:
   pop eax
   cmp eax, 0
   je _loop_end_1943
   push right1934[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1934[ebp], eax
   jmp _loop_start_1943
_loop_end_1943:
   push left1934[ebp]
   pop ecx
   push right1934[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349790268241
   push 1
   jmp _compare_end604349790268241
_compare_not_equal604349790268241:
   push 0
_compare_end604349790268241:
   pop eax
   cmp eax, 0
   je _if_end_1945
_if_start_1945:
   push left1934[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1930[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1945[ebp], eax
   push right1934[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1930[ebp]
   push [esi[edx]]
   pop edx
   push left1934[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1930[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1945[ebp]
   pop edx
   push right1934[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1930[ebp]
   add esi, ecx
   mov [esi], edx
   push left1934[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1934[ebp], eax
   push right1934[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1934[ebp], eax
_if_end_1945:
   push left1934[ebp]
   pop ecx
   push right1934[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349790493614
   push 1
   jmp _compare_end604349790493614
_compare_not_equal604349790493614:
   push 0
_compare_end604349790493614:
   pop eax
   cmp eax, 0
   je _loop_end_1937
   jmp _loop_start_1937
_loop_end_1937:

   ; init stack for qs
   push right1934[ebp]
   push arg_first1930[ebp]
   push arg_s_arr1930[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1930[ebp]
   push left1934[ebp]
   push arg_s_arr1930[ebp]
   ; call qs
   call qs

_if_end_1934:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1946[ebp]
   pop ecx
   push arg_last1946[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349790588980
   push 1
   jmp _compare_end604349790588980
_compare_not_equal604349790588980:
   push 0
_compare_end604349790588980:
   pop eax
   cmp eax, 0
   je _if_end_1950
_if_start_1950:
   push arg_first1946[ebp]
   pop eax
   mov left1950[ebp], eax
   push arg_last1946[ebp]
   pop eax
   mov right1950[ebp], eax
   push left1950[ebp]
   push right1950[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1946[ebp]
   push [esi[edx]]
   pop eax
   mov middle1950[ebp], eax
_loop_start_1953:
_loop_aftereffects_1953:
_loop_start_1956:
_loop_aftereffects_1956:
   push left1950[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1946[ebp]
   push [esi[edx]]
   pop ecx
   push middle1950[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349790721125
   push 1
   jmp _compare_end604349790721125
_compare_not_equal604349790721125:
   push 0
_compare_end604349790721125:
   pop eax
   cmp eax, 0
   je _loop_end_1956
   push left1950[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1950[ebp], eax
   jmp _loop_start_1956
_loop_end_1956:
_loop_start_1959:
_loop_aftereffects_1959:
   push right1950[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1946[ebp]
   push [esi[edx]]
   pop ecx
   push middle1950[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349790791688
   push 1
   jmp _compare_end604349790791688
_compare_not_equal604349790791688:
   push 0
_compare_end604349790791688:
   pop eax
   cmp eax, 0
   je _loop_end_1959
   push right1950[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1950[ebp], eax
   jmp _loop_start_1959
_loop_end_1959:
   push left1950[ebp]
   pop ecx
   push right1950[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349790865244
   push 1
   jmp _compare_end604349790865244
_compare_not_equal604349790865244:
   push 0
_compare_end604349790865244:
   pop eax
   cmp eax, 0
   je _if_end_1961
_if_start_1961:
   push left1950[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1946[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1961[ebp], eax
   push right1950[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1946[ebp]
   push [esi[edx]]
   pop edx
   push left1950[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1946[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1961[ebp]
   pop edx
   push right1950[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1946[ebp]
   add esi, ecx
   mov [esi], edx
   push left1950[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1950[ebp], eax
   push right1950[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1950[ebp], eax
_if_end_1961:
   push left1950[ebp]
   pop ecx
   push right1950[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349791091900
   push 1
   jmp _compare_end604349791091900
_compare_not_equal604349791091900:
   push 0
_compare_end604349791091900:
   pop eax
   cmp eax, 0
   je _loop_end_1953
   jmp _loop_start_1953
_loop_end_1953:

   ; init stack for qs
   push right1950[ebp]
   push arg_first1946[ebp]
   push arg_s_arr1946[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1946[ebp]
   push left1950[ebp]
   push arg_s_arr1946[ebp]
   ; call qs
   call qs

_if_end_1950:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1962[ebp]
   pop ecx
   push arg_last1962[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349791209933
   push 1
   jmp _compare_end604349791209933
_compare_not_equal604349791209933:
   push 0
_compare_end604349791209933:
   pop eax
   cmp eax, 0
   je _if_end_1966
_if_start_1966:
   push arg_first1962[ebp]
   pop eax
   mov left1966[ebp], eax
   push arg_last1962[ebp]
   pop eax
   mov right1966[ebp], eax
   push left1966[ebp]
   push right1966[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1962[ebp]
   push [esi[edx]]
   pop eax
   mov middle1966[ebp], eax
_loop_start_1969:
_loop_aftereffects_1969:
_loop_start_1972:
_loop_aftereffects_1972:
   push left1966[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1962[ebp]
   push [esi[edx]]
   pop ecx
   push middle1966[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349791809075
   push 1
   jmp _compare_end604349791809075
_compare_not_equal604349791809075:
   push 0
_compare_end604349791809075:
   pop eax
   cmp eax, 0
   je _loop_end_1972
   push left1966[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1966[ebp], eax
   jmp _loop_start_1972
_loop_end_1972:
_loop_start_1975:
_loop_aftereffects_1975:
   push right1966[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1962[ebp]
   push [esi[edx]]
   pop ecx
   push middle1966[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349791881348
   push 1
   jmp _compare_end604349791881348
_compare_not_equal604349791881348:
   push 0
_compare_end604349791881348:
   pop eax
   cmp eax, 0
   je _loop_end_1975
   push right1966[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1966[ebp], eax
   jmp _loop_start_1975
_loop_end_1975:
   push left1966[ebp]
   pop ecx
   push right1966[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349791953194
   push 1
   jmp _compare_end604349791953194
_compare_not_equal604349791953194:
   push 0
_compare_end604349791953194:
   pop eax
   cmp eax, 0
   je _if_end_1977
_if_start_1977:
   push left1966[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1962[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1977[ebp], eax
   push right1966[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1962[ebp]
   push [esi[edx]]
   pop edx
   push left1966[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1962[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1977[ebp]
   pop edx
   push right1966[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1962[ebp]
   add esi, ecx
   mov [esi], edx
   push left1966[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1966[ebp], eax
   push right1966[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1966[ebp], eax
_if_end_1977:
   push left1966[ebp]
   pop ecx
   push right1966[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349792208503
   push 1
   jmp _compare_end604349792208503
_compare_not_equal604349792208503:
   push 0
_compare_end604349792208503:
   pop eax
   cmp eax, 0
   je _loop_end_1969
   jmp _loop_start_1969
_loop_end_1969:

   ; init stack for qs
   push right1966[ebp]
   push arg_first1962[ebp]
   push arg_s_arr1962[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1962[ebp]
   push left1966[ebp]
   push arg_s_arr1962[ebp]
   ; call qs
   call qs

_if_end_1966:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1978[ebp]
   pop ecx
   push arg_last1978[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349792316271
   push 1
   jmp _compare_end604349792316271
_compare_not_equal604349792316271:
   push 0
_compare_end604349792316271:
   pop eax
   cmp eax, 0
   je _if_end_1982
_if_start_1982:
   push arg_first1978[ebp]
   pop eax
   mov left1982[ebp], eax
   push arg_last1978[ebp]
   pop eax
   mov right1982[ebp], eax
   push left1982[ebp]
   push right1982[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1978[ebp]
   push [esi[edx]]
   pop eax
   mov middle1982[ebp], eax
_loop_start_1985:
_loop_aftereffects_1985:
_loop_start_1988:
_loop_aftereffects_1988:
   push left1982[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1978[ebp]
   push [esi[edx]]
   pop ecx
   push middle1982[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349792448844
   push 1
   jmp _compare_end604349792448844
_compare_not_equal604349792448844:
   push 0
_compare_end604349792448844:
   pop eax
   cmp eax, 0
   je _loop_end_1988
   push left1982[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1982[ebp], eax
   jmp _loop_start_1988
_loop_end_1988:
_loop_start_1991:
_loop_aftereffects_1991:
   push right1982[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1978[ebp]
   push [esi[edx]]
   pop ecx
   push middle1982[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349792520689
   push 1
   jmp _compare_end604349792520689
_compare_not_equal604349792520689:
   push 0
_compare_end604349792520689:
   pop eax
   cmp eax, 0
   je _loop_end_1991
   push right1982[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1982[ebp], eax
   jmp _loop_start_1991
_loop_end_1991:
   push left1982[ebp]
   pop ecx
   push right1982[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349792592963
   push 1
   jmp _compare_end604349792592963
_compare_not_equal604349792592963:
   push 0
_compare_end604349792592963:
   pop eax
   cmp eax, 0
   je _if_end_1993
_if_start_1993:
   push left1982[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1978[ebp]
   push [esi[edx]]
   pop eax
   mov tmp1993[ebp], eax
   push right1982[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1978[ebp]
   push [esi[edx]]
   pop edx
   push left1982[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1978[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp1993[ebp]
   pop edx
   push right1982[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1978[ebp]
   add esi, ecx
   mov [esi], edx
   push left1982[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1982[ebp], eax
   push right1982[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1982[ebp], eax
_if_end_1993:
   push left1982[ebp]
   pop ecx
   push right1982[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349792848699
   push 1
   jmp _compare_end604349792848699
_compare_not_equal604349792848699:
   push 0
_compare_end604349792848699:
   pop eax
   cmp eax, 0
   je _loop_end_1985
   jmp _loop_start_1985
_loop_end_1985:

   ; init stack for qs
   push right1982[ebp]
   push arg_first1978[ebp]
   push arg_s_arr1978[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1978[ebp]
   push left1982[ebp]
   push arg_s_arr1978[ebp]
   ; call qs
   call qs

_if_end_1982:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first1994[ebp]
   pop ecx
   push arg_last1994[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349792956040
   push 1
   jmp _compare_end604349792956040
_compare_not_equal604349792956040:
   push 0
_compare_end604349792956040:
   pop eax
   cmp eax, 0
   je _if_end_1998
_if_start_1998:
   push arg_first1994[ebp]
   pop eax
   mov left1998[ebp], eax
   push arg_last1994[ebp]
   pop eax
   mov right1998[ebp], eax
   push left1998[ebp]
   push right1998[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1994[ebp]
   push [esi[edx]]
   pop eax
   mov middle1998[ebp], eax
_loop_start_2001:
_loop_aftereffects_2001:
_loop_start_2004:
_loop_aftereffects_2004:
   push left1998[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1994[ebp]
   push [esi[edx]]
   pop ecx
   push middle1998[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349793089040
   push 1
   jmp _compare_end604349793089040
_compare_not_equal604349793089040:
   push 0
_compare_end604349793089040:
   pop eax
   cmp eax, 0
   je _loop_end_2004
   push left1998[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1998[ebp], eax
   jmp _loop_start_2004
_loop_end_2004:
_loop_start_2007:
_loop_aftereffects_2007:
   push right1998[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1994[ebp]
   push [esi[edx]]
   pop ecx
   push middle1998[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349793161314
   push 1
   jmp _compare_end604349793161314
_compare_not_equal604349793161314:
   push 0
_compare_end604349793161314:
   pop eax
   cmp eax, 0
   je _loop_end_2007
   push right1998[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1998[ebp], eax
   jmp _loop_start_2007
_loop_end_2007:
   push left1998[ebp]
   pop ecx
   push right1998[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349793235298
   push 1
   jmp _compare_end604349793235298
_compare_not_equal604349793235298:
   push 0
_compare_end604349793235298:
   pop eax
   cmp eax, 0
   je _if_end_2009
_if_start_2009:
   push left1998[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1994[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2009[ebp], eax
   push right1998[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr1994[ebp]
   push [esi[edx]]
   pop edx
   push left1998[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1994[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2009[ebp]
   pop edx
   push right1998[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr1994[ebp]
   add esi, ecx
   mov [esi], edx
   push left1998[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left1998[ebp], eax
   push right1998[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right1998[ebp], eax
_if_end_2009:
   push left1998[ebp]
   pop ecx
   push right1998[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349793467513
   push 1
   jmp _compare_end604349793467513
_compare_not_equal604349793467513:
   push 0
_compare_end604349793467513:
   pop eax
   cmp eax, 0
   je _loop_end_2001
   jmp _loop_start_2001
_loop_end_2001:

   ; init stack for qs
   push right1998[ebp]
   push arg_first1994[ebp]
   push arg_s_arr1994[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last1994[ebp]
   push left1998[ebp]
   push arg_s_arr1994[ebp]
   ; call qs
   call qs

_if_end_1998:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2010[ebp]
   pop ecx
   push arg_last2010[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349793568867
   push 1
   jmp _compare_end604349793568867
_compare_not_equal604349793568867:
   push 0
_compare_end604349793568867:
   pop eax
   cmp eax, 0
   je _if_end_2014
_if_start_2014:
   push arg_first2010[ebp]
   pop eax
   mov left2014[ebp], eax
   push arg_last2010[ebp]
   pop eax
   mov right2014[ebp], eax
   push left2014[ebp]
   push right2014[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2010[ebp]
   push [esi[edx]]
   pop eax
   mov middle2014[ebp], eax
_loop_start_2017:
_loop_aftereffects_2017:
_loop_start_2020:
_loop_aftereffects_2020:
   push left2014[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2010[ebp]
   push [esi[edx]]
   pop ecx
   push middle2014[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349793727099
   push 1
   jmp _compare_end604349793727099
_compare_not_equal604349793727099:
   push 0
_compare_end604349793727099:
   pop eax
   cmp eax, 0
   je _loop_end_2020
   push left2014[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2014[ebp], eax
   jmp _loop_start_2020
_loop_end_2020:
_loop_start_2023:
_loop_aftereffects_2023:
   push right2014[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2010[ebp]
   push [esi[edx]]
   pop ecx
   push middle2014[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349793800227
   push 1
   jmp _compare_end604349793800227
_compare_not_equal604349793800227:
   push 0
_compare_end604349793800227:
   pop eax
   cmp eax, 0
   je _loop_end_2023
   push right2014[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2014[ebp], eax
   jmp _loop_start_2023
_loop_end_2023:
   push left2014[ebp]
   pop ecx
   push right2014[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349793872501
   push 1
   jmp _compare_end604349793872501
_compare_not_equal604349793872501:
   push 0
_compare_end604349793872501:
   pop eax
   cmp eax, 0
   je _if_end_2025
_if_start_2025:
   push left2014[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2010[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2025[ebp], eax
   push right2014[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2010[ebp]
   push [esi[edx]]
   pop edx
   push left2014[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2010[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2025[ebp]
   pop edx
   push right2014[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2010[ebp]
   add esi, ecx
   mov [esi], edx
   push left2014[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2014[ebp], eax
   push right2014[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2014[ebp], eax
_if_end_2025:
   push left2014[ebp]
   pop ecx
   push right2014[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349794105999
   push 1
   jmp _compare_end604349794105999
_compare_not_equal604349794105999:
   push 0
_compare_end604349794105999:
   pop eax
   cmp eax, 0
   je _loop_end_2017
   jmp _loop_start_2017
_loop_end_2017:

   ; init stack for qs
   push right2014[ebp]
   push arg_first2010[ebp]
   push arg_s_arr2010[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2010[ebp]
   push left2014[ebp]
   push arg_s_arr2010[ebp]
   ; call qs
   call qs

_if_end_2014:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2026[ebp]
   pop ecx
   push arg_last2026[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349794230446
   push 1
   jmp _compare_end604349794230446
_compare_not_equal604349794230446:
   push 0
_compare_end604349794230446:
   pop eax
   cmp eax, 0
   je _if_end_2030
_if_start_2030:
   push arg_first2026[ebp]
   pop eax
   mov left2030[ebp], eax
   push arg_last2026[ebp]
   pop eax
   mov right2030[ebp], eax
   push left2030[ebp]
   push right2030[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2026[ebp]
   push [esi[edx]]
   pop eax
   mov middle2030[ebp], eax
_loop_start_2033:
_loop_aftereffects_2033:
_loop_start_2036:
_loop_aftereffects_2036:
   push left2030[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2026[ebp]
   push [esi[edx]]
   pop ecx
   push middle2030[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349794398086
   push 1
   jmp _compare_end604349794398086
_compare_not_equal604349794398086:
   push 0
_compare_end604349794398086:
   pop eax
   cmp eax, 0
   je _loop_end_2036
   push left2030[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2030[ebp], eax
   jmp _loop_start_2036
_loop_end_2036:
_loop_start_2039:
_loop_aftereffects_2039:
   push right2030[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2026[ebp]
   push [esi[edx]]
   pop ecx
   push middle2030[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349794526810
   push 1
   jmp _compare_end604349794526810
_compare_not_equal604349794526810:
   push 0
_compare_end604349794526810:
   pop eax
   cmp eax, 0
   je _loop_end_2039
   push right2030[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2030[ebp], eax
   jmp _loop_start_2039
_loop_end_2039:
   push left2030[ebp]
   pop ecx
   push right2030[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349794659382
   push 1
   jmp _compare_end604349794659382
_compare_not_equal604349794659382:
   push 0
_compare_end604349794659382:
   pop eax
   cmp eax, 0
   je _if_end_2041
_if_start_2041:
   push left2030[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2026[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2041[ebp], eax
   push right2030[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2026[ebp]
   push [esi[edx]]
   pop edx
   push left2030[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2026[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2041[ebp]
   pop edx
   push right2030[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2026[ebp]
   add esi, ecx
   mov [esi], edx
   push left2030[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2030[ebp], eax
   push right2030[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2030[ebp], eax
_if_end_2041:
   push left2030[ebp]
   pop ecx
   push right2030[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349795152466
   push 1
   jmp _compare_end604349795152466
_compare_not_equal604349795152466:
   push 0
_compare_end604349795152466:
   pop eax
   cmp eax, 0
   je _loop_end_2033
   jmp _loop_start_2033
_loop_end_2033:

   ; init stack for qs
   push right2030[ebp]
   push arg_first2026[ebp]
   push arg_s_arr2026[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2026[ebp]
   push left2030[ebp]
   push arg_s_arr2026[ebp]
   ; call qs
   call qs

_if_end_2030:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2042[ebp]
   pop ecx
   push arg_last2042[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349795332936
   push 1
   jmp _compare_end604349795332936
_compare_not_equal604349795332936:
   push 0
_compare_end604349795332936:
   pop eax
   cmp eax, 0
   je _if_end_2046
_if_start_2046:
   push arg_first2042[ebp]
   pop eax
   mov left2046[ebp], eax
   push arg_last2042[ebp]
   pop eax
   mov right2046[ebp], eax
   push left2046[ebp]
   push right2046[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2042[ebp]
   push [esi[edx]]
   pop eax
   mov middle2046[ebp], eax
_loop_start_2049:
_loop_aftereffects_2049:
_loop_start_2052:
_loop_aftereffects_2052:
   push left2046[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2042[ebp]
   push [esi[edx]]
   pop ecx
   push middle2046[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349796387956
   push 1
   jmp _compare_end604349796387956
_compare_not_equal604349796387956:
   push 0
_compare_end604349796387956:
   pop eax
   cmp eax, 0
   je _loop_end_2052
   push left2046[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2046[ebp], eax
   jmp _loop_start_2052
_loop_end_2052:
_loop_start_2055:
_loop_aftereffects_2055:
   push right2046[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2042[ebp]
   push [esi[edx]]
   pop ecx
   push middle2046[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349796463651
   push 1
   jmp _compare_end604349796463651
_compare_not_equal604349796463651:
   push 0
_compare_end604349796463651:
   pop eax
   cmp eax, 0
   je _loop_end_2055
   push right2046[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2046[ebp], eax
   jmp _loop_start_2055
_loop_end_2055:
   push left2046[ebp]
   pop ecx
   push right2046[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349796538918
   push 1
   jmp _compare_end604349796538918
_compare_not_equal604349796538918:
   push 0
_compare_end604349796538918:
   pop eax
   cmp eax, 0
   je _if_end_2057
_if_start_2057:
   push left2046[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2042[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2057[ebp], eax
   push right2046[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2042[ebp]
   push [esi[edx]]
   pop edx
   push left2046[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2042[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2057[ebp]
   pop edx
   push right2046[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2042[ebp]
   add esi, ecx
   mov [esi], edx
   push left2046[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2046[ebp], eax
   push right2046[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2046[ebp], eax
_if_end_2057:
   push left2046[ebp]
   pop ecx
   push right2046[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349796779686
   push 1
   jmp _compare_end604349796779686
_compare_not_equal604349796779686:
   push 0
_compare_end604349796779686:
   pop eax
   cmp eax, 0
   je _loop_end_2049
   jmp _loop_start_2049
_loop_end_2049:

   ; init stack for qs
   push right2046[ebp]
   push arg_first2042[ebp]
   push arg_s_arr2042[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2042[ebp]
   push left2046[ebp]
   push arg_s_arr2042[ebp]
   ; call qs
   call qs

_if_end_2046:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2058[ebp]
   pop ecx
   push arg_last2058[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349797215465
   push 1
   jmp _compare_end604349797215465
_compare_not_equal604349797215465:
   push 0
_compare_end604349797215465:
   pop eax
   cmp eax, 0
   je _if_end_2062
_if_start_2062:
   push arg_first2058[ebp]
   pop eax
   mov left2062[ebp], eax
   push arg_last2058[ebp]
   pop eax
   mov right2062[ebp], eax
   push left2062[ebp]
   push right2062[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2058[ebp]
   push [esi[edx]]
   pop eax
   mov middle2062[ebp], eax
_loop_start_2065:
_loop_aftereffects_2065:
_loop_start_2068:
_loop_aftereffects_2068:
   push left2062[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2058[ebp]
   push [esi[edx]]
   pop ecx
   push middle2062[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349797948035
   push 1
   jmp _compare_end604349797948035
_compare_not_equal604349797948035:
   push 0
_compare_end604349797948035:
   pop eax
   cmp eax, 0
   je _loop_end_2068
   push left2062[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2062[ebp], eax
   jmp _loop_start_2068
_loop_end_2068:
_loop_start_2071:
_loop_aftereffects_2071:
   push right2062[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2058[ebp]
   push [esi[edx]]
   pop ecx
   push middle2062[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349798542045
   push 1
   jmp _compare_end604349798542045
_compare_not_equal604349798542045:
   push 0
_compare_end604349798542045:
   pop eax
   cmp eax, 0
   je _loop_end_2071
   push right2062[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2062[ebp], eax
   jmp _loop_start_2071
_loop_end_2071:
   push left2062[ebp]
   pop ecx
   push right2062[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349799145891
   push 1
   jmp _compare_end604349799145891
_compare_not_equal604349799145891:
   push 0
_compare_end604349799145891:
   pop eax
   cmp eax, 0
   je _if_end_2073
_if_start_2073:
   push left2062[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2058[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2073[ebp], eax
   push right2062[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2058[ebp]
   push [esi[edx]]
   pop edx
   push left2062[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2058[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2073[ebp]
   pop edx
   push right2062[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2058[ebp]
   add esi, ecx
   mov [esi], edx
   push left2062[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2062[ebp], eax
   push right2062[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2062[ebp], eax
_if_end_2073:
   push left2062[ebp]
   pop ecx
   push right2062[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349801109246
   push 1
   jmp _compare_end604349801109246
_compare_not_equal604349801109246:
   push 0
_compare_end604349801109246:
   pop eax
   cmp eax, 0
   je _loop_end_2065
   jmp _loop_start_2065
_loop_end_2065:

   ; init stack for qs
   push right2062[ebp]
   push arg_first2058[ebp]
   push arg_s_arr2058[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2058[ebp]
   push left2062[ebp]
   push arg_s_arr2058[ebp]
   ; call qs
   call qs

_if_end_2062:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2074[ebp]
   pop ecx
   push arg_last2074[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349801892279
   push 1
   jmp _compare_end604349801892279
_compare_not_equal604349801892279:
   push 0
_compare_end604349801892279:
   pop eax
   cmp eax, 0
   je _if_end_2078
_if_start_2078:
   push arg_first2074[ebp]
   pop eax
   mov left2078[ebp], eax
   push arg_last2074[ebp]
   pop eax
   mov right2078[ebp], eax
   push left2078[ebp]
   push right2078[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2074[ebp]
   push [esi[edx]]
   pop eax
   mov middle2078[ebp], eax
_loop_start_2081:
_loop_aftereffects_2081:
_loop_start_2084:
_loop_aftereffects_2084:
   push left2078[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2074[ebp]
   push [esi[edx]]
   pop ecx
   push middle2078[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349802857492
   push 1
   jmp _compare_end604349802857492
_compare_not_equal604349802857492:
   push 0
_compare_end604349802857492:
   pop eax
   cmp eax, 0
   je _loop_end_2084
   push left2078[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2078[ebp], eax
   jmp _loop_start_2084
_loop_end_2084:
_loop_start_2087:
_loop_aftereffects_2087:
   push right2078[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2074[ebp]
   push [esi[edx]]
   pop ecx
   push middle2078[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349803491274
   push 1
   jmp _compare_end604349803491274
_compare_not_equal604349803491274:
   push 0
_compare_end604349803491274:
   pop eax
   cmp eax, 0
   je _loop_end_2087
   push right2078[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2078[ebp], eax
   jmp _loop_start_2087
_loop_end_2087:
   push left2078[ebp]
   pop ecx
   push right2078[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349804123773
   push 1
   jmp _compare_end604349804123773
_compare_not_equal604349804123773:
   push 0
_compare_end604349804123773:
   pop eax
   cmp eax, 0
   je _if_end_2089
_if_start_2089:
   push left2078[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2074[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2089[ebp], eax
   push right2078[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2074[ebp]
   push [esi[edx]]
   pop edx
   push left2078[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2074[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2089[ebp]
   pop edx
   push right2078[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2074[ebp]
   add esi, ecx
   mov [esi], edx
   push left2078[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2078[ebp], eax
   push right2078[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2078[ebp], eax
_if_end_2089:
   push left2078[ebp]
   pop ecx
   push right2078[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349805470024
   push 1
   jmp _compare_end604349805470024
_compare_not_equal604349805470024:
   push 0
_compare_end604349805470024:
   pop eax
   cmp eax, 0
   je _loop_end_2081
   jmp _loop_start_2081
_loop_end_2081:

   ; init stack for qs
   push right2078[ebp]
   push arg_first2074[ebp]
   push arg_s_arr2074[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2074[ebp]
   push left2078[ebp]
   push arg_s_arr2074[ebp]
   ; call qs
   call qs

_if_end_2078:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2090[ebp]
   pop ecx
   push arg_last2090[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349806250919
   push 1
   jmp _compare_end604349806250919
_compare_not_equal604349806250919:
   push 0
_compare_end604349806250919:
   pop eax
   cmp eax, 0
   je _if_end_2094
_if_start_2094:
   push arg_first2090[ebp]
   pop eax
   mov left2094[ebp], eax
   push arg_last2090[ebp]
   pop eax
   mov right2094[ebp], eax
   push left2094[ebp]
   push right2094[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2090[ebp]
   push [esi[edx]]
   pop eax
   mov middle2094[ebp], eax
_loop_start_2097:
_loop_aftereffects_2097:
_loop_start_2100:
_loop_aftereffects_2100:
   push left2094[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2090[ebp]
   push [esi[edx]]
   pop ecx
   push middle2094[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349807417557
   push 1
   jmp _compare_end604349807417557
_compare_not_equal604349807417557:
   push 0
_compare_end604349807417557:
   pop eax
   cmp eax, 0
   je _loop_end_2100
   push left2094[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2094[ebp], eax
   jmp _loop_start_2100
_loop_end_2100:
_loop_start_2103:
_loop_aftereffects_2103:
   push right2094[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2090[ebp]
   push [esi[edx]]
   pop ecx
   push middle2094[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349807677997
   push 1
   jmp _compare_end604349807677997
_compare_not_equal604349807677997:
   push 0
_compare_end604349807677997:
   pop eax
   cmp eax, 0
   je _loop_end_2103
   push right2094[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2094[ebp], eax
   jmp _loop_start_2103
_loop_end_2103:
   push left2094[ebp]
   pop ecx
   push right2094[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349807931596
   push 1
   jmp _compare_end604349807931596
_compare_not_equal604349807931596:
   push 0
_compare_end604349807931596:
   pop eax
   cmp eax, 0
   je _if_end_2105
_if_start_2105:
   push left2094[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2090[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2105[ebp], eax
   push right2094[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2090[ebp]
   push [esi[edx]]
   pop edx
   push left2094[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2090[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2105[ebp]
   pop edx
   push right2094[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2090[ebp]
   add esi, ecx
   mov [esi], edx
   push left2094[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2094[ebp], eax
   push right2094[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2094[ebp], eax
_if_end_2105:
   push left2094[ebp]
   pop ecx
   push right2094[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349809457462
   push 1
   jmp _compare_end604349809457462
_compare_not_equal604349809457462:
   push 0
_compare_end604349809457462:
   pop eax
   cmp eax, 0
   je _loop_end_2097
   jmp _loop_start_2097
_loop_end_2097:

   ; init stack for qs
   push right2094[ebp]
   push arg_first2090[ebp]
   push arg_s_arr2090[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2090[ebp]
   push left2094[ebp]
   push arg_s_arr2090[ebp]
   ; call qs
   call qs

_if_end_2094:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2106[ebp]
   pop ecx
   push arg_last2106[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349809814552
   push 1
   jmp _compare_end604349809814552
_compare_not_equal604349809814552:
   push 0
_compare_end604349809814552:
   pop eax
   cmp eax, 0
   je _if_end_2110
_if_start_2110:
   push arg_first2106[ebp]
   pop eax
   mov left2110[ebp], eax
   push arg_last2106[ebp]
   pop eax
   mov right2110[ebp], eax
   push left2110[ebp]
   push right2110[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2106[ebp]
   push [esi[edx]]
   pop eax
   mov middle2110[ebp], eax
_loop_start_2113:
_loop_aftereffects_2113:
_loop_start_2116:
_loop_aftereffects_2116:
   push left2110[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2106[ebp]
   push [esi[edx]]
   pop ecx
   push middle2110[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349809959526
   push 1
   jmp _compare_end604349809959526
_compare_not_equal604349809959526:
   push 0
_compare_end604349809959526:
   pop eax
   cmp eax, 0
   je _loop_end_2116
   push left2110[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2110[ebp], eax
   jmp _loop_start_2116
_loop_end_2116:
_loop_start_2119:
_loop_aftereffects_2119:
   push right2110[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2106[ebp]
   push [esi[edx]]
   pop ecx
   push middle2110[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349810036504
   push 1
   jmp _compare_end604349810036504
_compare_not_equal604349810036504:
   push 0
_compare_end604349810036504:
   pop eax
   cmp eax, 0
   je _loop_end_2119
   push right2110[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2110[ebp], eax
   jmp _loop_start_2119
_loop_end_2119:
   push left2110[ebp]
   pop ecx
   push right2110[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349810117758
   push 1
   jmp _compare_end604349810117758
_compare_not_equal604349810117758:
   push 0
_compare_end604349810117758:
   pop eax
   cmp eax, 0
   je _if_end_2121
_if_start_2121:
   push left2110[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2106[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2121[ebp], eax
   push right2110[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2106[ebp]
   push [esi[edx]]
   pop edx
   push left2110[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2106[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2121[ebp]
   pop edx
   push right2110[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2106[ebp]
   add esi, ecx
   mov [esi], edx
   push left2110[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2110[ebp], eax
   push right2110[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2110[ebp], eax
_if_end_2121:
   push left2110[ebp]
   pop ecx
   push right2110[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349810434221
   push 1
   jmp _compare_end604349810434221
_compare_not_equal604349810434221:
   push 0
_compare_end604349810434221:
   pop eax
   cmp eax, 0
   je _loop_end_2113
   jmp _loop_start_2113
_loop_end_2113:

   ; init stack for qs
   push right2110[ebp]
   push arg_first2106[ebp]
   push arg_s_arr2106[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2106[ebp]
   push left2110[ebp]
   push arg_s_arr2106[ebp]
   ; call qs
   call qs

_if_end_2110:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2122[ebp]
   pop ecx
   push arg_last2122[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349810540707
   push 1
   jmp _compare_end604349810540707
_compare_not_equal604349810540707:
   push 0
_compare_end604349810540707:
   pop eax
   cmp eax, 0
   je _if_end_2126
_if_start_2126:
   push arg_first2122[ebp]
   pop eax
   mov left2126[ebp], eax
   push arg_last2122[ebp]
   pop eax
   mov right2126[ebp], eax
   push left2126[ebp]
   push right2126[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2122[ebp]
   push [esi[edx]]
   pop eax
   mov middle2126[ebp], eax
_loop_start_2129:
_loop_aftereffects_2129:
_loop_start_2132:
_loop_aftereffects_2132:
   push left2126[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2122[ebp]
   push [esi[edx]]
   pop ecx
   push middle2126[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349810689958
   push 1
   jmp _compare_end604349810689958
_compare_not_equal604349810689958:
   push 0
_compare_end604349810689958:
   pop eax
   cmp eax, 0
   je _loop_end_2132
   push left2126[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2126[ebp], eax
   jmp _loop_start_2132
_loop_end_2132:
_loop_start_2135:
_loop_aftereffects_2135:
   push right2126[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2122[ebp]
   push [esi[edx]]
   pop ecx
   push middle2126[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349810769074
   push 1
   jmp _compare_end604349810769074
_compare_not_equal604349810769074:
   push 0
_compare_end604349810769074:
   pop eax
   cmp eax, 0
   je _loop_end_2135
   push right2126[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2126[ebp], eax
   jmp _loop_start_2135
_loop_end_2135:
   push left2126[ebp]
   pop ecx
   push right2126[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349810846051
   push 1
   jmp _compare_end604349810846051
_compare_not_equal604349810846051:
   push 0
_compare_end604349810846051:
   pop eax
   cmp eax, 0
   je _if_end_2137
_if_start_2137:
   push left2126[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2122[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2137[ebp], eax
   push right2126[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2122[ebp]
   push [esi[edx]]
   pop edx
   push left2126[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2122[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2137[ebp]
   pop edx
   push right2126[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2122[ebp]
   add esi, ecx
   mov [esi], edx
   push left2126[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2126[ebp], eax
   push right2126[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2126[ebp], eax
_if_end_2137:
   push left2126[ebp]
   pop ecx
   push right2126[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349811098794
   push 1
   jmp _compare_end604349811098794
_compare_not_equal604349811098794:
   push 0
_compare_end604349811098794:
   pop eax
   cmp eax, 0
   je _loop_end_2129
   jmp _loop_start_2129
_loop_end_2129:

   ; init stack for qs
   push right2126[ebp]
   push arg_first2122[ebp]
   push arg_s_arr2122[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2122[ebp]
   push left2126[ebp]
   push arg_s_arr2122[ebp]
   ; call qs
   call qs

_if_end_2126:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2138[ebp]
   pop ecx
   push arg_last2138[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349811208273
   push 1
   jmp _compare_end604349811208273
_compare_not_equal604349811208273:
   push 0
_compare_end604349811208273:
   pop eax
   cmp eax, 0
   je _if_end_2142
_if_start_2142:
   push arg_first2138[ebp]
   pop eax
   mov left2142[ebp], eax
   push arg_last2138[ebp]
   pop eax
   mov right2142[ebp], eax
   push left2142[ebp]
   push right2142[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2138[ebp]
   push [esi[edx]]
   pop eax
   mov middle2142[ebp], eax
_loop_start_2145:
_loop_aftereffects_2145:
_loop_start_2148:
_loop_aftereffects_2148:
   push left2142[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2138[ebp]
   push [esi[edx]]
   pop ecx
   push middle2142[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349811350682
   push 1
   jmp _compare_end604349811350682
_compare_not_equal604349811350682:
   push 0
_compare_end604349811350682:
   pop eax
   cmp eax, 0
   je _loop_end_2148
   push left2142[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2142[ebp], eax
   jmp _loop_start_2148
_loop_end_2148:
_loop_start_2151:
_loop_aftereffects_2151:
   push right2142[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2138[ebp]
   push [esi[edx]]
   pop ecx
   push middle2142[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349811430225
   push 1
   jmp _compare_end604349811430225
_compare_not_equal604349811430225:
   push 0
_compare_end604349811430225:
   pop eax
   cmp eax, 0
   je _loop_end_2151
   push right2142[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2142[ebp], eax
   jmp _loop_start_2151
_loop_end_2151:
   push left2142[ebp]
   pop ecx
   push right2142[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349811507203
   push 1
   jmp _compare_end604349811507203
_compare_not_equal604349811507203:
   push 0
_compare_end604349811507203:
   pop eax
   cmp eax, 0
   je _if_end_2153
_if_start_2153:
   push left2142[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2138[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2153[ebp], eax
   push right2142[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2138[ebp]
   push [esi[edx]]
   pop edx
   push left2142[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2138[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2153[ebp]
   pop edx
   push right2142[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2138[ebp]
   add esi, ecx
   mov [esi], edx
   push left2142[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2142[ebp], eax
   push right2142[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2142[ebp], eax
_if_end_2153:
   push left2142[ebp]
   pop ecx
   push right2142[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349811892946
   push 1
   jmp _compare_end604349811892946
_compare_not_equal604349811892946:
   push 0
_compare_end604349811892946:
   pop eax
   cmp eax, 0
   je _loop_end_2145
   jmp _loop_start_2145
_loop_end_2145:

   ; init stack for qs
   push right2142[ebp]
   push arg_first2138[ebp]
   push arg_s_arr2138[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2138[ebp]
   push left2142[ebp]
   push arg_s_arr2138[ebp]
   ; call qs
   call qs

_if_end_2142:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2154[ebp]
   pop ecx
   push arg_last2154[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349811999432
   push 1
   jmp _compare_end604349811999432
_compare_not_equal604349811999432:
   push 0
_compare_end604349811999432:
   pop eax
   cmp eax, 0
   je _if_end_2158
_if_start_2158:
   push arg_first2154[ebp]
   pop eax
   mov left2158[ebp], eax
   push arg_last2154[ebp]
   pop eax
   mov right2158[ebp], eax
   push left2158[ebp]
   push right2158[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2154[ebp]
   push [esi[edx]]
   pop eax
   mov middle2158[ebp], eax
_loop_start_2161:
_loop_aftereffects_2161:
_loop_start_2164:
_loop_aftereffects_2164:
   push left2158[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2154[ebp]
   push [esi[edx]]
   pop ecx
   push middle2158[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349812142695
   push 1
   jmp _compare_end604349812142695
_compare_not_equal604349812142695:
   push 0
_compare_end604349812142695:
   pop eax
   cmp eax, 0
   je _loop_end_2164
   push left2158[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2158[ebp], eax
   jmp _loop_start_2164
_loop_end_2164:
_loop_start_2167:
_loop_aftereffects_2167:
   push right2158[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2154[ebp]
   push [esi[edx]]
   pop ecx
   push middle2158[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349812226943
   push 1
   jmp _compare_end604349812226943
_compare_not_equal604349812226943:
   push 0
_compare_end604349812226943:
   pop eax
   cmp eax, 0
   je _loop_end_2167
   push right2158[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2158[ebp], eax
   jmp _loop_start_2167
_loop_end_2167:
   push left2158[ebp]
   pop ecx
   push right2158[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349812304776
   push 1
   jmp _compare_end604349812304776
_compare_not_equal604349812304776:
   push 0
_compare_end604349812304776:
   pop eax
   cmp eax, 0
   je _if_end_2169
_if_start_2169:
   push left2158[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2154[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2169[ebp], eax
   push right2158[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2154[ebp]
   push [esi[edx]]
   pop edx
   push left2158[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2154[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2169[ebp]
   pop edx
   push right2158[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2154[ebp]
   add esi, ecx
   mov [esi], edx
   push left2158[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2158[ebp], eax
   push right2158[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2158[ebp], eax
_if_end_2169:
   push left2158[ebp]
   pop ecx
   push right2158[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349812554953
   push 1
   jmp _compare_end604349812554953
_compare_not_equal604349812554953:
   push 0
_compare_end604349812554953:
   pop eax
   cmp eax, 0
   je _loop_end_2161
   jmp _loop_start_2161
_loop_end_2161:

   ; init stack for qs
   push right2158[ebp]
   push arg_first2154[ebp]
   push arg_s_arr2154[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2154[ebp]
   push left2158[ebp]
   push arg_s_arr2154[ebp]
   ; call qs
   call qs

_if_end_2158:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2170[ebp]
   pop ecx
   push arg_last2170[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349812662721
   push 1
   jmp _compare_end604349812662721
_compare_not_equal604349812662721:
   push 0
_compare_end604349812662721:
   pop eax
   cmp eax, 0
   je _if_end_2174
_if_start_2174:
   push arg_first2170[ebp]
   pop eax
   mov left2174[ebp], eax
   push arg_last2170[ebp]
   pop eax
   mov right2174[ebp], eax
   push left2174[ebp]
   push right2174[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2170[ebp]
   push [esi[edx]]
   pop eax
   mov middle2174[ebp], eax
_loop_start_2177:
_loop_aftereffects_2177:
_loop_start_2180:
_loop_aftereffects_2180:
   push left2174[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2170[ebp]
   push [esi[edx]]
   pop ecx
   push middle2174[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349812811972
   push 1
   jmp _compare_end604349812811972
_compare_not_equal604349812811972:
   push 0
_compare_end604349812811972:
   pop eax
   cmp eax, 0
   je _loop_end_2180
   push left2174[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2174[ebp], eax
   jmp _loop_start_2180
_loop_end_2180:
_loop_start_2183:
_loop_aftereffects_2183:
   push right2174[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2170[ebp]
   push [esi[edx]]
   pop ecx
   push middle2174[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349812890233
   push 1
   jmp _compare_end604349812890233
_compare_not_equal604349812890233:
   push 0
_compare_end604349812890233:
   pop eax
   cmp eax, 0
   je _loop_end_2183
   push right2174[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2174[ebp], eax
   jmp _loop_start_2183
_loop_end_2183:
   push left2174[ebp]
   pop ecx
   push right2174[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349812967638
   push 1
   jmp _compare_end604349812967638
_compare_not_equal604349812967638:
   push 0
_compare_end604349812967638:
   pop eax
   cmp eax, 0
   je _if_end_2185
_if_start_2185:
   push left2174[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2170[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2185[ebp], eax
   push right2174[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2170[ebp]
   push [esi[edx]]
   pop edx
   push left2174[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2170[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2185[ebp]
   pop edx
   push right2174[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2170[ebp]
   add esi, ecx
   mov [esi], edx
   push left2174[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2174[ebp], eax
   push right2174[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2174[ebp], eax
_if_end_2185:
   push left2174[ebp]
   pop ecx
   push right2174[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349813223375
   push 1
   jmp _compare_end604349813223375
_compare_not_equal604349813223375:
   push 0
_compare_end604349813223375:
   pop eax
   cmp eax, 0
   je _loop_end_2177
   jmp _loop_start_2177
_loop_end_2177:

   ; init stack for qs
   push right2174[ebp]
   push arg_first2170[ebp]
   push arg_s_arr2170[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2170[ebp]
   push left2174[ebp]
   push arg_s_arr2170[ebp]
   ; call qs
   call qs

_if_end_2174:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2186[ebp]
   pop ecx
   push arg_last2186[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349813331999
   push 1
   jmp _compare_end604349813331999
_compare_not_equal604349813331999:
   push 0
_compare_end604349813331999:
   pop eax
   cmp eax, 0
   je _if_end_2190
_if_start_2190:
   push arg_first2186[ebp]
   pop eax
   mov left2190[ebp], eax
   push arg_last2186[ebp]
   pop eax
   mov right2190[ebp], eax
   push left2190[ebp]
   push right2190[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2186[ebp]
   push [esi[edx]]
   pop eax
   mov middle2190[ebp], eax
_loop_start_2193:
_loop_aftereffects_2193:
_loop_start_2196:
_loop_aftereffects_2196:
   push left2190[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2186[ebp]
   push [esi[edx]]
   pop ecx
   push middle2190[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349813476118
   push 1
   jmp _compare_end604349813476118
_compare_not_equal604349813476118:
   push 0
_compare_end604349813476118:
   pop eax
   cmp eax, 0
   je _loop_end_2196
   push left2190[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2190[ebp], eax
   jmp _loop_start_2196
_loop_end_2196:
_loop_start_2199:
_loop_aftereffects_2199:
   push right2190[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2186[ebp]
   push [esi[edx]]
   pop ecx
   push middle2190[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349813554806
   push 1
   jmp _compare_end604349813554806
_compare_not_equal604349813554806:
   push 0
_compare_end604349813554806:
   pop eax
   cmp eax, 0
   je _loop_end_2199
   push right2190[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2190[ebp], eax
   jmp _loop_start_2199
_loop_end_2199:
   push left2190[ebp]
   pop ecx
   push right2190[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349813633494
   push 1
   jmp _compare_end604349813633494
_compare_not_equal604349813633494:
   push 0
_compare_end604349813633494:
   pop eax
   cmp eax, 0
   je _if_end_2201
_if_start_2201:
   push left2190[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2186[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2201[ebp], eax
   push right2190[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2186[ebp]
   push [esi[edx]]
   pop edx
   push left2190[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2186[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2201[ebp]
   pop edx
   push right2190[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2186[ebp]
   add esi, ecx
   mov [esi], edx
   push left2190[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2190[ebp], eax
   push right2190[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2190[ebp], eax
_if_end_2201:
   push left2190[ebp]
   pop ecx
   push right2190[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349813894362
   push 1
   jmp _compare_end604349813894362
_compare_not_equal604349813894362:
   push 0
_compare_end604349813894362:
   pop eax
   cmp eax, 0
   je _loop_end_2193
   jmp _loop_start_2193
_loop_end_2193:

   ; init stack for qs
   push right2190[ebp]
   push arg_first2186[ebp]
   push arg_s_arr2186[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2186[ebp]
   push left2190[ebp]
   push arg_s_arr2186[ebp]
   ; call qs
   call qs

_if_end_2190:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2202[ebp]
   pop ecx
   push arg_last2202[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349814001276
   push 1
   jmp _compare_end604349814001276
_compare_not_equal604349814001276:
   push 0
_compare_end604349814001276:
   pop eax
   cmp eax, 0
   je _if_end_2206
_if_start_2206:
   push arg_first2202[ebp]
   pop eax
   mov left2206[ebp], eax
   push arg_last2202[ebp]
   pop eax
   mov right2206[ebp], eax
   push left2206[ebp]
   push right2206[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2202[ebp]
   push [esi[edx]]
   pop eax
   mov middle2206[ebp], eax
_loop_start_2209:
_loop_aftereffects_2209:
_loop_start_2212:
_loop_aftereffects_2212:
   push left2206[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2202[ebp]
   push [esi[edx]]
   pop ecx
   push middle2206[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349814153520
   push 1
   jmp _compare_end604349814153520
_compare_not_equal604349814153520:
   push 0
_compare_end604349814153520:
   pop eax
   cmp eax, 0
   je _loop_end_2212
   push left2206[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2206[ebp], eax
   jmp _loop_start_2212
_loop_end_2212:
_loop_start_2215:
_loop_aftereffects_2215:
   push right2206[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2202[ebp]
   push [esi[edx]]
   pop ecx
   push middle2206[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349814238195
   push 1
   jmp _compare_end604349814238195
_compare_not_equal604349814238195:
   push 0
_compare_end604349814238195:
   pop eax
   cmp eax, 0
   je _loop_end_2215
   push right2206[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2206[ebp], eax
   jmp _loop_start_2215
_loop_end_2215:
   push left2206[ebp]
   pop ecx
   push right2206[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349814317311
   push 1
   jmp _compare_end604349814317311
_compare_not_equal604349814317311:
   push 0
_compare_end604349814317311:
   pop eax
   cmp eax, 0
   je _if_end_2217
_if_start_2217:
   push left2206[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2202[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2217[ebp], eax
   push right2206[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2202[ebp]
   push [esi[edx]]
   pop edx
   push left2206[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2202[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2217[ebp]
   pop edx
   push right2206[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2202[ebp]
   add esi, ecx
   mov [esi], edx
   push left2206[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2206[ebp], eax
   push right2206[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2206[ebp], eax
_if_end_2217:
   push left2206[ebp]
   pop ecx
   push right2206[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349814754373
   push 1
   jmp _compare_end604349814754373
_compare_not_equal604349814754373:
   push 0
_compare_end604349814754373:
   pop eax
   cmp eax, 0
   je _loop_end_2209
   jmp _loop_start_2209
_loop_end_2209:

   ; init stack for qs
   push right2206[ebp]
   push arg_first2202[ebp]
   push arg_s_arr2202[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2202[ebp]
   push left2206[ebp]
   push arg_s_arr2202[ebp]
   ; call qs
   call qs

_if_end_2206:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2218[ebp]
   pop ecx
   push arg_last2218[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349814948955
   push 1
   jmp _compare_end604349814948955
_compare_not_equal604349814948955:
   push 0
_compare_end604349814948955:
   pop eax
   cmp eax, 0
   je _if_end_2222
_if_start_2222:
   push arg_first2218[ebp]
   pop eax
   mov left2222[ebp], eax
   push arg_last2218[ebp]
   pop eax
   mov right2222[ebp], eax
   push left2222[ebp]
   push right2222[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2218[ebp]
   push [esi[edx]]
   pop eax
   mov middle2222[ebp], eax
_loop_start_2225:
_loop_aftereffects_2225:
_loop_start_2228:
_loop_aftereffects_2228:
   push left2222[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2218[ebp]
   push [esi[edx]]
   pop ecx
   push middle2222[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349815292788
   push 1
   jmp _compare_end604349815292788
_compare_not_equal604349815292788:
   push 0
_compare_end604349815292788:
   pop eax
   cmp eax, 0
   je _loop_end_2228
   push left2222[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2222[ebp], eax
   jmp _loop_start_2228
_loop_end_2228:
_loop_start_2231:
_loop_aftereffects_2231:
   push right2222[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2218[ebp]
   push [esi[edx]]
   pop ecx
   push middle2222[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349815442039
   push 1
   jmp _compare_end604349815442039
_compare_not_equal604349815442039:
   push 0
_compare_end604349815442039:
   pop eax
   cmp eax, 0
   je _loop_end_2231
   push right2222[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2222[ebp], eax
   jmp _loop_start_2231
_loop_end_2231:
   push left2222[ebp]
   pop ecx
   push right2222[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349815560499
   push 1
   jmp _compare_end604349815560499
_compare_not_equal604349815560499:
   push 0
_compare_end604349815560499:
   pop eax
   cmp eax, 0
   je _if_end_2233
_if_start_2233:
   push left2222[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2218[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2233[ebp], eax
   push right2222[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2218[ebp]
   push [esi[edx]]
   pop edx
   push left2222[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2218[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2233[ebp]
   pop edx
   push right2222[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2218[ebp]
   add esi, ecx
   mov [esi], edx
   push left2222[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2222[ebp], eax
   push right2222[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2222[ebp], eax
_if_end_2233:
   push left2222[ebp]
   pop ecx
   push right2222[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349815843177
   push 1
   jmp _compare_end604349815843177
_compare_not_equal604349815843177:
   push 0
_compare_end604349815843177:
   pop eax
   cmp eax, 0
   je _loop_end_2225
   jmp _loop_start_2225
_loop_end_2225:

   ; init stack for qs
   push right2222[ebp]
   push arg_first2218[ebp]
   push arg_s_arr2218[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2218[ebp]
   push left2222[ebp]
   push arg_s_arr2218[ebp]
   ; call qs
   call qs

_if_end_2222:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2234[ebp]
   pop ecx
   push arg_last2234[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349815955223
   push 1
   jmp _compare_end604349815955223
_compare_not_equal604349815955223:
   push 0
_compare_end604349815955223:
   pop eax
   cmp eax, 0
   je _if_end_2238
_if_start_2238:
   push arg_first2234[ebp]
   pop eax
   mov left2238[ebp], eax
   push arg_last2234[ebp]
   pop eax
   mov right2238[ebp], eax
   push left2238[ebp]
   push right2238[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2234[ebp]
   push [esi[edx]]
   pop eax
   mov middle2238[ebp], eax
_loop_start_2241:
_loop_aftereffects_2241:
_loop_start_2244:
_loop_aftereffects_2244:
   push left2238[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2234[ebp]
   push [esi[edx]]
   pop ecx
   push middle2238[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349816108322
   push 1
   jmp _compare_end604349816108322
_compare_not_equal604349816108322:
   push 0
_compare_end604349816108322:
   pop eax
   cmp eax, 0
   je _loop_end_2244
   push left2238[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2238[ebp], eax
   jmp _loop_start_2244
_loop_end_2244:
_loop_start_2247:
_loop_aftereffects_2247:
   push right2238[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2234[ebp]
   push [esi[edx]]
   pop ecx
   push middle2238[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349816189149
   push 1
   jmp _compare_end604349816189149
_compare_not_equal604349816189149:
   push 0
_compare_end604349816189149:
   pop eax
   cmp eax, 0
   je _loop_end_2247
   push right2238[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2238[ebp], eax
   jmp _loop_start_2247
_loop_end_2247:
   push left2238[ebp]
   pop ecx
   push right2238[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349816272113
   push 1
   jmp _compare_end604349816272113
_compare_not_equal604349816272113:
   push 0
_compare_end604349816272113:
   pop eax
   cmp eax, 0
   je _if_end_2249
_if_start_2249:
   push left2238[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2234[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2249[ebp], eax
   push right2238[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2234[ebp]
   push [esi[edx]]
   pop edx
   push left2238[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2234[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2249[ebp]
   pop edx
   push right2238[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2234[ebp]
   add esi, ecx
   mov [esi], edx
   push left2238[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2238[ebp], eax
   push right2238[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2238[ebp], eax
_if_end_2249:
   push left2238[ebp]
   pop ecx
   push right2238[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349816531699
   push 1
   jmp _compare_end604349816531699
_compare_not_equal604349816531699:
   push 0
_compare_end604349816531699:
   pop eax
   cmp eax, 0
   je _loop_end_2241
   jmp _loop_start_2241
_loop_end_2241:

   ; init stack for qs
   push right2238[ebp]
   push arg_first2234[ebp]
   push arg_s_arr2234[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2234[ebp]
   push left2238[ebp]
   push arg_s_arr2234[ebp]
   ; call qs
   call qs

_if_end_2238:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2250[ebp]
   pop ecx
   push arg_last2250[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349816640323
   push 1
   jmp _compare_end604349816640323
_compare_not_equal604349816640323:
   push 0
_compare_end604349816640323:
   pop eax
   cmp eax, 0
   je _if_end_2254
_if_start_2254:
   push arg_first2250[ebp]
   pop eax
   mov left2254[ebp], eax
   push arg_last2250[ebp]
   pop eax
   mov right2254[ebp], eax
   push left2254[ebp]
   push right2254[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2250[ebp]
   push [esi[edx]]
   pop eax
   mov middle2254[ebp], eax
_loop_start_2257:
_loop_aftereffects_2257:
_loop_start_2260:
_loop_aftereffects_2260:
   push left2254[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2250[ebp]
   push [esi[edx]]
   pop ecx
   push middle2254[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349816804969
   push 1
   jmp _compare_end604349816804969
_compare_not_equal604349816804969:
   push 0
_compare_end604349816804969:
   pop eax
   cmp eax, 0
   je _loop_end_2260
   push left2254[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2254[ebp], eax
   jmp _loop_start_2260
_loop_end_2260:
_loop_start_2263:
_loop_aftereffects_2263:
   push right2254[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2250[ebp]
   push [esi[edx]]
   pop ecx
   push middle2254[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349816889644
   push 1
   jmp _compare_end604349816889644
_compare_not_equal604349816889644:
   push 0
_compare_end604349816889644:
   pop eax
   cmp eax, 0
   je _loop_end_2263
   push right2254[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2254[ebp], eax
   jmp _loop_start_2263
_loop_end_2263:
   push left2254[ebp]
   pop ecx
   push right2254[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349816970471
   push 1
   jmp _compare_end604349816970471
_compare_not_equal604349816970471:
   push 0
_compare_end604349816970471:
   pop eax
   cmp eax, 0
   je _if_end_2265
_if_start_2265:
   push left2254[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2250[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2265[ebp], eax
   push right2254[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2250[ebp]
   push [esi[edx]]
   pop edx
   push left2254[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2250[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2265[ebp]
   pop edx
   push right2254[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2250[ebp]
   add esi, ecx
   mov [esi], edx
   push left2254[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2254[ebp], eax
   push right2254[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2254[ebp], eax
_if_end_2265:
   push left2254[ebp]
   pop ecx
   push right2254[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349817232622
   push 1
   jmp _compare_end604349817232622
_compare_not_equal604349817232622:
   push 0
_compare_end604349817232622:
   pop eax
   cmp eax, 0
   je _loop_end_2257
   jmp _loop_start_2257
_loop_end_2257:

   ; init stack for qs
   push right2254[ebp]
   push arg_first2250[ebp]
   push arg_s_arr2250[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2250[ebp]
   push left2254[ebp]
   push arg_s_arr2250[ebp]
   ; call qs
   call qs

_if_end_2254:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2266[ebp]
   pop ecx
   push arg_last2266[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349817343812
   push 1
   jmp _compare_end604349817343812
_compare_not_equal604349817343812:
   push 0
_compare_end604349817343812:
   pop eax
   cmp eax, 0
   je _if_end_2270
_if_start_2270:
   push arg_first2266[ebp]
   pop eax
   mov left2270[ebp], eax
   push arg_last2266[ebp]
   pop eax
   mov right2270[ebp], eax
   push left2270[ebp]
   push right2270[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2266[ebp]
   push [esi[edx]]
   pop eax
   mov middle2270[ebp], eax
_loop_start_2273:
_loop_aftereffects_2273:
_loop_start_2276:
_loop_aftereffects_2276:
   push left2270[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2266[ebp]
   push [esi[edx]]
   pop ecx
   push middle2270[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349817497339
   push 1
   jmp _compare_end604349817497339
_compare_not_equal604349817497339:
   push 0
_compare_end604349817497339:
   pop eax
   cmp eax, 0
   je _loop_end_2276
   push left2270[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2270[ebp], eax
   jmp _loop_start_2276
_loop_end_2276:
_loop_start_2279:
_loop_aftereffects_2279:
   push right2270[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2266[ebp]
   push [esi[edx]]
   pop ecx
   push middle2270[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349817644452
   push 1
   jmp _compare_end604349817644452
_compare_not_equal604349817644452:
   push 0
_compare_end604349817644452:
   pop eax
   cmp eax, 0
   je _loop_end_2279
   push right2270[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2270[ebp], eax
   jmp _loop_start_2279
_loop_end_2279:
   push left2270[ebp]
   pop ecx
   push right2270[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349818102896
   push 1
   jmp _compare_end604349818102896
_compare_not_equal604349818102896:
   push 0
_compare_end604349818102896:
   pop eax
   cmp eax, 0
   je _if_end_2281
_if_start_2281:
   push left2270[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2266[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2281[ebp], eax
   push right2270[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2266[ebp]
   push [esi[edx]]
   pop edx
   push left2270[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2266[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2281[ebp]
   pop edx
   push right2270[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2266[ebp]
   add esi, ecx
   mov [esi], edx
   push left2270[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2270[ebp], eax
   push right2270[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2270[ebp], eax
_if_end_2281:
   push left2270[ebp]
   pop ecx
   push right2270[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349818427913
   push 1
   jmp _compare_end604349818427913
_compare_not_equal604349818427913:
   push 0
_compare_end604349818427913:
   pop eax
   cmp eax, 0
   je _loop_end_2273
   jmp _loop_start_2273
_loop_end_2273:

   ; init stack for qs
   push right2270[ebp]
   push arg_first2266[ebp]
   push arg_s_arr2266[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2266[ebp]
   push left2270[ebp]
   push arg_s_arr2266[ebp]
   ; call qs
   call qs

_if_end_2270:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2282[ebp]
   pop ecx
   push arg_last2282[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349818583151
   push 1
   jmp _compare_end604349818583151
_compare_not_equal604349818583151:
   push 0
_compare_end604349818583151:
   pop eax
   cmp eax, 0
   je _if_end_2286
_if_start_2286:
   push arg_first2282[ebp]
   pop eax
   mov left2286[ebp], eax
   push arg_last2282[ebp]
   pop eax
   mov right2286[ebp], eax
   push left2286[ebp]
   push right2286[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2282[ebp]
   push [esi[edx]]
   pop eax
   mov middle2286[ebp], eax
_loop_start_2289:
_loop_aftereffects_2289:
_loop_start_2292:
_loop_aftereffects_2292:
   push left2286[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2282[ebp]
   push [esi[edx]]
   pop ecx
   push middle2286[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349818838887
   push 1
   jmp _compare_end604349818838887
_compare_not_equal604349818838887:
   push 0
_compare_end604349818838887:
   pop eax
   cmp eax, 0
   je _loop_end_2292
   push left2286[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2286[ebp], eax
   jmp _loop_start_2292
_loop_end_2292:
_loop_start_2295:
_loop_aftereffects_2295:
   push right2286[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2282[ebp]
   push [esi[edx]]
   pop ecx
   push middle2286[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349819067254
   push 1
   jmp _compare_end604349819067254
_compare_not_equal604349819067254:
   push 0
_compare_end604349819067254:
   pop eax
   cmp eax, 0
   je _loop_end_2295
   push right2286[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2286[ebp], eax
   jmp _loop_start_2295
_loop_end_2295:
   push left2286[ebp]
   pop ecx
   push right2286[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349819180154
   push 1
   jmp _compare_end604349819180154
_compare_not_equal604349819180154:
   push 0
_compare_end604349819180154:
   pop eax
   cmp eax, 0
   je _if_end_2297
_if_start_2297:
   push left2286[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2282[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2297[ebp], eax
   push right2286[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2282[ebp]
   push [esi[edx]]
   pop edx
   push left2286[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2282[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2297[ebp]
   pop edx
   push right2286[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2282[ebp]
   add esi, ecx
   mov [esi], edx
   push left2286[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2286[ebp], eax
   push right2286[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2286[ebp], eax
_if_end_2297:
   push left2286[ebp]
   pop ecx
   push right2286[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349819582148
   push 1
   jmp _compare_end604349819582148
_compare_not_equal604349819582148:
   push 0
_compare_end604349819582148:
   pop eax
   cmp eax, 0
   je _loop_end_2289
   jmp _loop_start_2289
_loop_end_2289:

   ; init stack for qs
   push right2286[ebp]
   push arg_first2282[ebp]
   push arg_s_arr2282[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2282[ebp]
   push left2286[ebp]
   push arg_s_arr2282[ebp]
   ; call qs
   call qs

_if_end_2286:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2298[ebp]
   pop ecx
   push arg_last2298[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349819700180
   push 1
   jmp _compare_end604349819700180
_compare_not_equal604349819700180:
   push 0
_compare_end604349819700180:
   pop eax
   cmp eax, 0
   je _if_end_2302
_if_start_2302:
   push arg_first2298[ebp]
   pop eax
   mov left2302[ebp], eax
   push arg_last2298[ebp]
   pop eax
   mov right2302[ebp], eax
   push left2302[ebp]
   push right2302[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2298[ebp]
   push [esi[edx]]
   pop eax
   mov middle2302[ebp], eax
_loop_start_2305:
_loop_aftereffects_2305:
_loop_start_2308:
_loop_aftereffects_2308:
   push left2302[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2298[ebp]
   push [esi[edx]]
   pop ecx
   push middle2302[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349819912724
   push 1
   jmp _compare_end604349819912724
_compare_not_equal604349819912724:
   push 0
_compare_end604349819912724:
   pop eax
   cmp eax, 0
   je _loop_end_2308
   push left2302[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2302[ebp], eax
   jmp _loop_start_2308
_loop_end_2308:
_loop_start_2311:
_loop_aftereffects_2311:
   push right2302[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2298[ebp]
   push [esi[edx]]
   pop ecx
   push middle2302[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349820005097
   push 1
   jmp _compare_end604349820005097
_compare_not_equal604349820005097:
   push 0
_compare_end604349820005097:
   pop eax
   cmp eax, 0
   je _loop_end_2311
   push right2302[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2302[ebp], eax
   jmp _loop_start_2311
_loop_end_2311:
   push left2302[ebp]
   pop ecx
   push right2302[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349820124412
   push 1
   jmp _compare_end604349820124412
_compare_not_equal604349820124412:
   push 0
_compare_end604349820124412:
   pop eax
   cmp eax, 0
   je _if_end_2313
_if_start_2313:
   push left2302[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2298[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2313[ebp], eax
   push right2302[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2298[ebp]
   push [esi[edx]]
   pop edx
   push left2302[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2298[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2313[ebp]
   pop edx
   push right2302[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2298[ebp]
   add esi, ecx
   mov [esi], edx
   push left2302[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2302[ebp], eax
   push right2302[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2302[ebp], eax
_if_end_2313:
   push left2302[ebp]
   pop ecx
   push right2302[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349820650426
   push 1
   jmp _compare_end604349820650426
_compare_not_equal604349820650426:
   push 0
_compare_end604349820650426:
   pop eax
   cmp eax, 0
   je _loop_end_2305
   jmp _loop_start_2305
_loop_end_2305:

   ; init stack for qs
   push right2302[ebp]
   push arg_first2298[ebp]
   push arg_s_arr2298[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2298[ebp]
   push left2302[ebp]
   push arg_s_arr2298[ebp]
   ; call qs
   call qs

_if_end_2302:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2314[ebp]
   pop ecx
   push arg_last2314[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349820934815
   push 1
   jmp _compare_end604349820934815
_compare_not_equal604349820934815:
   push 0
_compare_end604349820934815:
   pop eax
   cmp eax, 0
   je _if_end_2318
_if_start_2318:
   push arg_first2314[ebp]
   pop eax
   mov left2318[ebp], eax
   push arg_last2314[ebp]
   pop eax
   mov right2318[ebp], eax
   push left2318[ebp]
   push right2318[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2314[ebp]
   push [esi[edx]]
   pop eax
   mov middle2318[ebp], eax
_loop_start_2321:
_loop_aftereffects_2321:
_loop_start_2324:
_loop_aftereffects_2324:
   push left2318[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2314[ebp]
   push [esi[edx]]
   pop ecx
   push middle2318[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349821366745
   push 1
   jmp _compare_end604349821366745
_compare_not_equal604349821366745:
   push 0
_compare_end604349821366745:
   pop eax
   cmp eax, 0
   je _loop_end_2324
   push left2318[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2318[ebp], eax
   jmp _loop_start_2324
_loop_end_2324:
_loop_start_2327:
_loop_aftereffects_2327:
   push right2318[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2314[ebp]
   push [esi[edx]]
   pop ecx
   push middle2318[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349821480073
   push 1
   jmp _compare_end604349821480073
_compare_not_equal604349821480073:
   push 0
_compare_end604349821480073:
   pop eax
   cmp eax, 0
   je _loop_end_2327
   push right2318[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2318[ebp], eax
   jmp _loop_start_2327
_loop_end_2327:
   push left2318[ebp]
   pop ecx
   push right2318[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349821586131
   push 1
   jmp _compare_end604349821586131
_compare_not_equal604349821586131:
   push 0
_compare_end604349821586131:
   pop eax
   cmp eax, 0
   je _if_end_2329
_if_start_2329:
   push left2318[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2314[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2329[ebp], eax
   push right2318[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2314[ebp]
   push [esi[edx]]
   pop edx
   push left2318[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2314[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2329[ebp]
   pop edx
   push right2318[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2314[ebp]
   add esi, ecx
   mov [esi], edx
   push left2318[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2318[ebp], eax
   push right2318[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2318[ebp], eax
_if_end_2329:
   push left2318[ebp]
   pop ecx
   push right2318[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349822007369
   push 1
   jmp _compare_end604349822007369
_compare_not_equal604349822007369:
   push 0
_compare_end604349822007369:
   pop eax
   cmp eax, 0
   je _loop_end_2321
   jmp _loop_start_2321
_loop_end_2321:

   ; init stack for qs
   push right2318[ebp]
   push arg_first2314[ebp]
   push arg_s_arr2314[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2314[ebp]
   push left2318[ebp]
   push arg_s_arr2314[ebp]
   ; call qs
   call qs

_if_end_2318:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2330[ebp]
   pop ecx
   push arg_last2330[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349822299028
   push 1
   jmp _compare_end604349822299028
_compare_not_equal604349822299028:
   push 0
_compare_end604349822299028:
   pop eax
   cmp eax, 0
   je _if_end_2334
_if_start_2334:
   push arg_first2330[ebp]
   pop eax
   mov left2334[ebp], eax
   push arg_last2330[ebp]
   pop eax
   mov right2334[ebp], eax
   push left2334[ebp]
   push right2334[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2330[ebp]
   push [esi[edx]]
   pop eax
   mov middle2334[ebp], eax
_loop_start_2337:
_loop_aftereffects_2337:
_loop_start_2340:
_loop_aftereffects_2340:
   push left2334[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2330[ebp]
   push [esi[edx]]
   pop ecx
   push middle2334[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349822455122
   push 1
   jmp _compare_end604349822455122
_compare_not_equal604349822455122:
   push 0
_compare_end604349822455122:
   pop eax
   cmp eax, 0
   je _loop_end_2340
   push left2334[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2334[ebp], eax
   jmp _loop_start_2340
_loop_end_2340:
_loop_start_2343:
_loop_aftereffects_2343:
   push right2334[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2330[ebp]
   push [esi[edx]]
   pop ecx
   push middle2334[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349822538942
   push 1
   jmp _compare_end604349822538942
_compare_not_equal604349822538942:
   push 0
_compare_end604349822538942:
   pop eax
   cmp eax, 0
   je _loop_end_2343
   push right2334[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2334[ebp], eax
   jmp _loop_start_2343
_loop_end_2343:
   push left2334[ebp]
   pop ecx
   push right2334[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349822649276
   push 1
   jmp _compare_end604349822649276
_compare_not_equal604349822649276:
   push 0
_compare_end604349822649276:
   pop eax
   cmp eax, 0
   je _if_end_2345
_if_start_2345:
   push left2334[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2330[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2345[ebp], eax
   push right2334[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2330[ebp]
   push [esi[edx]]
   pop edx
   push left2334[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2330[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2345[ebp]
   pop edx
   push right2334[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2330[ebp]
   add esi, ecx
   mov [esi], edx
   push left2334[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2334[ebp], eax
   push right2334[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2334[ebp], eax
_if_end_2345:
   push left2334[ebp]
   pop ecx
   push right2334[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349823003373
   push 1
   jmp _compare_end604349823003373
_compare_not_equal604349823003373:
   push 0
_compare_end604349823003373:
   pop eax
   cmp eax, 0
   je _loop_end_2337
   jmp _loop_start_2337
_loop_end_2337:

   ; init stack for qs
   push right2334[ebp]
   push arg_first2330[ebp]
   push arg_s_arr2330[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2330[ebp]
   push left2334[ebp]
   push arg_s_arr2330[ebp]
   ; call qs
   call qs

_if_end_2334:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2346[ebp]
   pop ecx
   push arg_last2346[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349823141932
   push 1
   jmp _compare_end604349823141932
_compare_not_equal604349823141932:
   push 0
_compare_end604349823141932:
   pop eax
   cmp eax, 0
   je _if_end_2350
_if_start_2350:
   push arg_first2346[ebp]
   pop eax
   mov left2350[ebp], eax
   push arg_last2346[ebp]
   pop eax
   mov right2350[ebp], eax
   push left2350[ebp]
   push right2350[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2346[ebp]
   push [esi[edx]]
   pop eax
   mov middle2350[ebp], eax
_loop_start_2353:
_loop_aftereffects_2353:
_loop_start_2356:
_loop_aftereffects_2356:
   push left2350[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2346[ebp]
   push [esi[edx]]
   pop ecx
   push middle2350[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349823345068
   push 1
   jmp _compare_end604349823345068
_compare_not_equal604349823345068:
   push 0
_compare_end604349823345068:
   pop eax
   cmp eax, 0
   je _loop_end_2356
   push left2350[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2350[ebp], eax
   jmp _loop_start_2356
_loop_end_2356:
_loop_start_2359:
_loop_aftereffects_2359:
   push right2350[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2346[ebp]
   push [esi[edx]]
   pop ecx
   push middle2350[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349823495602
   push 1
   jmp _compare_end604349823495602
_compare_not_equal604349823495602:
   push 0
_compare_end604349823495602:
   pop eax
   cmp eax, 0
   je _loop_end_2359
   push right2350[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2350[ebp], eax
   jmp _loop_start_2359
_loop_end_2359:
   push left2350[ebp]
   pop ecx
   push right2350[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349823584126
   push 1
   jmp _compare_end604349823584126
_compare_not_equal604349823584126:
   push 0
_compare_end604349823584126:
   pop eax
   cmp eax, 0
   je _if_end_2361
_if_start_2361:
   push left2350[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2346[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2361[ebp], eax
   push right2350[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2346[ebp]
   push [esi[edx]]
   pop edx
   push left2350[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2346[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2361[ebp]
   pop edx
   push right2350[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2346[ebp]
   add esi, ecx
   mov [esi], edx
   push left2350[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2350[ebp], eax
   push right2350[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2350[ebp], eax
_if_end_2361:
   push left2350[ebp]
   pop ecx
   push right2350[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349823884338
   push 1
   jmp _compare_end604349823884338
_compare_not_equal604349823884338:
   push 0
_compare_end604349823884338:
   pop eax
   cmp eax, 0
   je _loop_end_2353
   jmp _loop_start_2353
_loop_end_2353:

   ; init stack for qs
   push right2350[ebp]
   push arg_first2346[ebp]
   push arg_s_arr2346[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2346[ebp]
   push left2350[ebp]
   push arg_s_arr2346[ebp]
   ; call qs
   call qs

_if_end_2350:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2362[ebp]
   pop ecx
   push arg_last2362[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349824003226
   push 1
   jmp _compare_end604349824003226
_compare_not_equal604349824003226:
   push 0
_compare_end604349824003226:
   pop eax
   cmp eax, 0
   je _if_end_2366
_if_start_2366:
   push arg_first2362[ebp]
   pop eax
   mov left2366[ebp], eax
   push arg_last2362[ebp]
   pop eax
   mov right2366[ebp], eax
   push left2366[ebp]
   push right2366[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2362[ebp]
   push [esi[edx]]
   pop eax
   mov middle2366[ebp], eax
_loop_start_2369:
_loop_aftereffects_2369:
_loop_start_2372:
_loop_aftereffects_2372:
   push left2366[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2362[ebp]
   push [esi[edx]]
   pop ecx
   push middle2366[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349824371863
   push 1
   jmp _compare_end604349824371863
_compare_not_equal604349824371863:
   push 0
_compare_end604349824371863:
   pop eax
   cmp eax, 0
   je _loop_end_2372
   push left2366[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2366[ebp], eax
   jmp _loop_start_2372
_loop_end_2372:
_loop_start_2375:
_loop_aftereffects_2375:
   push right2366[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2362[ebp]
   push [esi[edx]]
   pop ecx
   push middle2366[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349824684477
   push 1
   jmp _compare_end604349824684477
_compare_not_equal604349824684477:
   push 0
_compare_end604349824684477:
   pop eax
   cmp eax, 0
   je _loop_end_2375
   push right2366[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2366[ebp], eax
   jmp _loop_start_2375
_loop_end_2375:
   push left2366[ebp]
   pop ecx
   push right2366[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349824908995
   push 1
   jmp _compare_end604349824908995
_compare_not_equal604349824908995:
   push 0
_compare_end604349824908995:
   pop eax
   cmp eax, 0
   je _if_end_2377
_if_start_2377:
   push left2366[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2362[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2377[ebp], eax
   push right2366[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2362[ebp]
   push [esi[edx]]
   pop edx
   push left2366[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2362[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2377[ebp]
   pop edx
   push right2366[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2362[ebp]
   add esi, ecx
   mov [esi], edx
   push left2366[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2366[ebp], eax
   push right2366[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2366[ebp], eax
_if_end_2377:
   push left2366[ebp]
   pop ecx
   push right2366[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349825602648
   push 1
   jmp _compare_end604349825602648
_compare_not_equal604349825602648:
   push 0
_compare_end604349825602648:
   pop eax
   cmp eax, 0
   je _loop_end_2369
   jmp _loop_start_2369
_loop_end_2369:

   ; init stack for qs
   push right2366[ebp]
   push arg_first2362[ebp]
   push arg_s_arr2362[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2362[ebp]
   push left2366[ebp]
   push arg_s_arr2362[ebp]
   ; call qs
   call qs

_if_end_2366:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2378[ebp]
   pop ecx
   push arg_last2378[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349825811771
   push 1
   jmp _compare_end604349825811771
_compare_not_equal604349825811771:
   push 0
_compare_end604349825811771:
   pop eax
   cmp eax, 0
   je _if_end_2382
_if_start_2382:
   push arg_first2378[ebp]
   pop eax
   mov left2382[ebp], eax
   push arg_last2378[ebp]
   pop eax
   mov right2382[ebp], eax
   push left2382[ebp]
   push right2382[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2378[ebp]
   push [esi[edx]]
   pop eax
   mov middle2382[ebp], eax
_loop_start_2385:
_loop_aftereffects_2385:
_loop_start_2388:
_loop_aftereffects_2388:
   push left2382[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2378[ebp]
   push [esi[edx]]
   pop ecx
   push middle2382[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349826008919
   push 1
   jmp _compare_end604349826008919
_compare_not_equal604349826008919:
   push 0
_compare_end604349826008919:
   pop eax
   cmp eax, 0
   je _loop_end_2388
   push left2382[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2382[ebp], eax
   jmp _loop_start_2388
_loop_end_2388:
_loop_start_2391:
_loop_aftereffects_2391:
   push right2382[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2378[ebp]
   push [esi[edx]]
   pop ecx
   push middle2382[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349826215475
   push 1
   jmp _compare_end604349826215475
_compare_not_equal604349826215475:
   push 0
_compare_end604349826215475:
   pop eax
   cmp eax, 0
   je _loop_end_2391
   push right2382[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2382[ebp], eax
   jmp _loop_start_2391
_loop_end_2391:
   push left2382[ebp]
   pop ecx
   push right2382[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349826361732
   push 1
   jmp _compare_end604349826361732
_compare_not_equal604349826361732:
   push 0
_compare_end604349826361732:
   pop eax
   cmp eax, 0
   je _if_end_2393
_if_start_2393:
   push left2382[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2378[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2393[ebp], eax
   push right2382[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2378[ebp]
   push [esi[edx]]
   pop edx
   push left2382[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2378[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2393[ebp]
   pop edx
   push right2382[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2378[ebp]
   add esi, ecx
   mov [esi], edx
   push left2382[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2382[ebp], eax
   push right2382[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2382[ebp], eax
_if_end_2393:
   push left2382[ebp]
   pop ecx
   push right2382[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349826687176
   push 1
   jmp _compare_end604349826687176
_compare_not_equal604349826687176:
   push 0
_compare_end604349826687176:
   pop eax
   cmp eax, 0
   je _loop_end_2385
   jmp _loop_start_2385
_loop_end_2385:

   ; init stack for qs
   push right2382[ebp]
   push arg_first2378[ebp]
   push arg_s_arr2378[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2378[ebp]
   push left2382[ebp]
   push arg_s_arr2378[ebp]
   ; call qs
   call qs

_if_end_2382:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2394[ebp]
   pop ecx
   push arg_last2394[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349826817183
   push 1
   jmp _compare_end604349826817183
_compare_not_equal604349826817183:
   push 0
_compare_end604349826817183:
   pop eax
   cmp eax, 0
   je _if_end_2398
_if_start_2398:
   push arg_first2394[ebp]
   pop eax
   mov left2398[ebp], eax
   push arg_last2394[ebp]
   pop eax
   mov right2398[ebp], eax
   push left2398[ebp]
   push right2398[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2394[ebp]
   push [esi[edx]]
   pop eax
   mov middle2398[ebp], eax
_loop_start_2401:
_loop_aftereffects_2401:
_loop_start_2404:
_loop_aftereffects_2404:
   push left2398[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2394[ebp]
   push [esi[edx]]
   pop ecx
   push middle2398[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349827092592
   push 1
   jmp _compare_end604349827092592
_compare_not_equal604349827092592:
   push 0
_compare_end604349827092592:
   pop eax
   cmp eax, 0
   je _loop_end_2404
   push left2398[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2398[ebp], eax
   jmp _loop_start_2404
_loop_end_2404:
_loop_start_2407:
_loop_aftereffects_2407:
   push right2398[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2394[ebp]
   push [esi[edx]]
   pop ecx
   push middle2398[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349827410765
   push 1
   jmp _compare_end604349827410765
_compare_not_equal604349827410765:
   push 0
_compare_end604349827410765:
   pop eax
   cmp eax, 0
   je _loop_end_2407
   push right2398[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2398[ebp], eax
   jmp _loop_start_2407
_loop_end_2407:
   push left2398[ebp]
   pop ecx
   push right2398[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349828110406
   push 1
   jmp _compare_end604349828110406
_compare_not_equal604349828110406:
   push 0
_compare_end604349828110406:
   pop eax
   cmp eax, 0
   je _if_end_2409
_if_start_2409:
   push left2398[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2394[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2409[ebp], eax
   push right2398[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2394[ebp]
   push [esi[edx]]
   pop edx
   push left2398[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2394[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2409[ebp]
   pop edx
   push right2398[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2394[ebp]
   add esi, ecx
   mov [esi], edx
   push left2398[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2398[ebp], eax
   push right2398[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2398[ebp], eax
_if_end_2409:
   push left2398[ebp]
   pop ecx
   push right2398[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349830396212
   push 1
   jmp _compare_end604349830396212
_compare_not_equal604349830396212:
   push 0
_compare_end604349830396212:
   pop eax
   cmp eax, 0
   je _loop_end_2401
   jmp _loop_start_2401
_loop_end_2401:

   ; init stack for qs
   push right2398[ebp]
   push arg_first2394[ebp]
   push arg_s_arr2394[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2394[ebp]
   push left2398[ebp]
   push arg_s_arr2394[ebp]
   ; call qs
   call qs

_if_end_2398:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2410[ebp]
   pop ecx
   push arg_last2410[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349831260071
   push 1
   jmp _compare_end604349831260071
_compare_not_equal604349831260071:
   push 0
_compare_end604349831260071:
   pop eax
   cmp eax, 0
   je _if_end_2414
_if_start_2414:
   push arg_first2410[ebp]
   pop eax
   mov left2414[ebp], eax
   push arg_last2410[ebp]
   pop eax
   mov right2414[ebp], eax
   push left2414[ebp]
   push right2414[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2410[ebp]
   push [esi[edx]]
   pop eax
   mov middle2414[ebp], eax
_loop_start_2417:
_loop_aftereffects_2417:
_loop_start_2420:
_loop_aftereffects_2420:
   push left2414[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2410[ebp]
   push [esi[edx]]
   pop ecx
   push middle2414[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349831427711
   push 1
   jmp _compare_end604349831427711
_compare_not_equal604349831427711:
   push 0
_compare_end604349831427711:
   pop eax
   cmp eax, 0
   je _loop_end_2420
   push left2414[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2414[ebp], eax
   jmp _loop_start_2420
_loop_end_2420:
_loop_start_2423:
_loop_aftereffects_2423:
   push right2414[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2410[ebp]
   push [esi[edx]]
   pop ecx
   push middle2414[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349832021721
   push 1
   jmp _compare_end604349832021721
_compare_not_equal604349832021721:
   push 0
_compare_end604349832021721:
   pop eax
   cmp eax, 0
   je _loop_end_2423
   push right2414[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2414[ebp], eax
   jmp _loop_start_2423
_loop_end_2423:
   push left2414[ebp]
   pop ecx
   push right2414[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349832239396
   push 1
   jmp _compare_end604349832239396
_compare_not_equal604349832239396:
   push 0
_compare_end604349832239396:
   pop eax
   cmp eax, 0
   je _if_end_2425
_if_start_2425:
   push left2414[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2410[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2425[ebp], eax
   push right2414[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2410[ebp]
   push [esi[edx]]
   pop edx
   push left2414[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2410[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2425[ebp]
   pop edx
   push right2414[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2410[ebp]
   add esi, ecx
   mov [esi], edx
   push left2414[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2414[ebp], eax
   push right2414[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2414[ebp], eax
_if_end_2425:
   push left2414[ebp]
   pop ecx
   push right2414[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349832647805
   push 1
   jmp _compare_end604349832647805
_compare_not_equal604349832647805:
   push 0
_compare_end604349832647805:
   pop eax
   cmp eax, 0
   je _loop_end_2417
   jmp _loop_start_2417
_loop_end_2417:

   ; init stack for qs
   push right2414[ebp]
   push arg_first2410[ebp]
   push arg_s_arr2410[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2410[ebp]
   push left2414[ebp]
   push arg_s_arr2410[ebp]
   ; call qs
   call qs

_if_end_2414:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2426[ebp]
   pop ecx
   push arg_last2426[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349832813307
   push 1
   jmp _compare_end604349832813307
_compare_not_equal604349832813307:
   push 0
_compare_end604349832813307:
   pop eax
   cmp eax, 0
   je _if_end_2430
_if_start_2430:
   push arg_first2426[ebp]
   pop eax
   mov left2430[ebp], eax
   push arg_last2426[ebp]
   pop eax
   mov right2430[ebp], eax
   push left2430[ebp]
   push right2430[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2426[ebp]
   push [esi[edx]]
   pop eax
   mov middle2430[ebp], eax
_loop_start_2433:
_loop_aftereffects_2433:
_loop_start_2436:
_loop_aftereffects_2436:
   push left2430[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2426[ebp]
   push [esi[edx]]
   pop ecx
   push middle2430[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349833046805
   push 1
   jmp _compare_end604349833046805
_compare_not_equal604349833046805:
   push 0
_compare_end604349833046805:
   pop eax
   cmp eax, 0
   je _loop_end_2436
   push left2430[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2430[ebp], eax
   jmp _loop_start_2436
_loop_end_2436:
_loop_start_2439:
_loop_aftereffects_2439:
   push right2430[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2426[ebp]
   push [esi[edx]]
   pop ecx
   push middle2430[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349833180661
   push 1
   jmp _compare_end604349833180661
_compare_not_equal604349833180661:
   push 0
_compare_end604349833180661:
   pop eax
   cmp eax, 0
   je _loop_end_2439
   push right2430[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2430[ebp], eax
   jmp _loop_start_2439
_loop_end_2439:
   push left2430[ebp]
   pop ecx
   push right2430[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349833305963
   push 1
   jmp _compare_end604349833305963
_compare_not_equal604349833305963:
   push 0
_compare_end604349833305963:
   pop eax
   cmp eax, 0
   je _if_end_2441
_if_start_2441:
   push left2430[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2426[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2441[ebp], eax
   push right2430[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2426[ebp]
   push [esi[edx]]
   pop edx
   push left2430[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2426[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2441[ebp]
   pop edx
   push right2430[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2426[ebp]
   add esi, ecx
   mov [esi], edx
   push left2430[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2430[ebp], eax
   push right2430[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2430[ebp], eax
_if_end_2441:
   push left2430[ebp]
   pop ecx
   push right2430[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349833799047
   push 1
   jmp _compare_end604349833799047
_compare_not_equal604349833799047:
   push 0
_compare_end604349833799047:
   pop eax
   cmp eax, 0
   je _loop_end_2433
   jmp _loop_start_2433
_loop_end_2433:

   ; init stack for qs
   push right2430[ebp]
   push arg_first2426[ebp]
   push arg_s_arr2426[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2426[ebp]
   push left2430[ebp]
   push arg_s_arr2426[ebp]
   ; call qs
   call qs

_if_end_2430:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2442[ebp]
   pop ecx
   push arg_last2442[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349833918362
   push 1
   jmp _compare_end604349833918362
_compare_not_equal604349833918362:
   push 0
_compare_end604349833918362:
   pop eax
   cmp eax, 0
   je _if_end_2446
_if_start_2446:
   push arg_first2442[ebp]
   pop eax
   mov left2446[ebp], eax
   push arg_last2442[ebp]
   pop eax
   mov right2446[ebp], eax
   push left2446[ebp]
   push right2446[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2442[ebp]
   push [esi[edx]]
   pop eax
   mov middle2446[ebp], eax
_loop_start_2449:
_loop_aftereffects_2449:
_loop_start_2452:
_loop_aftereffects_2452:
   push left2446[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2442[ebp]
   push [esi[edx]]
   pop ecx
   push middle2446[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349834079160
   push 1
   jmp _compare_end604349834079160
_compare_not_equal604349834079160:
   push 0
_compare_end604349834079160:
   pop eax
   cmp eax, 0
   je _loop_end_2452
   push left2446[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2446[ebp], eax
   jmp _loop_start_2452
_loop_end_2452:
_loop_start_2455:
_loop_aftereffects_2455:
   push right2446[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2442[ebp]
   push [esi[edx]]
   pop ecx
   push middle2446[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349834169822
   push 1
   jmp _compare_end604349834169822
_compare_not_equal604349834169822:
   push 0
_compare_end604349834169822:
   pop eax
   cmp eax, 0
   je _loop_end_2455
   push right2446[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2446[ebp], eax
   jmp _loop_start_2455
_loop_end_2455:
   push left2446[ebp]
   pop ecx
   push right2446[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349834325488
   push 1
   jmp _compare_end604349834325488
_compare_not_equal604349834325488:
   push 0
_compare_end604349834325488:
   pop eax
   cmp eax, 0
   je _if_end_2457
_if_start_2457:
   push left2446[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2442[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2457[ebp], eax
   push right2446[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2442[ebp]
   push [esi[edx]]
   pop edx
   push left2446[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2442[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2457[ebp]
   pop edx
   push right2446[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2442[ebp]
   add esi, ecx
   mov [esi], edx
   push left2446[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2446[ebp], eax
   push right2446[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2446[ebp], eax
_if_end_2457:
   push left2446[ebp]
   pop ecx
   push right2446[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349834827553
   push 1
   jmp _compare_end604349834827553
_compare_not_equal604349834827553:
   push 0
_compare_end604349834827553:
   pop eax
   cmp eax, 0
   je _loop_end_2449
   jmp _loop_start_2449
_loop_end_2449:

   ; init stack for qs
   push right2446[ebp]
   push arg_first2442[ebp]
   push arg_s_arr2442[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2442[ebp]
   push left2446[ebp]
   push arg_s_arr2442[ebp]
   ; call qs
   call qs

_if_end_2446:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2458[ebp]
   pop ecx
   push arg_last2458[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349835043517
   push 1
   jmp _compare_end604349835043517
_compare_not_equal604349835043517:
   push 0
_compare_end604349835043517:
   pop eax
   cmp eax, 0
   je _if_end_2462
_if_start_2462:
   push arg_first2458[ebp]
   pop eax
   mov left2462[ebp], eax
   push arg_last2458[ebp]
   pop eax
   mov right2462[ebp], eax
   push left2462[ebp]
   push right2462[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2458[ebp]
   push [esi[edx]]
   pop eax
   mov middle2462[ebp], eax
_loop_start_2465:
_loop_aftereffects_2465:
_loop_start_2468:
_loop_aftereffects_2468:
   push left2462[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2458[ebp]
   push [esi[edx]]
   pop ecx
   push middle2462[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349835963827
   push 1
   jmp _compare_end604349835963827
_compare_not_equal604349835963827:
   push 0
_compare_end604349835963827:
   pop eax
   cmp eax, 0
   je _loop_end_2468
   push left2462[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2462[ebp], eax
   jmp _loop_start_2468
_loop_end_2468:
_loop_start_2471:
_loop_aftereffects_2471:
   push right2462[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2458[ebp]
   push [esi[edx]]
   pop ecx
   push middle2462[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349836054062
   push 1
   jmp _compare_end604349836054062
_compare_not_equal604349836054062:
   push 0
_compare_end604349836054062:
   pop eax
   cmp eax, 0
   je _loop_end_2471
   push right2462[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2462[ebp], eax
   jmp _loop_start_2471
_loop_end_2471:
   push left2462[ebp]
   pop ecx
   push right2462[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349836147718
   push 1
   jmp _compare_end604349836147718
_compare_not_equal604349836147718:
   push 0
_compare_end604349836147718:
   pop eax
   cmp eax, 0
   je _if_end_2473
_if_start_2473:
   push left2462[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2458[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2473[ebp], eax
   push right2462[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2458[ebp]
   push [esi[edx]]
   pop edx
   push left2462[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2458[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2473[ebp]
   pop edx
   push right2462[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2458[ebp]
   add esi, ecx
   mov [esi], edx
   push left2462[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2462[ebp], eax
   push right2462[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2462[ebp], eax
_if_end_2473:
   push left2462[ebp]
   pop ecx
   push right2462[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349836440232
   push 1
   jmp _compare_end604349836440232
_compare_not_equal604349836440232:
   push 0
_compare_end604349836440232:
   pop eax
   cmp eax, 0
   je _loop_end_2465
   jmp _loop_start_2465
_loop_end_2465:

   ; init stack for qs
   push right2462[ebp]
   push arg_first2458[ebp]
   push arg_s_arr2458[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2458[ebp]
   push left2462[ebp]
   push arg_s_arr2458[ebp]
   ; call qs
   call qs

_if_end_2462:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2474[ebp]
   pop ecx
   push arg_last2474[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349836561686
   push 1
   jmp _compare_end604349836561686
_compare_not_equal604349836561686:
   push 0
_compare_end604349836561686:
   pop eax
   cmp eax, 0
   je _if_end_2478
_if_start_2478:
   push arg_first2474[ebp]
   pop eax
   mov left2478[ebp], eax
   push arg_last2474[ebp]
   pop eax
   mov right2478[ebp], eax
   push left2478[ebp]
   push right2478[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2474[ebp]
   push [esi[edx]]
   pop eax
   mov middle2478[ebp], eax
_loop_start_2481:
_loop_aftereffects_2481:
_loop_start_2484:
_loop_aftereffects_2484:
   push left2478[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2474[ebp]
   push [esi[edx]]
   pop ecx
   push middle2478[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349836726332
   push 1
   jmp _compare_end604349836726332
_compare_not_equal604349836726332:
   push 0
_compare_end604349836726332:
   pop eax
   cmp eax, 0
   je _loop_end_2484
   push left2478[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2478[ebp], eax
   jmp _loop_start_2484
_loop_end_2484:
_loop_start_2487:
_loop_aftereffects_2487:
   push right2478[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2474[ebp]
   push [esi[edx]]
   pop ecx
   push middle2478[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349836848213
   push 1
   jmp _compare_end604349836848213
_compare_not_equal604349836848213:
   push 0
_compare_end604349836848213:
   pop eax
   cmp eax, 0
   je _loop_end_2487
   push right2478[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2478[ebp], eax
   jmp _loop_start_2487
_loop_end_2487:
   push left2478[ebp]
   pop ecx
   push right2478[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349836936738
   push 1
   jmp _compare_end604349836936738
_compare_not_equal604349836936738:
   push 0
_compare_end604349836936738:
   pop eax
   cmp eax, 0
   je _if_end_2489
_if_start_2489:
   push left2478[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2474[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2489[ebp], eax
   push right2478[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2474[ebp]
   push [esi[edx]]
   pop edx
   push left2478[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2474[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2489[ebp]
   pop edx
   push right2478[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2474[ebp]
   add esi, ecx
   mov [esi], edx
   push left2478[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2478[ebp], eax
   push right2478[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2478[ebp], eax
_if_end_2489:
   push left2478[ebp]
   pop ecx
   push right2478[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349837231818
   push 1
   jmp _compare_end604349837231818
_compare_not_equal604349837231818:
   push 0
_compare_end604349837231818:
   pop eax
   cmp eax, 0
   je _loop_end_2481
   jmp _loop_start_2481
_loop_end_2481:

   ; init stack for qs
   push right2478[ebp]
   push arg_first2474[ebp]
   push arg_s_arr2474[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2474[ebp]
   push left2478[ebp]
   push arg_s_arr2474[ebp]
   ; call qs
   call qs

_if_end_2478:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2490[ebp]
   pop ecx
   push arg_last2490[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349837351561
   push 1
   jmp _compare_end604349837351561
_compare_not_equal604349837351561:
   push 0
_compare_end604349837351561:
   pop eax
   cmp eax, 0
   je _if_end_2494
_if_start_2494:
   push arg_first2490[ebp]
   pop eax
   mov left2494[ebp], eax
   push arg_last2490[ebp]
   pop eax
   mov right2494[ebp], eax
   push left2494[ebp]
   push right2494[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2490[ebp]
   push [esi[edx]]
   pop eax
   mov middle2494[ebp], eax
_loop_start_2497:
_loop_aftereffects_2497:
_loop_start_2500:
_loop_aftereffects_2500:
   push left2494[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2490[ebp]
   push [esi[edx]]
   pop ecx
   push middle2494[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349837514497
   push 1
   jmp _compare_end604349837514497
_compare_not_equal604349837514497:
   push 0
_compare_end604349837514497:
   pop eax
   cmp eax, 0
   je _loop_end_2500
   push left2494[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2494[ebp], eax
   jmp _loop_start_2500
_loop_end_2500:
_loop_start_2503:
_loop_aftereffects_2503:
   push right2494[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2490[ebp]
   push [esi[edx]]
   pop ecx
   push middle2494[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349837603449
   push 1
   jmp _compare_end604349837603449
_compare_not_equal604349837603449:
   push 0
_compare_end604349837603449:
   pop eax
   cmp eax, 0
   je _loop_end_2503
   push right2494[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2494[ebp], eax
   jmp _loop_start_2503
_loop_end_2503:
   push left2494[ebp]
   pop ecx
   push right2494[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349837727896
   push 1
   jmp _compare_end604349837727896
_compare_not_equal604349837727896:
   push 0
_compare_end604349837727896:
   pop eax
   cmp eax, 0
   je _if_end_2505
_if_start_2505:
   push left2494[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2490[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2505[ebp], eax
   push right2494[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2490[ebp]
   push [esi[edx]]
   pop edx
   push left2494[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2490[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2505[ebp]
   pop edx
   push right2494[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2490[ebp]
   add esi, ecx
   mov [esi], edx
   push left2494[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2494[ebp], eax
   push right2494[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2494[ebp], eax
_if_end_2505:
   push left2494[ebp]
   pop ecx
   push right2494[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349838430957
   push 1
   jmp _compare_end604349838430957
_compare_not_equal604349838430957:
   push 0
_compare_end604349838430957:
   pop eax
   cmp eax, 0
   je _loop_end_2497
   jmp _loop_start_2497
_loop_end_2497:

   ; init stack for qs
   push right2494[ebp]
   push arg_first2490[ebp]
   push arg_s_arr2490[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2490[ebp]
   push left2494[ebp]
   push arg_s_arr2490[ebp]
   ; call qs
   call qs

_if_end_2494:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2506[ebp]
   pop ecx
   push arg_last2506[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349838645212
   push 1
   jmp _compare_end604349838645212
_compare_not_equal604349838645212:
   push 0
_compare_end604349838645212:
   pop eax
   cmp eax, 0
   je _if_end_2510
_if_start_2510:
   push arg_first2506[ebp]
   pop eax
   mov left2510[ebp], eax
   push arg_last2506[ebp]
   pop eax
   mov right2510[ebp], eax
   push left2510[ebp]
   push right2510[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2506[ebp]
   push [esi[edx]]
   pop eax
   mov middle2510[ebp], eax
_loop_start_2513:
_loop_aftereffects_2513:
_loop_start_2516:
_loop_aftereffects_2516:
   push left2510[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2506[ebp]
   push [esi[edx]]
   pop ecx
   push middle2510[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349838858183
   push 1
   jmp _compare_end604349838858183
_compare_not_equal604349838858183:
   push 0
_compare_end604349838858183:
   pop eax
   cmp eax, 0
   je _loop_end_2516
   push left2510[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2510[ebp], eax
   jmp _loop_start_2516
_loop_end_2516:
_loop_start_2519:
_loop_aftereffects_2519:
   push right2510[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2506[ebp]
   push [esi[edx]]
   pop ecx
   push middle2510[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349838977498
   push 1
   jmp _compare_end604349838977498
_compare_not_equal604349838977498:
   push 0
_compare_end604349838977498:
   pop eax
   cmp eax, 0
   je _loop_end_2519
   push right2510[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2510[ebp], eax
   jmp _loop_start_2519
_loop_end_2519:
   push left2510[ebp]
   pop ecx
   push right2510[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349839096386
   push 1
   jmp _compare_end604349839096386
_compare_not_equal604349839096386:
   push 0
_compare_end604349839096386:
   pop eax
   cmp eax, 0
   je _if_end_2521
_if_start_2521:
   push left2510[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2506[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2521[ebp], eax
   push right2510[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2506[ebp]
   push [esi[edx]]
   pop edx
   push left2510[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2506[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2521[ebp]
   pop edx
   push right2510[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2506[ebp]
   add esi, ecx
   mov [esi], edx
   push left2510[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2510[ebp], eax
   push right2510[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2510[ebp], eax
_if_end_2521:
   push left2510[ebp]
   pop ecx
   push right2510[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349839724180
   push 1
   jmp _compare_end604349839724180
_compare_not_equal604349839724180:
   push 0
_compare_end604349839724180:
   pop eax
   cmp eax, 0
   je _loop_end_2513
   jmp _loop_start_2513
_loop_end_2513:

   ; init stack for qs
   push right2510[ebp]
   push arg_first2506[ebp]
   push arg_s_arr2506[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2506[ebp]
   push left2510[ebp]
   push arg_s_arr2506[ebp]
   ; call qs
   call qs

_if_end_2510:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2522[ebp]
   pop ecx
   push arg_last2522[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349840696236
   push 1
   jmp _compare_end604349840696236
_compare_not_equal604349840696236:
   push 0
_compare_end604349840696236:
   pop eax
   cmp eax, 0
   je _if_end_2526
_if_start_2526:
   push arg_first2522[ebp]
   pop eax
   mov left2526[ebp], eax
   push arg_last2522[ebp]
   pop eax
   mov right2526[ebp], eax
   push left2526[ebp]
   push right2526[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2522[ebp]
   push [esi[edx]]
   pop eax
   mov middle2526[ebp], eax
_loop_start_2529:
_loop_aftereffects_2529:
_loop_start_2532:
_loop_aftereffects_2532:
   push left2526[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2522[ebp]
   push [esi[edx]]
   pop ecx
   push middle2526[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349841970214
   push 1
   jmp _compare_end604349841970214
_compare_not_equal604349841970214:
   push 0
_compare_end604349841970214:
   pop eax
   cmp eax, 0
   je _loop_end_2532
   push left2526[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2526[ebp], eax
   jmp _loop_start_2532
_loop_end_2532:
_loop_start_2535:
_loop_aftereffects_2535:
   push right2526[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2522[ebp]
   push [esi[edx]]
   pop ecx
   push middle2526[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349842689954
   push 1
   jmp _compare_end604349842689954
_compare_not_equal604349842689954:
   push 0
_compare_end604349842689954:
   pop eax
   cmp eax, 0
   je _loop_end_2535
   push right2526[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2526[ebp], eax
   jmp _loop_start_2535
_loop_end_2535:
   push left2526[ebp]
   pop ecx
   push right2526[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349843407984
   push 1
   jmp _compare_end604349843407984
_compare_not_equal604349843407984:
   push 0
_compare_end604349843407984:
   pop eax
   cmp eax, 0
   je _if_end_2537
_if_start_2537:
   push left2526[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2522[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2537[ebp], eax
   push right2526[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2522[ebp]
   push [esi[edx]]
   pop edx
   push left2526[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2522[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2537[ebp]
   pop edx
   push right2526[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2522[ebp]
   add esi, ecx
   mov [esi], edx
   push left2526[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2526[ebp], eax
   push right2526[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2526[ebp], eax
_if_end_2537:
   push left2526[ebp]
   pop ecx
   push right2526[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349845405551
   push 1
   jmp _compare_end604349845405551
_compare_not_equal604349845405551:
   push 0
_compare_end604349845405551:
   pop eax
   cmp eax, 0
   je _loop_end_2529
   jmp _loop_start_2529
_loop_end_2529:

   ; init stack for qs
   push right2526[ebp]
   push arg_first2522[ebp]
   push arg_s_arr2522[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2522[ebp]
   push left2526[ebp]
   push arg_s_arr2522[ebp]
   ; call qs
   call qs

_if_end_2526:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2538[ebp]
   pop ecx
   push arg_last2538[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349846006404
   push 1
   jmp _compare_end604349846006404
_compare_not_equal604349846006404:
   push 0
_compare_end604349846006404:
   pop eax
   cmp eax, 0
   je _if_end_2542
_if_start_2542:
   push arg_first2538[ebp]
   pop eax
   mov left2542[ebp], eax
   push arg_last2538[ebp]
   pop eax
   mov right2542[ebp], eax
   push left2542[ebp]
   push right2542[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2538[ebp]
   push [esi[edx]]
   pop eax
   mov middle2542[ebp], eax
_loop_start_2545:
_loop_aftereffects_2545:
_loop_start_2548:
_loop_aftereffects_2548:
   push left2542[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2538[ebp]
   push [esi[edx]]
   pop ecx
   push middle2542[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349847096919
   push 1
   jmp _compare_end604349847096919
_compare_not_equal604349847096919:
   push 0
_compare_end604349847096919:
   pop eax
   cmp eax, 0
   je _loop_end_2548
   push left2542[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2542[ebp], eax
   jmp _loop_start_2548
_loop_end_2548:
_loop_start_2551:
_loop_aftereffects_2551:
   push right2542[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2538[ebp]
   push [esi[edx]]
   pop ecx
   push middle2542[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349847189720
   push 1
   jmp _compare_end604349847189720
_compare_not_equal604349847189720:
   push 0
_compare_end604349847189720:
   pop eax
   cmp eax, 0
   je _loop_end_2551
   push right2542[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2542[ebp], eax
   jmp _loop_start_2551
_loop_end_2551:
   push left2542[ebp]
   pop ecx
   push right2542[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349847298344
   push 1
   jmp _compare_end604349847298344
_compare_not_equal604349847298344:
   push 0
_compare_end604349847298344:
   pop eax
   cmp eax, 0
   je _if_end_2553
_if_start_2553:
   push left2542[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2538[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2553[ebp], eax
   push right2542[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2538[ebp]
   push [esi[edx]]
   pop edx
   push left2542[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2538[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2553[ebp]
   pop edx
   push right2542[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2538[ebp]
   add esi, ecx
   mov [esi], edx
   push left2542[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2542[ebp], eax
   push right2542[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2542[ebp], eax
_if_end_2553:
   push left2542[ebp]
   pop ecx
   push right2542[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349848567191
   push 1
   jmp _compare_end604349848567191
_compare_not_equal604349848567191:
   push 0
_compare_end604349848567191:
   pop eax
   cmp eax, 0
   je _loop_end_2545
   jmp _loop_start_2545
_loop_end_2545:

   ; init stack for qs
   push right2542[ebp]
   push arg_first2538[ebp]
   push arg_s_arr2538[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2538[ebp]
   push left2542[ebp]
   push arg_s_arr2538[ebp]
   ; call qs
   call qs

_if_end_2542:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2554[ebp]
   pop ecx
   push arg_last2554[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349849579445
   push 1
   jmp _compare_end604349849579445
_compare_not_equal604349849579445:
   push 0
_compare_end604349849579445:
   pop eax
   cmp eax, 0
   je _if_end_2558
_if_start_2558:
   push arg_first2554[ebp]
   pop eax
   mov left2558[ebp], eax
   push arg_last2554[ebp]
   pop eax
   mov right2558[ebp], eax
   push left2558[ebp]
   push right2558[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2554[ebp]
   push [esi[edx]]
   pop eax
   mov middle2558[ebp], eax
_loop_start_2561:
_loop_aftereffects_2561:
_loop_start_2564:
_loop_aftereffects_2564:
   push left2558[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2554[ebp]
   push [esi[edx]]
   pop ecx
   push middle2558[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349850523703
   push 1
   jmp _compare_end604349850523703
_compare_not_equal604349850523703:
   push 0
_compare_end604349850523703:
   pop eax
   cmp eax, 0
   je _loop_end_2564
   push left2558[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2558[ebp], eax
   jmp _loop_start_2564
_loop_end_2564:
_loop_start_2567:
_loop_aftereffects_2567:
   push right2558[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2554[ebp]
   push [esi[edx]]
   pop ecx
   push middle2558[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349850616932
   push 1
   jmp _compare_end604349850616932
_compare_not_equal604349850616932:
   push 0
_compare_end604349850616932:
   pop eax
   cmp eax, 0
   je _loop_end_2567
   push right2558[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2558[ebp], eax
   jmp _loop_start_2567
_loop_end_2567:
   push left2558[ebp]
   pop ecx
   push right2558[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349850784572
   push 1
   jmp _compare_end604349850784572
_compare_not_equal604349850784572:
   push 0
_compare_end604349850784572:
   pop eax
   cmp eax, 0
   je _if_end_2569
_if_start_2569:
   push left2558[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2554[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2569[ebp], eax
   push right2558[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2554[ebp]
   push [esi[edx]]
   pop edx
   push left2558[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2554[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2569[ebp]
   pop edx
   push right2558[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2554[ebp]
   add esi, ecx
   mov [esi], edx
   push left2558[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2558[ebp], eax
   push right2558[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2558[ebp], eax
_if_end_2569:
   push left2558[ebp]
   pop ecx
   push right2558[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349851506023
   push 1
   jmp _compare_end604349851506023
_compare_not_equal604349851506023:
   push 0
_compare_end604349851506023:
   pop eax
   cmp eax, 0
   je _loop_end_2561
   jmp _loop_start_2561
_loop_end_2561:

   ; init stack for qs
   push right2558[ebp]
   push arg_first2554[ebp]
   push arg_s_arr2554[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2554[ebp]
   push left2558[ebp]
   push arg_s_arr2554[ebp]
   ; call qs
   call qs

_if_end_2558:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2570[ebp]
   pop ecx
   push arg_last2570[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349851940090
   push 1
   jmp _compare_end604349851940090
_compare_not_equal604349851940090:
   push 0
_compare_end604349851940090:
   pop eax
   cmp eax, 0
   je _if_end_2574
_if_start_2574:
   push arg_first2570[ebp]
   pop eax
   mov left2574[ebp], eax
   push arg_last2570[ebp]
   pop eax
   mov right2574[ebp], eax
   push left2574[ebp]
   push right2574[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2570[ebp]
   push [esi[edx]]
   pop eax
   mov middle2574[ebp], eax
_loop_start_2577:
_loop_aftereffects_2577:
_loop_start_2580:
_loop_aftereffects_2580:
   push left2574[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2570[ebp]
   push [esi[edx]]
   pop ecx
   push middle2574[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349852168030
   push 1
   jmp _compare_end604349852168030
_compare_not_equal604349852168030:
   push 0
_compare_end604349852168030:
   pop eax
   cmp eax, 0
   je _loop_end_2580
   push left2574[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2574[ebp], eax
   jmp _loop_start_2580
_loop_end_2580:
_loop_start_2583:
_loop_aftereffects_2583:
   push right2574[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2570[ebp]
   push [esi[edx]]
   pop ecx
   push middle2574[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349852262113
   push 1
   jmp _compare_end604349852262113
_compare_not_equal604349852262113:
   push 0
_compare_end604349852262113:
   pop eax
   cmp eax, 0
   je _loop_end_2583
   push right2574[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2574[ebp], eax
   jmp _loop_start_2583
_loop_end_2583:
   push left2574[ebp]
   pop ecx
   push right2574[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349852354486
   push 1
   jmp _compare_end604349852354486
_compare_not_equal604349852354486:
   push 0
_compare_end604349852354486:
   pop eax
   cmp eax, 0
   je _if_end_2585
_if_start_2585:
   push left2574[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2570[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2585[ebp], eax
   push right2574[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2570[ebp]
   push [esi[edx]]
   pop edx
   push left2574[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2570[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2585[ebp]
   pop edx
   push right2574[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2570[ebp]
   add esi, ecx
   mov [esi], edx
   push left2574[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2574[ebp], eax
   push right2574[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2574[ebp], eax
_if_end_2585:
   push left2574[ebp]
   pop ecx
   push right2574[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349852650850
   push 1
   jmp _compare_end604349852650850
_compare_not_equal604349852650850:
   push 0
_compare_end604349852650850:
   pop eax
   cmp eax, 0
   je _loop_end_2577
   jmp _loop_start_2577
_loop_end_2577:

   ; init stack for qs
   push right2574[ebp]
   push arg_first2570[ebp]
   push arg_s_arr2570[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2570[ebp]
   push left2574[ebp]
   push arg_s_arr2570[ebp]
   ; call qs
   call qs

_if_end_2574:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2586[ebp]
   pop ecx
   push arg_last2586[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349852780001
   push 1
   jmp _compare_end604349852780001
_compare_not_equal604349852780001:
   push 0
_compare_end604349852780001:
   pop eax
   cmp eax, 0
   je _if_end_2590
_if_start_2590:
   push arg_first2586[ebp]
   pop eax
   mov left2590[ebp], eax
   push arg_last2586[ebp]
   pop eax
   mov right2590[ebp], eax
   push left2590[ebp]
   push right2590[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2586[ebp]
   push [esi[edx]]
   pop eax
   mov middle2590[ebp], eax
_loop_start_2593:
_loop_aftereffects_2593:
_loop_start_2596:
_loop_aftereffects_2596:
   push left2590[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2586[ebp]
   push [esi[edx]]
   pop ecx
   push middle2590[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349852952773
   push 1
   jmp _compare_end604349852952773
_compare_not_equal604349852952773:
   push 0
_compare_end604349852952773:
   pop eax
   cmp eax, 0
   je _loop_end_2596
   push left2590[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2590[ebp], eax
   jmp _loop_start_2596
_loop_end_2596:
_loop_start_2599:
_loop_aftereffects_2599:
   push right2590[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2586[ebp]
   push [esi[edx]]
   pop ecx
   push middle2590[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349853044291
   push 1
   jmp _compare_end604349853044291
_compare_not_equal604349853044291:
   push 0
_compare_end604349853044291:
   pop eax
   cmp eax, 0
   je _loop_end_2599
   push right2590[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2590[ebp], eax
   jmp _loop_start_2599
_loop_end_2599:
   push left2590[ebp]
   pop ecx
   push right2590[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349853135808
   push 1
   jmp _compare_end604349853135808
_compare_not_equal604349853135808:
   push 0
_compare_end604349853135808:
   pop eax
   cmp eax, 0
   je _if_end_2601
_if_start_2601:
   push left2590[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2586[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2601[ebp], eax
   push right2590[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2586[ebp]
   push [esi[edx]]
   pop edx
   push left2590[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2586[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2601[ebp]
   pop edx
   push right2590[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2586[ebp]
   add esi, ecx
   mov [esi], edx
   push left2590[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2590[ebp], eax
   push right2590[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2590[ebp], eax
_if_end_2601:
   push left2590[ebp]
   pop ecx
   push right2590[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349853435593
   push 1
   jmp _compare_end604349853435593
_compare_not_equal604349853435593:
   push 0
_compare_end604349853435593:
   pop eax
   cmp eax, 0
   je _loop_end_2593
   jmp _loop_start_2593
_loop_end_2593:

   ; init stack for qs
   push right2590[ebp]
   push arg_first2586[ebp]
   push arg_s_arr2586[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2586[ebp]
   push left2590[ebp]
   push arg_s_arr2586[ebp]
   ; call qs
   call qs

_if_end_2590:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2602[ebp]
   pop ecx
   push arg_last2602[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349853560040
   push 1
   jmp _compare_end604349853560040
_compare_not_equal604349853560040:
   push 0
_compare_end604349853560040:
   pop eax
   cmp eax, 0
   je _if_end_2606
_if_start_2606:
   push arg_first2602[ebp]
   pop eax
   mov left2606[ebp], eax
   push arg_last2602[ebp]
   pop eax
   mov right2606[ebp], eax
   push left2606[ebp]
   push right2606[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2602[ebp]
   push [esi[edx]]
   pop eax
   mov middle2606[ebp], eax
_loop_start_2609:
_loop_aftereffects_2609:
_loop_start_2612:
_loop_aftereffects_2612:
   push left2606[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2602[ebp]
   push [esi[edx]]
   pop ecx
   push middle2606[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349853744359
   push 1
   jmp _compare_end604349853744359
_compare_not_equal604349853744359:
   push 0
_compare_end604349853744359:
   pop eax
   cmp eax, 0
   je _loop_end_2612
   push left2606[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2606[ebp], eax
   jmp _loop_start_2612
_loop_end_2612:
_loop_start_2615:
_loop_aftereffects_2615:
   push right2606[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2602[ebp]
   push [esi[edx]]
   pop ecx
   push middle2606[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349853839725
   push 1
   jmp _compare_end604349853839725
_compare_not_equal604349853839725:
   push 0
_compare_end604349853839725:
   pop eax
   cmp eax, 0
   je _loop_end_2615
   push right2606[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2606[ebp], eax
   jmp _loop_start_2615
_loop_end_2615:
   push left2606[ebp]
   pop ecx
   push right2606[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349853932098
   push 1
   jmp _compare_end604349853932098
_compare_not_equal604349853932098:
   push 0
_compare_end604349853932098:
   pop eax
   cmp eax, 0
   je _if_end_2617
_if_start_2617:
   push left2606[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2602[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2617[ebp], eax
   push right2606[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2602[ebp]
   push [esi[edx]]
   pop edx
   push left2606[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2602[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2617[ebp]
   pop edx
   push right2606[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2602[ebp]
   add esi, ecx
   mov [esi], edx
   push left2606[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2606[ebp], eax
   push right2606[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2606[ebp], eax
_if_end_2617:
   push left2606[ebp]
   pop ecx
   push right2606[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349854470086
   push 1
   jmp _compare_end604349854470086
_compare_not_equal604349854470086:
   push 0
_compare_end604349854470086:
   pop eax
   cmp eax, 0
   je _loop_end_2609
   jmp _loop_start_2609
_loop_end_2609:

   ; init stack for qs
   push right2606[ebp]
   push arg_first2602[ebp]
   push arg_s_arr2602[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2602[ebp]
   push left2606[ebp]
   push arg_s_arr2602[ebp]
   ; call qs
   call qs

_if_end_2606:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2618[ebp]
   pop ecx
   push arg_last2618[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349854690755
   push 1
   jmp _compare_end604349854690755
_compare_not_equal604349854690755:
   push 0
_compare_end604349854690755:
   pop eax
   cmp eax, 0
   je _if_end_2622
_if_start_2622:
   push arg_first2618[ebp]
   pop eax
   mov left2622[ebp], eax
   push arg_last2618[ebp]
   pop eax
   mov right2622[ebp], eax
   push left2622[ebp]
   push right2622[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2618[ebp]
   push [esi[edx]]
   pop eax
   mov middle2622[ebp], eax
_loop_start_2625:
_loop_aftereffects_2625:
_loop_start_2628:
_loop_aftereffects_2628:
   push left2622[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2618[ebp]
   push [esi[edx]]
   pop ecx
   push middle2622[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349855041858
   push 1
   jmp _compare_end604349855041858
_compare_not_equal604349855041858:
   push 0
_compare_end604349855041858:
   pop eax
   cmp eax, 0
   je _loop_end_2628
   push left2622[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2622[ebp], eax
   jmp _loop_start_2628
_loop_end_2628:
_loop_start_2631:
_loop_aftereffects_2631:
   push right2622[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2618[ebp]
   push [esi[edx]]
   pop ecx
   push middle2622[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349855801798
   push 1
   jmp _compare_end604349855801798
_compare_not_equal604349855801798:
   push 0
_compare_end604349855801798:
   pop eax
   cmp eax, 0
   je _loop_end_2631
   push right2622[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2622[ebp], eax
   jmp _loop_start_2631
_loop_end_2631:
   push left2622[ebp]
   pop ecx
   push right2622[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349856586969
   push 1
   jmp _compare_end604349856586969
_compare_not_equal604349856586969:
   push 0
_compare_end604349856586969:
   pop eax
   cmp eax, 0
   je _if_end_2633
_if_start_2633:
   push left2622[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2618[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2633[ebp], eax
   push right2622[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2618[ebp]
   push [esi[edx]]
   pop edx
   push left2622[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2618[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2633[ebp]
   pop edx
   push right2622[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2618[ebp]
   add esi, ecx
   mov [esi], edx
   push left2622[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2622[ebp], eax
   push right2622[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2622[ebp], eax
_if_end_2633:
   push left2622[ebp]
   pop ecx
   push right2622[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349858990379
   push 1
   jmp _compare_end604349858990379
_compare_not_equal604349858990379:
   push 0
_compare_end604349858990379:
   pop eax
   cmp eax, 0
   je _loop_end_2625
   jmp _loop_start_2625
_loop_end_2625:

   ; init stack for qs
   push right2622[ebp]
   push arg_first2618[ebp]
   push arg_s_arr2618[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2618[ebp]
   push left2622[ebp]
   push arg_s_arr2618[ebp]
   ; call qs
   call qs

_if_end_2622:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2634[ebp]
   pop ecx
   push arg_last2634[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349860014180
   push 1
   jmp _compare_end604349860014180
_compare_not_equal604349860014180:
   push 0
_compare_end604349860014180:
   pop eax
   cmp eax, 0
   je _if_end_2638
_if_start_2638:
   push arg_first2634[ebp]
   pop eax
   mov left2638[ebp], eax
   push arg_last2634[ebp]
   pop eax
   mov right2638[ebp], eax
   push left2638[ebp]
   push right2638[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2634[ebp]
   push [esi[edx]]
   pop eax
   mov middle2638[ebp], eax
_loop_start_2641:
_loop_aftereffects_2641:
_loop_start_2644:
_loop_aftereffects_2644:
   push left2638[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2634[ebp]
   push [esi[edx]]
   pop ecx
   push middle2638[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349861416883
   push 1
   jmp _compare_end604349861416883
_compare_not_equal604349861416883:
   push 0
_compare_end604349861416883:
   pop eax
   cmp eax, 0
   je _loop_end_2644
   push left2638[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2638[ebp], eax
   jmp _loop_start_2644
_loop_end_2644:
_loop_start_2647:
_loop_aftereffects_2647:
   push right2638[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2634[ebp]
   push [esi[edx]]
   pop ecx
   push middle2638[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349862123365
   push 1
   jmp _compare_end604349862123365
_compare_not_equal604349862123365:
   push 0
_compare_end604349862123365:
   pop eax
   cmp eax, 0
   je _loop_end_2647
   push right2638[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2638[ebp], eax
   jmp _loop_start_2647
_loop_end_2647:
   push left2638[ebp]
   pop ecx
   push right2638[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349862926498
   push 1
   jmp _compare_end604349862926498
_compare_not_equal604349862926498:
   push 0
_compare_end604349862926498:
   pop eax
   cmp eax, 0
   je _if_end_2649
_if_start_2649:
   push left2638[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2634[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2649[ebp], eax
   push right2638[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2634[ebp]
   push [esi[edx]]
   pop edx
   push left2638[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2634[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2649[ebp]
   pop edx
   push right2638[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2634[ebp]
   add esi, ecx
   mov [esi], edx
   push left2638[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2638[ebp], eax
   push right2638[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2638[ebp], eax
_if_end_2649:
   push left2638[ebp]
   pop ecx
   push right2638[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349865525773
   push 1
   jmp _compare_end604349865525773
_compare_not_equal604349865525773:
   push 0
_compare_end604349865525773:
   pop eax
   cmp eax, 0
   je _loop_end_2641
   jmp _loop_start_2641
_loop_end_2641:

   ; init stack for qs
   push right2638[ebp]
   push arg_first2634[ebp]
   push arg_s_arr2634[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2634[ebp]
   push left2638[ebp]
   push arg_s_arr2634[ebp]
   ; call qs
   call qs

_if_end_2638:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2650[ebp]
   pop ecx
   push arg_last2650[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349866343874
   push 1
   jmp _compare_end604349866343874
_compare_not_equal604349866343874:
   push 0
_compare_end604349866343874:
   pop eax
   cmp eax, 0
   je _if_end_2654
_if_start_2654:
   push arg_first2650[ebp]
   pop eax
   mov left2654[ebp], eax
   push arg_last2650[ebp]
   pop eax
   mov right2654[ebp], eax
   push left2654[ebp]
   push right2654[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2650[ebp]
   push [esi[edx]]
   pop eax
   mov middle2654[ebp], eax
_loop_start_2657:
_loop_aftereffects_2657:
_loop_start_2660:
_loop_aftereffects_2660:
   push left2654[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2650[ebp]
   push [esi[edx]]
   pop ecx
   push middle2654[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349867713646
   push 1
   jmp _compare_end604349867713646
_compare_not_equal604349867713646:
   push 0
_compare_end604349867713646:
   pop eax
   cmp eax, 0
   je _loop_end_2660
   push left2654[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2654[ebp], eax
   jmp _loop_start_2660
_loop_end_2660:
_loop_start_2663:
_loop_aftereffects_2663:
   push right2654[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2650[ebp]
   push [esi[edx]]
   pop ecx
   push middle2654[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349868149425
   push 1
   jmp _compare_end604349868149425
_compare_not_equal604349868149425:
   push 0
_compare_end604349868149425:
   pop eax
   cmp eax, 0
   je _loop_end_2663
   push right2654[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2654[ebp], eax
   jmp _loop_start_2663
_loop_end_2663:
   push left2654[ebp]
   pop ecx
   push right2654[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349868904660
   push 1
   jmp _compare_end604349868904660
_compare_not_equal604349868904660:
   push 0
_compare_end604349868904660:
   pop eax
   cmp eax, 0
   je _if_end_2665
_if_start_2665:
   push left2654[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2650[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2665[ebp], eax
   push right2654[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2650[ebp]
   push [esi[edx]]
   pop edx
   push left2654[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2650[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2665[ebp]
   pop edx
   push right2654[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2650[ebp]
   add esi, ecx
   mov [esi], edx
   push left2654[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2654[ebp], eax
   push right2654[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2654[ebp], eax
_if_end_2665:
   push left2654[ebp]
   pop ecx
   push right2654[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349871304222
   push 1
   jmp _compare_end604349871304222
_compare_not_equal604349871304222:
   push 0
_compare_end604349871304222:
   pop eax
   cmp eax, 0
   je _loop_end_2657
   jmp _loop_start_2657
_loop_end_2657:

   ; init stack for qs
   push right2654[ebp]
   push arg_first2650[ebp]
   push arg_s_arr2650[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2650[ebp]
   push left2654[ebp]
   push arg_s_arr2650[ebp]
   ; call qs
   call qs

_if_end_2654:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2666[ebp]
   pop ecx
   push arg_last2666[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349872295949
   push 1
   jmp _compare_end604349872295949
_compare_not_equal604349872295949:
   push 0
_compare_end604349872295949:
   pop eax
   cmp eax, 0
   je _if_end_2670
_if_start_2670:
   push arg_first2666[ebp]
   pop eax
   mov left2670[ebp], eax
   push arg_last2666[ebp]
   pop eax
   mov right2670[ebp], eax
   push left2670[ebp]
   push right2670[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2666[ebp]
   push [esi[edx]]
   pop eax
   mov middle2670[ebp], eax
_loop_start_2673:
_loop_aftereffects_2673:
_loop_start_2676:
_loop_aftereffects_2676:
   push left2670[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2666[ebp]
   push [esi[edx]]
   pop ecx
   push middle2670[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349873764937
   push 1
   jmp _compare_end604349873764937
_compare_not_equal604349873764937:
   push 0
_compare_end604349873764937:
   pop eax
   cmp eax, 0
   je _loop_end_2676
   push left2670[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2670[ebp], eax
   jmp _loop_start_2676
_loop_end_2676:
_loop_start_2679:
_loop_aftereffects_2679:
   push right2670[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2666[ebp]
   push [esi[edx]]
   pop ecx
   push middle2670[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349874392304
   push 1
   jmp _compare_end604349874392304
_compare_not_equal604349874392304:
   push 0
_compare_end604349874392304:
   pop eax
   cmp eax, 0
   je _loop_end_2679
   push right2670[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2670[ebp], eax
   jmp _loop_start_2679
_loop_end_2679:
   push left2670[ebp]
   pop ecx
   push right2670[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349875195437
   push 1
   jmp _compare_end604349875195437
_compare_not_equal604349875195437:
   push 0
_compare_end604349875195437:
   pop eax
   cmp eax, 0
   je _if_end_2681
_if_start_2681:
   push left2670[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2666[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2681[ebp], eax
   push right2670[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2666[ebp]
   push [esi[edx]]
   pop edx
   push left2670[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2666[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2681[ebp]
   pop edx
   push right2670[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2666[ebp]
   add esi, ecx
   mov [esi], edx
   push left2670[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2670[ebp], eax
   push right2670[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2670[ebp], eax
_if_end_2681:
   push left2670[ebp]
   pop ecx
   push right2670[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349877477821
   push 1
   jmp _compare_end604349877477821
_compare_not_equal604349877477821:
   push 0
_compare_end604349877477821:
   pop eax
   cmp eax, 0
   je _loop_end_2673
   jmp _loop_start_2673
_loop_end_2673:

   ; init stack for qs
   push right2670[ebp]
   push arg_first2666[ebp]
   push arg_s_arr2666[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2666[ebp]
   push left2670[ebp]
   push arg_s_arr2666[ebp]
   ; call qs
   call qs

_if_end_2670:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2682[ebp]
   pop ecx
   push arg_last2682[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349878016664
   push 1
   jmp _compare_end604349878016664
_compare_not_equal604349878016664:
   push 0
_compare_end604349878016664:
   pop eax
   cmp eax, 0
   je _if_end_2686
_if_start_2686:
   push arg_first2682[ebp]
   pop eax
   mov left2686[ebp], eax
   push arg_last2682[ebp]
   pop eax
   mov right2686[ebp], eax
   push left2686[ebp]
   push right2686[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2682[ebp]
   push [esi[edx]]
   pop eax
   mov middle2686[ebp], eax
_loop_start_2689:
_loop_aftereffects_2689:
_loop_start_2692:
_loop_aftereffects_2692:
   push left2686[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2682[ebp]
   push [esi[edx]]
   pop ecx
   push middle2686[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349878195423
   push 1
   jmp _compare_end604349878195423
_compare_not_equal604349878195423:
   push 0
_compare_end604349878195423:
   pop eax
   cmp eax, 0
   je _loop_end_2692
   push left2686[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2686[ebp], eax
   jmp _loop_start_2692
_loop_end_2692:
_loop_start_2695:
_loop_aftereffects_2695:
   push right2686[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2682[ebp]
   push [esi[edx]]
   pop ecx
   push middle2686[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349878293356
   push 1
   jmp _compare_end604349878293356
_compare_not_equal604349878293356:
   push 0
_compare_end604349878293356:
   pop eax
   cmp eax, 0
   je _loop_end_2695
   push right2686[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2686[ebp], eax
   jmp _loop_start_2695
_loop_end_2695:
   push left2686[ebp]
   pop ecx
   push right2686[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349878388722
   push 1
   jmp _compare_end604349878388722
_compare_not_equal604349878388722:
   push 0
_compare_end604349878388722:
   pop eax
   cmp eax, 0
   je _if_end_2697
_if_start_2697:
   push left2686[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2682[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2697[ebp], eax
   push right2686[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2682[ebp]
   push [esi[edx]]
   pop edx
   push left2686[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2682[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2697[ebp]
   pop edx
   push right2686[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2682[ebp]
   add esi, ecx
   mov [esi], edx
   push left2686[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2686[ebp], eax
   push right2686[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2686[ebp], eax
_if_end_2697:
   push left2686[ebp]
   pop ecx
   push right2686[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349878781308
   push 1
   jmp _compare_end604349878781308
_compare_not_equal604349878781308:
   push 0
_compare_end604349878781308:
   pop eax
   cmp eax, 0
   je _loop_end_2689
   jmp _loop_start_2689
_loop_end_2689:

   ; init stack for qs
   push right2686[ebp]
   push arg_first2682[ebp]
   push arg_s_arr2682[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2682[ebp]
   push left2686[ebp]
   push arg_s_arr2682[ebp]
   ; call qs
   call qs

_if_end_2686:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2698[ebp]
   pop ecx
   push arg_last2698[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349879407392
   push 1
   jmp _compare_end604349879407392
_compare_not_equal604349879407392:
   push 0
_compare_end604349879407392:
   pop eax
   cmp eax, 0
   je _if_end_2702
_if_start_2702:
   push arg_first2698[ebp]
   pop eax
   mov left2702[ebp], eax
   push arg_last2698[ebp]
   pop eax
   mov right2702[ebp], eax
   push left2702[ebp]
   push right2702[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2698[ebp]
   push [esi[edx]]
   pop eax
   mov middle2702[ebp], eax
_loop_start_2705:
_loop_aftereffects_2705:
_loop_start_2708:
_loop_aftereffects_2708:
   push left2702[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2698[ebp]
   push [esi[edx]]
   pop ecx
   push middle2702[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349880610380
   push 1
   jmp _compare_end604349880610380
_compare_not_equal604349880610380:
   push 0
_compare_end604349880610380:
   pop eax
   cmp eax, 0
   je _loop_end_2708
   push left2702[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2702[ebp], eax
   jmp _loop_start_2708
_loop_end_2708:
_loop_start_2711:
_loop_aftereffects_2711:
   push right2702[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2698[ebp]
   push [esi[edx]]
   pop ecx
   push middle2702[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349881391275
   push 1
   jmp _compare_end604349881391275
_compare_not_equal604349881391275:
   push 0
_compare_end604349881391275:
   pop eax
   cmp eax, 0
   je _loop_end_2711
   push right2702[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2702[ebp], eax
   jmp _loop_start_2711
_loop_end_2711:
   push left2702[ebp]
   pop ecx
   push right2702[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349881522137
   push 1
   jmp _compare_end604349881522137
_compare_not_equal604349881522137:
   push 0
_compare_end604349881522137:
   pop eax
   cmp eax, 0
   je _if_end_2713
_if_start_2713:
   push left2702[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2698[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2713[ebp], eax
   push right2702[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2698[ebp]
   push [esi[edx]]
   pop edx
   push left2702[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2698[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2713[ebp]
   pop edx
   push right2702[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2698[ebp]
   add esi, ecx
   mov [esi], edx
   push left2702[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2702[ebp], eax
   push right2702[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2702[ebp], eax
_if_end_2713:
   push left2702[ebp]
   pop ecx
   push right2702[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349881962192
   push 1
   jmp _compare_end604349881962192
_compare_not_equal604349881962192:
   push 0
_compare_end604349881962192:
   pop eax
   cmp eax, 0
   je _loop_end_2705
   jmp _loop_start_2705
_loop_end_2705:

   ; init stack for qs
   push right2702[ebp]
   push arg_first2698[ebp]
   push arg_s_arr2698[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2698[ebp]
   push left2702[ebp]
   push arg_s_arr2698[ebp]
   ; call qs
   call qs

_if_end_2702:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2714[ebp]
   pop ecx
   push arg_last2714[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349882100751
   push 1
   jmp _compare_end604349882100751
_compare_not_equal604349882100751:
   push 0
_compare_end604349882100751:
   pop eax
   cmp eax, 0
   je _if_end_2718
_if_start_2718:
   push arg_first2714[ebp]
   pop eax
   mov left2718[ebp], eax
   push arg_last2714[ebp]
   pop eax
   mov right2718[ebp], eax
   push left2718[ebp]
   push right2718[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2714[ebp]
   push [esi[edx]]
   pop eax
   mov middle2718[ebp], eax
_loop_start_2721:
_loop_aftereffects_2721:
_loop_start_2724:
_loop_aftereffects_2724:
   push left2718[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2714[ebp]
   push [esi[edx]]
   pop ecx
   push middle2718[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349882283359
   push 1
   jmp _compare_end604349882283359
_compare_not_equal604349882283359:
   push 0
_compare_end604349882283359:
   pop eax
   cmp eax, 0
   je _loop_end_2724
   push left2718[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2718[ebp], eax
   jmp _loop_start_2724
_loop_end_2724:
_loop_start_2727:
_loop_aftereffects_2727:
   push right2718[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2714[ebp]
   push [esi[edx]]
   pop ecx
   push middle2718[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349882379581
   push 1
   jmp _compare_end604349882379581
_compare_not_equal604349882379581:
   push 0
_compare_end604349882379581:
   pop eax
   cmp eax, 0
   je _loop_end_2727
   push right2718[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2718[ebp], eax
   jmp _loop_start_2727
_loop_end_2727:
   push left2718[ebp]
   pop ecx
   push right2718[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349882475375
   push 1
   jmp _compare_end604349882475375
_compare_not_equal604349882475375:
   push 0
_compare_end604349882475375:
   pop eax
   cmp eax, 0
   je _if_end_2729
_if_start_2729:
   push left2718[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2714[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2729[ebp], eax
   push right2718[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2714[ebp]
   push [esi[edx]]
   pop edx
   push left2718[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2714[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2729[ebp]
   pop edx
   push right2718[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2714[ebp]
   add esi, ecx
   mov [esi], edx
   push left2718[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2718[ebp], eax
   push right2718[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2718[ebp], eax
_if_end_2729:
   push left2718[ebp]
   pop ecx
   push right2718[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349882887633
   push 1
   jmp _compare_end604349882887633
_compare_not_equal604349882887633:
   push 0
_compare_end604349882887633:
   pop eax
   cmp eax, 0
   je _loop_end_2721
   jmp _loop_start_2721
_loop_end_2721:

   ; init stack for qs
   push right2718[ebp]
   push arg_first2714[ebp]
   push arg_s_arr2714[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2714[ebp]
   push left2718[ebp]
   push arg_s_arr2714[ebp]
   ; call qs
   call qs

_if_end_2718:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2730[ebp]
   pop ecx
   push arg_last2730[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349883029614
   push 1
   jmp _compare_end604349883029614
_compare_not_equal604349883029614:
   push 0
_compare_end604349883029614:
   pop eax
   cmp eax, 0
   je _if_end_2734
_if_start_2734:
   push arg_first2730[ebp]
   pop eax
   mov left2734[ebp], eax
   push arg_last2730[ebp]
   pop eax
   mov right2734[ebp], eax
   push left2734[ebp]
   push right2734[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2730[ebp]
   push [esi[edx]]
   pop eax
   mov middle2734[ebp], eax
_loop_start_2737:
_loop_aftereffects_2737:
_loop_start_2740:
_loop_aftereffects_2740:
   push left2734[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2730[ebp]
   push [esi[edx]]
   pop ecx
   push middle2734[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349883211366
   push 1
   jmp _compare_end604349883211366
_compare_not_equal604349883211366:
   push 0
_compare_end604349883211366:
   pop eax
   cmp eax, 0
   je _loop_end_2740
   push left2734[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2734[ebp], eax
   jmp _loop_start_2740
_loop_end_2740:
_loop_start_2743:
_loop_aftereffects_2743:
   push right2734[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2730[ebp]
   push [esi[edx]]
   pop ecx
   push middle2734[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349883312292
   push 1
   jmp _compare_end604349883312292
_compare_not_equal604349883312292:
   push 0
_compare_end604349883312292:
   pop eax
   cmp eax, 0
   je _loop_end_2743
   push right2734[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2734[ebp], eax
   jmp _loop_start_2743
_loop_end_2743:
   push left2734[ebp]
   pop ecx
   push right2734[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349883410225
   push 1
   jmp _compare_end604349883410225
_compare_not_equal604349883410225:
   push 0
_compare_end604349883410225:
   pop eax
   cmp eax, 0
   je _if_end_2745
_if_start_2745:
   push left2734[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2730[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2745[ebp], eax
   push right2734[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2730[ebp]
   push [esi[edx]]
   pop edx
   push left2734[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2730[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2745[ebp]
   pop edx
   push right2734[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2730[ebp]
   add esi, ecx
   mov [esi], edx
   push left2734[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2734[ebp], eax
   push right2734[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2734[ebp], eax
_if_end_2745:
   push left2734[ebp]
   pop ecx
   push right2734[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349883724550
   push 1
   jmp _compare_end604349883724550
_compare_not_equal604349883724550:
   push 0
_compare_end604349883724550:
   pop eax
   cmp eax, 0
   je _loop_end_2737
   jmp _loop_start_2737
_loop_end_2737:

   ; init stack for qs
   push right2734[ebp]
   push arg_first2730[ebp]
   push arg_s_arr2730[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2730[ebp]
   push left2734[ebp]
   push arg_s_arr2730[ebp]
   ; call qs
   call qs

_if_end_2734:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2746[ebp]
   pop ecx
   push arg_last2746[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349883873801
   push 1
   jmp _compare_end604349883873801
_compare_not_equal604349883873801:
   push 0
_compare_end604349883873801:
   pop eax
   cmp eax, 0
   je _if_end_2750
_if_start_2750:
   push arg_first2746[ebp]
   pop eax
   mov left2750[ebp], eax
   push arg_last2746[ebp]
   pop eax
   mov right2750[ebp], eax
   push left2750[ebp]
   push right2750[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2746[ebp]
   push [esi[edx]]
   pop eax
   mov middle2750[ebp], eax
_loop_start_2753:
_loop_aftereffects_2753:
_loop_start_2756:
_loop_aftereffects_2756:
   push left2750[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2746[ebp]
   push [esi[edx]]
   pop ecx
   push middle2750[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349884057692
   push 1
   jmp _compare_end604349884057692
_compare_not_equal604349884057692:
   push 0
_compare_end604349884057692:
   pop eax
   cmp eax, 0
   je _loop_end_2756
   push left2750[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2750[ebp], eax
   jmp _loop_start_2756
_loop_end_2756:
_loop_start_2759:
_loop_aftereffects_2759:
   push right2750[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2746[ebp]
   push [esi[edx]]
   pop ecx
   push middle2750[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349884154341
   push 1
   jmp _compare_end604349884154341
_compare_not_equal604349884154341:
   push 0
_compare_end604349884154341:
   pop eax
   cmp eax, 0
   je _loop_end_2759
   push right2750[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2750[ebp], eax
   jmp _loop_start_2759
_loop_end_2759:
   push left2750[ebp]
   pop ecx
   push right2750[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349884255267
   push 1
   jmp _compare_end604349884255267
_compare_not_equal604349884255267:
   push 0
_compare_end604349884255267:
   pop eax
   cmp eax, 0
   je _if_end_2761
_if_start_2761:
   push left2750[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2746[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2761[ebp], eax
   push right2750[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2746[ebp]
   push [esi[edx]]
   pop edx
   push left2750[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2746[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2761[ebp]
   pop edx
   push right2750[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2746[ebp]
   add esi, ecx
   mov [esi], edx
   push left2750[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2750[ebp], eax
   push right2750[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2750[ebp], eax
_if_end_2761:
   push left2750[ebp]
   pop ecx
   push right2750[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349884743647
   push 1
   jmp _compare_end604349884743647
_compare_not_equal604349884743647:
   push 0
_compare_end604349884743647:
   pop eax
   cmp eax, 0
   je _loop_end_2753
   jmp _loop_start_2753
_loop_end_2753:

   ; init stack for qs
   push right2750[ebp]
   push arg_first2746[ebp]
   push arg_s_arr2746[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2746[ebp]
   push left2750[ebp]
   push arg_s_arr2746[ebp]
   ; call qs
   call qs

_if_end_2750:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2762[ebp]
   pop ecx
   push arg_last2762[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349884980995
   push 1
   jmp _compare_end604349884980995
_compare_not_equal604349884980995:
   push 0
_compare_end604349884980995:
   pop eax
   cmp eax, 0
   je _if_end_2766
_if_start_2766:
   push arg_first2762[ebp]
   pop eax
   mov left2766[ebp], eax
   push arg_last2762[ebp]
   pop eax
   mov right2766[ebp], eax
   push left2766[ebp]
   push right2766[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2762[ebp]
   push [esi[edx]]
   pop eax
   mov middle2766[ebp], eax
_loop_start_2769:
_loop_aftereffects_2769:
_loop_start_2772:
_loop_aftereffects_2772:
   push left2766[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2762[ebp]
   push [esi[edx]]
   pop ecx
   push middle2766[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349885274365
   push 1
   jmp _compare_end604349885274365
_compare_not_equal604349885274365:
   push 0
_compare_end604349885274365:
   pop eax
   cmp eax, 0
   je _loop_end_2772
   push left2766[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2766[ebp], eax
   jmp _loop_start_2772
_loop_end_2772:
_loop_start_2775:
_loop_aftereffects_2775:
   push right2766[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2762[ebp]
   push [esi[edx]]
   pop ecx
   push middle2766[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349885373580
   push 1
   jmp _compare_end604349885373580
_compare_not_equal604349885373580:
   push 0
_compare_end604349885373580:
   pop eax
   cmp eax, 0
   je _loop_end_2775
   push right2766[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2766[ebp], eax
   jmp _loop_start_2775
_loop_end_2775:
   push left2766[ebp]
   pop ecx
   push right2766[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349885472368
   push 1
   jmp _compare_end604349885472368
_compare_not_equal604349885472368:
   push 0
_compare_end604349885472368:
   pop eax
   cmp eax, 0
   je _if_end_2777
_if_start_2777:
   push left2766[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2762[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2777[ebp], eax
   push right2766[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2762[ebp]
   push [esi[edx]]
   pop edx
   push left2766[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2762[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2777[ebp]
   pop edx
   push right2766[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2762[ebp]
   add esi, ecx
   mov [esi], edx
   push left2766[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2766[ebp], eax
   push right2766[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2766[ebp], eax
_if_end_2777:
   push left2766[ebp]
   pop ecx
   push right2766[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349885792680
   push 1
   jmp _compare_end604349885792680
_compare_not_equal604349885792680:
   push 0
_compare_end604349885792680:
   pop eax
   cmp eax, 0
   je _loop_end_2769
   jmp _loop_start_2769
_loop_end_2769:

   ; init stack for qs
   push right2766[ebp]
   push arg_first2762[ebp]
   push arg_s_arr2762[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2762[ebp]
   push left2766[ebp]
   push arg_s_arr2762[ebp]
   ; call qs
   call qs

_if_end_2766:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2778[ebp]
   pop ecx
   push arg_last2778[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349885925253
   push 1
   jmp _compare_end604349885925253
_compare_not_equal604349885925253:
   push 0
_compare_end604349885925253:
   pop eax
   cmp eax, 0
   je _if_end_2782
_if_start_2782:
   push arg_first2778[ebp]
   pop eax
   mov left2782[ebp], eax
   push arg_last2778[ebp]
   pop eax
   mov right2782[ebp], eax
   push left2782[ebp]
   push right2782[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2778[ebp]
   push [esi[edx]]
   pop eax
   mov middle2782[ebp], eax
_loop_start_2785:
_loop_aftereffects_2785:
_loop_start_2788:
_loop_aftereffects_2788:
   push left2782[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2778[ebp]
   push [esi[edx]]
   pop ecx
   push middle2782[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349886109571
   push 1
   jmp _compare_end604349886109571
_compare_not_equal604349886109571:
   push 0
_compare_end604349886109571:
   pop eax
   cmp eax, 0
   je _loop_end_2788
   push left2782[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2782[ebp], eax
   jmp _loop_start_2788
_loop_end_2788:
_loop_start_2791:
_loop_aftereffects_2791:
   push right2782[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2778[ebp]
   push [esi[edx]]
   pop ecx
   push middle2782[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349886207931
   push 1
   jmp _compare_end604349886207931
_compare_not_equal604349886207931:
   push 0
_compare_end604349886207931:
   pop eax
   cmp eax, 0
   je _loop_end_2791
   push right2782[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2782[ebp], eax
   jmp _loop_start_2791
_loop_end_2791:
   push left2782[ebp]
   pop ecx
   push right2782[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349886309285
   push 1
   jmp _compare_end604349886309285
_compare_not_equal604349886309285:
   push 0
_compare_end604349886309285:
   pop eax
   cmp eax, 0
   je _if_end_2793
_if_start_2793:
   push left2782[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2778[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2793[ebp], eax
   push right2782[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2778[ebp]
   push [esi[edx]]
   pop edx
   push left2782[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2778[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2793[ebp]
   pop edx
   push right2782[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2778[ebp]
   add esi, ecx
   mov [esi], edx
   push left2782[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2782[ebp], eax
   push right2782[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2782[ebp], eax
_if_end_2793:
   push left2782[ebp]
   pop ecx
   push right2782[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349886626604
   push 1
   jmp _compare_end604349886626604
_compare_not_equal604349886626604:
   push 0
_compare_end604349886626604:
   pop eax
   cmp eax, 0
   je _loop_end_2785
   jmp _loop_start_2785
_loop_end_2785:

   ; init stack for qs
   push right2782[ebp]
   push arg_first2778[ebp]
   push arg_s_arr2778[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2778[ebp]
   push left2782[ebp]
   push arg_s_arr2778[ebp]
   ; call qs
   call qs

_if_end_2782:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2794[ebp]
   pop ecx
   push arg_last2794[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349886785263
   push 1
   jmp _compare_end604349886785263
_compare_not_equal604349886785263:
   push 0
_compare_end604349886785263:
   pop eax
   cmp eax, 0
   je _if_end_2798
_if_start_2798:
   push arg_first2794[ebp]
   pop eax
   mov left2798[ebp], eax
   push arg_last2794[ebp]
   pop eax
   mov right2798[ebp], eax
   push left2798[ebp]
   push right2798[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2794[ebp]
   push [esi[edx]]
   pop eax
   mov middle2798[ebp], eax
_loop_start_2801:
_loop_aftereffects_2801:
_loop_start_2804:
_loop_aftereffects_2804:
   push left2798[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2794[ebp]
   push [esi[edx]]
   pop ecx
   push middle2798[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349887010636
   push 1
   jmp _compare_end604349887010636
_compare_not_equal604349887010636:
   push 0
_compare_end604349887010636:
   pop eax
   cmp eax, 0
   je _loop_end_2804
   push left2798[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2798[ebp], eax
   jmp _loop_start_2804
_loop_end_2804:
_loop_start_2807:
_loop_aftereffects_2807:
   push right2798[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2794[ebp]
   push [esi[edx]]
   pop ecx
   push middle2798[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349887113700
   push 1
   jmp _compare_end604349887113700
_compare_not_equal604349887113700:
   push 0
_compare_end604349887113700:
   pop eax
   cmp eax, 0
   je _loop_end_2807
   push right2798[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2798[ebp], eax
   jmp _loop_start_2807
_loop_end_2807:
   push left2798[ebp]
   pop ecx
   push right2798[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349887212488
   push 1
   jmp _compare_end604349887212488
_compare_not_equal604349887212488:
   push 0
_compare_end604349887212488:
   pop eax
   cmp eax, 0
   je _if_end_2809
_if_start_2809:
   push left2798[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2794[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2809[ebp], eax
   push right2798[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2794[ebp]
   push [esi[edx]]
   pop edx
   push left2798[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2794[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2809[ebp]
   pop edx
   push right2798[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2794[ebp]
   add esi, ecx
   mov [esi], edx
   push left2798[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2798[ebp], eax
   push right2798[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2798[ebp], eax
_if_end_2809:
   push left2798[ebp]
   pop ecx
   push right2798[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349887546913
   push 1
   jmp _compare_end604349887546913
_compare_not_equal604349887546913:
   push 0
_compare_end604349887546913:
   pop eax
   cmp eax, 0
   je _loop_end_2801
   jmp _loop_start_2801
_loop_end_2801:

   ; init stack for qs
   push right2798[ebp]
   push arg_first2794[ebp]
   push arg_s_arr2794[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2794[ebp]
   push left2798[ebp]
   push arg_s_arr2794[ebp]
   ; call qs
   call qs

_if_end_2798:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2810[ebp]
   pop ecx
   push arg_last2810[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349887681196
   push 1
   jmp _compare_end604349887681196
_compare_not_equal604349887681196:
   push 0
_compare_end604349887681196:
   pop eax
   cmp eax, 0
   je _if_end_2814
_if_start_2814:
   push arg_first2810[ebp]
   pop eax
   mov left2814[ebp], eax
   push arg_last2810[ebp]
   pop eax
   mov right2814[ebp], eax
   push left2814[ebp]
   push right2814[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2810[ebp]
   push [esi[edx]]
   pop eax
   mov middle2814[ebp], eax
_loop_start_2817:
_loop_aftereffects_2817:
_loop_start_2820:
_loop_aftereffects_2820:
   push left2814[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2810[ebp]
   push [esi[edx]]
   pop ecx
   push middle2814[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349887932228
   push 1
   jmp _compare_end604349887932228
_compare_not_equal604349887932228:
   push 0
_compare_end604349887932228:
   pop eax
   cmp eax, 0
   je _loop_end_2820
   push left2814[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2814[ebp], eax
   jmp _loop_start_2820
_loop_end_2820:
_loop_start_2823:
_loop_aftereffects_2823:
   push right2814[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2810[ebp]
   push [esi[edx]]
   pop ecx
   push middle2814[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349888031872
   push 1
   jmp _compare_end604349888031872
_compare_not_equal604349888031872:
   push 0
_compare_end604349888031872:
   pop eax
   cmp eax, 0
   je _loop_end_2823
   push right2814[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2814[ebp], eax
   jmp _loop_start_2823
_loop_end_2823:
   push left2814[ebp]
   pop ecx
   push right2814[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349888134936
   push 1
   jmp _compare_end604349888134936
_compare_not_equal604349888134936:
   push 0
_compare_end604349888134936:
   pop eax
   cmp eax, 0
   je _if_end_2825
_if_start_2825:
   push left2814[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2810[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2825[ebp], eax
   push right2814[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2810[ebp]
   push [esi[edx]]
   pop edx
   push left2814[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2810[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2825[ebp]
   pop edx
   push right2814[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2810[ebp]
   add esi, ecx
   mov [esi], edx
   push left2814[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2814[ebp], eax
   push right2814[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2814[ebp], eax
_if_end_2825:
   push left2814[ebp]
   pop ecx
   push right2814[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349888459952
   push 1
   jmp _compare_end604349888459952
_compare_not_equal604349888459952:
   push 0
_compare_end604349888459952:
   pop eax
   cmp eax, 0
   je _loop_end_2817
   jmp _loop_start_2817
_loop_end_2817:

   ; init stack for qs
   push right2814[ebp]
   push arg_first2810[ebp]
   push arg_s_arr2810[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2810[ebp]
   push left2814[ebp]
   push arg_s_arr2810[ebp]
   ; call qs
   call qs

_if_end_2814:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2826[ebp]
   pop ecx
   push arg_last2826[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349888596374
   push 1
   jmp _compare_end604349888596374
_compare_not_equal604349888596374:
   push 0
_compare_end604349888596374:
   pop eax
   cmp eax, 0
   je _if_end_2830
_if_start_2830:
   push arg_first2826[ebp]
   pop eax
   mov left2830[ebp], eax
   push arg_last2826[ebp]
   pop eax
   mov right2830[ebp], eax
   push left2830[ebp]
   push right2830[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2826[ebp]
   push [esi[edx]]
   pop eax
   mov middle2830[ebp], eax
_loop_start_2833:
_loop_aftereffects_2833:
_loop_start_2836:
_loop_aftereffects_2836:
   push left2830[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2826[ebp]
   push [esi[edx]]
   pop ecx
   push middle2830[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349888781975
   push 1
   jmp _compare_end604349888781975
_compare_not_equal604349888781975:
   push 0
_compare_end604349888781975:
   pop eax
   cmp eax, 0
   je _loop_end_2836
   push left2830[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2830[ebp], eax
   jmp _loop_start_2836
_loop_end_2836:
_loop_start_2839:
_loop_aftereffects_2839:
   push right2830[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2826[ebp]
   push [esi[edx]]
   pop ecx
   push middle2830[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349888881191
   push 1
   jmp _compare_end604349888881191
_compare_not_equal604349888881191:
   push 0
_compare_end604349888881191:
   pop eax
   cmp eax, 0
   je _loop_end_2839
   push right2830[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2830[ebp], eax
   jmp _loop_start_2839
_loop_end_2839:
   push left2830[ebp]
   pop ecx
   push right2830[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349888984255
   push 1
   jmp _compare_end604349888984255
_compare_not_equal604349888984255:
   push 0
_compare_end604349888984255:
   pop eax
   cmp eax, 0
   je _if_end_2841
_if_start_2841:
   push left2830[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2826[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2841[ebp], eax
   push right2830[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2826[ebp]
   push [esi[edx]]
   pop edx
   push left2830[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2826[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2841[ebp]
   pop edx
   push right2830[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2826[ebp]
   add esi, ecx
   mov [esi], edx
   push left2830[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2830[ebp], eax
   push right2830[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2830[ebp], eax
_if_end_2841:
   push left2830[ebp]
   pop ecx
   push right2830[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349889309699
   push 1
   jmp _compare_end604349889309699
_compare_not_equal604349889309699:
   push 0
_compare_end604349889309699:
   pop eax
   cmp eax, 0
   je _loop_end_2833
   jmp _loop_start_2833
_loop_end_2833:

   ; init stack for qs
   push right2830[ebp]
   push arg_first2826[ebp]
   push arg_s_arr2826[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2826[ebp]
   push left2830[ebp]
   push arg_s_arr2826[ebp]
   ; call qs
   call qs

_if_end_2830:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2842[ebp]
   pop ecx
   push arg_last2842[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349889444837
   push 1
   jmp _compare_end604349889444837
_compare_not_equal604349889444837:
   push 0
_compare_end604349889444837:
   pop eax
   cmp eax, 0
   je _if_end_2846
_if_start_2846:
   push arg_first2842[ebp]
   pop eax
   mov left2846[ebp], eax
   push arg_last2842[ebp]
   pop eax
   mov right2846[ebp], eax
   push left2846[ebp]
   push right2846[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2842[ebp]
   push [esi[edx]]
   pop eax
   mov middle2846[ebp], eax
_loop_start_2849:
_loop_aftereffects_2849:
_loop_start_2852:
_loop_aftereffects_2852:
   push left2846[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2842[ebp]
   push [esi[edx]]
   pop ecx
   push middle2846[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349889628728
   push 1
   jmp _compare_end604349889628728
_compare_not_equal604349889628728:
   push 0
_compare_end604349889628728:
   pop eax
   cmp eax, 0
   je _loop_end_2852
   push left2846[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2846[ebp], eax
   jmp _loop_start_2852
_loop_end_2852:
_loop_start_2855:
_loop_aftereffects_2855:
   push right2846[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2842[ebp]
   push [esi[edx]]
   pop ecx
   push middle2846[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349889729227
   push 1
   jmp _compare_end604349889729227
_compare_not_equal604349889729227:
   push 0
_compare_end604349889729227:
   pop eax
   cmp eax, 0
   je _loop_end_2855
   push right2846[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2846[ebp], eax
   jmp _loop_start_2855
_loop_end_2855:
   push left2846[ebp]
   pop ecx
   push right2846[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349889831863
   push 1
   jmp _compare_end604349889831863
_compare_not_equal604349889831863:
   push 0
_compare_end604349889831863:
   pop eax
   cmp eax, 0
   je _if_end_2857
_if_start_2857:
   push left2846[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2842[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2857[ebp], eax
   push right2846[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2842[ebp]
   push [esi[edx]]
   pop edx
   push left2846[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2842[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2857[ebp]
   pop edx
   push right2846[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2842[ebp]
   add esi, ecx
   mov [esi], edx
   push left2846[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2846[ebp], eax
   push right2846[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2846[ebp], eax
_if_end_2857:
   push left2846[ebp]
   pop ecx
   push right2846[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349890159873
   push 1
   jmp _compare_end604349890159873
_compare_not_equal604349890159873:
   push 0
_compare_end604349890159873:
   pop eax
   cmp eax, 0
   je _loop_end_2849
   jmp _loop_start_2849
_loop_end_2849:

   ; init stack for qs
   push right2846[ebp]
   push arg_first2842[ebp]
   push arg_s_arr2842[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2842[ebp]
   push left2846[ebp]
   push arg_s_arr2842[ebp]
   ; call qs
   call qs

_if_end_2846:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2858[ebp]
   pop ecx
   push arg_last2858[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349890330507
   push 1
   jmp _compare_end604349890330507
_compare_not_equal604349890330507:
   push 0
_compare_end604349890330507:
   pop eax
   cmp eax, 0
   je _if_end_2862
_if_start_2862:
   push arg_first2858[ebp]
   pop eax
   mov left2862[ebp], eax
   push arg_last2858[ebp]
   pop eax
   mov right2862[ebp], eax
   push left2862[ebp]
   push right2862[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2858[ebp]
   push [esi[edx]]
   pop eax
   mov middle2862[ebp], eax
_loop_start_2865:
_loop_aftereffects_2865:
_loop_start_2868:
_loop_aftereffects_2868:
   push left2862[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2858[ebp]
   push [esi[edx]]
   pop ecx
   push middle2862[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349890517391
   push 1
   jmp _compare_end604349890517391
_compare_not_equal604349890517391:
   push 0
_compare_end604349890517391:
   pop eax
   cmp eax, 0
   je _loop_end_2868
   push left2862[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2862[ebp], eax
   jmp _loop_start_2868
_loop_end_2868:
_loop_start_2871:
_loop_aftereffects_2871:
   push right2862[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2858[ebp]
   push [esi[edx]]
   pop ecx
   push middle2862[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349890618317
   push 1
   jmp _compare_end604349890618317
_compare_not_equal604349890618317:
   push 0
_compare_end604349890618317:
   pop eax
   cmp eax, 0
   je _loop_end_2871
   push right2862[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2862[ebp], eax
   jmp _loop_start_2871
_loop_end_2871:
   push left2862[ebp]
   pop ecx
   push right2862[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349890718816
   push 1
   jmp _compare_end604349890718816
_compare_not_equal604349890718816:
   push 0
_compare_end604349890718816:
   pop eax
   cmp eax, 0
   je _if_end_2873
_if_start_2873:
   push left2862[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2858[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2873[ebp], eax
   push right2862[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2858[ebp]
   push [esi[edx]]
   pop edx
   push left2862[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2858[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2873[ebp]
   pop edx
   push right2862[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2858[ebp]
   add esi, ecx
   mov [esi], edx
   push left2862[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2862[ebp], eax
   push right2862[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2862[ebp], eax
_if_end_2873:
   push left2862[ebp]
   pop ecx
   push right2862[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349891052385
   push 1
   jmp _compare_end604349891052385
_compare_not_equal604349891052385:
   push 0
_compare_end604349891052385:
   pop eax
   cmp eax, 0
   je _loop_end_2865
   jmp _loop_start_2865
_loop_end_2865:

   ; init stack for qs
   push right2862[ebp]
   push arg_first2858[ebp]
   push arg_s_arr2858[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2858[ebp]
   push left2862[ebp]
   push arg_s_arr2858[ebp]
   ; call qs
   call qs

_if_end_2862:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2874[ebp]
   pop ecx
   push arg_last2874[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349891193938
   push 1
   jmp _compare_end604349891193938
_compare_not_equal604349891193938:
   push 0
_compare_end604349891193938:
   pop eax
   cmp eax, 0
   je _if_end_2878
_if_start_2878:
   push arg_first2874[ebp]
   pop eax
   mov left2878[ebp], eax
   push arg_last2874[ebp]
   pop eax
   mov right2878[ebp], eax
   push left2878[ebp]
   push right2878[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2874[ebp]
   push [esi[edx]]
   pop eax
   mov middle2878[ebp], eax
_loop_start_2881:
_loop_aftereffects_2881:
_loop_start_2884:
_loop_aftereffects_2884:
   push left2878[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2874[ebp]
   push [esi[edx]]
   pop ecx
   push middle2878[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349891382961
   push 1
   jmp _compare_end604349891382961
_compare_not_equal604349891382961:
   push 0
_compare_end604349891382961:
   pop eax
   cmp eax, 0
   je _loop_end_2884
   push left2878[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2878[ebp], eax
   jmp _loop_start_2884
_loop_end_2884:
_loop_start_2887:
_loop_aftereffects_2887:
   push right2878[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2874[ebp]
   push [esi[edx]]
   pop ecx
   push middle2878[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349891484315
   push 1
   jmp _compare_end604349891484315
_compare_not_equal604349891484315:
   push 0
_compare_end604349891484315:
   pop eax
   cmp eax, 0
   je _loop_end_2887
   push right2878[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2878[ebp], eax
   jmp _loop_start_2887
_loop_end_2887:
   push left2878[ebp]
   pop ecx
   push right2878[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349891585241
   push 1
   jmp _compare_end604349891585241
_compare_not_equal604349891585241:
   push 0
_compare_end604349891585241:
   pop eax
   cmp eax, 0
   je _if_end_2889
_if_start_2889:
   push left2878[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2874[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2889[ebp], eax
   push right2878[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2874[ebp]
   push [esi[edx]]
   pop edx
   push left2878[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2874[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2889[ebp]
   pop edx
   push right2878[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2874[ebp]
   add esi, ecx
   mov [esi], edx
   push left2878[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2878[ebp], eax
   push right2878[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2878[ebp], eax
_if_end_2889:
   push left2878[ebp]
   pop ecx
   push right2878[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349891951312
   push 1
   jmp _compare_end604349891951312
_compare_not_equal604349891951312:
   push 0
_compare_end604349891951312:
   pop eax
   cmp eax, 0
   je _loop_end_2881
   jmp _loop_start_2881
_loop_end_2881:

   ; init stack for qs
   push right2878[ebp]
   push arg_first2874[ebp]
   push arg_s_arr2874[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2874[ebp]
   push left2878[ebp]
   push arg_s_arr2874[ebp]
   ; call qs
   call qs

_if_end_2878:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2890[ebp]
   pop ecx
   push arg_last2890[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349892090727
   push 1
   jmp _compare_end604349892090727
_compare_not_equal604349892090727:
   push 0
_compare_end604349892090727:
   pop eax
   cmp eax, 0
   je _if_end_2894
_if_start_2894:
   push arg_first2890[ebp]
   pop eax
   mov left2894[ebp], eax
   push arg_last2890[ebp]
   pop eax
   mov right2894[ebp], eax
   push left2894[ebp]
   push right2894[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2890[ebp]
   push [esi[edx]]
   pop eax
   mov middle2894[ebp], eax
_loop_start_2897:
_loop_aftereffects_2897:
_loop_start_2900:
_loop_aftereffects_2900:
   push left2894[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2890[ebp]
   push [esi[edx]]
   pop ecx
   push middle2894[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349892281888
   push 1
   jmp _compare_end604349892281888
_compare_not_equal604349892281888:
   push 0
_compare_end604349892281888:
   pop eax
   cmp eax, 0
   je _loop_end_2900
   push left2894[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2894[ebp], eax
   jmp _loop_start_2900
_loop_end_2900:
_loop_start_2903:
_loop_aftereffects_2903:
   push right2894[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2890[ebp]
   push [esi[edx]]
   pop ecx
   push middle2894[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349892388373
   push 1
   jmp _compare_end604349892388373
_compare_not_equal604349892388373:
   push 0
_compare_end604349892388373:
   pop eax
   cmp eax, 0
   je _loop_end_2903
   push right2894[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2894[ebp], eax
   jmp _loop_start_2903
_loop_end_2903:
   push left2894[ebp]
   pop ecx
   push right2894[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349892494859
   push 1
   jmp _compare_end604349892494859
_compare_not_equal604349892494859:
   push 0
_compare_end604349892494859:
   pop eax
   cmp eax, 0
   je _if_end_2905
_if_start_2905:
   push left2894[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2890[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2905[ebp], eax
   push right2894[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2890[ebp]
   push [esi[edx]]
   pop edx
   push left2894[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2890[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2905[ebp]
   pop edx
   push right2894[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2890[ebp]
   add esi, ecx
   mov [esi], edx
   push left2894[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2894[ebp], eax
   push right2894[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2894[ebp], eax
_if_end_2905:
   push left2894[ebp]
   pop ecx
   push right2894[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349892843824
   push 1
   jmp _compare_end604349892843824
_compare_not_equal604349892843824:
   push 0
_compare_end604349892843824:
   pop eax
   cmp eax, 0
   je _loop_end_2897
   jmp _loop_start_2897
_loop_end_2897:

   ; init stack for qs
   push right2894[ebp]
   push arg_first2890[ebp]
   push arg_s_arr2890[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2890[ebp]
   push left2894[ebp]
   push arg_s_arr2890[ebp]
   ; call qs
   call qs

_if_end_2894:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2906[ebp]
   pop ecx
   push arg_last2906[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349892984094
   push 1
   jmp _compare_end604349892984094
_compare_not_equal604349892984094:
   push 0
_compare_end604349892984094:
   pop eax
   cmp eax, 0
   je _if_end_2910
_if_start_2910:
   push arg_first2906[ebp]
   pop eax
   mov left2910[ebp], eax
   push arg_last2906[ebp]
   pop eax
   mov right2910[ebp], eax
   push left2910[ebp]
   push right2910[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2906[ebp]
   push [esi[edx]]
   pop eax
   mov middle2910[ebp], eax
_loop_start_2913:
_loop_aftereffects_2913:
_loop_start_2916:
_loop_aftereffects_2916:
   push left2910[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2906[ebp]
   push [esi[edx]]
   pop ecx
   push middle2910[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349893172262
   push 1
   jmp _compare_end604349893172262
_compare_not_equal604349893172262:
   push 0
_compare_end604349893172262:
   pop eax
   cmp eax, 0
   je _loop_end_2916
   push left2910[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2910[ebp], eax
   jmp _loop_start_2916
_loop_end_2916:
_loop_start_2919:
_loop_aftereffects_2919:
   push right2910[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2906[ebp]
   push [esi[edx]]
   pop ecx
   push middle2910[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349893277464
   push 1
   jmp _compare_end604349893277464
_compare_not_equal604349893277464:
   push 0
_compare_end604349893277464:
   pop eax
   cmp eax, 0
   je _loop_end_2919
   push right2910[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2910[ebp], eax
   jmp _loop_start_2919
_loop_end_2919:
   push left2910[ebp]
   pop ecx
   push right2910[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349893379673
   push 1
   jmp _compare_end604349893379673
_compare_not_equal604349893379673:
   push 0
_compare_end604349893379673:
   pop eax
   cmp eax, 0
   je _if_end_2921
_if_start_2921:
   push left2910[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2906[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2921[ebp], eax
   push right2910[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2906[ebp]
   push [esi[edx]]
   pop edx
   push left2910[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2906[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2921[ebp]
   pop edx
   push right2910[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2906[ebp]
   add esi, ecx
   mov [esi], edx
   push left2910[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2910[ebp], eax
   push right2910[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2910[ebp], eax
_if_end_2921:
   push left2910[ebp]
   pop ecx
   push right2910[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349893716236
   push 1
   jmp _compare_end604349893716236
_compare_not_equal604349893716236:
   push 0
_compare_end604349893716236:
   pop eax
   cmp eax, 0
   je _loop_end_2913
   jmp _loop_start_2913
_loop_end_2913:

   ; init stack for qs
   push right2910[ebp]
   push arg_first2906[ebp]
   push arg_s_arr2906[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2906[ebp]
   push left2910[ebp]
   push arg_s_arr2906[ebp]
   ; call qs
   call qs

_if_end_2910:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2922[ebp]
   pop ecx
   push arg_last2922[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349893875323
   push 1
   jmp _compare_end604349893875323
_compare_not_equal604349893875323:
   push 0
_compare_end604349893875323:
   pop eax
   cmp eax, 0
   je _if_end_2926
_if_start_2926:
   push arg_first2922[ebp]
   pop eax
   mov left2926[ebp], eax
   push arg_last2922[ebp]
   pop eax
   mov right2926[ebp], eax
   push left2926[ebp]
   push right2926[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2922[ebp]
   push [esi[edx]]
   pop eax
   mov middle2926[ebp], eax
_loop_start_2929:
_loop_aftereffects_2929:
_loop_start_2932:
_loop_aftereffects_2932:
   push left2926[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2922[ebp]
   push [esi[edx]]
   pop ecx
   push middle2926[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349894063918
   push 1
   jmp _compare_end604349894063918
_compare_not_equal604349894063918:
   push 0
_compare_end604349894063918:
   pop eax
   cmp eax, 0
   je _loop_end_2932
   push left2926[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2926[ebp], eax
   jmp _loop_start_2932
_loop_end_2932:
_loop_start_2935:
_loop_aftereffects_2935:
   push right2926[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2922[ebp]
   push [esi[edx]]
   pop ecx
   push middle2926[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349894166555
   push 1
   jmp _compare_end604349894166555
_compare_not_equal604349894166555:
   push 0
_compare_end604349894166555:
   pop eax
   cmp eax, 0
   je _loop_end_2935
   push right2926[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2926[ebp], eax
   jmp _loop_start_2935
_loop_end_2935:
   push left2926[ebp]
   pop ecx
   push right2926[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349894276034
   push 1
   jmp _compare_end604349894276034
_compare_not_equal604349894276034:
   push 0
_compare_end604349894276034:
   pop eax
   cmp eax, 0
   je _if_end_2937
_if_start_2937:
   push left2926[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2922[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2937[ebp], eax
   push right2926[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2922[ebp]
   push [esi[edx]]
   pop edx
   push left2926[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2922[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2937[ebp]
   pop edx
   push right2926[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2922[ebp]
   add esi, ecx
   mov [esi], edx
   push left2926[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2926[ebp], eax
   push right2926[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2926[ebp], eax
_if_end_2937:
   push left2926[ebp]
   pop ecx
   push right2926[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349894838398
   push 1
   jmp _compare_end604349894838398
_compare_not_equal604349894838398:
   push 0
_compare_end604349894838398:
   pop eax
   cmp eax, 0
   je _loop_end_2929
   jmp _loop_start_2929
_loop_end_2929:

   ; init stack for qs
   push right2926[ebp]
   push arg_first2922[ebp]
   push arg_s_arr2922[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2922[ebp]
   push left2926[ebp]
   push arg_s_arr2922[ebp]
   ; call qs
   call qs

_if_end_2926:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2938[ebp]
   pop ecx
   push arg_last2938[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349895191212
   push 1
   jmp _compare_end604349895191212
_compare_not_equal604349895191212:
   push 0
_compare_end604349895191212:
   pop eax
   cmp eax, 0
   je _if_end_2942
_if_start_2942:
   push arg_first2938[ebp]
   pop eax
   mov left2942[ebp], eax
   push arg_last2938[ebp]
   pop eax
   mov right2942[ebp], eax
   push left2942[ebp]
   push right2942[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2938[ebp]
   push [esi[edx]]
   pop eax
   mov middle2942[ebp], eax
_loop_start_2945:
_loop_aftereffects_2945:
_loop_start_2948:
_loop_aftereffects_2948:
   push left2942[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2938[ebp]
   push [esi[edx]]
   pop ecx
   push middle2942[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349895462771
   push 1
   jmp _compare_end604349895462771
_compare_not_equal604349895462771:
   push 0
_compare_end604349895462771:
   pop eax
   cmp eax, 0
   je _loop_end_2948
   push left2942[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2942[ebp], eax
   jmp _loop_start_2948
_loop_end_2948:
_loop_start_2951:
_loop_aftereffects_2951:
   push right2942[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2938[ebp]
   push [esi[edx]]
   pop ecx
   push middle2942[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349895567546
   push 1
   jmp _compare_end604349895567546
_compare_not_equal604349895567546:
   push 0
_compare_end604349895567546:
   pop eax
   cmp eax, 0
   je _loop_end_2951
   push right2942[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2942[ebp], eax
   jmp _loop_start_2951
_loop_end_2951:
   push left2942[ebp]
   pop ecx
   push right2942[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349895724923
   push 1
   jmp _compare_end604349895724923
_compare_not_equal604349895724923:
   push 0
_compare_end604349895724923:
   pop eax
   cmp eax, 0
   je _if_end_2953
_if_start_2953:
   push left2942[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2938[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2953[ebp], eax
   push right2942[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2938[ebp]
   push [esi[edx]]
   pop edx
   push left2942[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2938[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2953[ebp]
   pop edx
   push right2942[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2938[ebp]
   add esi, ecx
   mov [esi], edx
   push left2942[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2942[ebp], eax
   push right2942[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2942[ebp], eax
_if_end_2953:
   push left2942[ebp]
   pop ecx
   push right2942[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349896117508
   push 1
   jmp _compare_end604349896117508
_compare_not_equal604349896117508:
   push 0
_compare_end604349896117508:
   pop eax
   cmp eax, 0
   je _loop_end_2945
   jmp _loop_start_2945
_loop_end_2945:

   ; init stack for qs
   push right2942[ebp]
   push arg_first2938[ebp]
   push arg_s_arr2938[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2938[ebp]
   push left2942[ebp]
   push arg_s_arr2938[ebp]
   ; call qs
   call qs

_if_end_2942:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2954[ebp]
   pop ecx
   push arg_last2954[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349896261627
   push 1
   jmp _compare_end604349896261627
_compare_not_equal604349896261627:
   push 0
_compare_end604349896261627:
   pop eax
   cmp eax, 0
   je _if_end_2958
_if_start_2958:
   push arg_first2954[ebp]
   pop eax
   mov left2958[ebp], eax
   push arg_last2954[ebp]
   pop eax
   mov right2958[ebp], eax
   push left2958[ebp]
   push right2958[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2954[ebp]
   push [esi[edx]]
   pop eax
   mov middle2958[ebp], eax
_loop_start_2961:
_loop_aftereffects_2961:
_loop_start_2964:
_loop_aftereffects_2964:
   push left2958[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2954[ebp]
   push [esi[edx]]
   pop ecx
   push middle2958[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349896457492
   push 1
   jmp _compare_end604349896457492
_compare_not_equal604349896457492:
   push 0
_compare_end604349896457492:
   pop eax
   cmp eax, 0
   je _loop_end_2964
   push left2958[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2958[ebp], eax
   jmp _loop_start_2964
_loop_end_2964:
_loop_start_2967:
_loop_aftereffects_2967:
   push right2958[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2954[ebp]
   push [esi[edx]]
   pop ecx
   push middle2958[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349896561840
   push 1
   jmp _compare_end604349896561840
_compare_not_equal604349896561840:
   push 0
_compare_end604349896561840:
   pop eax
   cmp eax, 0
   je _loop_end_2967
   push right2958[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2958[ebp], eax
   jmp _loop_start_2967
_loop_end_2967:
   push left2958[ebp]
   pop ecx
   push right2958[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349896666187
   push 1
   jmp _compare_end604349896666187
_compare_not_equal604349896666187:
   push 0
_compare_end604349896666187:
   pop eax
   cmp eax, 0
   je _if_end_2969
_if_start_2969:
   push left2958[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2954[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2969[ebp], eax
   push right2958[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2954[ebp]
   push [esi[edx]]
   pop edx
   push left2958[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2954[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2969[ebp]
   pop edx
   push right2958[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2954[ebp]
   add esi, ecx
   mov [esi], edx
   push left2958[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2958[ebp], eax
   push right2958[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2958[ebp], eax
_if_end_2969:
   push left2958[ebp]
   pop ecx
   push right2958[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349897004888
   push 1
   jmp _compare_end604349897004888
_compare_not_equal604349897004888:
   push 0
_compare_end604349897004888:
   pop eax
   cmp eax, 0
   je _loop_end_2961
   jmp _loop_start_2961
_loop_end_2961:

   ; init stack for qs
   push right2958[ebp]
   push arg_first2954[ebp]
   push arg_s_arr2954[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2954[ebp]
   push left2958[ebp]
   push arg_s_arr2954[ebp]
   ; call qs
   call qs

_if_end_2958:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2970[ebp]
   pop ecx
   push arg_last2970[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349897146014
   push 1
   jmp _compare_end604349897146014
_compare_not_equal604349897146014:
   push 0
_compare_end604349897146014:
   pop eax
   cmp eax, 0
   je _if_end_2974
_if_start_2974:
   push arg_first2970[ebp]
   pop eax
   mov left2974[ebp], eax
   push arg_last2970[ebp]
   pop eax
   mov right2974[ebp], eax
   push left2974[ebp]
   push right2974[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2970[ebp]
   push [esi[edx]]
   pop eax
   mov middle2974[ebp], eax
_loop_start_2977:
_loop_aftereffects_2977:
_loop_start_2980:
_loop_aftereffects_2980:
   push left2974[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2970[ebp]
   push [esi[edx]]
   pop ecx
   push middle2974[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349897354709
   push 1
   jmp _compare_end604349897354709
_compare_not_equal604349897354709:
   push 0
_compare_end604349897354709:
   pop eax
   cmp eax, 0
   je _loop_end_2980
   push left2974[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2974[ebp], eax
   jmp _loop_start_2980
_loop_end_2980:
_loop_start_2983:
_loop_aftereffects_2983:
   push right2974[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2970[ebp]
   push [esi[edx]]
   pop ecx
   push middle2974[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349897468037
   push 1
   jmp _compare_end604349897468037
_compare_not_equal604349897468037:
   push 0
_compare_end604349897468037:
   pop eax
   cmp eax, 0
   je _loop_end_2983
   push right2974[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2974[ebp], eax
   jmp _loop_start_2983
_loop_end_2983:
   push left2974[ebp]
   pop ecx
   push right2974[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349897572384
   push 1
   jmp _compare_end604349897572384
_compare_not_equal604349897572384:
   push 0
_compare_end604349897572384:
   pop eax
   cmp eax, 0
   je _if_end_2985
_if_start_2985:
   push left2974[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2970[ebp]
   push [esi[edx]]
   pop eax
   mov tmp2985[ebp], eax
   push right2974[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2970[ebp]
   push [esi[edx]]
   pop edx
   push left2974[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2970[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp2985[ebp]
   pop edx
   push right2974[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2970[ebp]
   add esi, ecx
   mov [esi], edx
   push left2974[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2974[ebp], eax
   push right2974[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2974[ebp], eax
_if_end_2985:
   push left2974[ebp]
   pop ecx
   push right2974[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349898264327
   push 1
   jmp _compare_end604349898264327
_compare_not_equal604349898264327:
   push 0
_compare_end604349898264327:
   pop eax
   cmp eax, 0
   je _loop_end_2977
   jmp _loop_start_2977
_loop_end_2977:

   ; init stack for qs
   push right2974[ebp]
   push arg_first2970[ebp]
   push arg_s_arr2970[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2970[ebp]
   push left2974[ebp]
   push arg_s_arr2970[ebp]
   ; call qs
   call qs

_if_end_2974:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first2986[ebp]
   pop ecx
   push arg_last2986[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349898510227
   push 1
   jmp _compare_end604349898510227
_compare_not_equal604349898510227:
   push 0
_compare_end604349898510227:
   pop eax
   cmp eax, 0
   je _if_end_2990
_if_start_2990:
   push arg_first2986[ebp]
   pop eax
   mov left2990[ebp], eax
   push arg_last2986[ebp]
   pop eax
   mov right2990[ebp], eax
   push left2990[ebp]
   push right2990[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2986[ebp]
   push [esi[edx]]
   pop eax
   mov middle2990[ebp], eax
_loop_start_2993:
_loop_aftereffects_2993:
_loop_start_2996:
_loop_aftereffects_2996:
   push left2990[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2986[ebp]
   push [esi[edx]]
   pop ecx
   push middle2990[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349898725337
   push 1
   jmp _compare_end604349898725337
_compare_not_equal604349898725337:
   push 0
_compare_end604349898725337:
   pop eax
   cmp eax, 0
   je _loop_end_2996
   push left2990[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2990[ebp], eax
   jmp _loop_start_2996
_loop_end_2996:
_loop_start_2999:
_loop_aftereffects_2999:
   push right2990[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2986[ebp]
   push [esi[edx]]
   pop ecx
   push middle2990[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349898959691
   push 1
   jmp _compare_end604349898959691
_compare_not_equal604349898959691:
   push 0
_compare_end604349898959691:
   pop eax
   cmp eax, 0
   je _loop_end_2999
   push right2990[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2990[ebp], eax
   jmp _loop_start_2999
_loop_end_2999:
   push left2990[ebp]
   pop ecx
   push right2990[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349899108514
   push 1
   jmp _compare_end604349899108514
_compare_not_equal604349899108514:
   push 0
_compare_end604349899108514:
   pop eax
   cmp eax, 0
   je _if_end_3001
_if_start_3001:
   push left2990[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2986[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3001[ebp], eax
   push right2990[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr2986[ebp]
   push [esi[edx]]
   pop edx
   push left2990[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2986[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3001[ebp]
   pop edx
   push right2990[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr2986[ebp]
   add esi, ecx
   mov [esi], edx
   push left2990[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left2990[ebp], eax
   push right2990[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right2990[ebp], eax
_if_end_3001:
   push left2990[ebp]
   pop ecx
   push right2990[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349899915068
   push 1
   jmp _compare_end604349899915068
_compare_not_equal604349899915068:
   push 0
_compare_end604349899915068:
   pop eax
   cmp eax, 0
   je _loop_end_2993
   jmp _loop_start_2993
_loop_end_2993:

   ; init stack for qs
   push right2990[ebp]
   push arg_first2986[ebp]
   push arg_s_arr2986[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last2986[ebp]
   push left2990[ebp]
   push arg_s_arr2986[ebp]
   ; call qs
   call qs

_if_end_2990:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3002[ebp]
   pop ecx
   push arg_last3002[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349900161396
   push 1
   jmp _compare_end604349900161396
_compare_not_equal604349900161396:
   push 0
_compare_end604349900161396:
   pop eax
   cmp eax, 0
   je _if_end_3006
_if_start_3006:
   push arg_first3002[ebp]
   pop eax
   mov left3006[ebp], eax
   push arg_last3002[ebp]
   pop eax
   mov right3006[ebp], eax
   push left3006[ebp]
   push right3006[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3002[ebp]
   push [esi[edx]]
   pop eax
   mov middle3006[ebp], eax
_loop_start_3009:
_loop_aftereffects_3009:
_loop_start_3012:
_loop_aftereffects_3012:
   push left3006[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3002[ebp]
   push [esi[edx]]
   pop ecx
   push middle3006[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349900647637
   push 1
   jmp _compare_end604349900647637
_compare_not_equal604349900647637:
   push 0
_compare_end604349900647637:
   pop eax
   cmp eax, 0
   je _loop_end_3012
   push left3006[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3006[ebp], eax
   jmp _loop_start_3012
_loop_end_3012:
_loop_start_3015:
_loop_aftereffects_3015:
   push right3006[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3002[ebp]
   push [esi[edx]]
   pop ecx
   push middle3006[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349900767808
   push 1
   jmp _compare_end604349900767808
_compare_not_equal604349900767808:
   push 0
_compare_end604349900767808:
   pop eax
   cmp eax, 0
   je _loop_end_3015
   push right3006[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3006[ebp], eax
   jmp _loop_start_3015
_loop_end_3015:
   push left3006[ebp]
   pop ecx
   push right3006[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349900973937
   push 1
   jmp _compare_end604349900973937
_compare_not_equal604349900973937:
   push 0
_compare_end604349900973937:
   pop eax
   cmp eax, 0
   je _if_end_3017
_if_start_3017:
   push left3006[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3002[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3017[ebp], eax
   push right3006[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3002[ebp]
   push [esi[edx]]
   pop edx
   push left3006[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3002[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3017[ebp]
   pop edx
   push right3006[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3002[ebp]
   add esi, ecx
   mov [esi], edx
   push left3006[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3006[ebp], eax
   push right3006[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3006[ebp], eax
_if_end_3017:
   push left3006[ebp]
   pop ecx
   push right3006[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349901319053
   push 1
   jmp _compare_end604349901319053
_compare_not_equal604349901319053:
   push 0
_compare_end604349901319053:
   pop eax
   cmp eax, 0
   je _loop_end_3009
   jmp _loop_start_3009
_loop_end_3009:

   ; init stack for qs
   push right3006[ebp]
   push arg_first3002[ebp]
   push arg_s_arr3002[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3002[ebp]
   push left3006[ebp]
   push arg_s_arr3002[ebp]
   ; call qs
   call qs

_if_end_3006:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3018[ebp]
   pop ecx
   push arg_last3018[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349901464027
   push 1
   jmp _compare_end604349901464027
_compare_not_equal604349901464027:
   push 0
_compare_end604349901464027:
   pop eax
   cmp eax, 0
   je _if_end_3022
_if_start_3022:
   push arg_first3018[ebp]
   pop eax
   mov left3022[ebp], eax
   push arg_last3018[ebp]
   pop eax
   mov right3022[ebp], eax
   push left3022[ebp]
   push right3022[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3018[ebp]
   push [esi[edx]]
   pop eax
   mov middle3022[ebp], eax
_loop_start_3025:
_loop_aftereffects_3025:
_loop_start_3028:
_loop_aftereffects_3028:
   push left3022[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3018[ebp]
   push [esi[edx]]
   pop ecx
   push middle3022[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349901659892
   push 1
   jmp _compare_end604349901659892
_compare_not_equal604349901659892:
   push 0
_compare_end604349901659892:
   pop eax
   cmp eax, 0
   je _loop_end_3028
   push left3022[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3022[ebp], eax
   jmp _loop_start_3028
_loop_end_3028:
_loop_start_3031:
_loop_aftereffects_3031:
   push right3022[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3018[ebp]
   push [esi[edx]]
   pop ecx
   push middle3022[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349901811709
   push 1
   jmp _compare_end604349901811709
_compare_not_equal604349901811709:
   push 0
_compare_end604349901811709:
   pop eax
   cmp eax, 0
   je _loop_end_3031
   push right3022[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3022[ebp], eax
   jmp _loop_start_3031
_loop_end_3031:
   push left3022[ebp]
   pop ecx
   push right3022[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349902217124
   push 1
   jmp _compare_end604349902217124
_compare_not_equal604349902217124:
   push 0
_compare_end604349902217124:
   pop eax
   cmp eax, 0
   je _if_end_3033
_if_start_3033:
   push left3022[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3018[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3033[ebp], eax
   push right3022[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3018[ebp]
   push [esi[edx]]
   pop edx
   push left3022[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3018[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3033[ebp]
   pop edx
   push right3022[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3018[ebp]
   add esi, ecx
   mov [esi], edx
   push left3022[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3022[ebp], eax
   push right3022[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3022[ebp], eax
_if_end_3033:
   push left3022[ebp]
   pop ecx
   push right3022[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349902825674
   push 1
   jmp _compare_end604349902825674
_compare_not_equal604349902825674:
   push 0
_compare_end604349902825674:
   pop eax
   cmp eax, 0
   je _loop_end_3025
   jmp _loop_start_3025
_loop_end_3025:

   ; init stack for qs
   push right3022[ebp]
   push arg_first3018[ebp]
   push arg_s_arr3018[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3018[ebp]
   push left3022[ebp]
   push arg_s_arr3018[ebp]
   ; call qs
   call qs

_if_end_3022:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3034[ebp]
   pop ecx
   push arg_last3034[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349903087826
   push 1
   jmp _compare_end604349903087826
_compare_not_equal604349903087826:
   push 0
_compare_end604349903087826:
   pop eax
   cmp eax, 0
   je _if_end_3038
_if_start_3038:
   push arg_first3034[ebp]
   pop eax
   mov left3038[ebp], eax
   push arg_last3034[ebp]
   pop eax
   mov right3038[ebp], eax
   push left3038[ebp]
   push right3038[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3034[ebp]
   push [esi[edx]]
   pop eax
   mov middle3038[ebp], eax
_loop_start_3041:
_loop_aftereffects_3041:
_loop_start_3044:
_loop_aftereffects_3044:
   push left3038[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3034[ebp]
   push [esi[edx]]
   pop ecx
   push middle3038[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349903545415
   push 1
   jmp _compare_end604349903545415
_compare_not_equal604349903545415:
   push 0
_compare_end604349903545415:
   pop eax
   cmp eax, 0
   je _loop_end_3044
   push left3038[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3038[ebp], eax
   jmp _loop_start_3044
_loop_end_3044:
_loop_start_3047:
_loop_aftereffects_3047:
   push right3038[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3034[ebp]
   push [esi[edx]]
   pop ecx
   push middle3038[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349903651900
   push 1
   jmp _compare_end604349903651900
_compare_not_equal604349903651900:
   push 0
_compare_end604349903651900:
   pop eax
   cmp eax, 0
   je _loop_end_3047
   push right3038[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3038[ebp], eax
   jmp _loop_start_3047
_loop_end_3047:
   push left3038[ebp]
   pop ecx
   push right3038[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349903768222
   push 1
   jmp _compare_end604349903768222
_compare_not_equal604349903768222:
   push 0
_compare_end604349903768222:
   pop eax
   cmp eax, 0
   je _if_end_3049
_if_start_3049:
   push left3038[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3034[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3049[ebp], eax
   push right3038[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3034[ebp]
   push [esi[edx]]
   pop edx
   push left3038[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3034[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3049[ebp]
   pop edx
   push right3038[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3034[ebp]
   add esi, ecx
   mov [esi], edx
   push left3038[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3038[ebp], eax
   push right3038[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3038[ebp], eax
_if_end_3049:
   push left3038[ebp]
   pop ecx
   push right3038[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349904118042
   push 1
   jmp _compare_end604349904118042
_compare_not_equal604349904118042:
   push 0
_compare_end604349904118042:
   pop eax
   cmp eax, 0
   je _loop_end_3041
   jmp _loop_start_3041
_loop_end_3041:

   ; init stack for qs
   push right3038[ebp]
   push arg_first3034[ebp]
   push arg_s_arr3034[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3034[ebp]
   push left3038[ebp]
   push arg_s_arr3034[ebp]
   ; call qs
   call qs

_if_end_3038:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3050[ebp]
   pop ecx
   push arg_last3050[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349904276701
   push 1
   jmp _compare_end604349904276701
_compare_not_equal604349904276701:
   push 0
_compare_end604349904276701:
   pop eax
   cmp eax, 0
   je _if_end_3054
_if_start_3054:
   push arg_first3050[ebp]
   pop eax
   mov left3054[ebp], eax
   push arg_last3050[ebp]
   pop eax
   mov right3054[ebp], eax
   push left3054[ebp]
   push right3054[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3050[ebp]
   push [esi[edx]]
   pop eax
   mov middle3054[ebp], eax
_loop_start_3057:
_loop_aftereffects_3057:
_loop_start_3060:
_loop_aftereffects_3060:
   push left3054[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3050[ebp]
   push [esi[edx]]
   pop ecx
   push middle3054[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349906139986
   push 1
   jmp _compare_end604349906139986
_compare_not_equal604349906139986:
   push 0
_compare_end604349906139986:
   pop eax
   cmp eax, 0
   je _loop_end_3060
   push left3054[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3054[ebp], eax
   jmp _loop_start_3060
_loop_end_3060:
_loop_start_3063:
_loop_aftereffects_3063:
   push right3054[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3050[ebp]
   push [esi[edx]]
   pop ecx
   push middle3054[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349906547111
   push 1
   jmp _compare_end604349906547111
_compare_not_equal604349906547111:
   push 0
_compare_end604349906547111:
   pop eax
   cmp eax, 0
   je _loop_end_3063
   push right3054[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3054[ebp], eax
   jmp _loop_start_3063
_loop_end_3063:
   push left3054[ebp]
   pop ecx
   push right3054[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349906729292
   push 1
   jmp _compare_end604349906729292
_compare_not_equal604349906729292:
   push 0
_compare_end604349906729292:
   pop eax
   cmp eax, 0
   je _if_end_3065
_if_start_3065:
   push left3054[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3050[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3065[ebp], eax
   push right3054[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3050[ebp]
   push [esi[edx]]
   pop edx
   push left3054[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3050[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3065[ebp]
   pop edx
   push right3054[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3050[ebp]
   add esi, ecx
   mov [esi], edx
   push left3054[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3054[ebp], eax
   push right3054[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3054[ebp], eax
_if_end_3065:
   push left3054[ebp]
   pop ecx
   push right3054[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349907771910
   push 1
   jmp _compare_end604349907771910
_compare_not_equal604349907771910:
   push 0
_compare_end604349907771910:
   pop eax
   cmp eax, 0
   je _loop_end_3057
   jmp _loop_start_3057
_loop_end_3057:

   ; init stack for qs
   push right3054[ebp]
   push arg_first3050[ebp]
   push arg_s_arr3050[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3050[ebp]
   push left3054[ebp]
   push arg_s_arr3050[ebp]
   ; call qs
   call qs

_if_end_3054:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3066[ebp]
   pop ecx
   push arg_last3066[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349908944962
   push 1
   jmp _compare_end604349908944962
_compare_not_equal604349908944962:
   push 0
_compare_end604349908944962:
   pop eax
   cmp eax, 0
   je _if_end_3070
_if_start_3070:
   push arg_first3066[ebp]
   pop eax
   mov left3070[ebp], eax
   push arg_last3066[ebp]
   pop eax
   mov right3070[ebp], eax
   push left3070[ebp]
   push right3070[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3066[ebp]
   push [esi[edx]]
   pop eax
   mov middle3070[ebp], eax
_loop_start_3073:
_loop_aftereffects_3073:
_loop_start_3076:
_loop_aftereffects_3076:
   push left3070[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3066[ebp]
   push [esi[edx]]
   pop ecx
   push middle3070[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349909533841
   push 1
   jmp _compare_end604349909533841
_compare_not_equal604349909533841:
   push 0
_compare_end604349909533841:
   pop eax
   cmp eax, 0
   je _loop_end_3076
   push left3070[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3070[ebp], eax
   jmp _loop_start_3076
_loop_end_3076:
_loop_start_3079:
_loop_aftereffects_3079:
   push right3070[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3066[ebp]
   push [esi[edx]]
   pop ecx
   push middle3070[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349909668124
   push 1
   jmp _compare_end604349909668124
_compare_not_equal604349909668124:
   push 0
_compare_end604349909668124:
   pop eax
   cmp eax, 0
   je _loop_end_3079
   push right3070[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3070[ebp], eax
   jmp _loop_start_3079
_loop_end_3079:
   push left3070[ebp]
   pop ecx
   push right3070[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349909781452
   push 1
   jmp _compare_end604349909781452
_compare_not_equal604349909781452:
   push 0
_compare_end604349909781452:
   pop eax
   cmp eax, 0
   je _if_end_3081
_if_start_3081:
   push left3070[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3066[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3081[ebp], eax
   push right3070[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3066[ebp]
   push [esi[edx]]
   pop edx
   push left3070[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3066[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3081[ebp]
   pop edx
   push right3070[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3066[ebp]
   add esi, ecx
   mov [esi], edx
   push left3070[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3070[ebp], eax
   push right3070[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3070[ebp], eax
_if_end_3081:
   push left3070[ebp]
   pop ecx
   push right3070[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349910132555
   push 1
   jmp _compare_end604349910132555
_compare_not_equal604349910132555:
   push 0
_compare_end604349910132555:
   pop eax
   cmp eax, 0
   je _loop_end_3073
   jmp _loop_start_3073
_loop_end_3073:

   ; init stack for qs
   push right3070[ebp]
   push arg_first3066[ebp]
   push arg_s_arr3066[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3066[ebp]
   push left3070[ebp]
   push arg_s_arr3066[ebp]
   ; call qs
   call qs

_if_end_3070:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3082[ebp]
   pop ecx
   push arg_last3082[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349910287365
   push 1
   jmp _compare_end604349910287365
_compare_not_equal604349910287365:
   push 0
_compare_end604349910287365:
   pop eax
   cmp eax, 0
   je _if_end_3086
_if_start_3086:
   push arg_first3082[ebp]
   pop eax
   mov left3086[ebp], eax
   push arg_last3082[ebp]
   pop eax
   mov right3086[ebp], eax
   push left3086[ebp]
   push right3086[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3082[ebp]
   push [esi[edx]]
   pop eax
   mov middle3086[ebp], eax
_loop_start_3089:
_loop_aftereffects_3089:
_loop_start_3092:
_loop_aftereffects_3092:
   push left3086[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3082[ebp]
   push [esi[edx]]
   pop ecx
   push middle3086[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349910486224
   push 1
   jmp _compare_end604349910486224
_compare_not_equal604349910486224:
   push 0
_compare_end604349910486224:
   pop eax
   cmp eax, 0
   je _loop_end_3092
   push left3086[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3086[ebp], eax
   jmp _loop_start_3092
_loop_end_3092:
_loop_start_3095:
_loop_aftereffects_3095:
   push right3086[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3082[ebp]
   push [esi[edx]]
   pop ecx
   push middle3086[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349910593993
   push 1
   jmp _compare_end604349910593993
_compare_not_equal604349910593993:
   push 0
_compare_end604349910593993:
   pop eax
   cmp eax, 0
   je _loop_end_3095
   push right3086[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3086[ebp], eax
   jmp _loop_start_3095
_loop_end_3095:
   push left3086[ebp]
   pop ecx
   push right3086[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349910702616
   push 1
   jmp _compare_end604349910702616
_compare_not_equal604349910702616:
   push 0
_compare_end604349910702616:
   pop eax
   cmp eax, 0
   je _if_end_3097
_if_start_3097:
   push left3086[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3082[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3097[ebp], eax
   push right3086[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3082[ebp]
   push [esi[edx]]
   pop edx
   push left3086[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3082[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3097[ebp]
   pop edx
   push right3086[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3082[ebp]
   add esi, ecx
   mov [esi], edx
   push left3086[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3086[ebp], eax
   push right3086[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3086[ebp], eax
_if_end_3097:
   push left3086[ebp]
   pop ecx
   push right3086[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349911907743
   push 1
   jmp _compare_end604349911907743
_compare_not_equal604349911907743:
   push 0
_compare_end604349911907743:
   pop eax
   cmp eax, 0
   je _loop_end_3089
   jmp _loop_start_3089
_loop_end_3089:

   ; init stack for qs
   push right3086[ebp]
   push arg_first3082[ebp]
   push arg_s_arr3082[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3082[ebp]
   push left3086[ebp]
   push arg_s_arr3082[ebp]
   ; call qs
   call qs

_if_end_3086:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3098[ebp]
   pop ecx
   push arg_last3098[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349912063836
   push 1
   jmp _compare_end604349912063836
_compare_not_equal604349912063836:
   push 0
_compare_end604349912063836:
   pop eax
   cmp eax, 0
   je _if_end_3102
_if_start_3102:
   push arg_first3098[ebp]
   pop eax
   mov left3102[ebp], eax
   push arg_last3098[ebp]
   pop eax
   mov right3102[ebp], eax
   push left3102[ebp]
   push right3102[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3098[ebp]
   push [esi[edx]]
   pop eax
   mov middle3102[ebp], eax
_loop_start_3105:
_loop_aftereffects_3105:
_loop_start_3108:
_loop_aftereffects_3108:
   push left3102[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3098[ebp]
   push [esi[edx]]
   pop ecx
   push middle3102[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349912284505
   push 1
   jmp _compare_end604349912284505
_compare_not_equal604349912284505:
   push 0
_compare_end604349912284505:
   pop eax
   cmp eax, 0
   je _loop_end_3108
   push left3102[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3102[ebp], eax
   jmp _loop_start_3108
_loop_end_3108:
_loop_start_3111:
_loop_aftereffects_3111:
   push right3102[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3098[ebp]
   push [esi[edx]]
   pop ecx
   push middle3102[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349912394840
   push 1
   jmp _compare_end604349912394840
_compare_not_equal604349912394840:
   push 0
_compare_end604349912394840:
   pop eax
   cmp eax, 0
   je _loop_end_3111
   push right3102[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3102[ebp], eax
   jmp _loop_start_3111
_loop_end_3111:
   push left3102[ebp]
   pop ecx
   push right3102[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349912504319
   push 1
   jmp _compare_end604349912504319
_compare_not_equal604349912504319:
   push 0
_compare_end604349912504319:
   pop eax
   cmp eax, 0
   je _if_end_3113
_if_start_3113:
   push left3102[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3098[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3113[ebp], eax
   push right3102[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3098[ebp]
   push [esi[edx]]
   pop edx
   push left3102[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3098[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3113[ebp]
   pop edx
   push right3102[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3098[ebp]
   add esi, ecx
   mov [esi], edx
   push left3102[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3102[ebp], eax
   push right3102[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3102[ebp], eax
_if_end_3113:
   push left3102[ebp]
   pop ecx
   push right3102[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349912861837
   push 1
   jmp _compare_end604349912861837
_compare_not_equal604349912861837:
   push 0
_compare_end604349912861837:
   pop eax
   cmp eax, 0
   je _loop_end_3105
   jmp _loop_start_3105
_loop_end_3105:

   ; init stack for qs
   push right3102[ebp]
   push arg_first3098[ebp]
   push arg_s_arr3098[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3098[ebp]
   push left3102[ebp]
   push arg_s_arr3098[ebp]
   ; call qs
   call qs

_if_end_3102:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3114[ebp]
   pop ecx
   push arg_last3114[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349913009377
   push 1
   jmp _compare_end604349913009377
_compare_not_equal604349913009377:
   push 0
_compare_end604349913009377:
   pop eax
   cmp eax, 0
   je _if_end_3118
_if_start_3118:
   push arg_first3114[ebp]
   pop eax
   mov left3118[ebp], eax
   push arg_last3114[ebp]
   pop eax
   mov right3118[ebp], eax
   push left3118[ebp]
   push right3118[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3114[ebp]
   push [esi[edx]]
   pop eax
   mov middle3118[ebp], eax
_loop_start_3121:
_loop_aftereffects_3121:
_loop_start_3124:
_loop_aftereffects_3124:
   push left3118[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3114[ebp]
   push [esi[edx]]
   pop ecx
   push middle3118[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349913213795
   push 1
   jmp _compare_end604349913213795
_compare_not_equal604349913213795:
   push 0
_compare_end604349913213795:
   pop eax
   cmp eax, 0
   je _loop_end_3124
   push left3118[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3118[ebp], eax
   jmp _loop_start_3124
_loop_end_3124:
_loop_start_3127:
_loop_aftereffects_3127:
   push right3118[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3114[ebp]
   push [esi[edx]]
   pop ecx
   push middle3118[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349913325840
   push 1
   jmp _compare_end604349913325840
_compare_not_equal604349913325840:
   push 0
_compare_end604349913325840:
   pop eax
   cmp eax, 0
   je _loop_end_3127
   push right3118[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3118[ebp], eax
   jmp _loop_start_3127
_loop_end_3127:
   push left3118[ebp]
   pop ecx
   push right3118[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349913434892
   push 1
   jmp _compare_end604349913434892
_compare_not_equal604349913434892:
   push 0
_compare_end604349913434892:
   pop eax
   cmp eax, 0
   je _if_end_3129
_if_start_3129:
   push left3118[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3114[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3129[ebp], eax
   push right3118[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3114[ebp]
   push [esi[edx]]
   pop edx
   push left3118[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3114[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3129[ebp]
   pop edx
   push right3118[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3114[ebp]
   add esi, ecx
   mov [esi], edx
   push left3118[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3118[ebp], eax
   push right3118[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3118[ebp], eax
_if_end_3129:
   push left3118[ebp]
   pop ecx
   push right3118[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349914124696
   push 1
   jmp _compare_end604349914124696
_compare_not_equal604349914124696:
   push 0
_compare_end604349914124696:
   pop eax
   cmp eax, 0
   je _loop_end_3121
   jmp _loop_start_3121
_loop_end_3121:

   ; init stack for qs
   push right3118[ebp]
   push arg_first3114[ebp]
   push arg_s_arr3114[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3114[ebp]
   push left3118[ebp]
   push arg_s_arr3114[ebp]
   ; call qs
   call qs

_if_end_3118:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3130[ebp]
   pop ecx
   push arg_last3130[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349914400960
   push 1
   jmp _compare_end604349914400960
_compare_not_equal604349914400960:
   push 0
_compare_end604349914400960:
   pop eax
   cmp eax, 0
   je _if_end_3134
_if_start_3134:
   push arg_first3130[ebp]
   pop eax
   mov left3134[ebp], eax
   push arg_last3130[ebp]
   pop eax
   mov right3134[ebp], eax
   push left3134[ebp]
   push right3134[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3130[ebp]
   push [esi[edx]]
   pop eax
   mov middle3134[ebp], eax
_loop_start_3137:
_loop_aftereffects_3137:
_loop_start_3140:
_loop_aftereffects_3140:
   push left3134[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3130[ebp]
   push [esi[edx]]
   pop ecx
   push middle3134[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349915114713
   push 1
   jmp _compare_end604349915114713
_compare_not_equal604349915114713:
   push 0
_compare_end604349915114713:
   pop eax
   cmp eax, 0
   je _loop_end_3140
   push left3134[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3134[ebp], eax
   jmp _loop_start_3140
_loop_end_3140:
_loop_start_3143:
_loop_aftereffects_3143:
   push right3134[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3130[ebp]
   push [esi[edx]]
   pop ecx
   push middle3134[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349915274228
   push 1
   jmp _compare_end604349915274228
_compare_not_equal604349915274228:
   push 0
_compare_end604349915274228:
   pop eax
   cmp eax, 0
   je _loop_end_3143
   push right3134[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3134[ebp], eax
   jmp _loop_start_3143
_loop_end_3143:
   push left3134[ebp]
   pop ecx
   push right3134[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349915491048
   push 1
   jmp _compare_end604349915491048
_compare_not_equal604349915491048:
   push 0
_compare_end604349915491048:
   pop eax
   cmp eax, 0
   je _if_end_3145
_if_start_3145:
   push left3134[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3130[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3145[ebp], eax
   push right3134[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3130[ebp]
   push [esi[edx]]
   pop edx
   push left3134[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3130[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3145[ebp]
   pop edx
   push right3134[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3130[ebp]
   add esi, ecx
   mov [esi], edx
   push left3134[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3134[ebp], eax
   push right3134[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3134[ebp], eax
_if_end_3145:
   push left3134[ebp]
   pop ecx
   push right3134[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349916210360
   push 1
   jmp _compare_end604349916210360
_compare_not_equal604349916210360:
   push 0
_compare_end604349916210360:
   pop eax
   cmp eax, 0
   je _loop_end_3137
   jmp _loop_start_3137
_loop_end_3137:

   ; init stack for qs
   push right3134[ebp]
   push arg_first3130[ebp]
   push arg_s_arr3130[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3130[ebp]
   push left3134[ebp]
   push arg_s_arr3130[ebp]
   ; call qs
   call qs

_if_end_3134:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3146[ebp]
   pop ecx
   push arg_last3146[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349916368164
   push 1
   jmp _compare_end604349916368164
_compare_not_equal604349916368164:
   push 0
_compare_end604349916368164:
   pop eax
   cmp eax, 0
   je _if_end_3150
_if_start_3150:
   push arg_first3146[ebp]
   pop eax
   mov left3150[ebp], eax
   push arg_last3146[ebp]
   pop eax
   mov right3150[ebp], eax
   push left3150[ebp]
   push right3150[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3146[ebp]
   push [esi[edx]]
   pop eax
   mov middle3150[ebp], eax
_loop_start_3153:
_loop_aftereffects_3153:
_loop_start_3156:
_loop_aftereffects_3156:
   push left3150[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3146[ebp]
   push [esi[edx]]
   pop ecx
   push middle3150[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349916573865
   push 1
   jmp _compare_end604349916573865
_compare_not_equal604349916573865:
   push 0
_compare_end604349916573865:
   pop eax
   cmp eax, 0
   je _loop_end_3156
   push left3150[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3150[ebp], eax
   jmp _loop_start_3156
_loop_end_3156:
_loop_start_3159:
_loop_aftereffects_3159:
   push right3150[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3146[ebp]
   push [esi[edx]]
   pop ecx
   push middle3150[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349916702589
   push 1
   jmp _compare_end604349916702589
_compare_not_equal604349916702589:
   push 0
_compare_end604349916702589:
   pop eax
   cmp eax, 0
   je _loop_end_3159
   push right3150[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3150[ebp], eax
   jmp _loop_start_3159
_loop_end_3159:
   push left3150[ebp]
   pop ecx
   push right3150[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349916929245
   push 1
   jmp _compare_end604349916929245
_compare_not_equal604349916929245:
   push 0
_compare_end604349916929245:
   pop eax
   cmp eax, 0
   je _if_end_3161
_if_start_3161:
   push left3150[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3146[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3161[ebp], eax
   push right3150[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3146[ebp]
   push [esi[edx]]
   pop edx
   push left3150[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3146[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3161[ebp]
   pop edx
   push right3150[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3146[ebp]
   add esi, ecx
   mov [esi], edx
   push left3150[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3150[ebp], eax
   push right3150[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3150[ebp], eax
_if_end_3161:
   push left3150[ebp]
   pop ecx
   push right3150[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349917518123
   push 1
   jmp _compare_end604349917518123
_compare_not_equal604349917518123:
   push 0
_compare_end604349917518123:
   pop eax
   cmp eax, 0
   je _loop_end_3153
   jmp _loop_start_3153
_loop_end_3153:

   ; init stack for qs
   push right3150[ebp]
   push arg_first3146[ebp]
   push arg_s_arr3146[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3146[ebp]
   push left3150[ebp]
   push arg_s_arr3146[ebp]
   ; call qs
   call qs

_if_end_3150:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3162[ebp]
   pop ecx
   push arg_last3162[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349917842712
   push 1
   jmp _compare_end604349917842712
_compare_not_equal604349917842712:
   push 0
_compare_end604349917842712:
   pop eax
   cmp eax, 0
   je _if_end_3166
_if_start_3166:
   push arg_first3162[ebp]
   pop eax
   mov left3166[ebp], eax
   push arg_last3162[ebp]
   pop eax
   mov right3166[ebp], eax
   push left3166[ebp]
   push right3166[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3162[ebp]
   push [esi[edx]]
   pop eax
   mov middle3166[ebp], eax
_loop_start_3169:
_loop_aftereffects_3169:
_loop_start_3172:
_loop_aftereffects_3172:
   push left3166[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3162[ebp]
   push [esi[edx]]
   pop ecx
   push middle3166[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349919375848
   push 1
   jmp _compare_end604349919375848
_compare_not_equal604349919375848:
   push 0
_compare_end604349919375848:
   pop eax
   cmp eax, 0
   je _loop_end_3172
   push left3166[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3166[ebp], eax
   jmp _loop_start_3172
_loop_end_3172:
_loop_start_3175:
_loop_aftereffects_3175:
   push right3166[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3162[ebp]
   push [esi[edx]]
   pop ecx
   push middle3166[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349919758170
   push 1
   jmp _compare_end604349919758170
_compare_not_equal604349919758170:
   push 0
_compare_end604349919758170:
   pop eax
   cmp eax, 0
   je _loop_end_3175
   push right3166[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3166[ebp], eax
   jmp _loop_start_3175
_loop_end_3175:
   push left3166[ebp]
   pop ecx
   push right3166[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349920181974
   push 1
   jmp _compare_end604349920181974
_compare_not_equal604349920181974:
   push 0
_compare_end604349920181974:
   pop eax
   cmp eax, 0
   je _if_end_3177
_if_start_3177:
   push left3166[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3162[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3177[ebp], eax
   push right3166[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3162[ebp]
   push [esi[edx]]
   pop edx
   push left3166[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3162[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3177[ebp]
   pop edx
   push right3166[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3162[ebp]
   add esi, ecx
   mov [esi], edx
   push left3166[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3166[ebp], eax
   push right3166[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3166[ebp], eax
_if_end_3177:
   push left3166[ebp]
   pop ecx
   push right3166[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349920817039
   push 1
   jmp _compare_end604349920817039
_compare_not_equal604349920817039:
   push 0
_compare_end604349920817039:
   pop eax
   cmp eax, 0
   je _loop_end_3169
   jmp _loop_start_3169
_loop_end_3169:

   ; init stack for qs
   push right3166[ebp]
   push arg_first3162[ebp]
   push arg_s_arr3162[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3162[ebp]
   push left3166[ebp]
   push arg_s_arr3162[ebp]
   ; call qs
   call qs

_if_end_3166:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3178[ebp]
   pop ecx
   push arg_last3178[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349921590664
   push 1
   jmp _compare_end604349921590664
_compare_not_equal604349921590664:
   push 0
_compare_end604349921590664:
   pop eax
   cmp eax, 0
   je _if_end_3182
_if_start_3182:
   push arg_first3178[ebp]
   pop eax
   mov left3182[ebp], eax
   push arg_last3178[ebp]
   pop eax
   mov right3182[ebp], eax
   push left3182[ebp]
   push right3182[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3178[ebp]
   push [esi[edx]]
   pop eax
   mov middle3182[ebp], eax
_loop_start_3185:
_loop_aftereffects_3185:
_loop_start_3188:
_loop_aftereffects_3188:
   push left3182[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3178[ebp]
   push [esi[edx]]
   pop ecx
   push middle3182[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349922214182
   push 1
   jmp _compare_end604349922214182
_compare_not_equal604349922214182:
   push 0
_compare_end604349922214182:
   pop eax
   cmp eax, 0
   je _loop_end_3188
   push left3182[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3182[ebp], eax
   jmp _loop_start_3188
_loop_end_3188:
_loop_start_3191:
_loop_aftereffects_3191:
   push right3182[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3178[ebp]
   push [esi[edx]]
   pop ecx
   push middle3182[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349922388664
   push 1
   jmp _compare_end604349922388664
_compare_not_equal604349922388664:
   push 0
_compare_end604349922388664:
   pop eax
   cmp eax, 0
   je _loop_end_3191
   push right3182[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3182[ebp], eax
   jmp _loop_start_3191
_loop_end_3191:
   push left3182[ebp]
   pop ecx
   push right3182[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349922504986
   push 1
   jmp _compare_end604349922504986
_compare_not_equal604349922504986:
   push 0
_compare_end604349922504986:
   pop eax
   cmp eax, 0
   je _if_end_3193
_if_start_3193:
   push left3182[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3178[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3193[ebp], eax
   push right3182[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3178[ebp]
   push [esi[edx]]
   pop edx
   push left3182[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3178[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3193[ebp]
   pop edx
   push right3182[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3178[ebp]
   add esi, ecx
   mov [esi], edx
   push left3182[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3182[ebp], eax
   push right3182[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3182[ebp], eax
_if_end_3193:
   push left3182[ebp]
   pop ecx
   push right3182[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349922871912
   push 1
   jmp _compare_end604349922871912
_compare_not_equal604349922871912:
   push 0
_compare_end604349922871912:
   pop eax
   cmp eax, 0
   je _loop_end_3185
   jmp _loop_start_3185
_loop_end_3185:

   ; init stack for qs
   push right3182[ebp]
   push arg_first3178[ebp]
   push arg_s_arr3178[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3178[ebp]
   push left3182[ebp]
   push arg_s_arr3178[ebp]
   ; call qs
   call qs

_if_end_3182:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3194[ebp]
   pop ecx
   push arg_last3194[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349923024584
   push 1
   jmp _compare_end604349923024584
_compare_not_equal604349923024584:
   push 0
_compare_end604349923024584:
   pop eax
   cmp eax, 0
   je _if_end_3198
_if_start_3198:
   push arg_first3194[ebp]
   pop eax
   mov left3198[ebp], eax
   push arg_last3194[ebp]
   pop eax
   mov right3198[ebp], eax
   push left3198[ebp]
   push right3198[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3194[ebp]
   push [esi[edx]]
   pop eax
   mov middle3198[ebp], eax
_loop_start_3201:
_loop_aftereffects_3201:
_loop_start_3204:
_loop_aftereffects_3204:
   push left3198[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3194[ebp]
   push [esi[edx]]
   pop ecx
   push middle3198[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349923231141
   push 1
   jmp _compare_end604349923231141
_compare_not_equal604349923231141:
   push 0
_compare_end604349923231141:
   pop eax
   cmp eax, 0
   je _loop_end_3204
   push left3198[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3198[ebp], eax
   jmp _loop_start_3204
_loop_end_3204:
_loop_start_3207:
_loop_aftereffects_3207:
   push right3198[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3194[ebp]
   push [esi[edx]]
   pop ecx
   push middle3198[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349923473620
   push 1
   jmp _compare_end604349923473620
_compare_not_equal604349923473620:
   push 0
_compare_end604349923473620:
   pop eax
   cmp eax, 0
   je _loop_end_3207
   push right3198[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3198[ebp], eax
   jmp _loop_start_3207
_loop_end_3207:
   push left3198[ebp]
   pop ecx
   push right3198[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349923586093
   push 1
   jmp _compare_end604349923586093
_compare_not_equal604349923586093:
   push 0
_compare_end604349923586093:
   pop eax
   cmp eax, 0
   je _if_end_3209
_if_start_3209:
   push left3198[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3194[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3209[ebp], eax
   push right3198[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3194[ebp]
   push [esi[edx]]
   pop edx
   push left3198[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3194[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3209[ebp]
   pop edx
   push right3198[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3194[ebp]
   add esi, ecx
   mov [esi], edx
   push left3198[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3198[ebp], eax
   push right3198[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3198[ebp], eax
_if_end_3209:
   push left3198[ebp]
   pop ecx
   push right3198[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349923958151
   push 1
   jmp _compare_end604349923958151
_compare_not_equal604349923958151:
   push 0
_compare_end604349923958151:
   pop eax
   cmp eax, 0
   je _loop_end_3201
   jmp _loop_start_3201
_loop_end_3201:

   ; init stack for qs
   push right3198[ebp]
   push arg_first3194[ebp]
   push arg_s_arr3194[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3194[ebp]
   push left3198[ebp]
   push arg_s_arr3194[ebp]
   ; call qs
   call qs

_if_end_3198:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3210[ebp]
   pop ecx
   push arg_last3210[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349924110823
   push 1
   jmp _compare_end604349924110823
_compare_not_equal604349924110823:
   push 0
_compare_end604349924110823:
   pop eax
   cmp eax, 0
   je _if_end_3214
_if_start_3214:
   push arg_first3210[ebp]
   pop eax
   mov left3214[ebp], eax
   push arg_last3210[ebp]
   pop eax
   mov right3214[ebp], eax
   push left3214[ebp]
   push right3214[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3210[ebp]
   push [esi[edx]]
   pop eax
   mov middle3214[ebp], eax
_loop_start_3217:
_loop_aftereffects_3217:
_loop_start_3220:
_loop_aftereffects_3220:
   push left3214[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3210[ebp]
   push [esi[edx]]
   pop ecx
   push middle3214[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349924319518
   push 1
   jmp _compare_end604349924319518
_compare_not_equal604349924319518:
   push 0
_compare_end604349924319518:
   pop eax
   cmp eax, 0
   je _loop_end_3220
   push left3214[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3214[ebp], eax
   jmp _loop_start_3220
_loop_end_3220:
_loop_start_3223:
_loop_aftereffects_3223:
   push right3214[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3210[ebp]
   push [esi[edx]]
   pop ecx
   push middle3214[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349924496139
   push 1
   jmp _compare_end604349924496139
_compare_not_equal604349924496139:
   push 0
_compare_end604349924496139:
   pop eax
   cmp eax, 0
   je _loop_end_3223
   push right3214[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3214[ebp], eax
   jmp _loop_start_3223
_loop_end_3223:
   push left3214[ebp]
   pop ecx
   push right3214[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349924689438
   push 1
   jmp _compare_end604349924689438
_compare_not_equal604349924689438:
   push 0
_compare_end604349924689438:
   pop eax
   cmp eax, 0
   je _if_end_3225
_if_start_3225:
   push left3214[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3210[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3225[ebp], eax
   push right3214[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3210[ebp]
   push [esi[edx]]
   pop edx
   push left3214[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3210[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3225[ebp]
   pop edx
   push right3214[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3210[ebp]
   add esi, ecx
   mov [esi], edx
   push left3214[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3214[ebp], eax
   push right3214[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3214[ebp], eax
_if_end_3225:
   push left3214[ebp]
   pop ecx
   push right3214[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349926200336
   push 1
   jmp _compare_end604349926200336
_compare_not_equal604349926200336:
   push 0
_compare_end604349926200336:
   pop eax
   cmp eax, 0
   je _loop_end_3217
   jmp _loop_start_3217
_loop_end_3217:

   ; init stack for qs
   push right3214[ebp]
   push arg_first3210[ebp]
   push arg_s_arr3210[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3210[ebp]
   push left3214[ebp]
   push arg_s_arr3210[ebp]
   ; call qs
   call qs

_if_end_3214:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3226[ebp]
   pop ecx
   push arg_last3226[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349927389212
   push 1
   jmp _compare_end604349927389212
_compare_not_equal604349927389212:
   push 0
_compare_end604349927389212:
   pop eax
   cmp eax, 0
   je _if_end_3230
_if_start_3230:
   push arg_first3226[ebp]
   pop eax
   mov left3230[ebp], eax
   push arg_last3226[ebp]
   pop eax
   mov right3230[ebp], eax
   push left3230[ebp]
   push right3230[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3226[ebp]
   push [esi[edx]]
   pop eax
   mov middle3230[ebp], eax
_loop_start_3233:
_loop_aftereffects_3233:
_loop_start_3236:
_loop_aftereffects_3236:
   push left3230[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3226[ebp]
   push [esi[edx]]
   pop ecx
   push middle3230[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349929067322
   push 1
   jmp _compare_end604349929067322
_compare_not_equal604349929067322:
   push 0
_compare_end604349929067322:
   pop eax
   cmp eax, 0
   je _loop_end_3236
   push left3230[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3230[ebp], eax
   jmp _loop_start_3236
_loop_end_3236:
_loop_start_3239:
_loop_aftereffects_3239:
   push right3230[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3226[ebp]
   push [esi[edx]]
   pop ecx
   push middle3230[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349929985494
   push 1
   jmp _compare_end604349929985494
_compare_not_equal604349929985494:
   push 0
_compare_end604349929985494:
   pop eax
   cmp eax, 0
   je _loop_end_3239
   push right3230[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3230[ebp], eax
   jmp _loop_start_3239
_loop_end_3239:
   push left3230[ebp]
   pop ecx
   push right3230[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349930913928
   push 1
   jmp _compare_end604349930913928
_compare_not_equal604349930913928:
   push 0
_compare_end604349930913928:
   pop eax
   cmp eax, 0
   je _if_end_3241
_if_start_3241:
   push left3230[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3226[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3241[ebp], eax
   push right3230[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3226[ebp]
   push [esi[edx]]
   pop edx
   push left3230[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3226[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3241[ebp]
   pop edx
   push right3230[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3226[ebp]
   add esi, ecx
   mov [esi], edx
   push left3230[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3230[ebp], eax
   push right3230[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3230[ebp], eax
_if_end_3241:
   push left3230[ebp]
   pop ecx
   push right3230[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349932073723
   push 1
   jmp _compare_end604349932073723
_compare_not_equal604349932073723:
   push 0
_compare_end604349932073723:
   pop eax
   cmp eax, 0
   je _loop_end_3233
   jmp _loop_start_3233
_loop_end_3233:

   ; init stack for qs
   push right3230[ebp]
   push arg_first3226[ebp]
   push arg_s_arr3226[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3226[ebp]
   push left3230[ebp]
   push arg_s_arr3226[ebp]
   ; call qs
   call qs

_if_end_3230:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3242[ebp]
   pop ecx
   push arg_last3242[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349932237087
   push 1
   jmp _compare_end604349932237087
_compare_not_equal604349932237087:
   push 0
_compare_end604349932237087:
   pop eax
   cmp eax, 0
   je _if_end_3246
_if_start_3246:
   push arg_first3242[ebp]
   pop eax
   mov left3246[ebp], eax
   push arg_last3242[ebp]
   pop eax
   mov right3246[ebp], eax
   push left3246[ebp]
   push right3246[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3242[ebp]
   push [esi[edx]]
   pop eax
   mov middle3246[ebp], eax
_loop_start_3249:
_loop_aftereffects_3249:
_loop_start_3252:
_loop_aftereffects_3252:
   push left3246[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3242[ebp]
   push [esi[edx]]
   pop ecx
   push middle3246[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349932574933
   push 1
   jmp _compare_end604349932574933
_compare_not_equal604349932574933:
   push 0
_compare_end604349932574933:
   pop eax
   cmp eax, 0
   je _loop_end_3252
   push left3246[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3246[ebp], eax
   jmp _loop_start_3252
_loop_end_3252:
_loop_start_3255:
_loop_aftereffects_3255:
   push right3246[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3242[ebp]
   push [esi[edx]]
   pop ecx
   push middle3246[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349932688689
   push 1
   jmp _compare_end604349932688689
_compare_not_equal604349932688689:
   push 0
_compare_end604349932688689:
   pop eax
   cmp eax, 0
   je _loop_end_3255
   push right3246[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3246[ebp], eax
   jmp _loop_start_3255
_loop_end_3255:
   push left3246[ebp]
   pop ecx
   push right3246[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349932933734
   push 1
   jmp _compare_end604349932933734
_compare_not_equal604349932933734:
   push 0
_compare_end604349932933734:
   pop eax
   cmp eax, 0
   je _if_end_3257
_if_start_3257:
   push left3246[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3242[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3257[ebp], eax
   push right3246[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3242[ebp]
   push [esi[edx]]
   pop edx
   push left3246[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3242[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3257[ebp]
   pop edx
   push right3246[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3242[ebp]
   add esi, ecx
   mov [esi], edx
   push left3246[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3246[ebp], eax
   push right3246[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3246[ebp], eax
_if_end_3257:
   push left3246[ebp]
   pop ecx
   push right3246[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349933306647
   push 1
   jmp _compare_end604349933306647
_compare_not_equal604349933306647:
   push 0
_compare_end604349933306647:
   pop eax
   cmp eax, 0
   je _loop_end_3249
   jmp _loop_start_3249
_loop_end_3249:

   ; init stack for qs
   push right3246[ebp]
   push arg_first3242[ebp]
   push arg_s_arr3242[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3242[ebp]
   push left3246[ebp]
   push arg_s_arr3242[ebp]
   ; call qs
   call qs

_if_end_3246:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3258[ebp]
   pop ecx
   push arg_last3258[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349933466162
   push 1
   jmp _compare_end604349933466162
_compare_not_equal604349933466162:
   push 0
_compare_end604349933466162:
   pop eax
   cmp eax, 0
   je _if_end_3262
_if_start_3262:
   push arg_first3258[ebp]
   pop eax
   mov left3262[ebp], eax
   push arg_last3258[ebp]
   pop eax
   mov right3262[ebp], eax
   push left3262[ebp]
   push right3262[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3258[ebp]
   push [esi[edx]]
   pop eax
   mov middle3262[ebp], eax
_loop_start_3265:
_loop_aftereffects_3265:
_loop_start_3268:
_loop_aftereffects_3268:
   push left3262[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3258[ebp]
   push [esi[edx]]
   pop ecx
   push middle3262[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349933676140
   push 1
   jmp _compare_end604349933676140
_compare_not_equal604349933676140:
   push 0
_compare_end604349933676140:
   pop eax
   cmp eax, 0
   je _loop_end_3268
   push left3262[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3262[ebp], eax
   jmp _loop_start_3268
_loop_end_3268:
_loop_start_3271:
_loop_aftereffects_3271:
   push right3262[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3258[ebp]
   push [esi[edx]]
   pop ecx
   push middle3262[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349933806574
   push 1
   jmp _compare_end604349933806574
_compare_not_equal604349933806574:
   push 0
_compare_end604349933806574:
   pop eax
   cmp eax, 0
   je _loop_end_3271
   push right3262[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3262[ebp], eax
   jmp _loop_start_3271
_loop_end_3271:
   push left3262[ebp]
   pop ecx
   push right3262[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349933921185
   push 1
   jmp _compare_end604349933921185
_compare_not_equal604349933921185:
   push 0
_compare_end604349933921185:
   pop eax
   cmp eax, 0
   je _if_end_3273
_if_start_3273:
   push left3262[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3258[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3273[ebp], eax
   push right3262[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3258[ebp]
   push [esi[edx]]
   pop edx
   push left3262[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3258[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3273[ebp]
   pop edx
   push right3262[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3258[ebp]
   add esi, ecx
   mov [esi], edx
   push left3262[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3262[ebp], eax
   push right3262[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3262[ebp], eax
_if_end_3273:
   push left3262[ebp]
   pop ecx
   push right3262[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349934987324
   push 1
   jmp _compare_end604349934987324
_compare_not_equal604349934987324:
   push 0
_compare_end604349934987324:
   pop eax
   cmp eax, 0
   je _loop_end_3265
   jmp _loop_start_3265
_loop_end_3265:

   ; init stack for qs
   push right3262[ebp]
   push arg_first3258[ebp]
   push arg_s_arr3258[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3258[ebp]
   push left3262[ebp]
   push arg_s_arr3258[ebp]
   ; call qs
   call qs

_if_end_3262:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3274[ebp]
   pop ecx
   push arg_last3274[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349936022244
   push 1
   jmp _compare_end604349936022244
_compare_not_equal604349936022244:
   push 0
_compare_end604349936022244:
   pop eax
   cmp eax, 0
   je _if_end_3278
_if_start_3278:
   push arg_first3274[ebp]
   pop eax
   mov left3278[ebp], eax
   push arg_last3274[ebp]
   pop eax
   mov right3278[ebp], eax
   push left3278[ebp]
   push right3278[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3274[ebp]
   push [esi[edx]]
   pop eax
   mov middle3278[ebp], eax
_loop_start_3281:
_loop_aftereffects_3281:
_loop_start_3284:
_loop_aftereffects_3284:
   push left3278[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3274[ebp]
   push [esi[edx]]
   pop ecx
   push middle3278[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349937734140
   push 1
   jmp _compare_end604349937734140
_compare_not_equal604349937734140:
   push 0
_compare_end604349937734140:
   pop eax
   cmp eax, 0
   je _loop_end_3284
   push left3278[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3278[ebp], eax
   jmp _loop_start_3284
_loop_end_3284:
_loop_start_3287:
_loop_aftereffects_3287:
   push right3278[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3274[ebp]
   push [esi[edx]]
   pop ecx
   push middle3278[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349938121166
   push 1
   jmp _compare_end604349938121166
_compare_not_equal604349938121166:
   push 0
_compare_end604349938121166:
   pop eax
   cmp eax, 0
   je _loop_end_3287
   push right3278[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3278[ebp], eax
   jmp _loop_start_3287
_loop_end_3287:
   push left3278[ebp]
   pop ecx
   push right3278[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349938348249
   push 1
   jmp _compare_end604349938348249
_compare_not_equal604349938348249:
   push 0
_compare_end604349938348249:
   pop eax
   cmp eax, 0
   je _if_end_3289
_if_start_3289:
   push left3278[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3274[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3289[ebp], eax
   push right3278[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3274[ebp]
   push [esi[edx]]
   pop edx
   push left3278[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3274[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3289[ebp]
   pop edx
   push right3278[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3274[ebp]
   add esi, ecx
   mov [esi], edx
   push left3278[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3278[ebp], eax
   push right3278[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3278[ebp], eax
_if_end_3289:
   push left3278[ebp]
   pop ecx
   push right3278[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349939065424
   push 1
   jmp _compare_end604349939065424
_compare_not_equal604349939065424:
   push 0
_compare_end604349939065424:
   pop eax
   cmp eax, 0
   je _loop_end_3281
   jmp _loop_start_3281
_loop_end_3281:

   ; init stack for qs
   push right3278[ebp]
   push arg_first3274[ebp]
   push arg_s_arr3274[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3274[ebp]
   push left3278[ebp]
   push arg_s_arr3274[ebp]
   ; call qs
   call qs

_if_end_3278:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3290[ebp]
   pop ecx
   push arg_last3290[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349939350241
   push 1
   jmp _compare_end604349939350241
_compare_not_equal604349939350241:
   push 0
_compare_end604349939350241:
   pop eax
   cmp eax, 0
   je _if_end_3294
_if_start_3294:
   push arg_first3290[ebp]
   pop eax
   mov left3294[ebp], eax
   push arg_last3290[ebp]
   pop eax
   mov right3294[ebp], eax
   push left3294[ebp]
   push right3294[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3290[ebp]
   push [esi[edx]]
   pop eax
   mov middle3294[ebp], eax
_loop_start_3297:
_loop_aftereffects_3297:
_loop_start_3300:
_loop_aftereffects_3300:
   push left3294[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3290[ebp]
   push [esi[edx]]
   pop ecx
   push middle3294[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349939739405
   push 1
   jmp _compare_end604349939739405
_compare_not_equal604349939739405:
   push 0
_compare_end604349939739405:
   pop eax
   cmp eax, 0
   je _loop_end_3300
   push left3294[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3294[ebp], eax
   jmp _loop_start_3300
_loop_end_3300:
_loop_start_3303:
_loop_aftereffects_3303:
   push right3294[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3290[ebp]
   push [esi[edx]]
   pop ecx
   push middle3294[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349939954087
   push 1
   jmp _compare_end604349939954087
_compare_not_equal604349939954087:
   push 0
_compare_end604349939954087:
   pop eax
   cmp eax, 0
   je _loop_end_3303
   push right3294[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3294[ebp], eax
   jmp _loop_start_3303
_loop_end_3303:
   push left3294[ebp]
   pop ecx
   push right3294[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349940164920
   push 1
   jmp _compare_end604349940164920
_compare_not_equal604349940164920:
   push 0
_compare_end604349940164920:
   pop eax
   cmp eax, 0
   je _if_end_3305
_if_start_3305:
   push left3294[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3290[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3305[ebp], eax
   push right3294[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3290[ebp]
   push [esi[edx]]
   pop edx
   push left3294[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3290[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3305[ebp]
   pop edx
   push right3294[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3290[ebp]
   add esi, ecx
   mov [esi], edx
   push left3294[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3294[ebp], eax
   push right3294[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3294[ebp], eax
_if_end_3305:
   push left3294[ebp]
   pop ecx
   push right3294[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349940847454
   push 1
   jmp _compare_end604349940847454
_compare_not_equal604349940847454:
   push 0
_compare_end604349940847454:
   pop eax
   cmp eax, 0
   je _loop_end_3297
   jmp _loop_start_3297
_loop_end_3297:

   ; init stack for qs
   push right3294[ebp]
   push arg_first3290[ebp]
   push arg_s_arr3290[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3290[ebp]
   push left3294[ebp]
   push arg_s_arr3290[ebp]
   ; call qs
   call qs

_if_end_3294:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3306[ebp]
   pop ecx
   push arg_last3306[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349941130560
   push 1
   jmp _compare_end604349941130560
_compare_not_equal604349941130560:
   push 0
_compare_end604349941130560:
   pop eax
   cmp eax, 0
   je _if_end_3310
_if_start_3310:
   push arg_first3306[ebp]
   pop eax
   mov left3310[ebp], eax
   push arg_last3306[ebp]
   pop eax
   mov right3310[ebp], eax
   push left3310[ebp]
   push right3310[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3306[ebp]
   push [esi[edx]]
   pop eax
   mov middle3310[ebp], eax
_loop_start_3313:
_loop_aftereffects_3313:
_loop_start_3316:
_loop_aftereffects_3316:
   push left3310[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3306[ebp]
   push [esi[edx]]
   pop ecx
   push middle3310[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349941397843
   push 1
   jmp _compare_end604349941397843
_compare_not_equal604349941397843:
   push 0
_compare_end604349941397843:
   pop eax
   cmp eax, 0
   je _loop_end_3316
   push left3310[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3310[ebp], eax
   jmp _loop_start_3316
_loop_end_3316:
_loop_start_3319:
_loop_aftereffects_3319:
   push right3310[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3306[ebp]
   push [esi[edx]]
   pop ecx
   push middle3310[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349941514593
   push 1
   jmp _compare_end604349941514593
_compare_not_equal604349941514593:
   push 0
_compare_end604349941514593:
   pop eax
   cmp eax, 0
   je _loop_end_3319
   push right3310[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3310[ebp], eax
   jmp _loop_start_3319
_loop_end_3319:
   push left3310[ebp]
   pop ecx
   push right3310[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349941630914
   push 1
   jmp _compare_end604349941630914
_compare_not_equal604349941630914:
   push 0
_compare_end604349941630914:
   pop eax
   cmp eax, 0
   je _if_end_3321
_if_start_3321:
   push left3310[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3306[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3321[ebp], eax
   push right3310[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3306[ebp]
   push [esi[edx]]
   pop edx
   push left3310[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3306[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3321[ebp]
   pop edx
   push right3310[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3306[ebp]
   add esi, ecx
   mov [esi], edx
   push left3310[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3310[ebp], eax
   push right3310[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3310[ebp], eax
_if_end_3321:
   push left3310[ebp]
   pop ecx
   push right3310[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349942156072
   push 1
   jmp _compare_end604349942156072
_compare_not_equal604349942156072:
   push 0
_compare_end604349942156072:
   pop eax
   cmp eax, 0
   je _loop_end_3313
   jmp _loop_start_3313
_loop_end_3313:

   ; init stack for qs
   push right3310[ebp]
   push arg_first3306[ebp]
   push arg_s_arr3306[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3306[ebp]
   push left3310[ebp]
   push arg_s_arr3306[ebp]
   ; call qs
   call qs

_if_end_3310:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3322[ebp]
   pop ecx
   push arg_last3322[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349942585008
   push 1
   jmp _compare_end604349942585008
_compare_not_equal604349942585008:
   push 0
_compare_end604349942585008:
   pop eax
   cmp eax, 0
   je _if_end_3326
_if_start_3326:
   push arg_first3322[ebp]
   pop eax
   mov left3326[ebp], eax
   push arg_last3322[ebp]
   pop eax
   mov right3326[ebp], eax
   push left3326[ebp]
   push right3326[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3322[ebp]
   push [esi[edx]]
   pop eax
   mov middle3326[ebp], eax
_loop_start_3329:
_loop_aftereffects_3329:
_loop_start_3332:
_loop_aftereffects_3332:
   push left3326[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3322[ebp]
   push [esi[edx]]
   pop ecx
   push middle3326[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349942874530
   push 1
   jmp _compare_end604349942874530
_compare_not_equal604349942874530:
   push 0
_compare_end604349942874530:
   pop eax
   cmp eax, 0
   je _loop_end_3332
   push left3326[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3326[ebp], eax
   jmp _loop_start_3332
_loop_end_3332:
_loop_start_3335:
_loop_aftereffects_3335:
   push right3326[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3322[ebp]
   push [esi[edx]]
   pop ecx
   push middle3326[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349942991279
   push 1
   jmp _compare_end604349942991279
_compare_not_equal604349942991279:
   push 0
_compare_end604349942991279:
   pop eax
   cmp eax, 0
   je _loop_end_3335
   push right3326[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3326[ebp], eax
   jmp _loop_start_3335
_loop_end_3335:
   push left3326[ebp]
   pop ecx
   push right3326[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349943107173
   push 1
   jmp _compare_end604349943107173
_compare_not_equal604349943107173:
   push 0
_compare_end604349943107173:
   pop eax
   cmp eax, 0
   je _if_end_3337
_if_start_3337:
   push left3326[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3322[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3337[ebp], eax
   push right3326[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3322[ebp]
   push [esi[edx]]
   pop edx
   push left3326[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3322[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3337[ebp]
   pop edx
   push right3326[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3322[ebp]
   add esi, ecx
   mov [esi], edx
   push left3326[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3326[ebp], eax
   push right3326[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3326[ebp], eax
_if_end_3337:
   push left3326[ebp]
   pop ecx
   push right3326[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349943486501
   push 1
   jmp _compare_end604349943486501
_compare_not_equal604349943486501:
   push 0
_compare_end604349943486501:
   pop eax
   cmp eax, 0
   je _loop_end_3329
   jmp _loop_start_3329
_loop_end_3329:

   ; init stack for qs
   push right3326[ebp]
   push arg_first3322[ebp]
   push arg_s_arr3322[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3322[ebp]
   push left3326[ebp]
   push arg_s_arr3322[ebp]
   ; call qs
   call qs

_if_end_3326:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3338[ebp]
   pop ecx
   push arg_last3338[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349943643022
   push 1
   jmp _compare_end604349943643022
_compare_not_equal604349943643022:
   push 0
_compare_end604349943643022:
   pop eax
   cmp eax, 0
   je _if_end_3342
_if_start_3342:
   push arg_first3338[ebp]
   pop eax
   mov left3342[ebp], eax
   push arg_last3338[ebp]
   pop eax
   mov right3342[ebp], eax
   push left3342[ebp]
   push right3342[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3338[ebp]
   push [esi[edx]]
   pop eax
   mov middle3342[ebp], eax
_loop_start_3345:
_loop_aftereffects_3345:
_loop_start_3348:
_loop_aftereffects_3348:
   push left3342[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3338[ebp]
   push [esi[edx]]
   pop ecx
   push middle3342[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349943867112
   push 1
   jmp _compare_end604349943867112
_compare_not_equal604349943867112:
   push 0
_compare_end604349943867112:
   pop eax
   cmp eax, 0
   je _loop_end_3348
   push left3342[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3342[ebp], eax
   jmp _loop_start_3348
_loop_end_3348:
_loop_start_3351:
_loop_aftereffects_3351:
   push right3342[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3338[ebp]
   push [esi[edx]]
   pop ecx
   push middle3342[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349943986855
   push 1
   jmp _compare_end604349943986855
_compare_not_equal604349943986855:
   push 0
_compare_end604349943986855:
   pop eax
   cmp eax, 0
   je _loop_end_3351
   push right3342[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3342[ebp], eax
   jmp _loop_start_3351
_loop_end_3351:
   push left3342[ebp]
   pop ecx
   push right3342[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349944104032
   push 1
   jmp _compare_end604349944104032
_compare_not_equal604349944104032:
   push 0
_compare_end604349944104032:
   pop eax
   cmp eax, 0
   je _if_end_3353
_if_start_3353:
   push left3342[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3338[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3353[ebp], eax
   push right3342[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3338[ebp]
   push [esi[edx]]
   pop edx
   push left3342[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3338[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3353[ebp]
   pop edx
   push right3342[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3338[ebp]
   add esi, ecx
   mov [esi], edx
   push left3342[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3342[ebp], eax
   push right3342[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3342[ebp], eax
_if_end_3353:
   push left3342[ebp]
   pop ecx
   push right3342[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349944605669
   push 1
   jmp _compare_end604349944605669
_compare_not_equal604349944605669:
   push 0
_compare_end604349944605669:
   pop eax
   cmp eax, 0
   je _loop_end_3345
   jmp _loop_start_3345
_loop_end_3345:

   ; init stack for qs
   push right3342[ebp]
   push arg_first3338[ebp]
   push arg_s_arr3338[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3338[ebp]
   push left3342[ebp]
   push arg_s_arr3338[ebp]
   ; call qs
   call qs

_if_end_3342:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3354[ebp]
   pop ecx
   push arg_last3354[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349944948219
   push 1
   jmp _compare_end604349944948219
_compare_not_equal604349944948219:
   push 0
_compare_end604349944948219:
   pop eax
   cmp eax, 0
   je _if_end_3358
_if_start_3358:
   push arg_first3354[ebp]
   pop eax
   mov left3358[ebp], eax
   push arg_last3354[ebp]
   pop eax
   mov right3358[ebp], eax
   push left3358[ebp]
   push right3358[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3354[ebp]
   push [esi[edx]]
   pop eax
   mov middle3358[ebp], eax
_loop_start_3361:
_loop_aftereffects_3361:
_loop_start_3364:
_loop_aftereffects_3364:
   push left3358[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3354[ebp]
   push [esi[edx]]
   pop ecx
   push middle3358[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349945747075
   push 1
   jmp _compare_end604349945747075
_compare_not_equal604349945747075:
   push 0
_compare_end604349945747075:
   pop eax
   cmp eax, 0
   je _loop_end_3364
   push left3358[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3358[ebp], eax
   jmp _loop_start_3364
_loop_end_3364:
_loop_start_3367:
_loop_aftereffects_3367:
   push right3358[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3354[ebp]
   push [esi[edx]]
   pop ecx
   push middle3358[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349945868956
   push 1
   jmp _compare_end604349945868956
_compare_not_equal604349945868956:
   push 0
_compare_end604349945868956:
   pop eax
   cmp eax, 0
   je _loop_end_3367
   push right3358[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3358[ebp], eax
   jmp _loop_start_3367
_loop_end_3367:
   push left3358[ebp]
   pop ecx
   push right3358[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349945991265
   push 1
   jmp _compare_end604349945991265
_compare_not_equal604349945991265:
   push 0
_compare_end604349945991265:
   pop eax
   cmp eax, 0
   je _if_end_3369
_if_start_3369:
   push left3358[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3354[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3369[ebp], eax
   push right3358[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3354[ebp]
   push [esi[edx]]
   pop edx
   push left3358[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3354[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3369[ebp]
   pop edx
   push right3358[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3354[ebp]
   add esi, ecx
   mov [esi], edx
   push left3358[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3358[ebp], eax
   push right3358[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3358[ebp], eax
_if_end_3369:
   push left3358[ebp]
   pop ecx
   push right3358[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349946437735
   push 1
   jmp _compare_end604349946437735
_compare_not_equal604349946437735:
   push 0
_compare_end604349946437735:
   pop eax
   cmp eax, 0
   je _loop_end_3361
   jmp _loop_start_3361
_loop_end_3361:

   ; init stack for qs
   push right3358[ebp]
   push arg_first3354[ebp]
   push arg_s_arr3354[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3354[ebp]
   push left3358[ebp]
   push arg_s_arr3354[ebp]
   ; call qs
   call qs

_if_end_3358:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3370[ebp]
   pop ecx
   push arg_last3370[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349946598960
   push 1
   jmp _compare_end604349946598960
_compare_not_equal604349946598960:
   push 0
_compare_end604349946598960:
   pop eax
   cmp eax, 0
   je _if_end_3374
_if_start_3374:
   push arg_first3370[ebp]
   pop eax
   mov left3374[ebp], eax
   push arg_last3370[ebp]
   pop eax
   mov right3374[ebp], eax
   push left3374[ebp]
   push right3374[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3370[ebp]
   push [esi[edx]]
   pop eax
   mov middle3374[ebp], eax
_loop_start_3377:
_loop_aftereffects_3377:
_loop_start_3380:
_loop_aftereffects_3380:
   push left3374[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3370[ebp]
   push [esi[edx]]
   pop ecx
   push middle3374[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349946818346
   push 1
   jmp _compare_end604349946818346
_compare_not_equal604349946818346:
   push 0
_compare_end604349946818346:
   pop eax
   cmp eax, 0
   je _loop_end_3380
   push left3374[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3374[ebp], eax
   jmp _loop_start_3380
_loop_end_3380:
_loop_start_3383:
_loop_aftereffects_3383:
   push right3374[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3370[ebp]
   push [esi[edx]]
   pop ecx
   push middle3374[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349946935951
   push 1
   jmp _compare_end604349946935951
_compare_not_equal604349946935951:
   push 0
_compare_end604349946935951:
   pop eax
   cmp eax, 0
   je _loop_end_3383
   push right3374[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3374[ebp], eax
   jmp _loop_start_3383
_loop_end_3383:
   push left3374[ebp]
   pop ecx
   push right3374[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349947056977
   push 1
   jmp _compare_end604349947056977
_compare_not_equal604349947056977:
   push 0
_compare_end604349947056977:
   pop eax
   cmp eax, 0
   je _if_end_3385
_if_start_3385:
   push left3374[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3370[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3385[ebp], eax
   push right3374[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3370[ebp]
   push [esi[edx]]
   pop edx
   push left3374[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3370[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3385[ebp]
   pop edx
   push right3374[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3370[ebp]
   add esi, ecx
   mov [esi], edx
   push left3374[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3374[ebp], eax
   push right3374[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3374[ebp], eax
_if_end_3385:
   push left3374[ebp]
   pop ecx
   push right3374[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349947456405
   push 1
   jmp _compare_end604349947456405
_compare_not_equal604349947456405:
   push 0
_compare_end604349947456405:
   pop eax
   cmp eax, 0
   je _loop_end_3377
   jmp _loop_start_3377
_loop_end_3377:

   ; init stack for qs
   push right3374[ebp]
   push arg_first3370[ebp]
   push arg_s_arr3370[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3370[ebp]
   push left3374[ebp]
   push arg_s_arr3370[ebp]
   ; call qs
   call qs

_if_end_3374:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3386[ebp]
   pop ecx
   push arg_last3386[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349947660395
   push 1
   jmp _compare_end604349947660395
_compare_not_equal604349947660395:
   push 0
_compare_end604349947660395:
   pop eax
   cmp eax, 0
   je _if_end_3390
_if_start_3390:
   push arg_first3386[ebp]
   pop eax
   mov left3390[ebp], eax
   push arg_last3386[ebp]
   pop eax
   mov right3390[ebp], eax
   push left3390[ebp]
   push right3390[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3386[ebp]
   push [esi[edx]]
   pop eax
   mov middle3390[ebp], eax
_loop_start_3393:
_loop_aftereffects_3393:
_loop_start_3396:
_loop_aftereffects_3396:
   push left3390[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3386[ebp]
   push [esi[edx]]
   pop ecx
   push middle3390[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349948335232
   push 1
   jmp _compare_end604349948335232
_compare_not_equal604349948335232:
   push 0
_compare_end604349948335232:
   pop eax
   cmp eax, 0
   je _loop_end_3396
   push left3390[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3390[ebp], eax
   jmp _loop_start_3396
_loop_end_3396:
_loop_start_3399:
_loop_aftereffects_3399:
   push right3390[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3386[ebp]
   push [esi[edx]]
   pop ecx
   push middle3390[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349948529814
   push 1
   jmp _compare_end604349948529814
_compare_not_equal604349948529814:
   push 0
_compare_end604349948529814:
   pop eax
   cmp eax, 0
   je _loop_end_3399
   push right3390[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3390[ebp], eax
   jmp _loop_start_3399
_loop_end_3399:
   push left3390[ebp]
   pop ecx
   push right3390[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349948719692
   push 1
   jmp _compare_end604349948719692
_compare_not_equal604349948719692:
   push 0
_compare_end604349948719692:
   pop eax
   cmp eax, 0
   je _if_end_3401
_if_start_3401:
   push left3390[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3386[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3401[ebp], eax
   push right3390[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3386[ebp]
   push [esi[edx]]
   pop edx
   push left3390[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3386[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3401[ebp]
   pop edx
   push right3390[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3386[ebp]
   add esi, ecx
   mov [esi], edx
   push left3390[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3390[ebp], eax
   push right3390[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3390[ebp], eax
_if_end_3401:
   push left3390[ebp]
   pop ecx
   push right3390[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349949423609
   push 1
   jmp _compare_end604349949423609
_compare_not_equal604349949423609:
   push 0
_compare_end604349949423609:
   pop eax
   cmp eax, 0
   je _loop_end_3393
   jmp _loop_start_3393
_loop_end_3393:

   ; init stack for qs
   push right3390[ebp]
   push arg_first3386[ebp]
   push arg_s_arr3386[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3386[ebp]
   push left3390[ebp]
   push arg_s_arr3386[ebp]
   ; call qs
   call qs

_if_end_3390:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3402[ebp]
   pop ecx
   push arg_last3402[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349949707143
   push 1
   jmp _compare_end604349949707143
_compare_not_equal604349949707143:
   push 0
_compare_end604349949707143:
   pop eax
   cmp eax, 0
   je _if_end_3406
_if_start_3406:
   push arg_first3402[ebp]
   pop eax
   mov left3406[ebp], eax
   push arg_last3402[ebp]
   pop eax
   mov right3406[ebp], eax
   push left3406[ebp]
   push right3406[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3402[ebp]
   push [esi[edx]]
   pop eax
   mov middle3406[ebp], eax
_loop_start_3409:
_loop_aftereffects_3409:
_loop_start_3412:
_loop_aftereffects_3412:
   push left3406[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3402[ebp]
   push [esi[edx]]
   pop ecx
   push middle3406[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349950160455
   push 1
   jmp _compare_end604349950160455
_compare_not_equal604349950160455:
   push 0
_compare_end604349950160455:
   pop eax
   cmp eax, 0
   je _loop_end_3412
   push left3406[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3406[ebp], eax
   jmp _loop_start_3412
_loop_end_3412:
_loop_start_3415:
_loop_aftereffects_3415:
   push right3406[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3402[ebp]
   push [esi[edx]]
   pop ecx
   push middle3406[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349950372143
   push 1
   jmp _compare_end604349950372143
_compare_not_equal604349950372143:
   push 0
_compare_end604349950372143:
   pop eax
   cmp eax, 0
   je _loop_end_3415
   push right3406[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3406[ebp], eax
   jmp _loop_start_3415
_loop_end_3415:
   push left3406[ebp]
   pop ecx
   push right3406[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349950700153
   push 1
   jmp _compare_end604349950700153
_compare_not_equal604349950700153:
   push 0
_compare_end604349950700153:
   pop eax
   cmp eax, 0
   je _if_end_3417
_if_start_3417:
   push left3406[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3402[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3417[ebp], eax
   push right3406[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3402[ebp]
   push [esi[edx]]
   pop edx
   push left3406[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3402[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3417[ebp]
   pop edx
   push right3406[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3402[ebp]
   add esi, ecx
   mov [esi], edx
   push left3406[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3406[ebp], eax
   push right3406[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3406[ebp], eax
_if_end_3417:
   push left3406[ebp]
   pop ecx
   push right3406[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349951589244
   push 1
   jmp _compare_end604349951589244
_compare_not_equal604349951589244:
   push 0
_compare_end604349951589244:
   pop eax
   cmp eax, 0
   je _loop_end_3409
   jmp _loop_start_3409
_loop_end_3409:

   ; init stack for qs
   push right3406[ebp]
   push arg_first3402[ebp]
   push arg_s_arr3402[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3402[ebp]
   push left3406[ebp]
   push arg_s_arr3402[ebp]
   ; call qs
   call qs

_if_end_3406:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3418[ebp]
   pop ecx
   push arg_last3418[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349951890739
   push 1
   jmp _compare_end604349951890739
_compare_not_equal604349951890739:
   push 0
_compare_end604349951890739:
   pop eax
   cmp eax, 0
   je _if_end_3422
_if_start_3422:
   push arg_first3418[ebp]
   pop eax
   mov left3422[ebp], eax
   push arg_last3418[ebp]
   pop eax
   mov right3422[ebp], eax
   push left3422[ebp]
   push right3422[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3418[ebp]
   push [esi[edx]]
   pop eax
   mov middle3422[ebp], eax
_loop_start_3425:
_loop_aftereffects_3425:
_loop_start_3428:
_loop_aftereffects_3428:
   push left3422[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3418[ebp]
   push [esi[edx]]
   pop ecx
   push middle3422[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349952118678
   push 1
   jmp _compare_end604349952118678
_compare_not_equal604349952118678:
   push 0
_compare_end604349952118678:
   pop eax
   cmp eax, 0
   je _loop_end_3428
   push left3422[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3422[ebp], eax
   jmp _loop_start_3428
_loop_end_3428:
_loop_start_3431:
_loop_aftereffects_3431:
   push right3422[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3418[ebp]
   push [esi[edx]]
   pop ecx
   push middle3422[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349952237566
   push 1
   jmp _compare_end604349952237566
_compare_not_equal604349952237566:
   push 0
_compare_end604349952237566:
   pop eax
   cmp eax, 0
   je _loop_end_3431
   push right3422[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3422[ebp], eax
   jmp _loop_start_3431
_loop_end_3431:
   push left3422[ebp]
   pop ecx
   push right3422[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349952359019
   push 1
   jmp _compare_end604349952359019
_compare_not_equal604349952359019:
   push 0
_compare_end604349952359019:
   pop eax
   cmp eax, 0
   je _if_end_3433
_if_start_3433:
   push left3422[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3418[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3433[ebp], eax
   push right3422[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3418[ebp]
   push [esi[edx]]
   pop edx
   push left3422[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3418[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3433[ebp]
   pop edx
   push right3422[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3418[ebp]
   add esi, ecx
   mov [esi], edx
   push left3422[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3422[ebp], eax
   push right3422[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3422[ebp], eax
_if_end_3433:
   push left3422[ebp]
   pop ecx
   push right3422[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349952751177
   push 1
   jmp _compare_end604349952751177
_compare_not_equal604349952751177:
   push 0
_compare_end604349952751177:
   pop eax
   cmp eax, 0
   je _loop_end_3425
   jmp _loop_start_3425
_loop_end_3425:

   ; init stack for qs
   push right3422[ebp]
   push arg_first3418[ebp]
   push arg_s_arr3418[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3418[ebp]
   push left3422[ebp]
   push arg_s_arr3418[ebp]
   ; call qs
   call qs

_if_end_3422:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3434[ebp]
   pop ecx
   push arg_last3434[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349952929509
   push 1
   jmp _compare_end604349952929509
_compare_not_equal604349952929509:
   push 0
_compare_end604349952929509:
   pop eax
   cmp eax, 0
   je _if_end_3438
_if_start_3438:
   push arg_first3434[ebp]
   pop eax
   mov left3438[ebp], eax
   push arg_last3434[ebp]
   pop eax
   mov right3438[ebp], eax
   push left3438[ebp]
   push right3438[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3434[ebp]
   push [esi[edx]]
   pop eax
   mov middle3438[ebp], eax
_loop_start_3441:
_loop_aftereffects_3441:
_loop_start_3444:
_loop_aftereffects_3444:
   push left3438[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3434[ebp]
   push [esi[edx]]
   pop ecx
   push middle3438[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349953148895
   push 1
   jmp _compare_end604349953148895
_compare_not_equal604349953148895:
   push 0
_compare_end604349953148895:
   pop eax
   cmp eax, 0
   je _loop_end_3444
   push left3438[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3438[ebp], eax
   jmp _loop_start_3444
_loop_end_3444:
_loop_start_3447:
_loop_aftereffects_3447:
   push right3438[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3434[ebp]
   push [esi[edx]]
   pop ecx
   push middle3438[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349953392229
   push 1
   jmp _compare_end604349953392229
_compare_not_equal604349953392229:
   push 0
_compare_end604349953392229:
   pop eax
   cmp eax, 0
   je _loop_end_3447
   push right3438[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3438[ebp], eax
   jmp _loop_start_3447
_loop_end_3447:
   push left3438[ebp]
   pop ecx
   push right3438[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349953586811
   push 1
   jmp _compare_end604349953586811
_compare_not_equal604349953586811:
   push 0
_compare_end604349953586811:
   pop eax
   cmp eax, 0
   je _if_end_3449
_if_start_3449:
   push left3438[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3434[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3449[ebp], eax
   push right3438[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3434[ebp]
   push [esi[edx]]
   pop edx
   push left3438[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3434[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3449[ebp]
   pop edx
   push right3438[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3434[ebp]
   add esi, ecx
   mov [esi], edx
   push left3438[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3438[ebp], eax
   push right3438[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3438[ebp], eax
_if_end_3449:
   push left3438[ebp]
   pop ecx
   push right3438[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349954546037
   push 1
   jmp _compare_end604349954546037
_compare_not_equal604349954546037:
   push 0
_compare_end604349954546037:
   pop eax
   cmp eax, 0
   je _loop_end_3441
   jmp _loop_start_3441
_loop_end_3441:

   ; init stack for qs
   push right3438[ebp]
   push arg_first3434[ebp]
   push arg_s_arr3434[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3434[ebp]
   push left3438[ebp]
   push arg_s_arr3434[ebp]
   ; call qs
   call qs

_if_end_3438:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3450[ebp]
   pop ecx
   push arg_last3450[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349954856513
   push 1
   jmp _compare_end604349954856513
_compare_not_equal604349954856513:
   push 0
_compare_end604349954856513:
   pop eax
   cmp eax, 0
   je _if_end_3454
_if_start_3454:
   push arg_first3450[ebp]
   pop eax
   mov left3454[ebp], eax
   push arg_last3450[ebp]
   pop eax
   mov right3454[ebp], eax
   push left3454[ebp]
   push right3454[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3450[ebp]
   push [esi[edx]]
   pop eax
   mov middle3454[ebp], eax
_loop_start_3457:
_loop_aftereffects_3457:
_loop_start_3460:
_loop_aftereffects_3460:
   push left3454[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3450[ebp]
   push [esi[edx]]
   pop ecx
   push middle3454[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349955307260
   push 1
   jmp _compare_end604349955307260
_compare_not_equal604349955307260:
   push 0
_compare_end604349955307260:
   pop eax
   cmp eax, 0
   je _loop_end_3460
   push left3454[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3454[ebp], eax
   jmp _loop_start_3460
_loop_end_3460:
_loop_start_3463:
_loop_aftereffects_3463:
   push right3454[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3450[ebp]
   push [esi[edx]]
   pop ecx
   push middle3454[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349955518948
   push 1
   jmp _compare_end604349955518948
_compare_not_equal604349955518948:
   push 0
_compare_end604349955518948:
   pop eax
   cmp eax, 0
   je _loop_end_3463
   push right3454[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3454[ebp], eax
   jmp _loop_start_3463
_loop_end_3463:
   push left3454[ebp]
   pop ecx
   push right3454[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349955641684
   push 1
   jmp _compare_end604349955641684
_compare_not_equal604349955641684:
   push 0
_compare_end604349955641684:
   pop eax
   cmp eax, 0
   je _if_end_3465
_if_start_3465:
   push left3454[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3450[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3465[ebp], eax
   push right3454[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3450[ebp]
   push [esi[edx]]
   pop edx
   push left3454[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3450[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3465[ebp]
   pop edx
   push right3454[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3450[ebp]
   add esi, ecx
   mov [esi], edx
   push left3454[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3454[ebp], eax
   push right3454[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3454[ebp], eax
_if_end_3465:
   push left3454[ebp]
   pop ecx
   push right3454[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349956372116
   push 1
   jmp _compare_end604349956372116
_compare_not_equal604349956372116:
   push 0
_compare_end604349956372116:
   pop eax
   cmp eax, 0
   je _loop_end_3457
   jmp _loop_start_3457
_loop_end_3457:

   ; init stack for qs
   push right3454[ebp]
   push arg_first3450[ebp]
   push arg_s_arr3450[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3450[ebp]
   push left3454[ebp]
   push arg_s_arr3450[ebp]
   ; call qs
   call qs

_if_end_3454:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3466[ebp]
   pop ecx
   push arg_last3466[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349956537190
   push 1
   jmp _compare_end604349956537190
_compare_not_equal604349956537190:
   push 0
_compare_end604349956537190:
   pop eax
   cmp eax, 0
   je _if_end_3470
_if_start_3470:
   push arg_first3466[ebp]
   pop eax
   mov left3470[ebp], eax
   push arg_last3466[ebp]
   pop eax
   mov right3470[ebp], eax
   push left3470[ebp]
   push right3470[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3466[ebp]
   push [esi[edx]]
   pop eax
   mov middle3470[ebp], eax
_loop_start_3473:
_loop_aftereffects_3473:
_loop_start_3476:
_loop_aftereffects_3476:
   push left3470[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3466[ebp]
   push [esi[edx]]
   pop ecx
   push middle3470[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349956767695
   push 1
   jmp _compare_end604349956767695
_compare_not_equal604349956767695:
   push 0
_compare_end604349956767695:
   pop eax
   cmp eax, 0
   je _loop_end_3476
   push left3470[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3470[ebp], eax
   jmp _loop_start_3476
_loop_end_3476:
_loop_start_3479:
_loop_aftereffects_3479:
   push right3470[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3466[ebp]
   push [esi[edx]]
   pop ecx
   push middle3470[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349956896846
   push 1
   jmp _compare_end604349956896846
_compare_not_equal604349956896846:
   push 0
_compare_end604349956896846:
   pop eax
   cmp eax, 0
   je _loop_end_3479
   push right3470[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3470[ebp], eax
   jmp _loop_start_3479
_loop_end_3479:
   push left3470[ebp]
   pop ecx
   push right3470[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349957506252
   push 1
   jmp _compare_end604349957506252
_compare_not_equal604349957506252:
   push 0
_compare_end604349957506252:
   pop eax
   cmp eax, 0
   je _if_end_3481
_if_start_3481:
   push left3470[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3466[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3481[ebp], eax
   push right3470[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3466[ebp]
   push [esi[edx]]
   pop edx
   push left3470[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3466[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3481[ebp]
   pop edx
   push right3470[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3466[ebp]
   add esi, ecx
   mov [esi], edx
   push left3470[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3470[ebp], eax
   push right3470[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3470[ebp], eax
_if_end_3481:
   push left3470[ebp]
   pop ecx
   push right3470[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349958692561
   push 1
   jmp _compare_end604349958692561
_compare_not_equal604349958692561:
   push 0
_compare_end604349958692561:
   pop eax
   cmp eax, 0
   je _loop_end_3473
   jmp _loop_start_3473
_loop_end_3473:

   ; init stack for qs
   push right3470[ebp]
   push arg_first3466[ebp]
   push arg_s_arr3466[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3466[ebp]
   push left3470[ebp]
   push arg_s_arr3466[ebp]
   ; call qs
   call qs

_if_end_3470:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3482[ebp]
   pop ecx
   push arg_last3482[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349958861057
   push 1
   jmp _compare_end604349958861057
_compare_not_equal604349958861057:
   push 0
_compare_end604349958861057:
   pop eax
   cmp eax, 0
   je _if_end_3486
_if_start_3486:
   push arg_first3482[ebp]
   pop eax
   mov left3486[ebp], eax
   push arg_last3482[ebp]
   pop eax
   mov right3486[ebp], eax
   push left3486[ebp]
   push right3486[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3482[ebp]
   push [esi[edx]]
   pop eax
   mov middle3486[ebp], eax
_loop_start_3489:
_loop_aftereffects_3489:
_loop_start_3492:
_loop_aftereffects_3492:
   push left3486[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3482[ebp]
   push [esi[edx]]
   pop ecx
   push middle3486[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349959089851
   push 1
   jmp _compare_end604349959089851
_compare_not_equal604349959089851:
   push 0
_compare_end604349959089851:
   pop eax
   cmp eax, 0
   je _loop_end_3492
   push left3486[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3486[ebp], eax
   jmp _loop_start_3492
_loop_end_3492:
_loop_start_3495:
_loop_aftereffects_3495:
   push right3486[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3482[ebp]
   push [esi[edx]]
   pop ecx
   push middle3486[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349959210877
   push 1
   jmp _compare_end604349959210877
_compare_not_equal604349959210877:
   push 0
_compare_end604349959210877:
   pop eax
   cmp eax, 0
   je _loop_end_3495
   push right3486[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3486[ebp], eax
   jmp _loop_start_3495
_loop_end_3495:
   push left3486[ebp]
   pop ecx
   push right3486[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349959334041
   push 1
   jmp _compare_end604349959334041
_compare_not_equal604349959334041:
   push 0
_compare_end604349959334041:
   pop eax
   cmp eax, 0
   je _if_end_3497
_if_start_3497:
   push left3486[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3482[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3497[ebp], eax
   push right3486[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3482[ebp]
   push [esi[edx]]
   pop edx
   push left3486[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3482[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3497[ebp]
   pop edx
   push right3486[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3482[ebp]
   add esi, ecx
   mov [esi], edx
   push left3486[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3486[ebp], eax
   push right3486[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3486[ebp], eax
_if_end_3497:
   push left3486[ebp]
   pop ecx
   push right3486[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349959729192
   push 1
   jmp _compare_end604349959729192
_compare_not_equal604349959729192:
   push 0
_compare_end604349959729192:
   pop eax
   cmp eax, 0
   je _loop_end_3489
   jmp _loop_start_3489
_loop_end_3489:

   ; init stack for qs
   push right3486[ebp]
   push arg_first3482[ebp]
   push arg_s_arr3482[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3482[ebp]
   push left3486[ebp]
   push arg_s_arr3482[ebp]
   ; call qs
   call qs

_if_end_3486:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3498[ebp]
   pop ecx
   push arg_last3498[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349959894267
   push 1
   jmp _compare_end604349959894267
_compare_not_equal604349959894267:
   push 0
_compare_end604349959894267:
   pop eax
   cmp eax, 0
   je _if_end_3502
_if_start_3502:
   push arg_first3498[ebp]
   pop eax
   mov left3502[ebp], eax
   push arg_last3498[ebp]
   pop eax
   mov right3502[ebp], eax
   push left3502[ebp]
   push right3502[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3498[ebp]
   push [esi[edx]]
   pop eax
   mov middle3502[ebp], eax
_loop_start_3505:
_loop_aftereffects_3505:
_loop_start_3508:
_loop_aftereffects_3508:
   push left3502[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3498[ebp]
   push [esi[edx]]
   pop ecx
   push middle3502[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349960249646
   push 1
   jmp _compare_end604349960249646
_compare_not_equal604349960249646:
   push 0
_compare_end604349960249646:
   pop eax
   cmp eax, 0
   je _loop_end_3508
   push left3502[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3502[ebp], eax
   jmp _loop_start_3508
_loop_end_3508:
_loop_start_3511:
_loop_aftereffects_3511:
   push right3502[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3498[ebp]
   push [esi[edx]]
   pop ecx
   push middle3502[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349960372810
   push 1
   jmp _compare_end604349960372810
_compare_not_equal604349960372810:
   push 0
_compare_end604349960372810:
   pop eax
   cmp eax, 0
   je _loop_end_3511
   push right3502[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3502[ebp], eax
   jmp _loop_start_3511
_loop_end_3511:
   push left3502[ebp]
   pop ecx
   push right3502[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349960494264
   push 1
   jmp _compare_end604349960494264
_compare_not_equal604349960494264:
   push 0
_compare_end604349960494264:
   pop eax
   cmp eax, 0
   je _if_end_3513
_if_start_3513:
   push left3502[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3498[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3513[ebp], eax
   push right3502[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3498[ebp]
   push [esi[edx]]
   pop edx
   push left3502[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3498[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3513[ebp]
   pop edx
   push right3502[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3498[ebp]
   add esi, ecx
   mov [esi], edx
   push left3502[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3502[ebp], eax
   push right3502[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3502[ebp], eax
_if_end_3513:
   push left3502[ebp]
   pop ecx
   push right3502[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349961110512
   push 1
   jmp _compare_end604349961110512
_compare_not_equal604349961110512:
   push 0
_compare_end604349961110512:
   pop eax
   cmp eax, 0
   je _loop_end_3505
   jmp _loop_start_3505
_loop_end_3505:

   ; init stack for qs
   push right3502[ebp]
   push arg_first3498[ebp]
   push arg_s_arr3498[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3498[ebp]
   push left3502[ebp]
   push arg_s_arr3498[ebp]
   ; call qs
   call qs

_if_end_3502:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3514[ebp]
   pop ecx
   push arg_last3514[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349961392335
   push 1
   jmp _compare_end604349961392335
_compare_not_equal604349961392335:
   push 0
_compare_end604349961392335:
   pop eax
   cmp eax, 0
   je _if_end_3518
_if_start_3518:
   push arg_first3514[ebp]
   pop eax
   mov left3518[ebp], eax
   push arg_last3514[ebp]
   pop eax
   mov right3518[ebp], eax
   push left3518[ebp]
   push right3518[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3514[ebp]
   push [esi[edx]]
   pop eax
   mov middle3518[ebp], eax
_loop_start_3521:
_loop_aftereffects_3521:
_loop_start_3524:
_loop_aftereffects_3524:
   push left3518[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3514[ebp]
   push [esi[edx]]
   pop ecx
   push middle3518[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349961743011
   push 1
   jmp _compare_end604349961743011
_compare_not_equal604349961743011:
   push 0
_compare_end604349961743011:
   pop eax
   cmp eax, 0
   je _loop_end_3524
   push left3518[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3518[ebp], eax
   jmp _loop_start_3524
_loop_end_3524:
_loop_start_3527:
_loop_aftereffects_3527:
   push right3518[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3514[ebp]
   push [esi[edx]]
   pop ecx
   push middle3518[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349962041940
   push 1
   jmp _compare_end604349962041940
_compare_not_equal604349962041940:
   push 0
_compare_end604349962041940:
   pop eax
   cmp eax, 0
   je _loop_end_3527
   push right3518[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3518[ebp], eax
   jmp _loop_start_3527
_loop_end_3527:
   push left3518[ebp]
   pop ecx
   push right3518[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349962200172
   push 1
   jmp _compare_end604349962200172
_compare_not_equal604349962200172:
   push 0
_compare_end604349962200172:
   pop eax
   cmp eax, 0
   je _if_end_3529
_if_start_3529:
   push left3518[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3514[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3529[ebp], eax
   push right3518[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3514[ebp]
   push [esi[edx]]
   pop edx
   push left3518[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3514[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3529[ebp]
   pop edx
   push right3518[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3514[ebp]
   add esi, ecx
   mov [esi], edx
   push left3518[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3518[ebp], eax
   push right3518[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3518[ebp], eax
_if_end_3529:
   push left3518[ebp]
   pop ecx
   push right3518[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349962671446
   push 1
   jmp _compare_end604349962671446
_compare_not_equal604349962671446:
   push 0
_compare_end604349962671446:
   pop eax
   cmp eax, 0
   je _loop_end_3521
   jmp _loop_start_3521
_loop_end_3521:

   ; init stack for qs
   push right3518[ebp]
   push arg_first3514[ebp]
   push arg_s_arr3514[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3514[ebp]
   push left3518[ebp]
   push arg_s_arr3514[ebp]
   ; call qs
   call qs

_if_end_3518:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3530[ebp]
   pop ecx
   push arg_last3530[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349962847211
   push 1
   jmp _compare_end604349962847211
_compare_not_equal604349962847211:
   push 0
_compare_end604349962847211:
   pop eax
   cmp eax, 0
   je _if_end_3534
_if_start_3534:
   push arg_first3530[ebp]
   pop eax
   mov left3534[ebp], eax
   push arg_last3530[ebp]
   pop eax
   mov right3534[ebp], eax
   push left3534[ebp]
   push right3534[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3530[ebp]
   push [esi[edx]]
   pop eax
   mov middle3534[ebp], eax
_loop_start_3537:
_loop_aftereffects_3537:
_loop_start_3540:
_loop_aftereffects_3540:
   push left3534[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3530[ebp]
   push [esi[edx]]
   pop ecx
   push middle3534[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349963204301
   push 1
   jmp _compare_end604349963204301
_compare_not_equal604349963204301:
   push 0
_compare_end604349963204301:
   pop eax
   cmp eax, 0
   je _loop_end_3540
   push left3534[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3534[ebp], eax
   jmp _loop_start_3540
_loop_end_3540:
_loop_start_3543:
_loop_aftereffects_3543:
   push right3534[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3530[ebp]
   push [esi[edx]]
   pop ecx
   push middle3534[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349963339867
   push 1
   jmp _compare_end604349963339867
_compare_not_equal604349963339867:
   push 0
_compare_end604349963339867:
   pop eax
   cmp eax, 0
   je _loop_end_3543
   push right3534[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3534[ebp], eax
   jmp _loop_start_3543
_loop_end_3543:
   push left3534[ebp]
   pop ecx
   push right3534[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349963463887
   push 1
   jmp _compare_end604349963463887
_compare_not_equal604349963463887:
   push 0
_compare_end604349963463887:
   pop eax
   cmp eax, 0
   je _if_end_3545
_if_start_3545:
   push left3534[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3530[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3545[ebp], eax
   push right3534[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3530[ebp]
   push [esi[edx]]
   pop edx
   push left3534[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3530[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3545[ebp]
   pop edx
   push right3534[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3530[ebp]
   add esi, ecx
   mov [esi], edx
   push left3534[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3534[ebp], eax
   push right3534[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3534[ebp], eax
_if_end_3545:
   push left3534[ebp]
   pop ecx
   push right3534[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349964101090
   push 1
   jmp _compare_end604349964101090
_compare_not_equal604349964101090:
   push 0
_compare_end604349964101090:
   pop eax
   cmp eax, 0
   je _loop_end_3537
   jmp _loop_start_3537
_loop_end_3537:

   ; init stack for qs
   push right3534[ebp]
   push arg_first3530[ebp]
   push arg_s_arr3530[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3530[ebp]
   push left3534[ebp]
   push arg_s_arr3530[ebp]
   ; call qs
   call qs

_if_end_3534:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3546[ebp]
   pop ecx
   push arg_last3546[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349964269158
   push 1
   jmp _compare_end604349964269158
_compare_not_equal604349964269158:
   push 0
_compare_end604349964269158:
   pop eax
   cmp eax, 0
   je _if_end_3550
_if_start_3550:
   push arg_first3546[ebp]
   pop eax
   mov left3550[ebp], eax
   push arg_last3546[ebp]
   pop eax
   mov right3550[ebp], eax
   push left3550[ebp]
   push right3550[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3546[ebp]
   push [esi[edx]]
   pop eax
   mov middle3550[ebp], eax
_loop_start_3553:
_loop_aftereffects_3553:
_loop_start_3556:
_loop_aftereffects_3556:
   push left3550[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3546[ebp]
   push [esi[edx]]
   pop ecx
   push middle3550[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349964592463
   push 1
   jmp _compare_end604349964592463
_compare_not_equal604349964592463:
   push 0
_compare_end604349964592463:
   pop eax
   cmp eax, 0
   je _loop_end_3556
   push left3550[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3550[ebp], eax
   jmp _loop_start_3556
_loop_end_3556:
_loop_start_3559:
_loop_aftereffects_3559:
   push right3550[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3546[ebp]
   push [esi[edx]]
   pop ecx
   push middle3550[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349964788756
   push 1
   jmp _compare_end604349964788756
_compare_not_equal604349964788756:
   push 0
_compare_end604349964788756:
   pop eax
   cmp eax, 0
   je _loop_end_3559
   push right3550[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3550[ebp], eax
   jmp _loop_start_3559
_loop_end_3559:
   push left3550[ebp]
   pop ecx
   push right3550[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349964981200
   push 1
   jmp _compare_end604349964981200
_compare_not_equal604349964981200:
   push 0
_compare_end604349964981200:
   pop eax
   cmp eax, 0
   je _if_end_3561
_if_start_3561:
   push left3550[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3546[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3561[ebp], eax
   push right3550[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3546[ebp]
   push [esi[edx]]
   pop edx
   push left3550[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3546[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3561[ebp]
   pop edx
   push right3550[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3546[ebp]
   add esi, ecx
   mov [esi], edx
   push left3550[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3550[ebp], eax
   push right3550[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3550[ebp], eax
_if_end_3561:
   push left3550[ebp]
   pop ecx
   push right3550[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349966290246
   push 1
   jmp _compare_end604349966290246
_compare_not_equal604349966290246:
   push 0
_compare_end604349966290246:
   pop eax
   cmp eax, 0
   je _loop_end_3553
   jmp _loop_start_3553
_loop_end_3553:

   ; init stack for qs
   push right3550[ebp]
   push arg_first3546[ebp]
   push arg_s_arr3546[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3546[ebp]
   push left3550[ebp]
   push arg_s_arr3546[ebp]
   ; call qs
   call qs

_if_end_3550:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3562[ebp]
   pop ecx
   push arg_last3562[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349967006137
   push 1
   jmp _compare_end604349967006137
_compare_not_equal604349967006137:
   push 0
_compare_end604349967006137:
   pop eax
   cmp eax, 0
   je _if_end_3566
_if_start_3566:
   push arg_first3562[ebp]
   pop eax
   mov left3566[ebp], eax
   push arg_last3562[ebp]
   pop eax
   mov right3566[ebp], eax
   push left3566[ebp]
   push right3566[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3562[ebp]
   push [esi[edx]]
   pop eax
   mov middle3566[ebp], eax
_loop_start_3569:
_loop_aftereffects_3569:
_loop_start_3572:
_loop_aftereffects_3572:
   push left3566[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3562[ebp]
   push [esi[edx]]
   pop ecx
   push middle3566[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349967328160
   push 1
   jmp _compare_end604349967328160
_compare_not_equal604349967328160:
   push 0
_compare_end604349967328160:
   pop eax
   cmp eax, 0
   je _loop_end_3572
   push left3566[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3566[ebp], eax
   jmp _loop_start_3572
_loop_end_3572:
_loop_start_3575:
_loop_aftereffects_3575:
   push right3566[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3562[ebp]
   push [esi[edx]]
   pop ecx
   push middle3566[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349967503925
   push 1
   jmp _compare_end604349967503925
_compare_not_equal604349967503925:
   push 0
_compare_end604349967503925:
   pop eax
   cmp eax, 0
   je _loop_end_3575
   push right3566[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3566[ebp], eax
   jmp _loop_start_3575
_loop_end_3575:
   push left3566[ebp]
   pop ecx
   push right3566[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349968375482
   push 1
   jmp _compare_end604349968375482
_compare_not_equal604349968375482:
   push 0
_compare_end604349968375482:
   pop eax
   cmp eax, 0
   je _if_end_3577
_if_start_3577:
   push left3566[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3562[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3577[ebp], eax
   push right3566[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3562[ebp]
   push [esi[edx]]
   pop edx
   push left3566[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3562[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3577[ebp]
   pop edx
   push right3566[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3562[ebp]
   add esi, ecx
   mov [esi], edx
   push left3566[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3566[ebp], eax
   push right3566[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3566[ebp], eax
_if_end_3577:
   push left3566[ebp]
   pop ecx
   push right3566[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349971317735
   push 1
   jmp _compare_end604349971317735
_compare_not_equal604349971317735:
   push 0
_compare_end604349971317735:
   pop eax
   cmp eax, 0
   je _loop_end_3569
   jmp _loop_start_3569
_loop_end_3569:

   ; init stack for qs
   push right3566[ebp]
   push arg_first3562[ebp]
   push arg_s_arr3562[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3562[ebp]
   push left3566[ebp]
   push arg_s_arr3562[ebp]
   ; call qs
   call qs

_if_end_3566:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3578[ebp]
   pop ecx
   push arg_last3578[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349972654151
   push 1
   jmp _compare_end604349972654151
_compare_not_equal604349972654151:
   push 0
_compare_end604349972654151:
   pop eax
   cmp eax, 0
   je _if_end_3582
_if_start_3582:
   push arg_first3578[ebp]
   pop eax
   mov left3582[ebp], eax
   push arg_last3578[ebp]
   pop eax
   mov right3582[ebp], eax
   push left3582[ebp]
   push right3582[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3578[ebp]
   push [esi[edx]]
   pop eax
   mov middle3582[ebp], eax
_loop_start_3585:
_loop_aftereffects_3585:
_loop_start_3588:
_loop_aftereffects_3588:
   push left3582[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3578[ebp]
   push [esi[edx]]
   pop ecx
   push middle3582[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349974469539
   push 1
   jmp _compare_end604349974469539
_compare_not_equal604349974469539:
   push 0
_compare_end604349974469539:
   pop eax
   cmp eax, 0
   je _loop_end_3588
   push left3582[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3582[ebp], eax
   jmp _loop_start_3588
_loop_end_3588:
_loop_start_3591:
_loop_aftereffects_3591:
   push right3582[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3578[ebp]
   push [esi[edx]]
   pop ecx
   push middle3582[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349975009237
   push 1
   jmp _compare_end604349975009237
_compare_not_equal604349975009237:
   push 0
_compare_end604349975009237:
   pop eax
   cmp eax, 0
   je _loop_end_3591
   push right3582[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3582[ebp], eax
   jmp _loop_start_3591
_loop_end_3591:
   push left3582[ebp]
   pop ecx
   push right3582[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349975135394
   push 1
   jmp _compare_end604349975135394
_compare_not_equal604349975135394:
   push 0
_compare_end604349975135394:
   pop eax
   cmp eax, 0
   je _if_end_3593
_if_start_3593:
   push left3582[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3578[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3593[ebp], eax
   push right3582[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3578[ebp]
   push [esi[edx]]
   pop edx
   push left3582[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3578[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3593[ebp]
   pop edx
   push right3582[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3578[ebp]
   add esi, ecx
   mov [esi], edx
   push left3582[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3582[ebp], eax
   push right3582[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3582[ebp], eax
_if_end_3593:
   push left3582[ebp]
   pop ecx
   push right3582[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349975548080
   push 1
   jmp _compare_end604349975548080
_compare_not_equal604349975548080:
   push 0
_compare_end604349975548080:
   pop eax
   cmp eax, 0
   je _loop_end_3585
   jmp _loop_start_3585
_loop_end_3585:

   ; init stack for qs
   push right3582[ebp]
   push arg_first3578[ebp]
   push arg_s_arr3578[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3578[ebp]
   push left3582[ebp]
   push arg_s_arr3578[ebp]
   ; call qs
   call qs

_if_end_3582:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3594[ebp]
   pop ecx
   push arg_last3594[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349975719141
   push 1
   jmp _compare_end604349975719141
_compare_not_equal604349975719141:
   push 0
_compare_end604349975719141:
   pop eax
   cmp eax, 0
   je _if_end_3598
_if_start_3598:
   push arg_first3594[ebp]
   pop eax
   mov left3598[ebp], eax
   push arg_last3594[ebp]
   pop eax
   mov right3598[ebp], eax
   push left3598[ebp]
   push right3598[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3594[ebp]
   push [esi[edx]]
   pop eax
   mov middle3598[ebp], eax
_loop_start_3601:
_loop_aftereffects_3601:
_loop_start_3604:
_loop_aftereffects_3604:
   push left3598[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3594[ebp]
   push [esi[edx]]
   pop ecx
   push middle3598[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349975971456
   push 1
   jmp _compare_end604349975971456
_compare_not_equal604349975971456:
   push 0
_compare_end604349975971456:
   pop eax
   cmp eax, 0
   je _loop_end_3604
   push left3598[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3598[ebp], eax
   jmp _loop_start_3604
_loop_end_3604:
_loop_start_3607:
_loop_aftereffects_3607:
   push right3598[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3594[ebp]
   push [esi[edx]]
   pop ecx
   push middle3598[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349976213936
   push 1
   jmp _compare_end604349976213936
_compare_not_equal604349976213936:
   push 0
_compare_end604349976213936:
   pop eax
   cmp eax, 0
   je _loop_end_3607
   push right3598[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3598[ebp], eax
   jmp _loop_start_3607
_loop_end_3607:
   push left3598[ebp]
   pop ecx
   push right3598[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349976390984
   push 1
   jmp _compare_end604349976390984
_compare_not_equal604349976390984:
   push 0
_compare_end604349976390984:
   pop eax
   cmp eax, 0
   je _if_end_3609
_if_start_3609:
   push left3598[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3594[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3609[ebp], eax
   push right3598[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3594[ebp]
   push [esi[edx]]
   pop edx
   push left3598[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3594[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3609[ebp]
   pop edx
   push right3598[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3594[ebp]
   add esi, ecx
   mov [esi], edx
   push left3598[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3598[ebp], eax
   push right3598[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3598[ebp], eax
_if_end_3609:
   push left3598[ebp]
   pop ecx
   push right3598[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349978572015
   push 1
   jmp _compare_end604349978572015
_compare_not_equal604349978572015:
   push 0
_compare_end604349978572015:
   pop eax
   cmp eax, 0
   je _loop_end_3601
   jmp _loop_start_3601
_loop_end_3601:

   ; init stack for qs
   push right3598[ebp]
   push arg_first3594[ebp]
   push arg_s_arr3594[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3594[ebp]
   push left3598[ebp]
   push arg_s_arr3594[ebp]
   ; call qs
   call qs

_if_end_3598:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3610[ebp]
   pop ecx
   push arg_last3610[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349979906720
   push 1
   jmp _compare_end604349979906720
_compare_not_equal604349979906720:
   push 0
_compare_end604349979906720:
   pop eax
   cmp eax, 0
   je _if_end_3614
_if_start_3614:
   push arg_first3610[ebp]
   pop eax
   mov left3614[ebp], eax
   push arg_last3610[ebp]
   pop eax
   mov right3614[ebp], eax
   push left3614[ebp]
   push right3614[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3610[ebp]
   push [esi[edx]]
   pop eax
   mov middle3614[ebp], eax
_loop_start_3617:
_loop_aftereffects_3617:
_loop_start_3620:
_loop_aftereffects_3620:
   push left3614[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3610[ebp]
   push [esi[edx]]
   pop ecx
   push middle3614[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349981360740
   push 1
   jmp _compare_end604349981360740
_compare_not_equal604349981360740:
   push 0
_compare_end604349981360740:
   pop eax
   cmp eax, 0
   je _loop_end_3620
   push left3614[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3614[ebp], eax
   jmp _loop_start_3620
_loop_end_3620:
_loop_start_3623:
_loop_aftereffects_3623:
   push right3614[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3610[ebp]
   push [esi[edx]]
   pop ecx
   push middle3614[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349981488181
   push 1
   jmp _compare_end604349981488181
_compare_not_equal604349981488181:
   push 0
_compare_end604349981488181:
   pop eax
   cmp eax, 0
   je _loop_end_3623
   push right3614[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3614[ebp], eax
   jmp _loop_start_3623
_loop_end_3623:
   push left3614[ebp]
   pop ecx
   push right3614[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349981613911
   push 1
   jmp _compare_end604349981613911
_compare_not_equal604349981613911:
   push 0
_compare_end604349981613911:
   pop eax
   cmp eax, 0
   je _if_end_3625
_if_start_3625:
   push left3614[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3610[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3625[ebp], eax
   push right3614[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3610[ebp]
   push [esi[edx]]
   pop edx
   push left3614[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3610[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3625[ebp]
   pop edx
   push right3614[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3610[ebp]
   add esi, ecx
   mov [esi], edx
   push left3614[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3614[ebp], eax
   push right3614[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3614[ebp], eax
_if_end_3625:
   push left3614[ebp]
   pop ecx
   push right3614[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349982989671
   push 1
   jmp _compare_end604349982989671
_compare_not_equal604349982989671:
   push 0
_compare_end604349982989671:
   pop eax
   cmp eax, 0
   je _loop_end_3617
   jmp _loop_start_3617
_loop_end_3617:

   ; init stack for qs
   push right3614[ebp]
   push arg_first3610[ebp]
   push arg_s_arr3610[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3610[ebp]
   push left3614[ebp]
   push arg_s_arr3610[ebp]
   ; call qs
   call qs

_if_end_3614:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3626[ebp]
   pop ecx
   push arg_last3626[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349984417604
   push 1
   jmp _compare_end604349984417604
_compare_not_equal604349984417604:
   push 0
_compare_end604349984417604:
   pop eax
   cmp eax, 0
   je _if_end_3630
_if_start_3630:
   push arg_first3626[ebp]
   pop eax
   mov left3630[ebp], eax
   push arg_last3626[ebp]
   pop eax
   mov right3630[ebp], eax
   push left3630[ebp]
   push right3630[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3626[ebp]
   push [esi[edx]]
   pop eax
   mov middle3630[ebp], eax
_loop_start_3633:
_loop_aftereffects_3633:
_loop_start_3636:
_loop_aftereffects_3636:
   push left3630[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3626[ebp]
   push [esi[edx]]
   pop ecx
   push middle3630[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349986225722
   push 1
   jmp _compare_end604349986225722
_compare_not_equal604349986225722:
   push 0
_compare_end604349986225722:
   pop eax
   cmp eax, 0
   je _loop_end_3636
   push left3630[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3630[ebp], eax
   jmp _loop_start_3636
_loop_end_3636:
_loop_start_3639:
_loop_aftereffects_3639:
   push right3630[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3626[ebp]
   push [esi[edx]]
   pop ecx
   push middle3630[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349986871478
   push 1
   jmp _compare_end604349986871478
_compare_not_equal604349986871478:
   push 0
_compare_end604349986871478:
   pop eax
   cmp eax, 0
   je _loop_end_3639
   push right3630[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3630[ebp], eax
   jmp _loop_start_3639
_loop_end_3639:
   push left3630[ebp]
   pop ecx
   push right3630[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349987314526
   push 1
   jmp _compare_end604349987314526
_compare_not_equal604349987314526:
   push 0
_compare_end604349987314526:
   pop eax
   cmp eax, 0
   je _if_end_3641
_if_start_3641:
   push left3630[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3626[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3641[ebp], eax
   push right3630[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3626[ebp]
   push [esi[edx]]
   pop edx
   push left3630[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3626[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3641[ebp]
   pop edx
   push right3630[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3626[ebp]
   add esi, ecx
   mov [esi], edx
   push left3630[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3630[ebp], eax
   push right3630[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3630[ebp], eax
_if_end_3641:
   push left3630[ebp]
   pop ecx
   push right3630[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349990252503
   push 1
   jmp _compare_end604349990252503
_compare_not_equal604349990252503:
   push 0
_compare_end604349990252503:
   pop eax
   cmp eax, 0
   je _loop_end_3633
   jmp _loop_start_3633
_loop_end_3633:

   ; init stack for qs
   push right3630[ebp]
   push arg_first3626[ebp]
   push arg_s_arr3626[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3626[ebp]
   push left3630[ebp]
   push arg_s_arr3626[ebp]
   ; call qs
   call qs

_if_end_3630:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3642[ebp]
   pop ecx
   push arg_last3642[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349991612867
   push 1
   jmp _compare_end604349991612867
_compare_not_equal604349991612867:
   push 0
_compare_end604349991612867:
   pop eax
   cmp eax, 0
   je _if_end_3646
_if_start_3646:
   push arg_first3642[ebp]
   pop eax
   mov left3646[ebp], eax
   push arg_last3642[ebp]
   pop eax
   mov right3646[ebp], eax
   push left3646[ebp]
   push right3646[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3642[ebp]
   push [esi[edx]]
   pop eax
   mov middle3646[ebp], eax
_loop_start_3649:
_loop_aftereffects_3649:
_loop_start_3652:
_loop_aftereffects_3652:
   push left3646[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3642[ebp]
   push [esi[edx]]
   pop ecx
   push middle3646[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349992541730
   push 1
   jmp _compare_end604349992541730
_compare_not_equal604349992541730:
   push 0
_compare_end604349992541730:
   pop eax
   cmp eax, 0
   je _loop_end_3652
   push left3646[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3646[ebp], eax
   jmp _loop_start_3652
_loop_end_3652:
_loop_start_3655:
_loop_aftereffects_3655:
   push right3646[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3642[ebp]
   push [esi[edx]]
   pop ecx
   push middle3646[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349993542010
   push 1
   jmp _compare_end604349993542010
_compare_not_equal604349993542010:
   push 0
_compare_end604349993542010:
   pop eax
   cmp eax, 0
   je _loop_end_3655
   push right3646[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3646[ebp], eax
   jmp _loop_start_3655
_loop_end_3655:
   push left3646[ebp]
   pop ecx
   push right3646[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349994560252
   push 1
   jmp _compare_end604349994560252
_compare_not_equal604349994560252:
   push 0
_compare_end604349994560252:
   pop eax
   cmp eax, 0
   je _if_end_3657
_if_start_3657:
   push left3646[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3642[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3657[ebp], eax
   push right3646[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3642[ebp]
   push [esi[edx]]
   pop edx
   push left3646[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3642[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3657[ebp]
   pop edx
   push right3646[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3642[ebp]
   add esi, ecx
   mov [esi], edx
   push left3646[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3646[ebp], eax
   push right3646[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3646[ebp], eax
_if_end_3657:
   push left3646[ebp]
   pop ecx
   push right3646[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349995928315
   push 1
   jmp _compare_end604349995928315
_compare_not_equal604349995928315:
   push 0
_compare_end604349995928315:
   pop eax
   cmp eax, 0
   je _loop_end_3649
   jmp _loop_start_3649
_loop_end_3649:

   ; init stack for qs
   push right3646[ebp]
   push arg_first3642[ebp]
   push arg_s_arr3642[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3642[ebp]
   push left3646[ebp]
   push arg_s_arr3642[ebp]
   ; call qs
   call qs

_if_end_3646:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3658[ebp]
   pop ecx
   push arg_last3658[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349996911917
   push 1
   jmp _compare_end604349996911917
_compare_not_equal604349996911917:
   push 0
_compare_end604349996911917:
   pop eax
   cmp eax, 0
   je _if_end_3662
_if_start_3662:
   push arg_first3658[ebp]
   pop eax
   mov left3662[ebp], eax
   push arg_last3658[ebp]
   pop eax
   mov right3662[ebp], eax
   push left3662[ebp]
   push right3662[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3658[ebp]
   push [esi[edx]]
   pop eax
   mov middle3662[ebp], eax
_loop_start_3665:
_loop_aftereffects_3665:
_loop_start_3668:
_loop_aftereffects_3668:
   push left3662[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3658[ebp]
   push [esi[edx]]
   pop ecx
   push middle3662[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349997784757
   push 1
   jmp _compare_end604349997784757
_compare_not_equal604349997784757:
   push 0
_compare_end604349997784757:
   pop eax
   cmp eax, 0
   je _loop_end_3668
   push left3662[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3662[ebp], eax
   jmp _loop_start_3668
_loop_end_3668:
_loop_start_3671:
_loop_aftereffects_3671:
   push right3662[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3658[ebp]
   push [esi[edx]]
   pop ecx
   push middle3662[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349998473278
   push 1
   jmp _compare_end604349998473278
_compare_not_equal604349998473278:
   push 0
_compare_end604349998473278:
   pop eax
   cmp eax, 0
   je _loop_end_3671
   push right3662[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3662[ebp], eax
   jmp _loop_start_3671
_loop_end_3671:
   push left3662[ebp]
   pop ecx
   push right3662[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349998965934
   push 1
   jmp _compare_end604349998965934
_compare_not_equal604349998965934:
   push 0
_compare_end604349998965934:
   pop eax
   cmp eax, 0
   je _if_end_3673
_if_start_3673:
   push left3662[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3658[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3673[ebp], eax
   push right3662[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3658[ebp]
   push [esi[edx]]
   pop edx
   push left3662[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3658[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3673[ebp]
   pop edx
   push right3662[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3658[ebp]
   add esi, ecx
   mov [esi], edx
   push left3662[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3662[ebp], eax
   push right3662[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3662[ebp], eax
_if_end_3673:
   push left3662[ebp]
   pop ecx
   push right3662[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604349999389311
   push 1
   jmp _compare_end604349999389311
_compare_not_equal604349999389311:
   push 0
_compare_end604349999389311:
   pop eax
   cmp eax, 0
   je _loop_end_3665
   jmp _loop_start_3665
_loop_end_3665:

   ; init stack for qs
   push right3662[ebp]
   push arg_first3658[ebp]
   push arg_s_arr3658[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3658[ebp]
   push left3662[ebp]
   push arg_s_arr3658[ebp]
   ; call qs
   call qs

_if_end_3662:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3674[ebp]
   pop ecx
   push arg_last3674[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349999564221
   push 1
   jmp _compare_end604349999564221
_compare_not_equal604349999564221:
   push 0
_compare_end604349999564221:
   pop eax
   cmp eax, 0
   je _if_end_3678
_if_start_3678:
   push arg_first3674[ebp]
   pop eax
   mov left3678[ebp], eax
   push arg_last3674[ebp]
   pop eax
   mov right3678[ebp], eax
   push left3678[ebp]
   push right3678[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3674[ebp]
   push [esi[edx]]
   pop eax
   mov middle3678[ebp], eax
_loop_start_3681:
_loop_aftereffects_3681:
_loop_start_3684:
_loop_aftereffects_3684:
   push left3678[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3674[ebp]
   push [esi[edx]]
   pop ecx
   push middle3678[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604349999804990
   push 1
   jmp _compare_end604349999804990
_compare_not_equal604349999804990:
   push 0
_compare_end604349999804990:
   pop eax
   cmp eax, 0
   je _loop_end_3684
   push left3678[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3678[ebp], eax
   jmp _loop_start_3684
_loop_end_3684:
_loop_start_3687:
_loop_aftereffects_3687:
   push right3678[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3674[ebp]
   push [esi[edx]]
   pop ecx
   push middle3678[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604349999962794
   push 1
   jmp _compare_end604349999962794
_compare_not_equal604349999962794:
   push 0
_compare_end604349999962794:
   pop eax
   cmp eax, 0
   je _loop_end_3687
   push right3678[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3678[ebp], eax
   jmp _loop_start_3687
_loop_end_3687:
   push left3678[ebp]
   pop ecx
   push right3678[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350000091090
   push 1
   jmp _compare_end604350000091090
_compare_not_equal604350000091090:
   push 0
_compare_end604350000091090:
   pop eax
   cmp eax, 0
   je _if_end_3689
_if_start_3689:
   push left3678[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3674[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3689[ebp], eax
   push right3678[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3674[ebp]
   push [esi[edx]]
   pop edx
   push left3678[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3674[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3689[ebp]
   pop edx
   push right3678[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3674[ebp]
   add esi, ecx
   mov [esi], edx
   push left3678[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3678[ebp], eax
   push right3678[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3678[ebp], eax
_if_end_3689:
   push left3678[ebp]
   pop ecx
   push right3678[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350000740695
   push 1
   jmp _compare_end604350000740695
_compare_not_equal604350000740695:
   push 0
_compare_end604350000740695:
   pop eax
   cmp eax, 0
   je _loop_end_3681
   jmp _loop_start_3681
_loop_end_3681:

   ; init stack for qs
   push right3678[ebp]
   push arg_first3674[ebp]
   push arg_s_arr3674[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3674[ebp]
   push left3678[ebp]
   push arg_s_arr3674[ebp]
   ; call qs
   call qs

_if_end_3678:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3690[ebp]
   pop ecx
   push arg_last3690[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350001142689
   push 1
   jmp _compare_end604350001142689
_compare_not_equal604350001142689:
   push 0
_compare_end604350001142689:
   pop eax
   cmp eax, 0
   je _if_end_3694
_if_start_3694:
   push arg_first3690[ebp]
   pop eax
   mov left3694[ebp], eax
   push arg_last3690[ebp]
   pop eax
   mov right3694[ebp], eax
   push left3694[ebp]
   push right3694[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3690[ebp]
   push [esi[edx]]
   pop eax
   mov middle3694[ebp], eax
_loop_start_3697:
_loop_aftereffects_3697:
_loop_start_3700:
_loop_aftereffects_3700:
   push left3694[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3690[ebp]
   push [esi[edx]]
   pop ecx
   push middle3694[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350001569486
   push 1
   jmp _compare_end604350001569486
_compare_not_equal604350001569486:
   push 0
_compare_end604350001569486:
   pop eax
   cmp eax, 0
   je _loop_end_3700
   push left3694[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3694[ebp], eax
   jmp _loop_start_3700
_loop_end_3700:
_loop_start_3703:
_loop_aftereffects_3703:
   push right3694[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3690[ebp]
   push [esi[edx]]
   pop ecx
   push middle3694[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350001882101
   push 1
   jmp _compare_end604350001882101
_compare_not_equal604350001882101:
   push 0
_compare_end604350001882101:
   pop eax
   cmp eax, 0
   je _loop_end_3703
   push right3694[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3694[ebp], eax
   jmp _loop_start_3703
_loop_end_3703:
   push left3694[ebp]
   pop ecx
   push right3694[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350002178892
   push 1
   jmp _compare_end604350002178892
_compare_not_equal604350002178892:
   push 0
_compare_end604350002178892:
   pop eax
   cmp eax, 0
   je _if_end_3705
_if_start_3705:
   push left3694[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3690[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3705[ebp], eax
   push right3694[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3690[ebp]
   push [esi[edx]]
   pop edx
   push left3694[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3690[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3705[ebp]
   pop edx
   push right3694[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3690[ebp]
   add esi, ecx
   mov [esi], edx
   push left3694[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3694[ebp], eax
   push right3694[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3694[ebp], eax
_if_end_3705:
   push left3694[ebp]
   pop ecx
   push right3694[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350003571758
   push 1
   jmp _compare_end604350003571758
_compare_not_equal604350003571758:
   push 0
_compare_end604350003571758:
   pop eax
   cmp eax, 0
   je _loop_end_3697
   jmp _loop_start_3697
_loop_end_3697:

   ; init stack for qs
   push right3694[ebp]
   push arg_first3690[ebp]
   push arg_s_arr3690[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3690[ebp]
   push left3694[ebp]
   push arg_s_arr3690[ebp]
   ; call qs
   call qs

_if_end_3694:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3706[ebp]
   pop ecx
   push arg_last3706[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350004276530
   push 1
   jmp _compare_end604350004276530
_compare_not_equal604350004276530:
   push 0
_compare_end604350004276530:
   pop eax
   cmp eax, 0
   je _if_end_3710
_if_start_3710:
   push arg_first3706[ebp]
   pop eax
   mov left3710[ebp], eax
   push arg_last3706[ebp]
   pop eax
   mov right3710[ebp], eax
   push left3710[ebp]
   push right3710[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3706[ebp]
   push [esi[edx]]
   pop eax
   mov middle3710[ebp], eax
_loop_start_3713:
_loop_aftereffects_3713:
_loop_start_3716:
_loop_aftereffects_3716:
   push left3710[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3706[ebp]
   push [esi[edx]]
   pop ecx
   push middle3710[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350004756785
   push 1
   jmp _compare_end604350004756785
_compare_not_equal604350004756785:
   push 0
_compare_end604350004756785:
   pop eax
   cmp eax, 0
   je _loop_end_3716
   push left3710[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3710[ebp], eax
   jmp _loop_start_3716
_loop_end_3716:
_loop_start_3719:
_loop_aftereffects_3719:
   push right3710[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3706[ebp]
   push [esi[edx]]
   pop ecx
   push middle3710[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350005001402
   push 1
   jmp _compare_end604350005001402
_compare_not_equal604350005001402:
   push 0
_compare_end604350005001402:
   pop eax
   cmp eax, 0
   je _loop_end_3719
   push right3710[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3710[ebp], eax
   jmp _loop_start_3719
_loop_end_3719:
   push left3710[ebp]
   pop ecx
   push right3710[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350005275955
   push 1
   jmp _compare_end604350005275955
_compare_not_equal604350005275955:
   push 0
_compare_end604350005275955:
   pop eax
   cmp eax, 0
   je _if_end_3721
_if_start_3721:
   push left3710[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3706[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3721[ebp], eax
   push right3710[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3706[ebp]
   push [esi[edx]]
   pop edx
   push left3710[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3706[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3721[ebp]
   pop edx
   push right3710[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3706[ebp]
   add esi, ecx
   mov [esi], edx
   push left3710[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3710[ebp], eax
   push right3710[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3710[ebp], eax
_if_end_3721:
   push left3710[ebp]
   pop ecx
   push right3710[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350006049580
   push 1
   jmp _compare_end604350006049580
_compare_not_equal604350006049580:
   push 0
_compare_end604350006049580:
   pop eax
   cmp eax, 0
   je _loop_end_3713
   jmp _loop_start_3713
_loop_end_3713:

   ; init stack for qs
   push right3710[ebp]
   push arg_first3706[ebp]
   push arg_s_arr3706[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3706[ebp]
   push left3710[ebp]
   push arg_s_arr3706[ebp]
   ; call qs
   call qs

_if_end_3710:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3722[ebp]
   pop ecx
   push arg_last3722[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350006381439
   push 1
   jmp _compare_end604350006381439
_compare_not_equal604350006381439:
   push 0
_compare_end604350006381439:
   pop eax
   cmp eax, 0
   je _if_end_3726
_if_start_3726:
   push arg_first3722[ebp]
   pop eax
   mov left3726[ebp], eax
   push arg_last3722[ebp]
   pop eax
   mov right3726[ebp], eax
   push left3726[ebp]
   push right3726[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3722[ebp]
   push [esi[edx]]
   pop eax
   mov middle3726[ebp], eax
_loop_start_3729:
_loop_aftereffects_3729:
_loop_start_3732:
_loop_aftereffects_3732:
   push left3726[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3722[ebp]
   push [esi[edx]]
   pop ecx
   push middle3726[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350006806098
   push 1
   jmp _compare_end604350006806098
_compare_not_equal604350006806098:
   push 0
_compare_end604350006806098:
   pop eax
   cmp eax, 0
   je _loop_end_3732
   push left3726[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3726[ebp], eax
   jmp _loop_start_3732
_loop_end_3732:
_loop_start_3735:
_loop_aftereffects_3735:
   push right3726[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3722[ebp]
   push [esi[edx]]
   pop ecx
   push middle3726[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350007048150
   push 1
   jmp _compare_end604350007048150
_compare_not_equal604350007048150:
   push 0
_compare_end604350007048150:
   pop eax
   cmp eax, 0
   je _loop_end_3735
   push right3726[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3726[ebp], eax
   jmp _loop_start_3735
_loop_end_3735:
   push left3726[ebp]
   pop ecx
   push right3726[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350007288918
   push 1
   jmp _compare_end604350007288918
_compare_not_equal604350007288918:
   push 0
_compare_end604350007288918:
   pop eax
   cmp eax, 0
   je _if_end_3737
_if_start_3737:
   push left3726[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3722[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3737[ebp], eax
   push right3726[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3722[ebp]
   push [esi[edx]]
   pop edx
   push left3726[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3722[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3737[ebp]
   pop edx
   push right3726[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3722[ebp]
   add esi, ecx
   mov [esi], edx
   push left3726[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3726[ebp], eax
   push right3726[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3726[ebp], eax
_if_end_3737:
   push left3726[ebp]
   pop ecx
   push right3726[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350008251993
   push 1
   jmp _compare_end604350008251993
_compare_not_equal604350008251993:
   push 0
_compare_end604350008251993:
   pop eax
   cmp eax, 0
   je _loop_end_3729
   jmp _loop_start_3729
_loop_end_3729:

   ; init stack for qs
   push right3726[ebp]
   push arg_first3722[ebp]
   push arg_s_arr3722[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3722[ebp]
   push left3726[ebp]
   push arg_s_arr3722[ebp]
   ; call qs
   call qs

_if_end_3726:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3738[ebp]
   pop ecx
   push arg_last3738[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350008568884
   push 1
   jmp _compare_end604350008568884
_compare_not_equal604350008568884:
   push 0
_compare_end604350008568884:
   pop eax
   cmp eax, 0
   je _if_end_3742
_if_start_3742:
   push arg_first3738[ebp]
   pop eax
   mov left3742[ebp], eax
   push arg_last3738[ebp]
   pop eax
   mov right3742[ebp], eax
   push left3742[ebp]
   push right3742[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3738[ebp]
   push [esi[edx]]
   pop eax
   mov middle3742[ebp], eax
_loop_start_3745:
_loop_aftereffects_3745:
_loop_start_3748:
_loop_aftereffects_3748:
   push left3742[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3738[ebp]
   push [esi[edx]]
   pop ecx
   push middle3742[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350009026901
   push 1
   jmp _compare_end604350009026901
_compare_not_equal604350009026901:
   push 0
_compare_end604350009026901:
   pop eax
   cmp eax, 0
   je _loop_end_3748
   push left3742[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3742[ebp], eax
   jmp _loop_start_3748
_loop_end_3748:
_loop_start_3751:
_loop_aftereffects_3751:
   push right3742[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3738[ebp]
   push [esi[edx]]
   pop ecx
   push middle3742[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350009265959
   push 1
   jmp _compare_end604350009265959
_compare_not_equal604350009265959:
   push 0
_compare_end604350009265959:
   pop eax
   cmp eax, 0
   je _loop_end_3751
   push right3742[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3742[ebp], eax
   jmp _loop_start_3751
_loop_end_3751:
   push left3742[ebp]
   pop ecx
   push right3742[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350009510576
   push 1
   jmp _compare_end604350009510576
_compare_not_equal604350009510576:
   push 0
_compare_end604350009510576:
   pop eax
   cmp eax, 0
   je _if_end_3753
_if_start_3753:
   push left3742[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3738[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3753[ebp], eax
   push right3742[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3738[ebp]
   push [esi[edx]]
   pop edx
   push left3742[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3738[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3753[ebp]
   pop edx
   push right3742[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3738[ebp]
   add esi, ecx
   mov [esi], edx
   push left3742[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3742[ebp], eax
   push right3742[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3742[ebp], eax
_if_end_3753:
   push left3742[ebp]
   pop ecx
   push right3742[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350010283345
   push 1
   jmp _compare_end604350010283345
_compare_not_equal604350010283345:
   push 0
_compare_end604350010283345:
   pop eax
   cmp eax, 0
   je _loop_end_3745
   jmp _loop_start_3745
_loop_end_3745:

   ; init stack for qs
   push right3742[ebp]
   push arg_first3738[ebp]
   push arg_s_arr3738[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3738[ebp]
   push left3742[ebp]
   push arg_s_arr3738[ebp]
   ; call qs
   call qs

_if_end_3742:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3754[ebp]
   pop ecx
   push arg_last3754[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350010660963
   push 1
   jmp _compare_end604350010660963
_compare_not_equal604350010660963:
   push 0
_compare_end604350010660963:
   pop eax
   cmp eax, 0
   je _if_end_3758
_if_start_3758:
   push arg_first3754[ebp]
   pop eax
   mov left3758[ebp], eax
   push arg_last3754[ebp]
   pop eax
   mov right3758[ebp], eax
   push left3758[ebp]
   push right3758[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3754[ebp]
   push [esi[edx]]
   pop eax
   mov middle3758[ebp], eax
_loop_start_3761:
_loop_aftereffects_3761:
_loop_start_3764:
_loop_aftereffects_3764:
   push left3758[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3754[ebp]
   push [esi[edx]]
   pop ecx
   push middle3758[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350011408928
   push 1
   jmp _compare_end604350011408928
_compare_not_equal604350011408928:
   push 0
_compare_end604350011408928:
   pop eax
   cmp eax, 0
   je _loop_end_3764
   push left3758[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3758[ebp], eax
   jmp _loop_start_3764
_loop_end_3764:
_loop_start_3767:
_loop_aftereffects_3767:
   push right3758[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3754[ebp]
   push [esi[edx]]
   pop ecx
   push middle3758[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350012022610
   push 1
   jmp _compare_end604350012022610
_compare_not_equal604350012022610:
   push 0
_compare_end604350012022610:
   pop eax
   cmp eax, 0
   je _loop_end_3767
   push right3758[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3758[ebp], eax
   jmp _loop_start_3767
_loop_end_3767:
   push left3758[ebp]
   pop ecx
   push right3758[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350012429308
   push 1
   jmp _compare_end604350012429308
_compare_not_equal604350012429308:
   push 0
_compare_end604350012429308:
   pop eax
   cmp eax, 0
   je _if_end_3769
_if_start_3769:
   push left3758[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3754[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3769[ebp], eax
   push right3758[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3754[ebp]
   push [esi[edx]]
   pop edx
   push left3758[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3754[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3769[ebp]
   pop edx
   push right3758[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3754[ebp]
   add esi, ecx
   mov [esi], edx
   push left3758[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3758[ebp], eax
   push right3758[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3758[ebp], eax
_if_end_3769:
   push left3758[ebp]
   pop ecx
   push right3758[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350013353039
   push 1
   jmp _compare_end604350013353039
_compare_not_equal604350013353039:
   push 0
_compare_end604350013353039:
   pop eax
   cmp eax, 0
   je _loop_end_3761
   jmp _loop_start_3761
_loop_end_3761:

   ; init stack for qs
   push right3758[ebp]
   push arg_first3754[ebp]
   push arg_s_arr3754[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3754[ebp]
   push left3758[ebp]
   push arg_s_arr3754[ebp]
   ; call qs
   call qs

_if_end_3758:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3770[ebp]
   pop ecx
   push arg_last3770[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350013758027
   push 1
   jmp _compare_end604350013758027
_compare_not_equal604350013758027:
   push 0
_compare_end604350013758027:
   pop eax
   cmp eax, 0
   je _if_end_3774
_if_start_3774:
   push arg_first3770[ebp]
   pop eax
   mov left3774[ebp], eax
   push arg_last3770[ebp]
   pop eax
   mov right3774[ebp], eax
   push left3774[ebp]
   push right3774[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3770[ebp]
   push [esi[edx]]
   pop eax
   mov middle3774[ebp], eax
_loop_start_3777:
_loop_aftereffects_3777:
_loop_start_3780:
_loop_aftereffects_3780:
   push left3774[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3770[ebp]
   push [esi[edx]]
   pop ecx
   push middle3774[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350014310127
   push 1
   jmp _compare_end604350014310127
_compare_not_equal604350014310127:
   push 0
_compare_end604350014310127:
   pop eax
   cmp eax, 0
   je _loop_end_3780
   push left3774[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3774[ebp], eax
   jmp _loop_start_3780
_loop_end_3780:
_loop_start_3783:
_loop_aftereffects_3783:
   push right3774[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3770[ebp]
   push [esi[edx]]
   pop ecx
   push middle3774[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350014557310
   push 1
   jmp _compare_end604350014557310
_compare_not_equal604350014557310:
   push 0
_compare_end604350014557310:
   pop eax
   cmp eax, 0
   je _loop_end_3783
   push right3774[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3774[ebp], eax
   jmp _loop_start_3783
_loop_end_3783:
   push left3774[ebp]
   pop ecx
   push right3774[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350014790809
   push 1
   jmp _compare_end604350014790809
_compare_not_equal604350014790809:
   push 0
_compare_end604350014790809:
   pop eax
   cmp eax, 0
   je _if_end_3785
_if_start_3785:
   push left3774[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3770[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3785[ebp], eax
   push right3774[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3770[ebp]
   push [esi[edx]]
   pop edx
   push left3774[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3770[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3785[ebp]
   pop edx
   push right3774[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3770[ebp]
   add esi, ecx
   mov [esi], edx
   push left3774[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3774[ebp], eax
   push right3774[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3774[ebp], eax
_if_end_3785:
   push left3774[ebp]
   pop ecx
   push right3774[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350016077617
   push 1
   jmp _compare_end604350016077617
_compare_not_equal604350016077617:
   push 0
_compare_end604350016077617:
   pop eax
   cmp eax, 0
   je _loop_end_3777
   jmp _loop_start_3777
_loop_end_3777:

   ; init stack for qs
   push right3774[ebp]
   push arg_first3770[ebp]
   push arg_s_arr3770[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3770[ebp]
   push left3774[ebp]
   push arg_s_arr3770[ebp]
   ; call qs
   call qs

_if_end_3774:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3786[ebp]
   pop ecx
   push arg_last3786[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350017169843
   push 1
   jmp _compare_end604350017169843
_compare_not_equal604350017169843:
   push 0
_compare_end604350017169843:
   pop eax
   cmp eax, 0
   je _if_end_3790
_if_start_3790:
   push arg_first3786[ebp]
   pop eax
   mov left3790[ebp], eax
   push arg_last3786[ebp]
   pop eax
   mov right3790[ebp], eax
   push left3790[ebp]
   push right3790[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3786[ebp]
   push [esi[edx]]
   pop eax
   mov middle3790[ebp], eax
_loop_start_3793:
_loop_aftereffects_3793:
_loop_start_3796:
_loop_aftereffects_3796:
   push left3790[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3786[ebp]
   push [esi[edx]]
   pop ecx
   push middle3790[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350017608187
   push 1
   jmp _compare_end604350017608187
_compare_not_equal604350017608187:
   push 0
_compare_end604350017608187:
   pop eax
   cmp eax, 0
   je _loop_end_3796
   push left3790[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3790[ebp], eax
   jmp _loop_start_3796
_loop_end_3796:
_loop_start_3799:
_loop_aftereffects_3799:
   push right3790[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3786[ebp]
   push [esi[edx]]
   pop ecx
   push middle3790[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350017947316
   push 1
   jmp _compare_end604350017947316
_compare_not_equal604350017947316:
   push 0
_compare_end604350017947316:
   pop eax
   cmp eax, 0
   je _loop_end_3799
   push right3790[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3790[ebp], eax
   jmp _loop_start_3799
_loop_end_3799:
   push left3790[ebp]
   pop ecx
   push right3790[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350018813314
   push 1
   jmp _compare_end604350018813314
_compare_not_equal604350018813314:
   push 0
_compare_end604350018813314:
   pop eax
   cmp eax, 0
   je _if_end_3801
_if_start_3801:
   push left3790[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3786[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3801[ebp], eax
   push right3790[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3786[ebp]
   push [esi[edx]]
   pop edx
   push left3790[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3786[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3801[ebp]
   pop edx
   push right3790[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3786[ebp]
   add esi, ecx
   mov [esi], edx
   push left3790[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3790[ebp], eax
   push right3790[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3790[ebp], eax
_if_end_3801:
   push left3790[ebp]
   pop ecx
   push right3790[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350019582234
   push 1
   jmp _compare_end604350019582234
_compare_not_equal604350019582234:
   push 0
_compare_end604350019582234:
   pop eax
   cmp eax, 0
   je _loop_end_3793
   jmp _loop_start_3793
_loop_end_3793:

   ; init stack for qs
   push right3790[ebp]
   push arg_first3786[ebp]
   push arg_s_arr3786[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3786[ebp]
   push left3790[ebp]
   push arg_s_arr3786[ebp]
   ; call qs
   call qs

_if_end_3790:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3802[ebp]
   pop ecx
   push arg_last3802[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350020009887
   push 1
   jmp _compare_end604350020009887
_compare_not_equal604350020009887:
   push 0
_compare_end604350020009887:
   pop eax
   cmp eax, 0
   je _if_end_3806
_if_start_3806:
   push arg_first3802[ebp]
   pop eax
   mov left3806[ebp], eax
   push arg_last3802[ebp]
   pop eax
   mov right3806[ebp], eax
   push left3806[ebp]
   push right3806[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3802[ebp]
   push [esi[edx]]
   pop eax
   mov middle3806[ebp], eax
_loop_start_3809:
_loop_aftereffects_3809:
_loop_start_3812:
_loop_aftereffects_3812:
   push left3806[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3802[ebp]
   push [esi[edx]]
   pop ecx
   push middle3806[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350020593633
   push 1
   jmp _compare_end604350020593633
_compare_not_equal604350020593633:
   push 0
_compare_end604350020593633:
   pop eax
   cmp eax, 0
   je _loop_end_3812
   push left3806[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3806[ebp], eax
   jmp _loop_start_3812
_loop_end_3812:
_loop_start_3815:
_loop_aftereffects_3815:
   push right3806[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3802[ebp]
   push [esi[edx]]
   pop ecx
   push middle3806[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350020865193
   push 1
   jmp _compare_end604350020865193
_compare_not_equal604350020865193:
   push 0
_compare_end604350020865193:
   pop eax
   cmp eax, 0
   je _loop_end_3815
   push right3806[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3806[ebp], eax
   jmp _loop_start_3815
_loop_end_3815:
   push left3806[ebp]
   pop ecx
   push right3806[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350021082868
   push 1
   jmp _compare_end604350021082868
_compare_not_equal604350021082868:
   push 0
_compare_end604350021082868:
   pop eax
   cmp eax, 0
   je _if_end_3817
_if_start_3817:
   push left3806[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3802[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3817[ebp], eax
   push right3806[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3802[ebp]
   push [esi[edx]]
   pop edx
   push left3806[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3802[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3817[ebp]
   pop edx
   push right3806[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3802[ebp]
   add esi, ecx
   mov [esi], edx
   push left3806[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3806[ebp], eax
   push right3806[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3806[ebp], eax
_if_end_3817:
   push left3806[ebp]
   pop ecx
   push right3806[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350022007882
   push 1
   jmp _compare_end604350022007882
_compare_not_equal604350022007882:
   push 0
_compare_end604350022007882:
   pop eax
   cmp eax, 0
   je _loop_end_3809
   jmp _loop_start_3809
_loop_end_3809:

   ; init stack for qs
   push right3806[ebp]
   push arg_first3802[ebp]
   push arg_s_arr3802[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3802[ebp]
   push left3806[ebp]
   push arg_s_arr3802[ebp]
   ; call qs
   call qs

_if_end_3806:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3818[ebp]
   pop ecx
   push arg_last3818[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350022351715
   push 1
   jmp _compare_end604350022351715
_compare_not_equal604350022351715:
   push 0
_compare_end604350022351715:
   pop eax
   cmp eax, 0
   je _if_end_3822
_if_start_3822:
   push arg_first3818[ebp]
   pop eax
   mov left3822[ebp], eax
   push arg_last3818[ebp]
   pop eax
   mov right3822[ebp], eax
   push left3822[ebp]
   push right3822[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3818[ebp]
   push [esi[edx]]
   pop eax
   mov middle3822[ebp], eax
_loop_start_3825:
_loop_aftereffects_3825:
_loop_start_3828:
_loop_aftereffects_3828:
   push left3822[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3818[ebp]
   push [esi[edx]]
   pop ecx
   push middle3822[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350022818712
   push 1
   jmp _compare_end604350022818712
_compare_not_equal604350022818712:
   push 0
_compare_end604350022818712:
   pop eax
   cmp eax, 0
   je _loop_end_3828
   push left3822[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3822[ebp], eax
   jmp _loop_start_3828
_loop_end_3828:
_loop_start_3831:
_loop_aftereffects_3831:
   push right3822[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3818[ebp]
   push [esi[edx]]
   pop ecx
   push middle3822[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350023062474
   push 1
   jmp _compare_end604350023062474
_compare_not_equal604350023062474:
   push 0
_compare_end604350023062474:
   pop eax
   cmp eax, 0
   je _loop_end_3831
   push right3822[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3822[ebp], eax
   jmp _loop_start_3831
_loop_end_3831:
   push left3822[ebp]
   pop ecx
   push right3822[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350023329330
   push 1
   jmp _compare_end604350023329330
_compare_not_equal604350023329330:
   push 0
_compare_end604350023329330:
   pop eax
   cmp eax, 0
   je _if_end_3833
_if_start_3833:
   push left3822[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3818[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3833[ebp], eax
   push right3822[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3818[ebp]
   push [esi[edx]]
   pop edx
   push left3822[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3818[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3833[ebp]
   pop edx
   push right3822[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3818[ebp]
   add esi, ecx
   mov [esi], edx
   push left3822[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3822[ebp], eax
   push right3822[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3822[ebp], eax
_if_end_3833:
   push left3822[ebp]
   pop ecx
   push right3822[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350024097395
   push 1
   jmp _compare_end604350024097395
_compare_not_equal604350024097395:
   push 0
_compare_end604350024097395:
   pop eax
   cmp eax, 0
   je _loop_end_3825
   jmp _loop_start_3825
_loop_end_3825:

   ; init stack for qs
   push right3822[ebp]
   push arg_first3818[ebp]
   push arg_s_arr3818[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3818[ebp]
   push left3822[ebp]
   push arg_s_arr3818[ebp]
   ; call qs
   call qs

_if_end_3822:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3834[ebp]
   pop ecx
   push arg_last3834[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350024419418
   push 1
   jmp _compare_end604350024419418
_compare_not_equal604350024419418:
   push 0
_compare_end604350024419418:
   pop eax
   cmp eax, 0
   je _if_end_3838
_if_start_3838:
   push arg_first3834[ebp]
   pop eax
   mov left3838[ebp], eax
   push arg_last3834[ebp]
   pop eax
   mov right3838[ebp], eax
   push left3838[ebp]
   push right3838[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3834[ebp]
   push [esi[edx]]
   pop eax
   mov middle3838[ebp], eax
_loop_start_3841:
_loop_aftereffects_3841:
_loop_start_3844:
_loop_aftereffects_3844:
   push left3838[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3834[ebp]
   push [esi[edx]]
   pop ecx
   push middle3838[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350024867598
   push 1
   jmp _compare_end604350024867598
_compare_not_equal604350024867598:
   push 0
_compare_end604350024867598:
   pop eax
   cmp eax, 0
   je _loop_end_3844
   push left3838[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3838[ebp], eax
   jmp _loop_start_3844
_loop_end_3844:
_loop_start_3847:
_loop_aftereffects_3847:
   push right3838[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3834[ebp]
   push [esi[edx]]
   pop ecx
   push middle3838[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350025119486
   push 1
   jmp _compare_end604350025119486
_compare_not_equal604350025119486:
   push 0
_compare_end604350025119486:
   pop eax
   cmp eax, 0
   je _loop_end_3847
   push right3838[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3838[ebp], eax
   jmp _loop_start_3847
_loop_end_3847:
   push left3838[ebp]
   pop ecx
   push right3838[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350025368380
   push 1
   jmp _compare_end604350025368380
_compare_not_equal604350025368380:
   push 0
_compare_end604350025368380:
   pop eax
   cmp eax, 0
   je _if_end_3849
_if_start_3849:
   push left3838[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3834[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3849[ebp], eax
   push right3838[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3834[ebp]
   push [esi[edx]]
   pop edx
   push left3838[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3834[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3849[ebp]
   pop edx
   push right3838[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3834[ebp]
   add esi, ecx
   mov [esi], edx
   push left3838[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3838[ebp], eax
   push right3838[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3838[ebp], eax
_if_end_3849:
   push left3838[ebp]
   pop ecx
   push right3838[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350026171512
   push 1
   jmp _compare_end604350026171512
_compare_not_equal604350026171512:
   push 0
_compare_end604350026171512:
   pop eax
   cmp eax, 0
   je _loop_end_3841
   jmp _loop_start_3841
_loop_end_3841:

   ; init stack for qs
   push right3838[ebp]
   push arg_first3834[ebp]
   push arg_s_arr3834[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3834[ebp]
   push left3838[ebp]
   push arg_s_arr3834[ebp]
   ; call qs
   call qs

_if_end_3838:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3850[ebp]
   pop ecx
   push arg_last3850[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350026498667
   push 1
   jmp _compare_end604350026498667
_compare_not_equal604350026498667:
   push 0
_compare_end604350026498667:
   pop eax
   cmp eax, 0
   je _if_end_3854
_if_start_3854:
   push arg_first3850[ebp]
   pop eax
   mov left3854[ebp], eax
   push arg_last3850[ebp]
   pop eax
   mov right3854[ebp], eax
   push left3854[ebp]
   push right3854[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3850[ebp]
   push [esi[edx]]
   pop eax
   mov middle3854[ebp], eax
_loop_start_3857:
_loop_aftereffects_3857:
_loop_start_3860:
_loop_aftereffects_3860:
   push left3854[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3850[ebp]
   push [esi[edx]]
   pop ecx
   push middle3854[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350026945564
   push 1
   jmp _compare_end604350026945564
_compare_not_equal604350026945564:
   push 0
_compare_end604350026945564:
   pop eax
   cmp eax, 0
   je _loop_end_3860
   push left3854[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3854[ebp], eax
   jmp _loop_start_3860
_loop_end_3860:
_loop_start_3863:
_loop_aftereffects_3863:
   push right3854[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3850[ebp]
   push [esi[edx]]
   pop ecx
   push middle3854[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350027252619
   push 1
   jmp _compare_end604350027252619
_compare_not_equal604350027252619:
   push 0
_compare_end604350027252619:
   pop eax
   cmp eax, 0
   je _loop_end_3863
   push right3854[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3854[ebp], eax
   jmp _loop_start_3863
_loop_end_3863:
   push left3854[ebp]
   pop ecx
   push right3854[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350027529738
   push 1
   jmp _compare_end604350027529738
_compare_not_equal604350027529738:
   push 0
_compare_end604350027529738:
   pop eax
   cmp eax, 0
   je _if_end_3865
_if_start_3865:
   push left3854[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3850[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3865[ebp], eax
   push right3854[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3850[ebp]
   push [esi[edx]]
   pop edx
   push left3854[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3850[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3865[ebp]
   pop edx
   push right3854[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3850[ebp]
   add esi, ecx
   mov [esi], edx
   push left3854[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3854[ebp], eax
   push right3854[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3854[ebp], eax
_if_end_3865:
   push left3854[ebp]
   pop ecx
   push right3854[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350028375636
   push 1
   jmp _compare_end604350028375636
_compare_not_equal604350028375636:
   push 0
_compare_end604350028375636:
   pop eax
   cmp eax, 0
   je _loop_end_3857
   jmp _loop_start_3857
_loop_end_3857:

   ; init stack for qs
   push right3854[ebp]
   push arg_first3850[ebp]
   push arg_s_arr3850[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3850[ebp]
   push left3854[ebp]
   push arg_s_arr3850[ebp]
   ; call qs
   call qs

_if_end_3854:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3866[ebp]
   pop ecx
   push arg_last3866[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350028707923
   push 1
   jmp _compare_end604350028707923
_compare_not_equal604350028707923:
   push 0
_compare_end604350028707923:
   pop eax
   cmp eax, 0
   je _if_end_3870
_if_start_3870:
   push arg_first3866[ebp]
   pop eax
   mov left3870[ebp], eax
   push arg_last3866[ebp]
   pop eax
   mov right3870[ebp], eax
   push left3870[ebp]
   push right3870[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3866[ebp]
   push [esi[edx]]
   pop eax
   mov middle3870[ebp], eax
_loop_start_3873:
_loop_aftereffects_3873:
_loop_start_3876:
_loop_aftereffects_3876:
   push left3870[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3866[ebp]
   push [esi[edx]]
   pop ecx
   push middle3870[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350029148405
   push 1
   jmp _compare_end604350029148405
_compare_not_equal604350029148405:
   push 0
_compare_end604350029148405:
   pop eax
   cmp eax, 0
   je _loop_end_3876
   push left3870[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3870[ebp], eax
   jmp _loop_start_3876
_loop_end_3876:
_loop_start_3879:
_loop_aftereffects_3879:
   push right3870[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3866[ebp]
   push [esi[edx]]
   pop ecx
   push middle3870[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350029389602
   push 1
   jmp _compare_end604350029389602
_compare_not_equal604350029389602:
   push 0
_compare_end604350029389602:
   pop eax
   cmp eax, 0
   je _loop_end_3879
   push right3870[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3870[ebp], eax
   jmp _loop_start_3879
_loop_end_3879:
   push left3870[ebp]
   pop ecx
   push right3870[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350029622673
   push 1
   jmp _compare_end604350029622673
_compare_not_equal604350029622673:
   push 0
_compare_end604350029622673:
   pop eax
   cmp eax, 0
   je _if_end_3881
_if_start_3881:
   push left3870[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3866[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3881[ebp], eax
   push right3870[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3866[ebp]
   push [esi[edx]]
   pop edx
   push left3870[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3866[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3881[ebp]
   pop edx
   push right3870[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3866[ebp]
   add esi, ecx
   mov [esi], edx
   push left3870[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3870[ebp], eax
   push right3870[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3870[ebp], eax
_if_end_3881:
   push left3870[ebp]
   pop ecx
   push right3870[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350030438635
   push 1
   jmp _compare_end604350030438635
_compare_not_equal604350030438635:
   push 0
_compare_end604350030438635:
   pop eax
   cmp eax, 0
   je _loop_end_3873
   jmp _loop_start_3873
_loop_end_3873:

   ; init stack for qs
   push right3870[ebp]
   push arg_first3866[ebp]
   push arg_s_arr3866[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3866[ebp]
   push left3870[ebp]
   push arg_s_arr3866[ebp]
   ; call qs
   call qs

_if_end_3870:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3882[ebp]
   pop ecx
   push arg_last3882[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350030761085
   push 1
   jmp _compare_end604350030761085
_compare_not_equal604350030761085:
   push 0
_compare_end604350030761085:
   pop eax
   cmp eax, 0
   je _if_end_3886
_if_start_3886:
   push arg_first3882[ebp]
   pop eax
   mov left3886[ebp], eax
   push arg_last3882[ebp]
   pop eax
   mov right3886[ebp], eax
   push left3886[ebp]
   push right3886[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3882[ebp]
   push [esi[edx]]
   pop eax
   mov middle3886[ebp], eax
_loop_start_3889:
_loop_aftereffects_3889:
_loop_start_3892:
_loop_aftereffects_3892:
   push left3886[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3882[ebp]
   push [esi[edx]]
   pop ecx
   push middle3886[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350031238774
   push 1
   jmp _compare_end604350031238774
_compare_not_equal604350031238774:
   push 0
_compare_end604350031238774:
   pop eax
   cmp eax, 0
   je _loop_end_3892
   push left3886[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3886[ebp], eax
   jmp _loop_start_3892
_loop_end_3892:
_loop_start_3895:
_loop_aftereffects_3895:
   push right3886[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3882[ebp]
   push [esi[edx]]
   pop ecx
   push middle3886[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350031548394
   push 1
   jmp _compare_end604350031548394
_compare_not_equal604350031548394:
   push 0
_compare_end604350031548394:
   pop eax
   cmp eax, 0
   je _loop_end_3895
   push right3886[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3886[ebp], eax
   jmp _loop_start_3895
_loop_end_3895:
   push left3886[ebp]
   pop ecx
   push right3886[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350032008549
   push 1
   jmp _compare_end604350032008549
_compare_not_equal604350032008549:
   push 0
_compare_end604350032008549:
   pop eax
   cmp eax, 0
   je _if_end_3897
_if_start_3897:
   push left3886[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3882[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3897[ebp], eax
   push right3886[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3882[ebp]
   push [esi[edx]]
   pop edx
   push left3886[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3882[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3897[ebp]
   pop edx
   push right3886[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3882[ebp]
   add esi, ecx
   mov [esi], edx
   push left3886[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3886[ebp], eax
   push right3886[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3886[ebp], eax
_if_end_3897:
   push left3886[ebp]
   pop ecx
   push right3886[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350032875402
   push 1
   jmp _compare_end604350032875402
_compare_not_equal604350032875402:
   push 0
_compare_end604350032875402:
   pop eax
   cmp eax, 0
   je _loop_end_3889
   jmp _loop_start_3889
_loop_end_3889:

   ; init stack for qs
   push right3886[ebp]
   push arg_first3882[ebp]
   push arg_s_arr3882[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3882[ebp]
   push left3886[ebp]
   push arg_s_arr3882[ebp]
   ; call qs
   call qs

_if_end_3886:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3898[ebp]
   pop ecx
   push arg_last3898[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350033270553
   push 1
   jmp _compare_end604350033270553
_compare_not_equal604350033270553:
   push 0
_compare_end604350033270553:
   pop eax
   cmp eax, 0
   je _if_end_3902
_if_start_3902:
   push arg_first3898[ebp]
   pop eax
   mov left3902[ebp], eax
   push arg_last3898[ebp]
   pop eax
   mov right3902[ebp], eax
   push left3902[ebp]
   push right3902[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3898[ebp]
   push [esi[edx]]
   pop eax
   mov middle3902[ebp], eax
_loop_start_3905:
_loop_aftereffects_3905:
_loop_start_3908:
_loop_aftereffects_3908:
   push left3902[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3898[ebp]
   push [esi[edx]]
   pop ecx
   push middle3902[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350033720444
   push 1
   jmp _compare_end604350033720444
_compare_not_equal604350033720444:
   push 0
_compare_end604350033720444:
   pop eax
   cmp eax, 0
   je _loop_end_3908
   push left3902[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3902[ebp], eax
   jmp _loop_start_3908
_loop_end_3908:
_loop_start_3911:
_loop_aftereffects_3911:
   push right3902[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3898[ebp]
   push [esi[edx]]
   pop ecx
   push middle3902[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal604350033986017
   push 1
   jmp _compare_end604350033986017
_compare_not_equal604350033986017:
   push 0
_compare_end604350033986017:
   pop eax
   cmp eax, 0
   je _loop_end_3911
   push right3902[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3902[ebp], eax
   jmp _loop_start_3911
_loop_end_3911:
   push left3902[ebp]
   pop ecx
   push right3902[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350034235766
   push 1
   jmp _compare_end604350034235766
_compare_not_equal604350034235766:
   push 0
_compare_end604350034235766:
   pop eax
   cmp eax, 0
   je _if_end_3913
_if_start_3913:
   push left3902[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3898[ebp]
   push [esi[edx]]
   pop eax
   mov tmp3913[ebp], eax
   push right3902[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_s_arr3898[ebp]
   push [esi[edx]]
   pop edx
   push left3902[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3898[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp3913[ebp]
   pop edx
   push right3902[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_s_arr3898[ebp]
   add esi, ecx
   mov [esi], edx
   push left3902[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left3902[ebp], eax
   push right3902[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right3902[ebp], eax
_if_end_3913:
   push left3902[ebp]
   pop ecx
   push right3902[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal604350035029918
   push 1
   jmp _compare_end604350035029918
_compare_not_equal604350035029918:
   push 0
_compare_end604350035029918:
   pop eax
   cmp eax, 0
   je _loop_end_3905
   jmp _loop_start_3905
_loop_end_3905:

   ; init stack for qs
   push right3902[ebp]
   push arg_first3898[ebp]
   push arg_s_arr3898[ebp]
   ; call qs
   call qs


   ; init stack for qs
   push arg_last3898[ebp]
   push left3902[ebp]
   push arg_s_arr3898[ebp]
   ; call qs
   call qs

_if_end_3902:
   leave
   ret 12
qs ENDP
qs PROC
   enter 0, 16
   push arg_first3914[ebp]
   pop ecx
   push arg_last3914[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal604350035436616
   push 1
   jmp _compare_end604350035436616
_compare_not_equal604350035436616:
   push 0
_compare_end604350035436616:
   pop eax
   cmp eax, 0
   je _if_end_3918
_if_start_3918:
   push arg_first3914[ebp]
   pop eax
   mov left3918[ebp], eax