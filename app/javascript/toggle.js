console.log("connected")
const toggle = document.querySelector('.toggle input')

toggle.addEventListener('click', () => {
    const onOff = toggle.parentNode.querySelector('.onoff')
    onOff.textContent = toggle.checked ? 'ON' : 'OFF'
})


const bubbles = document.querySelectorAll(".bubble");
console.log(bubbles)

bubbles.addEventListener("click", (event) => {

    event.currentTarget.classList.toggle("active");
});

