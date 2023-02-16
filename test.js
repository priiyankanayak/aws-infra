const { exec } = require('child_process');

exec('terraform fmt -check', (err, stdout, stderr) => {
  if (err) {
    console.error(err);
    return;
  }

  console.log(stdout);

  exec('terraform plan', (err, stdout, stderr) => {
    if (err) {
      console.error(err);
      return;
    }

    console.log(stdout);
  });
});
