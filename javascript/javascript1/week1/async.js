async function waitJson() {
  const data = await fetchJSONByUsingAwait(url);
  return data
}

// Example 1 - Console.log from another async function to use await
async function logData() {
  const data = await waitJson();
  console.log(data);
}
logData() // <-- Calling the function
// Example 2 - Using the .then method
waitJson().then(data => {
  console.log(data);
});

function fetchJSON(url, cb) {
  const xhr = new XMLHttpRequest();
  xhr.open('GET', url);
  xhr.responseType = 'json';
  xhr.onload = () => {
    if (xhr.status < 400) {
      cb(null, xhr.response);
    } else {
      cb(new Error(`Network error: ${xhr.status} - ${xhr.statusText}`));
    }
  };
  xhr.onerror = () => cb(new Error('Network request failed'));
  xhr.send();
}