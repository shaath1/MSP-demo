<?php
shell_exec('rm ~/.aws/credentials');
shell_exec('touch ~/.aws/credentials');
shell_exec('echo "[default]" > ~/.aws/credentials');
shell_exec('echo "aws_access_key_id = AKIAXCKOPFE25OKLQ73H" >> ~/.aws/credentials');
shell_exec('echo "aws_secret_access_key = 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" >> ~/.aws/credentials');
$output = shell_exec('aws ec2 import-key-pair --key-name "ec2keypair" --public-key-material fileb://~/.ssh/id_rsa.pub');
echo "<pre>$output</pre>";
?>