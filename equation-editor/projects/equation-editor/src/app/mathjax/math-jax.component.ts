import {Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {MathService} from "../services/math.service";

@Component({
  selector: 'equation-editor-mathjax',
  templateUrl: './math-jax.component.html',
  styleUrls: ['./math-jax.component.scss']
})
export class MathJaxComponent implements OnInit, OnChanges {

  @Input() content?: string;

  constructor(private mathService: MathService) {
  }

  ngOnInit() {
    /* Wait for the MathJax script to execute and the math service to become available before attempting to load the
     * configuration so that we don't get an error saying MathJax is not defined.
     */
    this.mathService.ready().subscribe(() => {
      this.loadConfiguration()
      this.render();
    });
  }

  ngOnChanges(changes: SimpleChanges) {
    if (changes['content']) {
      this.render()
    }
  }

  render() {
    setTimeout(() => {
      MathJax.Hub.Queue(["Typeset", MathJax.Hub, 'mathContent']);
    }, 1000)
  }

  loadConfiguration() {
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
