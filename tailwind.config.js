/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",
  ],
  theme: {
    extend: {
      borderColor: ['checked'],
      backgroundColor: ['checked'],
      backgroundColor:{
        "mmsu-green": 'rgb(12,75,5)',
        'mmsu-light-gray': 'rgba(249,249,249,0.99)',
        'mmsu-yellow': 'rgb(225,203,0)'
      },
      fontFamily: {
        'times': ['Times New Roman', 'serif'],
      },
      boxShadow: {
        'custom': '4px 4px 4px 0 rgba(0,0,0,0.25), -4px -4px 0px #fff'
      },
      border:{
        "mmsu-green": 'rgb(12,75,5)',
      }
    },
  },
  plugins: [],
}