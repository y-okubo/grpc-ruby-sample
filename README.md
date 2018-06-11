# Prepare
## Development & Use
```
$ gem install grpc
$ gem install grpc-tools
```

## Development
```
$ grpc_tools_ruby_protoc -I . --ruby_out=./lib --grpc_out=./lib ./sample.proto
```

# How to use
## Client
`ruby client.rb`

## Server
`ruby server.rb`