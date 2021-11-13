const posts = document.getElementById('jobPostings');

const addPost = post => {
	const template = `
	<a href="/jobs/${post.id}" class="list-group-item list-group-item-action flex-column align-items-start">
	    <div class="d-flex w-100 justify-content-between">
	      <h5 class="mb-1">${ post.title }</h5>
	      <small class="text-light">${ post.date }</small>
	    </div>
	    <p class="mb-1">${ post.salary } USD/month</p><p class="mb-1">${ post.location }</p>
	    <small class="text-muted">${ post.type }</small>
	  </a>
	`;
	posts.insertAdjacentHTML('beforeend', template);
};

const getPosts = (order) => {
	fetch('/api/list', {
			method: 'POST',
			body: JSON.stringify({
				order: `${order} DESC`
			}),
			headers: {
				'Content-Type': 'application/json'
			}
		})
		.then(res => res.json())
		.then(data => {
			posts.innerHTML = '';
			data.forEach(post => {
				addPost(post);
			});
		})
};

getPosts('date');

$('#order-by').on('change', function() {
	getPosts(this.value);
});