# route-53-updater

This is a docker image to update your route 53 entries regularly (every minute).

## Usage

### Environment

Please be sure to specify the following environment variables:

  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY

### Volumes

  - `/root/config` is the place for your `records.txt` file.
  - `/root/data` is the place for the logs.

### Configuration

There is an example of a configuration file in this repository.
