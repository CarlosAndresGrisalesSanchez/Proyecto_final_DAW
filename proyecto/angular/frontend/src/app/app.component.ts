import { Component } from '@angular/core';
import {ConexionService}from './conexion.service'
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  title = 'frontend';
  todos_los_videos:any[]=[];
  constructor(private videos_leidos:ConexionService) { }//instaciar al servicio de lista de recetas para optener datos
  coger_videos():void{
    this.videos_leidos.cogervideos().subscribe(todos_los_videos=>this.todos_los_videos=todos_los_videos)
  }

}
