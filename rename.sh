
declare -A meses
meses[ene]=01
meses[feb]=02
meses[mar]=03
meses[abr]=04
meses[may]=05
meses[jun]=06
meses[jul]=07

for f in $(ls --hide="${0#./}"); do
    FILE=${f#clase_}
    FILE=${FILE%.pdf}
    OIFS="$IFS"
    IFS='_'

    arr=()
    for x in $FILE
    do
        arr=("${arr[@]}" "$x")
    done

    newf="${meses[${arr[1]}]}-${arr[0]}.pdf"
    echo "$f -> $newf"
    mv "$f" "$newf"

    IFS="$OIFS"
done
