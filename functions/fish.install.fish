function fish.install --argument-names option name
  set -l repo_name
  set -l type

  switch $option
    case '--theme'
      set type 'themes'
      set repo_name "theme-$name"
    case '--plugin'
      set type 'plugins'
      set repo_name "plugin-$name"
    case '*'
      echo 'Unknown repository type sent to fish.install'
      exit 1
  end

  git clone "https://github.com/oh-my-fish/$repo_name" $fish_path/$type/$name
end
