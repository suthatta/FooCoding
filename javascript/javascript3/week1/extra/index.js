'use strict';

{
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

  function createAndAppend(name, parent, options = {}) {
    const elem = document.createElement(name);
    parent.appendChild(elem);
    Object.keys(options).forEach(key => {
      const value = options[key];
      if (key === 'text') {
        elem.textContent = value;
      } else {
        elem.setAttribute(key, value);
      }
    });
    return elem;
  }
  // Create table on left within main div
  function createRepository(element) {
    const container = document.getElementById('container');
    const divLeft = createAndAppend('div', container, {
      id: 'leftSide', class: 'left-div whiteframe'
    });

    const divRepo = createAndAppend('div', divLeft, {
      class: 'left', text: 'Repository', style: 'font-weight:bold'
    });
    const divRepoUrl = createAndAppend('a', divLeft, {
      class: 'left', href: element.html_url,
      text: element.name,
      target: '_blank',
    });
    const divDescription = createAndAppend('div', divLeft, {
      class: 'left', text: 'Description:', style: 'font-weight:bold'
    });
    const divDescriptText = createAndAppend('div', divLeft, {
      class: 'left', text: element.description
    });
    const divForks = createAndAppend('div', divLeft, {
      class: 'left', text: 'Forks:', style: 'font-weight:bold'
    });
    const divForksCount = createAndAppend('div', divLeft, {
      class: 'left', text: element.forks
    });
    const newDate = new Date(element.updated_at).toLocaleString();
    const divDate = createAndAppend('div', divLeft, {
      class: 'left', text: 'Updated:', style: 'font-weight:bold'
    });
    const divDateShow = createAndAppend('div', divLeft, {
      class: 'left', text: newDate
    });
  }

  // Contributors
  function createContributors(element) {
    fetchJSON(element.contributors_url, (err, data) => {
      const root = document.getElementById('container');
      if (err) {
        createAndAppend('div', root, { text: err.message, class: 'alert-error' });
      } else {

        const container = document.getElementById('container');

        const divRight = createAndAppend('div', container, {
          id: 'rightSide', class: 'right-div whiteframe'
        });

        const divContributor = createAndAppend('div', divRight, {
          id: 'contributors', class: 'right', text: 'Contributors', style: 'font-weight:bold'
        });

        const ul = createAndAppend('ul', divRight, { class: 'contributorsList' });


        for (let i in data) {
          let li = createAndAppend('li', ul, { class: 'contributorItem' });
          let img = createAndAppend('img', li, {
            src: data[i].avatar_url,
            class: 'contributorsAvatar',
            height: 48,
          });
          let login = createAndAppend('a', li, {
            text: data[i].login,
            href: data[i].html_url,
            target: '_blank',
            class: 'contributorName',
          });
          let badge = createAndAppend('div', li, {
            text: data[i].contributions,
            class: 'contributorBadge',
          });
        }
      }
    })
  }


  function main(url) {
    fetchJSON(url, (err, data) => {
      const root = document.getElementById('root');
      if (err) {
        createAndAppend('div', root, { text: err.message, class: 'alert-error' });
      } else {
        //create Header (Top)
        createAndAppend('header', root, { id: 'top', class: 'header' });
        const header = document.getElementById('top');
        createAndAppend('p', header, { id: 'title', text: 'HYF Repositories' });
        createAndAppend('select', header, { id: 'repoSelect', class: 'repo-selector' });
        createAndAppend('div', root, { id: 'container' });
        // sort text upper lower case
        data.sort((a, b) => a.name.localeCompare(b.name));

        function selectOption(options) {
          const repoSelect = document.getElementById('repoSelect');
          for (let i = 0; i < options.length; i++) {
            createAndAppend('option', repoSelect, { value: i, text: options[i].name });
          }
        }
        //call selectOption function
        selectOption(data);

        createRepository(data[0]);
        createContributors(data[0]);

        // when you click the option -onchange
        document.getElementById('repoSelect').onchange = function () {
          let selectItems = this.options[this.selectedIndex].value;
          let repo = document.getElementById('leftSide');
          repo.parentNode.removeChild(repo);
          let contributors = document.getElementById('rightSide');
          contributors.parentNode.removeChild(contributors);

          createRepository(data[selectItems]);
          createContributors(data[selectItems]);
        };
      }
    });
  }



  //const HYF_REPOS_URL = 'https://api.github.com/orgs/HackYourFuture/repos?per_page=100';
  const HYF_REPOS_URL = 'https://api.github.com/orgs/foocoding/repos?per_page=100'

  window.onload = () => main(HYF_REPOS_URL);
}
