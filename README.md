# vault-explode

A CLI utility that can be used to fetch secrets and set their values in
environment variables.  

Currently written and built to support IAM authentication in AWS. 


## Windows Port

The Windows port uses Powershell to execute Vault secret fetching and 
environment variable setting.

You must be running Powershell as an Administrator in order to set system
environment variables.


### Usage

````
.\vault-explode.ps1 -file C:\path\to\vault-explode.config
````

````
.\vault-explode -vaultHost <vault-hostname> -role <aws-role> -path <secret-path> -file <explode-config-file>
````

Supports providing an explode-config-file that has a mapping of secret-key to 
ENV var name.

Missing flag values will default to reading from OS environment variables.


### Parameters and Flags

#### -authmethod 
- Only value currently supported is _aws_. 
- You should not need to provide this.

#### -vaultHost
- Should be the host of the Vault Enterprise server you want to connect to, ie _vault.vaultenterprisesandbox.aws.gartner.com_.
- Will read from VAULT_HOSTNAME OS environment variable, if not provided.

#### -role
- Should be the Vault Role you want to authenticate as. 
- Will read from VAULT_APP_NAME OS environment variable, if not provided.

#### -path
- Should be the secret path your secrets are found on. If you need to replace from multiple 
secret paths, call vault-replace once for each. 
- Will read from VAULT_SECRET_PATH OS environment variable, if not provided.

#### -file 
- Should be the path to the `vault-explode.config` file. Absolute or relative to
current working directory.
- Does not have an OS environment variable fallback.


### explode-config-file

Pipe-delimited file containing mapping of secret-key to ENV var name.

vault-explode.config
````
username|APP_USERNAME
pass|APP_PASSWORD
apikey|FUN_API_KEY
````



## Usage
TODO: Refactor this section (*OUT OF DATE*).
````
echo "usage: ./vault-explode [-authmethod method] [-host vaulthost] [-role vaultrole] [-path secretpath] | [-h]"
````

Format the values you need to replace inside curly braces. The values between curly braces should 
match the keys in Vault. 

