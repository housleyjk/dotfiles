# uwsgi completion
_uwsgi_help() {
    reply=(`uwsgi --help|tail -n +2|awk '{print $1}'|awk -F '|' '{print $1; if ($2) {print $2}}'`)
}
 
compctl -K _uwsgi_help -f uwsgi
