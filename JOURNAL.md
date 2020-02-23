# 2020/02/23

- Decided to collobrate using https://repl.it
- Learned about the .replit file: https://docs.repl.it/repls/dot-replit
- Created `r.sh` for running commands
    - It seems that repl.it resets permissions every time you save, so we're just using `bash r.sh` instead of `./r.sh`
- Created a basic backend in Go
    - https://golang.org/pkg/net/http/
    - https://yourbasic.org/golang/http-server-example/
- repl.it automatically detects when you serve on a port: https://docs.repl.it/repls/http-servers
- Created a new Angular project:
    - `ng new emerson`
    - It automatically created a `.gitignore` to ignore `node_modules` and other things
    - Had trouble running it on repl.it until realizing we needed `npx ng serve --host 0.0.0.0`: https://stackoverflow.com/questions/43492354/how-to-allow-access-outside-localhost
    - Also needed `--disableHostCheck=true`: https://angular.io/cli/serve

# 2020/02/02

- Decided to make an MSN clone
- Created a GitHub project: https://github.com/hsuallen/emerson
- Chose tech stack: Go and Angular