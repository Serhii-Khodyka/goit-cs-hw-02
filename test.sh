#!/bin/bash

# масив URL сайтів для перевірки
sites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
  "https://nosencewesegseg.com"
)

# назва файлу для запису логування
log_file="website_status.log"

# очищення файлу логів перед записом нових результатів
> "$log_file"

# цикл перевірки доступності кожного сайту
for site in "${sites[@]}"; do
  # curl для перевірки статусу HTTP
  http_status=$(curl -o /dev/null -s -w "%{http_code}\n" -L "$site")
  
  # перевірка чи статус код дорівнює 200
  if [ "$http_status" -eq 200 ]; then
    echo "<$site> is UP" | tee -a "$log_file"
  else
    echo "<$site> is DOWN" | tee -a "$log_file"
  fi
done

# повідомлення про завершення роботи скрипту
echo "Результати записано у файл $log_file"