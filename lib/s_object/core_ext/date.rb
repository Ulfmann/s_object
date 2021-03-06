class Date
  def utc
    convert_to_time(new_offset, :gm)
  end

  def to_local_time
    convert_to_time(new_offset(DateTime.now.offset - offset), :local)
  end

private

  def convert_to_time(dest, method)
    # Convert a fraction of a day to a number of microseconds
    usec = (dest.sec_fraction * 60 * 60 * 24 * (10**6)).to_i
    Time.send(method,
      dest.year, dest.month, dest.day, dest.hour, dest.min, dest.sec, usec)
  end
end
