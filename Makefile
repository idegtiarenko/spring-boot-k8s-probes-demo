SHELL = /bin/bash

assemble:
	./gradlew assemble

start-db:
	@if [ `docker ps --format '{{.Names}}' | grep -w 'probes-postgres' | wc -l` = "0" ]; then \
		docker run --name probes-postgres \
				-e POSTGRES_DB=probes \
				-e POSTGRES_USER=probes-user \
				-e POSTGRES_PASSWORD=probes-password \
				-p 5432:5432 \
				-d \
				--rm postgres:9.6.18; \
	fi

stop-db:
	@if [ `docker ps --format '{{.Names}}' | grep -w 'probes-postgres' | wc -l` = "1" ]; then \
		docker stop probes-postgres; \
	fi

start-app: assemble
	java -jar -Dspring.profiles.active=local build/libs/probes-1.0.0-SNAPSHOT.jar

