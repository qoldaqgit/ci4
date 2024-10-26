#! /bin/bash

#Create a Controller [project] [controller name]
if [ -n $1 ];then
  if [ -n $2 ];then
    project=$(echo $1 | tr '[:upper:]' '[:lower:]')
    
    controller=$(echo $2 | tr '[:upper:]' '[:lower:]')
    controller="$(tr '[:lower:]' '[:upper:]' <<< ${controller:0:1})${controller:1}"
    
    view=$(echo $2 | tr '[:upper:]' '[:lower:]')
    
    
    touch /var/www/$project/app/Controllers/$controller.php
    echo "<?php
    
    namespace App\Controllers;
    
    class $controller extends BaseController
    {
        public function getindex(): string
        {
            \$data=[
                'title' => '$controller',
            ];
            return view('$view',\$data);
        }
    }"| tee -a /var/www/$project/app/Controllers/$controller.php > /dev/null
    
    #Create a test index
    
    touch /var/www/$project/app/Views/$view.php
    echo '<h1>This is the Route to '$controller'<h1> '| tee -a /var/www/$project/app/Views/$view.php > /dev/null
    
    echo Project: $project
    echo Controller: $controller
    echo View: $view
    echo Done
  else
    echo Please provide Project name, ex.  create_controller.sh [project] [controller name]
  fi
else
  echo Please provide Project name, ex.  create_controller.sh [project] [controller name]
fi
