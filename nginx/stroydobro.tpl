server {
    listen	%ip%:%proxy_port%;
    server_name stroydobro.ru www.stroydobro.ru xn--90afotcbifck.xn--p1ai www.xn--90afotcbifck.xn--p1ai;
    location / {
        rewrite ^(.*) https://stroydobro.ru$1 permanent;
    }
    include %home%/%user%/conf/web/*nginx.%domain_idn%.conf_letsencrypt;
}

server {
    listen      %ip%:%proxy_port%;
    server_name api.stroydobro.ru infobox.stroydobro.ru;
    error_log  /var/log/httpd/domains/%domain%.error.log error;

    location / {
        proxy_pass      http://%ip%:%web_port%;
        location ~* ^.+\.(%proxy_extentions%)$ {
            root           %docroot%;
            access_log     /var/log/httpd/domains/%domain%.log combined;
            access_log     /var/log/httpd/domains/%domain%.bytes bytes;
            expires        max;
            try_files      $uri @fallback;
        }
    }

    location /error/ {
        alias   %home%/%user%/web/%domain%/document_errors/;
    }
    
    location = /robots.txt {
        add_header Content-Type text/plain;
        return 200 "User-agent: *\nDisallow: /\n";
    }    

    location @fallback {
        proxy_pass      http://%ip%:%web_port%;
    }

    location ~ /\.ht    {return 404;}
    location ~ /\.svn/  {return 404;}
    location ~ /\.git/  {return 404;}
    location ~ /\.hg/   {return 404;}
    location ~ /\.bzr/  {return 404;}

    include %home%/%user%/conf/web/nginx.%domain%.conf*;
}
