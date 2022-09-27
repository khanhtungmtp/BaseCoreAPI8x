import { AuthGuard } from './_core/_guards/auth/auth.guard';
import { ListsComponent } from './views/lists/lists.component';
import { MessagesComponent } from './views/messages/messages.component';
import { MemberListComponent } from './views/members/member-list/member-list.component';
import { Routes, RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { HomeComponent } from './home/home.component';
import { MemberEditComponent } from './views/members/member-edit/member-edit.component';


export const routes: Routes = [
    { path: '', component: HomeComponent },
    {
        path: '',
        runGuardsAndResolvers: 'always',
        canActivate: [AuthGuard],
        children: [
            {
                path: 'members',
                loadChildren: () => import('./views/members/members.module').then(m => m.MembersModule),
            },
            { path: 'messages', component: MessagesComponent},
            { path: 'lists', component: ListsComponent},
            {path: 'member/edit', component: MemberEditComponent}
        ]
    },
    { path: '**', redirectTo: '', pathMatch: 'full' }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class FeatureRoutingModule { }
