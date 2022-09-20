function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    sutUrl: 'https://jsonplaceholder.typicode.com'
  }
  if (env == 'tst') {
    config.sutUrl = 'https://jsonplaceholder.typicode.com'
  } else if (env == 'uat') {
    config.sutUrl = 'https://jsonplaceholder.typicode.com'
  }
  return config;
}