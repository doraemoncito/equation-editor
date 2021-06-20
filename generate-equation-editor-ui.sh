#!/bin/sh

export APPLICATION_NAME="equation-editor"

echo "Generating '${APPLICATION_NAME}' Angular UI workspace and application.  This may take some time..."

echo
echo "Generating Angular UI workspace..."
ng new "${APPLICATION_NAME}" --create-application=false --skip-install=true --strict=true --routing=true --style=scss --package-manager=npm

cd "${APPLICATION_NAME}" || exit

echo
echo "Installing Boostrap and JQuery..."
npm install bootstrap@~5.0.1
npm install jquery
npm install @popperjs/core@^2.9.2
echo
echo "Installing MathJax (with client side rendering support)..."
npm install mathjax@3
npm install @types/mathjax

echo
echo "Generating Angular UI application..."
ng generate application "${APPLICATION_NAME}" --strict --routing=true --defaults=true --style=scss --prefix "${APPLICATION_NAME}"

echo
echo "Generating components..."
ng generate component header --skip-tests=true --project ${APPLICATION_NAME}
ng generate component landing-page --skip-tests=true --project ${APPLICATION_NAME}
ng generate component mathjax --skip-tests=true --project ${APPLICATION_NAME}

echo "Generating services"
ng generate service services/math --skip-tests=true --project ${APPLICATION_NAME}

echo "Generating services"
ng generate directive directives/math --skip-tests=true --project ${APPLICATION_NAME}

echo
echo "Auditing and fixing dependencies..."
npm audit fix

echo
echo "Setting application base URL..."
cd .. || exit
sed -i '' 's|<base href="/"\>|<!-- Set the HREF to "." (i.e. a single dot) to allow the application to be deployed to any subdirectory -->\n  <base href="."\>|g' index.html

mkdir -p "assets/fonts"
cd "assets/fonts" || exit
git submodule add git@github.com:doraemoncito/source-sans.git

echo
echo "start server using this command:"
echo
echo "    ./run-equation-editor.sh"
echo
echo "Done!"
echo

# Icon attribution:
# <div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
# <div>Icons made by <a href="https://www.flaticon.com/authors/eucalyp" title="Eucalyp">Eucalyp</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
# <div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>

# GitHub Icon (https://github.com/simple-icons/simple-icons)
# https://github.com/simple-icons/simple-icons/blob/develop/icons/github.svg?short_path=538ec5b

# https://stackoverflow.com/questions/55125544/mathjax-in-angular-6
# https://stackoverflow.com/questions/49878988/how-to-import-a-new-font-into-a-project-angular-5
# https://stackblitz.com/edit/angular-mathjax?file=src%2Fapp%2Fmathjax%2Fmathjax.component.ts
# https://medium.com/kongsberg-digital/how-to-render-mathml-in-browser-using-angular-and-mathjax-3-along-with-lazy-loading-83f791911cfd
# https://stackoverflow.com/questions/64293790/locally-install-mathjax-in-angular

