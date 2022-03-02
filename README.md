# Principal Bruteforce

Generate a principal id with a human readable prefix! 

### Usage

```sh
./generate_ids.sh <number of threads> prefix_string [string2 ...]
```

You can list an unlimited number of strings, but with a performance hit with large inputs

Tested running 64 threads on an i9-11900H, handled it easily
