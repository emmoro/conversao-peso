FROM mcr.microsoft.com/dotnet/core/runtime:3.0 as build
WORKDIR /app
COPY conversao-peso/ConversaoPeso.Web/wwwroot/lib
ENTRYPOINT [ "dotnet", "app/conversao-peso.dll" ]

FROM alpine:latest as final
WORKDIR /app
COPY --from=build /app/main .
CMD ["./main"]