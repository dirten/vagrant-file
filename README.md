# Welcome on my Vagrantfile largely inspired by Scotchbox
Here you can find a ready to go Web developper box with :

- Nginx configured and tested
- PHP7.1 configured and tested
- Composer / git / curl
- MySQL configured and tested (ready to go with any software for external access)
- PostGreSQL configured and tested (ready to go with PGadmin for external access)
- Java JDK 1.8 (Java 8)
- ElasticSearch configured and tested (Start on boot)
- Logstash configured and tested (first index with the nginx access log)
- Kibana configured and accessible at elk.local (add this one to your host)
- Redis (not tested yet)
- Memecached (not tested yet)
- Golang and Mailhog (not fully tested)
- NodeJS at its latest version with npm

You also have a website.local vhost available for a ready to go box

You should have inserted into your host (/etc/hosts) those 2 lines

```
192.168.33.10 elk.local
192.168.33.10 website.local
```

If you find a bug, you can either open an issue, or make a pull request.
This box can be a really good one for any freelance web developper. But it can be much better !
You're very welcome for any improvement.

