import { NgxNotiflixService } from 'src/app/_core/_services/ngx-notiflix.service';
import { User } from 'src/app/_core/_models/user';
import { AfterContentChecked, Component, OnInit, ViewChild, computed } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TabDirective, TabsetComponent } from 'ngx-bootstrap/tabs';
import { UserService } from 'src/app/_core/_services/user.service';
import { SearchParams } from 'src/app/_core/_models/dating';
@Component({
  selector: 'app-memeber-detail',
  templateUrl: './memeber-detail.component.html',
  styleUrls: ['./memeber-detail.component.css']
})

export class MemeberDetailComponent implements OnInit, AfterContentChecked {
  searchParam: SearchParams = <SearchParams>{};
  test = computed(() => {
    return this.userService.searchInput()
  })
  @ViewChild('memberTabs', { static: false }) memberTabs: TabsetComponent;
  activeTab: TabDirective;
  user: User;
  tabId: number
  constructor(
    private userService: UserService,
    private route: ActivatedRoute,
    private notiflix: NgxNotiflixService,
    private router: Router
  ) {

  }

  ngOnInit(): void {
    this.selectTab(this.tabId)
    this.notiflix.showLoading();
    let id = this.route.snapshot.paramMap.get('id')
    if (id)
      this.getUserInfo(+id); // ép về int
    this.route.queryParams.subscribe({
      next: (res) => {
        this.tabId = res['tab'];
        this.notiflix.hideLoading()
      },
      error: () => this.notiflix.error('cannot get params'),
      complete: () => this.notiflix.hideLoading()
    })

  }
  ngAfterContentChecked(): void {
    this.selectTab(this.tabId)
  }


  getUserInfo(id: number) {
    this.notiflix.showLoading();
    this.userService.getUser(id).subscribe({
      next: (res) => {
        if (!res)
          this.back()
        this.user = res;
        this.notiflix.hideLoading()
      },
      error: (e) => {
        this.notiflix.error(e)
        this.back()
        this.notiflix.hideLoading()
      }
    })
  }

  back() {
    this.router.navigate(['members']);
  }

  selectTab(tabId: number) {
    if (this.memberTabs && this.memberTabs.tabs[tabId])
      this.memberTabs.tabs[tabId].active = true;
  }

  onTabActivated(data: TabDirective) {
    this.activeTab = data;
  }

}
