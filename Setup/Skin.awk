BEGIN { 
  printf("\n", $0)
}

/^Type/ { gsub("^.*$", "", $0) }
/^Name/ { gsub("^.*$", "", $0) }
/^Author/ { gsub("^.*$", "", $0) }
/^Mail/ { gsub("^.*$", "", $0) }
/^Path/ { gsub("^.*$", "", $0) }
/^Size/ { gsub("^.*$", "", $0) }
/^#/ { gsub("^#.*$", "", $0) }
/^;/ { gsub("^;.*$", "", $0) }

/=/ {
  sub("^", "000", $0)
  sub(".... *=", "1&", $0)
  sub("^[^1]*1", "1", $0)
  sub("=", "=", $0)
  sub(" *= *", " ICON \"{BuildSkinsPath}\\Gio\\", $0)
  gsub("\\\\", "\\\\", $0)
  sub("$", "\"", $0)
printf("%s\n", $0)
}