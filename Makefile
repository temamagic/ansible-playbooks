lint:
	ansible-lint playbook*.yml
encrypt:
	@for file in $$(find ./vault_files -type f); do \
		 if ! grep -q "$$ANSIBLE_VAULT;" $$file; then \
			 ansible-vault encrypt $$file --vault-password-file=.ansible_vault_pass && echo "$$file encrypted."; \
		 else \
			 echo "$$file is already encrypted."; \
		 fi; \
	done
	@for file in $$(find . -name "vault.yml"); do \
		 if ! grep -q "$$ANSIBLE_VAULT;" $$file; then \
			 ansible-vault encrypt $$file --vault-password-file=.ansible_vault_pass && echo "$$file encrypted."; \
		 else \
			 echo "$$file is already encrypted."; \
		 fi; \
	done

decrypt:
	@for file in $$(find ./vault_files -type f); do \
		 if grep -q "$$ANSIBLE_VAULT;" $$file; then \
			 ansible-vault decrypt $$file --vault-password-file=.ansible_vault_pass && echo "$$file decrypted."; \
		 else \
			 echo "$$file is not encrypted."; \
		 fi; \
	done
	@for file in $$(find . -name "vault.yml"); do \
		 if grep -q "$$ANSIBLE_VAULT;" $$file; then \
			 ansible-vault decrypt $$file --vault-password-file=.ansible_vault_pass && echo "$$file decrypted."; \
		 else \
			 echo "$$file is not encrypted."; \
		 fi; \
	done

setup:
	@sh setup.sh

play-user:
	ansible-playbook -i prod_inventory.yml \
	--vault-password-file=.ansible_vault_pass \
	--connection=local \
	playbook_user.yml

play-secure:
	ansible-playbook -i prod_inventory.yml \
	--vault-password-file=.ansible_vault_pass \
	--connection=local \
	playbook_secure.yml

play-wireguard:
	ansible-playbook -i prod_inventory.yml \
	--vault-password-file=.ansible_vault_pass \
	--connection=local \
	playbook_wireguard.yml


