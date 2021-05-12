MIX_ENV=prod

##########################################################
#    Docker Commands - Setup local Environment           #
##########################################################

start:
	docker-compose up

##########################################################
#    Application Commands - Release, Compile, etc        #
##########################################################

clean:
	mix deps.clean --all

compile:
	mix deps.get
	mix deps.compile
	mix compile

release: clean compile
#	Don't forget to export some variables:
#	mix phx.gen.secret
#	REALLY_LONG_SECRET
#	export SECRET_KEY_BASE=REALLY_LONG_SECRET
#	export DATABASE_URL=ecto://USER:PASS@HOST/database
	mix deps.get --only prod
	MIX_ENV=${MIX_ENV} mix compile

#	Install / update  JavaScript dependencies
	npm install --prefix ./assets

# 	Compile assets
	npm run deploy --prefix ./assets

#	Release
	MIX_ENV=${MIX_ENV} mix do phx.digest, distillery.release --env=${MIX_ENV}
	@echo "Release for MIX_ENV=${MIX_ENV} is done !"

upgrade:
# 	Compile assets
	npm run deploy --prefix assets

#	Release 
	MIX_ENV=${MIX_ENV} mix do phx.digest, distillery.release --env=${MIX_ENV} --upgrade
	@echo "Upgrade for MIX_ENV=${MIX_ENV} is ready to be used !"
