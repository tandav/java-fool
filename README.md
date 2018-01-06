# Fool Around with Java Stack
- source stored on host machine
- then it runs with docker (openjdk, maven)
    - compile, test, run, whatever
- dev: use docker bind mounts
- prod: use docker volumes


## Run instructions
run a container from image:
```shell
docker run \
-it \
--name spring_learn \
--mount type=bind,source="$PWD",destination=/spring-learn \
-w /spring-learn \
maven:3.5.2-jdk-8-alpine \
bash
```
this brings you to container's shell. If you want to run it in a background(detached), use `run -d`

---

then while it running execute commands (e.g. `mvn compile`):
```shell
docker exec -it spring_learn mvn compile
```

first time it will download some maven dependencies

of cource you can go to container shell again:
```shell
docker exec -it spring_learn bash
```


---

if you stop the container you should start it again if you want to execute commands:

```shell
docker start spring_learn
```

### Old stuff
read "How to use this image" [here](https://hub.docker.com/r/library/maven/)

You can either create a `Dockerfile` for your needs or (for small commands) run a single command: 
```
docker run -it --rm --name my-maven-project -v "$PWD":/usr/src/mymaven -w /usr/src/mymaven maven:3.2-jdk-7 mvn clean install
```

(old deprecated docker shit)

My new 2018 version:

```shell
docker run \
-it \
--rm \ 
--name spring-learn \
--mount type=bind,source="$PWD",destination=/usr/src/spring-learn \
-w /usr/src/spring-learn \ 
maven:3.5.2-jdk-8-alpine \
mvn clean install
```

notes: `--rm` means remove container after exit and `-w` means working directory docker run
