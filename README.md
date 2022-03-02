# Principal Bruteforce

Generate a principal id with a human readable prefix! 

## Usage

```sh
./generate_ids.sh <number of threads> prefix_string [string2 ...]
```

You can list an unlimited number of strings, but performance decreases with large amounts.

The longer the string, the chance of it being generated decreases exponentially

Tested running 64 threads, 8-12 strings. My specs: i9-11900H, nvidia rtx 3050ti, 32GB ram (Usage: 95% cpu, 35% gpu)

## Dependencies

bash, [keysmith](https://github.com/dfinity/keysmith)

## Notes

Theoretically, this *could* be used to bruteforce an entire principal id. I do not recommend it, as the universe will probably collapse by the time you succeed.
