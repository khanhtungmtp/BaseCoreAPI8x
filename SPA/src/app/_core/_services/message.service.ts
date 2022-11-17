import { PaginationParams, PaginationResult } from './../_helpers/utilities/pagination-utilities';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Message } from '../_models/message';
import { map } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MessageService {
  baseUrl: string = environment.apiUrl + 'users/';

  constructor(
    private http: HttpClient
  ) { }

  getMessageForUser(userid: number, param?: PaginationParams, messageContainer?: string) {
    let paginatedResult: PaginationResult<Message[]> = <PaginationResult<Message[]>>{};
    let params = new HttpParams()
    // .set('message_container', messageContainer);
    if (param?.pageNumber != null && param.pageSize != null) {
      params = params.appendAll({ ...param });
    }
    if (messageContainer) {
      params = params.append('message_container', messageContainer)
    }
    return this.http.get<Message[]>(this.baseUrl + userid + '/Message/GetMessageForUser', { observe: 'response', params }).pipe(
      map(response => {
        paginatedResult.result = response.body as Message[];
        if (response.headers.get('pagination') != null) {
          paginatedResult.pagination = JSON.parse(response.headers.get('pagination') as string);
        }
        return paginatedResult;
      })
    );
  }
}
