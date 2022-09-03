formulas=(
	ripgrep
	prettier
	stylua
	shfmt
	black
)
main() {
  install_brew_formulars
}

install_brew_formulars() {
	echo "You want install Homebrew packages formulars ?"
	echo "---------------------------------------------"
	for formula in ${formulas[@]}; do
		echo - $formula
	done
	echo "---------------------------------------------"

	echo -n "Proceed? [y/n]: "

	read ans

	if [[ $ans = "y" ]]; then
		echo "---------------------------------------------"
		echo "Start Installing Packages Formulas..."
		echo "---------------------------------------------"
		process_brew_formulas
		echo "---------------------------------------------"
		echo "End Installing Packages Formulas..."
		echo "---------------------------------------------"
	fi

}
process_brew_formulas() {

	for formula in ${formulas[@]}; do
		if brew list | grep "$formula" >/dev/null; then
			echo "Package $formula is already installed"
		else
			echo "Installing packages < $formula >"
			brew install "$formula"
		fi
	done
}

main
