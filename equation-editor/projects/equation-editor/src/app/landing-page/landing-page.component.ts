import {Component, OnInit} from '@angular/core';

@Component({
  selector: 'equation-editor-landing-page',
  templateUrl: './landing-page.component.html',
  styleUrls: ['./landing-page.component.scss']
})
export class LandingPageComponent {

  // NOTE: the formula will be wrapped in $$ just before rendering by the math service
  formula = 'x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}';
  //formula = 'P_{n,k} = K^{n}';

}
