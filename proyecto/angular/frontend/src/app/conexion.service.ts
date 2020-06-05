import { Injectable } from '@angular/core';
import {throwError,Observable, from} from 'rxjs';
import { tap, catchError, map} from 'rxjs/operators';
import {HttpHeaders, HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ConexionService {
  base_url='http://18.207.254.214:8080';
  
  headers = new HttpHeaders().set('Content-Type', 'application/json').set('Accept', 'application/json');
  httpOptions = {
    headers: this.headers
  };

  constructor(private http:HttpClient) { }//instanciar el httpclient
  private handleError(error: any) {//para mirar errores
    console.error(error);                                       
    return throwError(error);
  }
  url_videos:string;
  cogervideos():Observable<any[]>{
    this.url_videos=this.base_url+'/videos/todos/';
    
    return this.http.get<any[]>(this.url_videos,this.httpOptions)
  }
}
