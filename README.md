# cloudxns-ddns
A shell script for CloudXNS DDNS

## Requirements: *nix shell with curl

## Usage:
> ### 1. Edit blank sections as you need.
> + __[API_KEY](https://www.cloudxns.net/AccountManage/apimanage.html) is required:__

> > e.g. `API_KEY="af0b62d0e4b5898587dde0ea6fddd97e"`

> + __[SECRET_KEY](https://www.cloudxns.net/AccountManage/apimanage.html) is required:__

> > e.g. `SECRET_KEY="28c9ca6aa33241e6"`

> + __DOMAIN is required:__

> > e.g. `DOMAIN="example.com"` or `DOMAIN="www.example.com"`

> + __IP__ is optional: Leave it blank let server autodetect yourt public IP

> > e.g. 
> > + `IP=""` : Autodetect public IP. __[Recommend]__.
> > + `IP="1.2.3.4"` : Single IP
> > + `IP="1.2.3.4|2.2.3.4"` : Several IPs separated by "|"

> ### 2. Run it.
> + If there's everything OK, it prints `<date> -- success` and returns with 0.
> > e.g. `Tue, 30 Aug 2016 19:41:56 +0800 -- Success`

> + Otherwise it prints `<date> -- failed:<message>` and returns with 255.
> > e.g. `Tue, 30 Aug 2016 19:41:36 +0800 -- Failed:{"code":639,"message":"The host record does not exist"}`
    
## Example:
> + Assume you are a normal user names *someone* and you put the __edited cloudxns-ddns.sh__ in `/home/someone`. 
>
> + You run `$crontab -e` and add a line like this:
>
> > > `* * * * * /home/someone/cloudxns-ddns.sh >> /home/someone/cloudxns-ddns.log`
>
> + It means `cloudxns-ddns.sh` will run at every minute, and log result to `/home/someone/cloudxns-ddns.log`.


## Thanks to:
> + [weicno/cloudxns-ddns](https://github.com/weicno/cloudxns-ddns)
> + [kuretru/CloudXNS-DDNS](https://github.com/kuretru/CloudXNS-DDNS)

## Refers:
> + [CloudXNS Support](https://www.cloudxns.net/Support/lists/cid/17)
> + CloudXNS API Version:  2.0.0
