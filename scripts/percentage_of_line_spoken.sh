   #!/bin/bash
   f=clean_dialog.csv

   total=$(grep -c -v '^"title","writer","pony","dialog"' "$f")

   echo "pony_name,total_line_count,percent_all_lines" > Line_percentages.csv
   for p in "Twilight Sparkle" "Rarity" "Pinkie Pie" "Rainbow Dash" "Fluttershy"; do
     n=$(grep -c -E "^\"[^\"]*\",\"[^\"]*\",\"$p\"," "$f")
     pct=$(echo "scale=2; 100 * $n / $total" | bc)
     echo "$p,$n,$pct" >> Line_percentages.csv
   done

   cat Line_percentages.csv
