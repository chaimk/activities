# Snagged from here:
# http://stackoverflow.com/questions/3694352/rails-3-default-datetime-format-without-utc

Date::DATE_FORMATS[:default] = "%Y-%m-%d"
Time::DATE_FORMATS[:default] = "%Y-%m-%d %H:%M"