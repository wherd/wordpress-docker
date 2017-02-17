# wordpress-docker

A development stack to get started with WordPress development.

## Dependencies

Depends on [docker](https://www.docker.com/) and [wherd/lamp-docker](https://github.com/wherd/lamp-docker) image.

## Install

1. Install [docker](https://www.docker.com/);
2. Clone [this project](https://github.com/wherd/wordpress-docker);
3. Create an instance of [wherd/lamp-docker](https://github.com/wherd/lamp-docker) image;
4. Setup your settings changing the `payload/config.sh` file;
5. Run the start script;
6. Check the env.ini file for passwords;
7. Login to wordpress admin [https://localhost/wp/wp-admin](https://localhost/wp/wp-admin);
8. Start codin.

### Example

```
git clone git@github.com:wherd/wordpress-docker.git wordpress

docker run -d -p 80:80 --name wordpress -v /wordpress:/var/www/localhost wherd/lamp-docker

docker exec wordpress chmod +x /var/www/localhost/payload/start.sh
docker exec wordpress /var/www/localhost/payload/start.sh
```

## Tests

```
docker exec wordpress sh -c "cd /var/www/localhost && composer test"
```
