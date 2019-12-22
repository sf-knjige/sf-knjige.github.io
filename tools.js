const fs = require('fs')
const cheerio = require('cheerio')

const dir = './knjige/'

const getNum = str => str.match(/\d+/) ? str.match(/\d+/)[0] : 0

fs.readdir(dir, (err, allBooks) => {
  if (err) return console.log('Error scan directory: ' + err)
  allBooks
    .filter(x => !x.includes('.html'))
    .forEach(subdir => {
      console.log(subdir)
      let knjiga = ''
      const pages = fs.readdirSync(dir + subdir)

      const naslovHtml = fs.readFileSync(dir + subdir + '/naslov.html', 'utf8')
      const $naslovHtml = cheerio.load(naslovHtml)
      const naslov = $naslovHtml('title').text().replace(/\//g, ' & ')
      console.log(naslov)

      pages
        .filter(x => x !== 'index0.html' && x !== 'naslov.html' && x !== 'menu.html')
        .sort((a, b) => getNum(a) - getNum(b))
        .forEach(file => {
          const strana = fs.readFileSync(dir + subdir + '/' + file, 'utf8')
          const $strana = cheerio.load(strana)
          knjiga += $strana('body').text()
        })
      fs.writeFileSync(`mobi/${naslov}.txt`, knjiga)

    })
})
