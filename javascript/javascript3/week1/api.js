function getData(url) {
  fetch(url)
    .then(result => result.json())
    .then(data => data)
}