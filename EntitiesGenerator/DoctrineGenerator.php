//In progress

//Customisation "Pimp my ride"
        //Doctrine
        $doctrinePath = $bundle->getPath().'/Resources/config/doctrine/'.str_replace('\\', '/', $entity).'.orm.yml';
        if (!file_exists($doctrinePath)) {
            $tab = '    ';
            $namespace = $bundle->getNamespace().'/Entity/'.str_replace('\\', '/', $entity).':'.PHP_EOL;
            $type = $tab.'type: entity'.PHP_EOL;
            $table = $tab.'table: to_determinate'.PHP_EOL;
            $repositoryClass = $tab.'repositoryClass: '.$bundle->getNamespace().'/Repository/'.str_replace('\\', '/', $entity).'Repository'.PHP_EOL;
            $fieldsDoctrine = $tab.'fields:'.PHP_EOL;
            $doctrineText = $namespace.$type.$table.$repositoryClass.$fieldsDoctrine;
            file_put_contents($doctrinePath,$doctrineText);
        }