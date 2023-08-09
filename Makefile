.PHONY: up env-%

up: env-USER_NAME env-GIT_USER_NAME env-GIT_EMAIL
	ansible-playbook playbook.yml --extra-vars="user_name=${USER_NAME} user_git_name=${GIT_USER_NAME} user_email=${USER_EMAIL} hostname=${HOST_NAME}" --ask-become-pass

env-%:
    @if["${${*}}" = "" ]; then \
        echo "Environment variable $* not set"; \
        exit 1; \
    fi