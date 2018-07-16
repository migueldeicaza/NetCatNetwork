This is a port of Apple's
[ImplementingNetcatWithNetworkFramework](https://developer.apple.com/documentation/network/implementing_netcat_with_network_framework)
sample code to C# and Xamarin.

This requires an unreleased version of Xamarin to try it out, for now,
your best bet is to build locally with the Network patches and edit
the Makefile to point to your installation directory.

You can build a self-contained executable like this:

```
$ make bundle
```

Which will produce the standalone `ncsharp` tool:


```
$ ./ncsharp
Network.framework-based 'netcat' app built with C#
  -4                         Use IPV4
  -6                         Use IPV6
  -b                         Use Bonjour
  -l, --listener             Create a listener to accept inbound connections
  -p, --port=VALUE           Use a local port for outbound connections
  -s, --localaddr=VALUE      Sets the local address for outbound connections
  -t, --tls                  Add TLS/DTLS as applicable
  -u, --udp                  Use UDP instead of TCP
  -v, --verbose              Verbose
  -k, --psk=VALUE            Specify the TLS Pre-Shared Key
  -h, --help                 Show this help
```


# Examples

## Connect to www.google.com http server:

```
$ ./ncsharp www.google.com 80
$
```

## Connect to www.google.com using https:

```
$ ./ncsharp -t www.google.com 443
$
```

## 

# Debugging

While debugging and iterating, it is easier to use the Makefile target
with `make run COMMAND=args` where `args` is the set of arguments you
would like to pass to the C# version of Netcat.
