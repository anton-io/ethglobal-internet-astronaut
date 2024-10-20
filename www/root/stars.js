window.onload = function() {
  const starContainer = document.querySelector('.star-container');

  function createStar() {
    const star = document.createElement('div');
    star.classList.add('star');

    const x = Math.random() * window.innerWidth;
    const y = Math.random() * window.innerHeight;
    const size = Math.random() * 3 + 1;

    star.style.left = `${x}px`;
    star.style.top = `${y}px`;
    star.style.width = `${size}px`;
    star.style.height = `${size}px`;
    star.style.animationDelay = `${Math.random() * 2}s`;

    starContainer.appendChild(star);
  }

  for (let i = 0; i < 100; i++) {
    createStar();
  }
};