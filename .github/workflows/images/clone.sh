cd /
mkdir depends
cd depends

git init

# add a remote
git remote add origin https://github.com/python-pillow/pillow-depends
#  git clone https://github.com/python-pillow/pillow-depends/archive/503ff2ff53e2f0446aa06a4a6c6cb17361b108e2.zip --shallow --depth 1 /depends

# fetch a commit (or branch or tag) of interest
# Note: the full history up to this commit will be retrieved unless
#       you limit it with '--depth=...' or '--shallow-since=...'
git fetch origin 503ff2ff53e2f0446aa06a4a6c6cb17361b108e2 --depth=1

# reset this repository's master branch to the commit of interest
git reset --hard FETCH_HEAD
