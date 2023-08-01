.PHONY: up guard-%

up: guard-USER_NAME guard-GIT_USER_NAME guard-GIT_EMAIL
	ansible-playbook playbook.yml --extra-vars="user_name=${USER_NAME} user_git_name=${GIT_USER_NAME} user_email=${USER_EMAIL} hostname=${HOST_NAME}" --ask-become-pass

guard-%:
    @ if [ "${${*}}" = "" ]; then \
        echo "Environment variable $* not set"; \
        exit 1; \
    fi