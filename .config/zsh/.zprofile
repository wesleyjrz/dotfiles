#  Wesley Vieira S. Jr.
#
#      ,= ,-_-. =.
#     ((_/)o o(\_))
#      `-'(. .)`-'
#          \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

# Autostart X at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi
