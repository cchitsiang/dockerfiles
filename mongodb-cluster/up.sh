#!/bin/sh
docker-compose stop
docker-compose up -d
sleep 10
docker exec -it localmongo1 mongo

rs.initiate(
  {
    _id : 'rs0',
    members: [
      { _id : 0, host : "mongo1:27017" },
      { _id : 1, host : "mongo2:27017" },
      { _id : 2, host : "mongo3:27017", arbiterOnly: true }, { force: true }
    ]
  },
)

exit

# docker exec localmongo1 mongo --eval "
# rs.initiate(
#   {
#     _id : 'rs0',
#     members: [
#       { _id : 0, host : \"mongo1:27017\" },
#       { _id : 1, host : \"mongo2:27017\" },
#       { _id : 2, host : \"mongo3:27017\", arbiterOnly: true }
#     ]
#   }
# )
# "


docker exec -it localmongo2 mongo

rs.reconfig(
  {
    _id : 'rs0',
    members: [
      { _id : 0, host : "mongo1:27017" },
      { _id : 1, host : "mongo2:27017" },
      { _id : 2, host : "mongo3:27017", arbiterOnly: true }
    ]
  }, {force: true}
)

exit

#rs.stepDown(120)

docker exec -it localmongo2 mongo

rs.stepDown(120)

