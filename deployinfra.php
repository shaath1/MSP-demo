<?php
$output = shell_exec('make deploy_infra');
echo "<pre>$output</pre>";
?>