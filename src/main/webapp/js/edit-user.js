//Form validation

const btn = document.querySelector('.btn-edit')
const wrapper = document.querySelector(".wrapper")
const wrapperBtnEdit = document.querySelector(".profil-action");
let inputs = [...wrapper.querySelectorAll('.form-control')]

function validate(){
    let isIncomplete = inputs.some(input => !input.value);
    btn.disabled = isIncomplete;
    wrapperBtnEdit.style.cursor = isIncomplete ? "not-allowed" : "pointer"
}

wrapper.addEventListener('input', validate);
validate()
