// To parse this JSON data, do
//
//     final insumo = insumoFromJson(jsonString);

import 'dart:convert';

Insumo insumoFromJson(String str) => Insumo.fromJson(json.decode(str));

String insumoToJson(Insumo data) => json.encode(data.toJson());

class Insumo {
    Insumo({
        this.id,
        this.nombre,
        this.tipo,
        this.unidadM,
        this.especie,
        this.tamano,
        this.composicion,
        this.cantidad,
        this.cantidadMinima,
        this.observacion,
        this.urlImagen,
        this.createdAt,
        this.updatedAt,
        this.precioPromedio,
        this.totalSales,
    });

    int id;
    String nombre;
    String tipo;
    String unidadM;
    String especie;
    double tamano;
    String composicion;
    int cantidad;
    int cantidadMinima;
    String observacion;
    String urlImagen;
    String createdAt;
    String updatedAt;
    double precioPromedio;
    double totalSales;

    factory Insumo.fromJson(Map<String, dynamic> json) => Insumo(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        unidadM: json["unidadM"],
        especie: json["especie"]==null?null:json["especie"],
        tamano: json["tamano"]==null?0.0:json["tamano"].toDouble(),
        composicion: json["composicion"]==null?"":json["composicion"],
        cantidad: json["cantidad"],
        cantidadMinima: json["cantidadMinima"],
        observacion: json["observacion"]==null?"":json["observacion"],
        urlImagen: json["url_imagen"]==null?null:json["url_imagen"],
        updatedAt:json["updated_at"]==null?null: json["updated_at"],
        createdAt:json["created_at"]==null?null: json["created_at"],
        precioPromedio: json["precioPromedio"]==null?0.0: json["precioPromedio"].toDouble(),
        totalSales: json["total_sales"]==null?0.0: json["total_sales"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "tipo": tipo,
        "unidadM": unidadM,
        "especie": especie,
        "tamano": tamano,
        "composicion": composicion,
        "cantidad": cantidad,
        "cantidadMinima": cantidadMinima,
        "observacion": observacion,
        "url_imagen": urlImagen,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "precioPromedio": precioPromedio,
        "total_sales": totalSales,
    };
}
