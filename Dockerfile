FROM golang:1.15-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o math

FROM scratch as production

WORKDIR /app

COPY --from=builder /app/math .

CMD [ "./math" ]