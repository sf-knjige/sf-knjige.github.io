var path = require('path');
var fs = require('fs');
const cheerio = require('cheerio')

const dir = './knjige/1984/'
let knjiga = ''

const getNum = str => {
  return str.match(/\d+/) ? str.match(/\d+/)[0] : 0
}

fs.readdir(dir, function (err, files) {
    if (err) return console.log('Error scan directory: ' + err);
    files
      .filter(x => x !== 'index0.html' && x !== 'naslov.html')
      .sort((a, b) => getNum(a) - getNum(b))
      .forEach(function (file) {
        const sadrzaj = fs.readFileSync(dir + file, 'utf8')
        const $ = cheerio.load(sadrzaj)
        knjiga += $('body').text()
    });
    console.log(knjiga);
    fs.writeFileSync('knjiga.txt', knjiga)
});
