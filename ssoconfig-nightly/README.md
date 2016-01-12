

# ssoconfig

This is a docker image that runs the OpenAM config tool to configure a freshly installed
instance.

The image expects that a volume /config/openam/ will be mounted and contains
property files that will be applied. The property files will be applied in
lexicalgraphic order (01_file1.properties, etc.).

If /config/openam does not exist, a default configuration will be used. It is
probably not what you want.

In a Kubernetes environment /config/openam should probably come from a
gitRepo volume.
