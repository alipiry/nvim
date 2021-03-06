# My NEOVIM configuration

## Screenshot

<img width="1440" alt="image" src="https://user-images.githubusercontent.com/25138854/67805832-fd23ae80-faa6-11e9-889e-5f808bd4f190.png">

## Usage

Clone the repo and do the following commands:
```bash
	cd
	git clone git@github.com:alipiry/nvim.git nvim
	ln -sf ~/nvim/ ~/.config/
```

Make sure you have [`vim-plug`](https://github.com/junegunn/vim-plug) installed on your machine:
```
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Now the only thing you should do is open your `NEOVIM` and run `:PlugInstall`:
```bash
	nvim
	:PlugInstall
```

To customize your nvim, edit the cloned `init.vim`:
```bash
	nvim ~/nvim/init.vim
```

## Author

[Ali Piry](https://github.com/alipiry)

## LICENSE

This NEOVIM config is APACHE licensed. See [LICENSE](LICENSE).
