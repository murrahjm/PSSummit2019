#!/usr/bin/powershell

switch ($args[1]) {
    'dev' {'devpassword'}
    'prod' {'prodpassword'}
}
