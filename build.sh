#git pull
docker stop heosdisplay
docker rm heosdisplay
docker rmi $(docker images 'heosdisplay:latest' -a -q)
docker build -t heosdisplay .
docker run --rm --name heosdisplay -P -d heosdisplay
echo "http://$(ipconfig getifaddr en0):3000"
echo "http://$(ipconfig getifaddr en1):3000"
echo "http://localhost:3000"