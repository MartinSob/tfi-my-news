async function get(url) {
	let response = await fetch(url);
	return response.json();
}

async function post(url = '', data = {}) {
    const response = await fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
		},
		body: JSON.stringify(data) // body data type must match "Content-Type" header
	});
	return response.json();
}

document.addEventListener('DOMContentLoaded', () => {
    // Get all "navbar-burger" elements
    const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

    // Check if there are any navbar burgers
    if ($navbarBurgers.length > 0) {

        // Add a click event on each of them
        $navbarBurgers.forEach(el => {
            el.addEventListener('click', () => {

                // Get the target from the "data-target" attribute
                const target = el.dataset.target;
                const $target = document.getElementById(target);

                // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
                el.classList.toggle('is-active');
                $target.classList.toggle('is-active');

            });
        });
    }
});

/*
 * Response must contain a type and a description.
 * 
 * Type can be: 'is-success', 'is-warning', 'is-danger'
 */
const showAlert = (response) => {
    if (!response.description) {
        return;
    }

    const alertNotification = document.getElementById('custom-alert-notification');
    alertNotification.style.opacity = "1";

    const customAlert = document.getElementById('custom-alert');
    customAlert.classList.add('is-'+response.type);

    const customAlertMessage = document.getElementById('custom-alert-message');
    customAlertMessage.innerHTML = response.description;

    customAlert.classList.remove('is-hidden');

    setTimeout(function () {
        alertNotification.style.opacity = "0";

        setTimeout(function () {
            customAlert.classList.add('is-hidden');
            customAlert.classList.remove('is-' + response.type);
        }, 600);
    }, 3000);
}

const isJsonString = (str) => {
    try {
        JSON.parse(JSON.stringify(str));
    } catch (e) {
        console.error(e);
        return false;
    }
    return true;
}
