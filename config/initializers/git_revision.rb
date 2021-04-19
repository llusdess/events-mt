# frozen_string_literal: true
module Git
  REVISION =
    %x(SHA1=$(git rev-parse --short HEAD 2> /dev/null); if [ $SHA1 ]; then echo $SHA1; else echo 'unknown'; fi).chomp
  VERSION =
    %x(VERSION=$(git describe --tags 2> /dev/null); if [ $VERSION ]; then echo $VERSION; else echo 'unknown'; fi).chomp
end
