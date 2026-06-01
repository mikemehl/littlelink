serve:
    miniserve . --index=index.html

clean-dist:
    rm -rf dist

build-dist:
    mkdir -p dist
    cp -r css dist/css
    cp -r fonts dist/fonts
    cp -r images dist/images
    cp -r index.html dist/index.html

test-dist: build-dist
    miniserve dist --index=index.html

deploy: clean-dist build-dist
    rsync --delete -rv ./dist/ pgs.sh:/about/
