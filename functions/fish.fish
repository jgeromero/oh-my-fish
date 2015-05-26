function fish
  if test (count $argv) -gt 0
    if [ $argv[1] = 'install' ]
      # Install plugins
      for plugin in $fish_plugins
        if [ -e $fish_path/plugins/$plugin -o -e $fish_custom/plugins/$plugin ]
          #echo "$plugin is already installed. Skipping."
        else
          echo "Installing $plugin."
          fish.install --plugin $plugin
        end
      end

      # Install theme
      if [ -e $fish_path/themes/$fish_theme -o -e $fish_custom/themes/$fish_theme ]
        #echo "$fish_theme is already installed. Skipping."
      else
        echo "Installing $fish_theme."
        fish.install --theme $fish_theme
      end
    else
      command fish $argv
    end
  else
    command fish
  end
end
