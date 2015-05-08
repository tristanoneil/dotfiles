function print_weather
  if test -f ~/.weather
    set time (head -n 1 ~/.weather)
    set current (date +%s)
    set diff (math $current - $time)

    if [ $diff -ge 3600 ]
      get_weather
    else
      echo (sed '2q;d' ~/.weather)
    end
  else
    get_weather
  end
end

function get_weather
  set -l weather (weatherme -k 7bd7902a6625042ba61502788bf3b52f -l 44.6646,-73.0090)
  printf '%s\n%s' (date +%s) $weather > ~/.weather
  echo $weather
end
