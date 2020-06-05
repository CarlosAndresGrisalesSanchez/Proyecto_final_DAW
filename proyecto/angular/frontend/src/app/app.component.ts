import { Component } from '@angular/core';
import {ConexionService}from './conexion.service'
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  title = 'frontend';
  todos_los_videos=[{nombre:'nombre',imagen:'imagen',video:'video'}];
  constructor(private videos_leidos:ConexionService) { }//instaciar al servicio de lista de recetas para optener datos
  coger_videos():void{
    this.videos_leidos.cogervideos().subscribe(data=>{this.todos_los_videos=data},error =>{console.log(error)})
  }
  ngOnInit():void{
    this.coger_videos();//coger los videos nada mas cargar la pagina
  }
}