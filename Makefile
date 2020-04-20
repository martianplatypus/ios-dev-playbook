.PHONY: \
	install \
	install_galaxy_roles \
	install_homebrew \
	install_ruby \
	install_fastlane \
	install_rome \
	install_mas \
	install_xcode

install: \
	install_galaxy_roles \
	install_homebrew \
	install_ruby \
	install_fastlane \
	install_rome \
	install_mas \
	install_xcode

install_galaxy_roles:
	ansible-galaxy install -r requirements.yml

install_homebrew:
	ansible-playbook playbook.yml -i inventory --tags "homebrew"

install_ruby:
	ansible-playbook playbook.yml -i inventory --tags "ruby" --extra-vars "ci_running=true"

install_fastlane:
	ansible-playbook playbook.yml -i inventory --tags "fastlane"

install_rome:
	ansible-playbook playbook.yml -i inventory --tags "rome"

install_mas:
	ansible-playbook playbook.yml -i inventory --tags "mas"

install_xcode:
	ansible-playbook playbook.yml -i inventory --tags "xcode"

clean:
	ansible-galaxy remove geerlingguy.homebrew
	ansible-galaxy remove elliotweiser.osx-command-line-tools
	ansible-galaxy remove martianplatypus.ruby_mac
	ansible-galaxy remove geerlingguy.mas
