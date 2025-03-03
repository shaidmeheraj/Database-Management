const signUpButton=document.getElementById('signUpButton');
const signUpButton=document.getElementById('signInButton');
const signInForm=document.getElementById('signIn');
const signInForm=document.getElementById('signUp');

signUpButton.addEventListener('click', function(){
    signInForm.style.display="none";
    signUpForm.style.display="block";
})
signInButton.addEventListener('click', function(){
    signInForm.style.display="block";
    signUpForm.style.display="none";
})