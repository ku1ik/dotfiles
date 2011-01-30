function local_setup_tags()
  -- master factor and slave columns number for "im" tag
  awful.tag.setmwfact(0.2, tags[1][4])
  awful.tag.setnmaster(1, tags[1][4])
  awful.tag.setncol(3, tags[1][4])
end
