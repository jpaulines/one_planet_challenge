
const toggleActive = () => {

 const categories = document.querySelectorAll('.category-choice');
 categories.forEach((category) => {
  category.addEventListener('click', (event) => {
    category.classList.toggle('active');
  })
 })
};

export { toggleActive };
