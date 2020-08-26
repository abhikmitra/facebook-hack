namespace HackFacebook\UiServer\GlobalValues;
use Facebook\HackRouter\{HttpMethod};
function getFromServerGlobal(string $key): string {
  /* HH_IGNORE_ERROR[2050] $_Server is a global */
  return string_param($key, $_SERVER);
}

function getReqMethodFromServerGlobal(string $key): HttpMethod {
  /* HH_IGNORE_ERROR[4110] $_Server is a global */
  /* HH_IGNORE_ERROR[2050] $_Server is a global */
  return string_param($key, $_SERVER);
}

function string_param(string $key, darray<arraykey,string> $globalObj): string {
  if (!\array_key_exists($key, $globalObj)) {
    throw new \Exception("Value Not found");
  }
  $value = $globalObj[$key];
  invariant(\is_string($value), 'GET param must be a string');
  return $value;
}