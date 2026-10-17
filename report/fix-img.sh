#!/usr/bin/env bash
# Преобразует блоки
#   <p align="center">
#     <img src="X.png" alt="ALT" width="600"/><br>
#     <em>CAPTION</em>
#   </p>
# в
#   ![CAPTION](X.png){ width=600px fig-align="center" }

perl -0777 -pe '
s{
  <p\ align="center">\s*
  <img\ src="([^"]+)"\s*alt="[^"]*"\s*width="?(\d+)"?\s*/?>\s*<br>\s*
  <em>([^<]+)</em>\s*
  </p>
}{
  "![$3]($1){ width=${2}px fig-align=\"center\" }"
}gxse
' report.md.bak > report.md

echo ">>> Готово. Проверьте diff:"
diff report.md.bak report.md | head -40
