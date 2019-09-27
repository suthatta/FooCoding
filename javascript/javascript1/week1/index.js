
// call API
const main = async url => {
  const response = await fetch(url);
  const repoList = await response.json();
  createHTML();
  repoList.forEach(createRepoList);
}

const createHTML = () => {
  const divRoot = document.getElementById('root');
  //left
  const divLeft = createAndAppend('div', divRoot, { id: 'divLeft' });
  const h1 = createAndAppend('h1', divLeft, { text: 'Repository' });
  const ul = createAndAppend('ul', divLeft, { id: 'list' });
  //right
  const divRight = createAndAppend('div', divRoot, { id: 'contributors', });
}

const createRepoList = repo => {
  const ul = document.getElementById('list');
  const li = createAndAppend('li', ul, { id: 'list', text: 'Name:' });
  const span = createAndAppend('span', li, { id: 'list', text: repo.name, });
  span.addEventListener('click', showRepoDetails(repo));

}
// AddEventListener
const showRepoDetails = repo => event => {
  alert(`Hello ${repo.name}`)
  const contributors = document.getElementById('contributors').innerHTML = "";
  document.querySelector('#contributors').classList.add('active');
  createContributor(repo);
}


const createAndAppend = ((name, parent, options = {}) => {
  const element = document.createElement(name);
  parent.appendChild(element);
  Object.keys(options).forEach(key => {
    const value = options[key];
    if (key === 'text') {
      element.textContent = value;
    } else {
      element.setAttribute(key, value);
    }
  });
  return element;
});

// contributor
const createContributor = repo => {
  fetch(repo.contributors_url)
    .then(res => res.json())
    .then(data => {
      const contributors = document.getElementById('contributors');
      const div = createAndAppend('div', contributors, { id: 'contributorsItem' });
      createAndAppend('h1', div, { id: 'item', text: 'Contributions' });
      const ul = createAndAppend('ul', contributors, { class: 'contributorsList' });
      for (const i in data) {
        const li = createAndAppend('li', ul, { class: 'contributorItem' });
        const img = createAndAppend('img', li, { src: data[i].avatar_url, class: 'contributorsAvatar', height: 48, })
        const login = createAndAppend('a', li, { text: data[i].login, href: data[i].html_url, target: '_blank', class: 'contributorName', });
        const badge = createAndAppend('div', li, { class: 'contributorsBadge', text: data[i].contributions, });
      }
    })
}


const url = main('https://api.github.com/orgs/HackYourFuture/repos?per_page=5');
console.log(url);
