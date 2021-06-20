import {Directive, ElementRef, Input, OnChanges, OnDestroy, OnInit, SimpleChanges} from '@angular/core';
import {take, takeUntil} from "rxjs/operators";
import {MathService} from "../services/math.service";
import {Subject} from "rxjs";

@Directive({
  selector: '[equationEditorMath]'
})
export class MathDirective implements OnInit, OnChanges, OnDestroy {

  @Input() equationEditorMath: string = '';
  private readonly _el: HTMLElement;
  private alive$ = new Subject<boolean>();

  constructor(private mathService: MathService, private el: ElementRef) {
    this._el = el.nativeElement as HTMLElement;
  }

  ngOnInit(): void {
    this.render();
  }

  ngOnChanges(changes: SimpleChanges): void {
    this.render();
  }

  ngOnDestroy(): void {
    this.alive$.next(false);
  }

  private render() {
    this.mathService
      .ready()
      .pipe(
        take(1),
        takeUntil(this.alive$)
      ).subscribe(res => {
      this.mathService.render(this._el, this.equationEditorMath);
    });
  }

}
