

ssoadm must be able to read the directory where OpenAM is installed.

On Kubernetes, we run it in the same pod and mount the openam directory that the openam container mounts


TODO:

The ssoadm script has hard coded dependencies on the the DNS FQDN of OpenAM.
Fix.
