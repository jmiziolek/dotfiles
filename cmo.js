// could be done with cmus-remote -Q | sed -n '2p' | sed -e 's/file //g'
// but NODE ALL THE THINGS!
const exec = require('child_process').exec
const filePath = "cmus-remote -Q"

exec(filePath, (err, stdout) => {
	if(err) return
	let path = stdout.split('\n')[1].substring(5)
	exec('open -R "' + path + '"')
})
