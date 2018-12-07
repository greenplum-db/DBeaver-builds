#get the story number passed as arg
storyId=$1
echo $storyId

#find the branch that contains story number and switch to it
git fetch
git pull
branchname=$(git branch -r | grep $storyId | sed 's:origin/::')
if [ -z $branchname ]
then
    echo Could not find branch for $storyId
else
    echo $branchname
    git co $branchname

    #start dbeaver
    ./DBeaver.app/Contents/MacOS/dbeaver

    #clean up the repo from starting DBeaver
    git add .
    git stash
    git stash drop
fi