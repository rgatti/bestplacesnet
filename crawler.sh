set -e

declare -a PAGES
PAGES=('overview' 'costofliving' 'jobs' 'crime' 'climate' 'weather' \
       'education' 'economy' 'health' 'religion' 'people' 'voting'  \
       'housing' 'transportation')

city1="${1:-}"
city2="${2:-}"

for page in ${PAGES[*]}
do
    url="//www.bestplaces.net/compare-cities/${city1}/${city2}/${page}"

    curl -s "https:${url}" | hxnormalize -x > data

    # print table header
    cat data | hxselect -c 'h5.mt-3'
    echo
    echo

    # print table
    cat data \
    | hxselect 'table#mainContent_dgCities' \
    | w3m -dump -cols 100 -T 'text/html'

    echo
    echo
done
