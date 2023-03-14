# FTP-deploy
Deploy (directory of) GitHub repository to a server using FTP

## Usage example

Create a new Action for your GitHub repository by adding the file .github/workflows/main.yml to the root of your repository. This file could look like this:

```yaml
name: Upload to FTP server
on:
  push:
    branches: [ main ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Upload from GitHub using FTP
        uses: mathijsdeen/FTP-deploy@main
        with:
          host: ${{ secrets.FTP_SERVER }}
          user: ${{ secrets.FTP_USERNAME }}
          password: ${{ secrets.FTP_PASSWORD }}
          localDir: "./directory/in/your/repo"
          remoteDir: "/var/www/target_directory/specified/here"
          forceSSL: "false"
          options: ""
```

Be sure to add repository secrets `FTP_SERVER`, `FTP_USERNAME` and `FTP_PASSWORD` through the `Settings` button in your repository (`Settings` -> `Secrets and variables` -> `Actions` -> `New repository secret`). The case above initiates the FTP upload when changes get pushed to the `main` branch. Multiple branches can be specified by separating them with a comma (e.g., `[ main, dev ]`). To trigger the upload on every push, replace the three lines

```yaml
on:
  push:
    branches: [ main ]
```

by `on: push`.

## Options

This action has the following options:

Parameter | Description | Required | Default
--- | --- | --- | ---
host | FTP server name or IP address | Yes | N/A
user | Username for FTP server | Yes | N/A
password | Password for FTP server | Yes | N/A
forceSSL | Should SSL encryption be forced? | No | false
options | Command options for the `mirror` command| No | ''
localDir | The directory of your repository to upload | No | .
remoteDir | The destination directory on the FTP server | No | .

The shell script uses `lftp`, more info on [the lftp website](https://lftp.yar.ru/lftp-man.html).
