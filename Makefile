install-openblas-macos:
	@brew install openblas
	@export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"

install-lapack-macos:
	@brew install lapack
	@export PKG_CONFIG_PATH="/usr/local/opt/lapack/lib/pkgconfig"

install-all-macos: install-openblas-macos install-lapack-macos

install-openblas-linux:
	@apt install -y libopenblas-dev

install-lapack-linux:
	@apt install -y liblapacke-dev

install-all-linux: install-openblas-linux install-lapack-linux

test-linux-local:
	@docker build -f Dockerfile-LinuxTests -t linuxtest .
	@docker run linuxtest

test:
	@swift test

format:
	@swift-format \
	--ignore-unparsable-files \
	--in-place \
	--recursive \
	./Sources ./Tests Package.swift
