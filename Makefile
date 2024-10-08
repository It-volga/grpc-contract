PROTOC = protoc
PROTOC_GEN_GO = protoc-gen-go
PROTOC_GEN_GRPC_GATEWAY = protoc-gen-grpc-gateway

# Путь к proto файлам
PROTO_PATH = ./proto:./googleapis:./

# Команда по умолчанию - генерация кода
all: generate

# Генерация gRPC и gRPC Gateway кода
generate:
	$(PROTOC) -I $(PROTO_PATH) --go_out=. --go-grpc_out=. ./proto/account.proto
	$(PROTOC) -I $(PROTO_PATH) --go_out=. --go-grpc_out=. ./contract.proto
	$(PROTOC) -I $(PROTO_PATH) --grpc-gateway_out=logtostderr=true:. ./contract.proto
