# Principal Bruteforce

Generate a principal id for the internet computer with a human readable prefix! 

## Usage

```sh
./generate_ids.sh <number of threads> prefix_string [string2 ...]
```

This will output a private key and a seed phrase file into a folder. You can then import the pem with dfx, and import the seed into plugwallet (root account)

You can list an unlimited number of strings, but performance decreases with large amounts.

## Dependencies

bash, [keysmith](https://github.com/dfinity/keysmith)

## Footnote

The longer the prefix, the chance of it being generated decreases exponentially

Tested running 64 threads, 8-12 strings. My specs: i9-11900H, nvidia rtx 3050ti, 32GB ram (Usage: 95% cpu, 35% gpu)

Theoretically, this *could* be used to bruteforce an entire principal id. I do not recommend it, as the universe will probably collapse by the time you succeed.
