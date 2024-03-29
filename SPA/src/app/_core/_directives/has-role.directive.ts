import { Directive, Input, OnInit, TemplateRef, ViewContainerRef } from '@angular/core';
import { UserLogin } from '../_models/user';
import { AuthService } from '../_services/auth.service';

@Directive({
  selector: '[appHasRole]'
})
export class HasRoleDirective implements OnInit {
  @Input() appHasRole: string[] = [];
  user: UserLogin = <UserLogin>{}
  constructor(private viewContainerRef: ViewContainerRef, private templateRef: TemplateRef<any>, authServices: AuthService) {
    this.user = authServices.currentUser;
  }
  ngOnInit(): void {
    if (this.user.roles.some(role => this.appHasRole.includes(role))) {
      this.viewContainerRef.createEmbeddedView(this.templateRef);
    } else
      this.viewContainerRef.clear();
  }

}
