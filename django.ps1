function dm {
python manage.py $args
}

function dmr {
dm runserver $args
}

function dms {
dm shell $args
}
