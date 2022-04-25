@echo off

call activate people_env
call conda env list
call conda env update -f environment.yml
