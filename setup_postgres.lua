--postgres_docker.lua
--
-- User-configurable variables

local db_name = "mydb"
local db_user = "postgres"
local db_password = "root"
local host_port = "5432"
local container_name = "my_postgres"


-- Build the Docker run command
local docker_cmd = string.format([[
docker run -d \
--name %s \
-e POSTGRES_DB=%s \
-e POSTGRES_USER=%s \
-e POSTGRES_PASSWORD=%s \
-p %s:5432 \
postgres:latest
]], container_name, db_name, db_user, db_password, host_port)

-- Execute the command
print("Running Docker command:")
print(docker_cmd)
local result = os.execute(docker_cmd)

if result == 0 then
    print("PostgreSQL container started successfully!")
else
    print("Failed to start PostgreSQL container.")
end
