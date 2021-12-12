const urlPrefix = 'http://localhost/MyNewsMaker/'; // Prod
// const urlPrefix = '/'; // Local

async function get(url) {
    let response = await fetch(urlPrefix + url);
    return response.json();
}

async function post(url = '', data = {}) {
    const response = await fetch(urlPrefix + url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data) // body data type must match "Content-Type" header
    });
    return response.json();
}

function relocation(url) {
    window.location.replace(urlPrefix + url);
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

    if (document.getElementById('languageList')) {
        document.getElementById('languageList').addEventListener("change", async function () {
            if (!this.value)
                return;

            const response = await get('Language/LoadLanguage?id=' + this.value);
            if (response.type === 'success') {
                location.reload();
            }
        });
    }

    if (document.getElementById('logoutBtn')) {
        document.getElementById('logoutBtn').addEventListener("click", async function () {
            relocation('Login/Logout');
        });
    }
});

/*
 * Response must contain a type and a description.
 * 
 * Type can be: 'success', 'warning', 'danger'
 */
const showAlert = (response) => {
    if (!response.description) {
        return;
    }

    const alertNotification = document.getElementById('custom-alert-notification');
    alertNotification.style.opacity = "1";

    const customAlert = document.getElementById('custom-alert');
    customAlert.classList.add('is-' + response.type);

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

const toggleModal = () => {
    let modal = document.querySelector('.modal');
    let html = document.querySelector('html');
    modal.classList.toggle('is-active');
    const isShown = html.classList.toggle('is-clipped');

    if (isShown) {
        modal.querySelector('.modal-background').addEventListener('click', function (e) {
            e.preventDefault();
            modal.classList.remove('is-active');
            html.classList.remove('is-clipped');
        });
    }
}

function getBase64(file) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = error => reject(error);
    });
}

const generateRandomColor = () => {
    return '#' + Math.floor(Math.random() * 16777215).toString(16)
}