# Equation Editor

An equation editor written in Angular and MathJax.

A live version of this equation editor can be found on [GitHub Pages](https://doraemoncito.github.io/equation-editor/).

## Building for GitHub Pages

These commands will build the application and place the compiled code inside the top level *docs* folder:  

```shell
cd equation-editor
ng build --base-href "/equation-editor/"
cp ../docs/index.html ../docs/404.html
touch ../docs/.nojekyll
```

## Running locally

You can start the equation editor running on a local web server using the `run-equation-editor.sh` shell script.  E.g.

```shell
run-equation-editor.sh
```

or by running these commands in the shell:

```shell
cd equation-editor
ng serve --base-href "/" --port 4200
```

Once the server is up, open a web browser and navigate to this URL: <http://localhost:4200>
