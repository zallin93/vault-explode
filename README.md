# vault-explode

A CLI utility that can be used to fetch secrets and set their values in
environment variables.  

Currently written and built to support IAM authentication in AWS. 

To see usage, call the script with the '-h' or '--help' flag. 


## Usage
TODO: Refactor this section (*OUT OF DATE*).
````
echo "usage: ./vault-explode [-authmethod method] [-host vaulthost] [-role vaultrole] [-path secretpath] | [-h]"
````

Format the values you need to replace inside curly braces. The values between curly braces should 
match the keys in Vault. 

### Parameters
TODO: Refactor this section (*OUT OF DATE*).
-authmethod 
Only value currently supported is _aws_.

-host
Should be the host of the Vault Enterprise server you want to connect to, ie _vault.vaultenterprisesandbox.aws.gartner.com_.

-role
Should be the Vault Role you want to authenticate as. 

-path
Should be the secret path your secrets are found on. If you need to replace from multiple 
secret paths, call vault-replace once for each. 

-h
Usage doc printout.



## Windows Port

Untested, the Windows port uses Powershell to execute the Vault secret fetching 
and secret replacement. 

### Usage

````
.\vault-explode -vaultHost <vault-hostname> -role <aws-role> -path <secret-path> -file <explode-config-file>
````

Supports providing an explode-config-file that has a mapping of secret-key to 
ENV var name.


### explode-config-file

Pipe-delimited file containing mapping of secret-key to ENV var name.

````
username|APP_USERNAME
pass|APP_PASSWORD
apikey|FUN_API_KEY
````
