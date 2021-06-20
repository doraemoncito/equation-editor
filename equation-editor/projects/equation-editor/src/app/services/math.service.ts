// https://stackoverflow.com/questions/55125544/mathjax-in-angular-6
import {Injectable, OnInit} from '@angular/core';
import {Observable, Observer, ReplaySubject} from "rxjs";

// see https://stackoverflow.com/a/12709880/1203690
declare global {
  interface Window {
    hubReady: Observer<boolean>;
  }
}

@Injectable({
  providedIn: 'root'
})
export class MathService {

  private readonly notifier: ReplaySubject<boolean>;

  constructor() {
    this.notifier = new ReplaySubject<boolean>();
    window.hubReady = this.notifier;

    /* Wait for the MathJax script to execute and the math service to become available before attempting to load the
     * configuration so that we don't get an error saying MathJax is not defined.
     */
    this.ready().subscribe(() => {
      this.loadConfiguration()
    });
  }

  ready(): Observable<boolean> {
    return this.notifier;
  }

  render(element: HTMLElement, math?: string): void {
    if (math) {
      // Surround LaTeX equation with $ signs so that MathJax renders in correctly
      element.innerText = `$$${math}$$`;
      setTimeout(() => {
        MathJax.Hub.Queue(["Typeset", MathJax.Hub, element]);
      }, 1000)
    }
  }

  loadConfiguration() {
    console.log("Configuring MathJax")
    MathJax.Hub.Config({
      showMathMenu: false,
      tex2jax: {inlineMath: [["$", "$"], ["\\(", "\\)"]]},
      menuSettings: {zoom: "Double-Click", zscale: "150%"},
      CommonHTML: {
        linebreaks: {
          automatic: true
        }
      },
      "HTML-CSS": {
        linebreaks: {
          automatic: true
        }
      },
      SVG: {
        linebreaks: {
          automatic: true
        }
      }
    });
  }

}
