let host   = document.getElementById('host');
let form   = document.getElementById('form');
let output = document.getElementById('healthcheck');

form.addEventListener('submit', e => {

    e.preventDefault();

    output.innerHTML = '';

    let map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#039;'
    };

    fetch('/api/curl', {
      method: 'POST',
      body: `host=${encodeURIComponent(host.value)}`,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
    .then(resp => resp.json())
    .then(data => {
        let formatted = data.message.toString().replace(/[&<>"']/g, m => map[m]);

        output.innerHTML = `
            <pre data-code-type="language-html"><code class="language-html" id="response">${formatted}</code></pre>
        `;

        Prism.highlightElement(document.getElementById('response'));
    });

    host.value = '';
});