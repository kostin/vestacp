server {
    listen      %ip%:%proxy_port%;
    server_name %domain_idn% %alias_idn%;
    return 301 https://%domain_idn%$request_uri;
    include %home%/%user%/conf/web/nginx.%domain%.conf*;
}
