module TodosHelper
require "cgi"

  def convert(str)
    converted = CGI.escape(str.encode("UTF-8"))
  end
  def keta(intcount)
    if intcount >= 10
      result = intcount.to_s
    else
      result = "0" + intcount.to_s
    end
    result
  end

  def convert_day(day)
      year = day.year.to_s
      month = keta(day.month)
      date = keta(day.day)
      result = year + month + date
  end

  def convert_time(time)
    if time.present?
      hour = keta(time.hour)
      min  =keta(time.min)
      result = hour + min
    else
      result = nil
    end
      result
  end
end
