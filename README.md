# `ddifzero`: a command to create zero-filled file (similar to `dd if=/dev/zero`)

[![License X11](https://img.shields.io/badge/license-X11-blue.svg)](https://raw.githubusercontent.com/nishidayuya/ddifzero/master/LICENSE.txt)
[![Build Status](https://gitlab.com/nishidayuya/ci-ddifzero/badges/master/pipeline.svg)](https://gitlab.com/nishidayuya/ci-ddifzero/pipelines)

## Installation

`ddifzero` is a single executable binary (written by mruby-cli). So we can install following:

1. Download from [releases page](https://github.com/nishidayuya/ddifzero/releases)
1. Extract and deploy to PATH environment directory

## Usage

`ddifzero` is similar to `dd if=/dev/zero`. So, we can run following:

```sh
$ ddifzero of=a.bin bs=1M count=1024
```

Supported options are:

* bs
* count
* obs
* of

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nishidayuya/ddifzero .

## Development

Additional requirements for development

* [Docker](https://docs.docker.com/install/)
* [Docker Compose](https://docs.docker.com/compose/)

Clone this project.

Compile `ddifzero`.

```sh
$ docker-compose run compile
```

Write some changes with tests.

```sh
$ docker-compile run mtest
$ docker-compile run bintest
```

Submit pull-request.

Thank you!
