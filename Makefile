setup:
#	docker-compose run --rm --no-deps sh -c "\
#		mix deps.get \
#		mix deps.clean \
#		&& mix deps.compile"

start:
	docker-compose up

tests:
	docker-compose up test
