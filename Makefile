serve-all:
	pnpm --parallel serve
serve-docs:
	pnpm --filter docs dev
serve-testing:
	pnpm --filter testing dev

audit:
	pnpm audit
audit-fix:
	pnpm audit --fix

lint:
	pnpm --parallel lint
lint-lib:
	pnpm --filter maz-ui lint

build-all:
	pnpm --parallel build
build-docs:
	pnpm --filter docs build
build-lib:
	pnpm --filter maz-ui build
build-cli:
	pnpm --filter cli build

clean:
	rm -rf node_modules
clean-lib:
	rm -rf packages/lib/node_modules
clean-docs:
	rm -rf packages/docs/node_modules
clean-app:
	rm -rf packages/app/node_modules
clean-cli:
	rm -rf packages/cli/node_modules
clean-all:
	make clean clean-lib clean-docs clean-app clean-cli

install:
	pnpm install --no-frozen-lockfile
install-docs:
	pnpm --filter docs install --no-frozen-lockfile
install-cli:
	pnpm --filter cli install --no-frozen-lockfile
install-lib:
	pnpm --filter maz-ui install --no-frozen-lockfile
install-testing:
	pnpm --filter testing install --no-frozen-lockfile

reinstall-all:
	make clean-all install

lint-staged: ## lint-staged
	npm run pre-commit
lint-staged-lib: ## lint-staged lib
	pnpm --filter maz-ui lint-staged
lint-staged-testing: ## lint-staged testing
	make --directory=packages/testing lint-staged
lint-staged-cli: ## lint-staged cli
	make --directory=packages/cli lint-staged

check-dependencies-update:
	pnpm update --interactive
check-dependencies-update-latest:
	pnpm update --interactive --latest
check-docs-dependencies-update-latest:
	pnpm update --filter docs --interactive --latest
check-lib-dependencies-update-latest:
	pnpm update --filter maz-ui --interactive --latest
check-app-dependencies-update-latest:
	pnpm update --filter app --interactive --latest
check-cli-dependencies-update-latest:
	pnpm update --filter cli --interactive --latest

test-unit:
	pnpm --filter maz-ui test:unit
test-unit-silent:
	pnpm --filter maz-ui test:unit --silent
test-unit-watch:
	pnpm --filter maz-ui test:unit:watch
test-unit-coverage:
	pnpm --filter maz-ui test:unit:coverage
test-unit-coverage-watch:
	pnpm --filter maz-ui test:unit:coverage:watch
test-unit-coverage-main:
	pnpm --filter maz-ui test:unit:coverage:master

release:
	pnpm lerna:version $(type)

# CLI

create-component-files:
	pnpm --filter cli maz-cli create-files -f $(name)
generate-components-docs:
	pnpm --filter cli maz-cli generate-components-docs
generate-components-docs-watch:
	pnpm --filter cli maz-cli generate-components-docs --watch

