var tableau = ['Wassim', 'Kévin', 'Maureen', 'Willy' ,'Clementine', 'Chloe', 'Georges', 'Samir', 'Ahmed','Mohamed', 'Ayoub', 'Abdelrahmane', 'Geoffroy', 'Mohammed'];
var btn = document.getElementById('btn1');
var motMystere;
btn.addEventListener('click', afficherMotMystere);


function afficherMotMystere() {
    let chiffrePosition = genererChiffreAlea(tableau.length);
    motMystere = tableau[chiffrePosition];
    Swal.fire(
        'Votre sentence est irrévocable',
        motMystere.toUpperCase(),
        'success'
      )
    return motMystere;
}

function genererChiffreAlea(max) {
    return Math.floor(Math.random() * Math.floor(max));
}
