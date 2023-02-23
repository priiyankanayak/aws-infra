#!/bin/bash
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl enable web
sudo systemctl start web