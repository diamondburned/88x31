{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
	buildInputs = with pkgs; [
		nodejs
		ffmpeg
	];

	PUPPETEER_PRODUCT = "chrome";
	PUPPETEER_EXECUTABLE_PATH = "${pkgs.chromium}/bin/chromium";
	PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "true";

	shellHook = ''
		export PATH="$PATH:"${builtins.toString ./.}/node_modules/.bin
	'';
}
