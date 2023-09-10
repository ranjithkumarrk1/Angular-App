import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less'],
})
export class AppComponent implements OnInit {
  ngOnInit(): void {
    this.addToggleAnimation();
  }
  title = 'Angular-App';

  addToggleAnimation(): void {
    const toggleBtn = document.getElementById('nav-toggle');
    toggleBtn?.addEventListener('click', () => {
      if (!toggleBtn.classList.contains('is-active')) {
        toggleBtn.classList.add('is-active');
      } else {
        toggleBtn.classList.remove('is-active');
      }
      const nav = document.getElementsByClassName('nav')[0];
      if (!nav.classList.contains('show')) {
        nav.classList.add('show');
      } else {
        nav.classList.remove('show');
      }
    });
  }
}
