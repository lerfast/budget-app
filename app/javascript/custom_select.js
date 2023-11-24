// custom_select.js

document.addEventListener("turbo:load", () => {
  document.querySelectorAll('.icon-select .icon-option').forEach(item => {
    item.addEventListener('click', (event) => {
    
      document.querySelectorAll('.icon-select .icon-option').forEach(option => {
        option.classList.remove('selected');
      });

      
      event.currentTarget.classList.add('selected');

     
      const value = item.getAttribute('data-value');
      document.getElementById('selected_icon').value = value;
    });
  });
});
