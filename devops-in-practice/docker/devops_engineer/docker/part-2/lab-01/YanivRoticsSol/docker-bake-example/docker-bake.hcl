group "default" {
    targets = ["app", "db"]
}

target "app" {
    context = "./app"
    dockerfile = "Dockerfile"
    tags = ["my-app:latest"]
    platforms = ["linux/amd64", "linux/arm64"]
}

target "db" {
    context = "./db"
    dockerfile = "Dockerfile"
    tags = ["my-db:latest"]
    platforms = ["linux/amd64", "linux/arm64"]
}