const fs = require('fs')
const convert = require('ebook-convert')
const path = require('path')

const dir = './txt/'
// const min = 0, max = 10

fs.readdir(dir, (err, files) => {
  if (err) return console.log('Error scan directory: ' + err)
  files
    .forEach((filename, i) => {
      const naslov = filename.split('.').slice(0, -1).join('.')
      const authors = filename.split(',').slice(0, -1).join(',')
      const title = naslov.split(',').slice(1).join(',')

      const options = {
        input: path.join('txt', `"${filename}"`),
        output: path.join('mobi', `"${naslov}.mobi"`),
        authors: `"${authors}"`,
        title: `"${title}"`,
      }

      convert(options, err => {
        if (err) console.log(err)
      })

    })
})
