set current_file_dir (dirname (status --current-filename))

cd $current_file_dir

if test (git status --short | wc -l) -gt 0
    git add -A && git commit -m (date +'%Y-%m-%d')
    git push origin master
end
