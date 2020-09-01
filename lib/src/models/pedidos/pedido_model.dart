// To parse this JSON data, do
//
//     final pedidosModel = pedidosModelFromJson(jsonString);

import 'dart:convert';

PedidosModel pedidosModelFromJson(String str) => PedidosModel.fromJson(json.decode(str));

String pedidosModelToJson(PedidosModel data) => json.encode(data.toJson());

class PedidosModel {
    PedidosModel({
        this.pedidos,
    });

    Map<String, Pedido> pedidos;

    factory PedidosModel.fromJson(Map<String, dynamic> json) => PedidosModel(
        pedidos: Map.from(json["pedidos"]).map((k, v) => MapEntry<String, Pedido>(k, Pedido.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "pedidos": Map.from(pedidos).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Pedido {
    Pedido({
        this.id,
        this.idCliente,
        this.fechaSolicitud,
        this.estatus,
        this.total,
        this.createdAt,
        this.updatedAt,
        this.idVenta,
        this.totalPagado,
        this.tipoEntrega,
        this.detalles,
    });

    int id;
    int idCliente;
    DateTime fechaSolicitud;
    String estatus;
    int total;
    DateTime createdAt;
    DateTime updatedAt;
    int idVenta;
    double totalPagado;
    String tipoEntrega;
    List<Detalle> detalles;

    factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        id: json["id"],
        idCliente: json["id_cliente"],
        fechaSolicitud: DateTime.parse(json["fechaSolicitud"]),
        estatus: json["estatus"],
        total: json["total"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        idVenta: json["idVenta"] == null ? null : json["idVenta"],
        totalPagado: json["totalPagado"].toDouble(),
        tipoEntrega: json["tipo_entrega"],
        detalles: List<Detalle>.from(json["detalles"].map((x) => Detalle.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_cliente": idCliente,
        "fechaSolicitud": "${fechaSolicitud.year.toString().padLeft(4, '0')}-${fechaSolicitud.month.toString().padLeft(2, '0')}-${fechaSolicitud.day.toString().padLeft(2, '0')}",
        "estatus": estatus,
        "total": total,
        "created_at": createdAt == null ? null : "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at": updatedAt == null ? null : "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "idVenta": idVenta == null ? null : idVenta,
        "totalPagado": totalPagado,
        "tipo_entrega": tipoEntrega,
        "detalles": List<dynamic>.from(detalles.map((x) => x.toJson())),
    };
}

class Detalle {
    Detalle({
        this.idPedido,
        this.nombreProducto,
        this.cantidadPedido,
        this.cantidadSurtida,
        this.idProducto,
        this.unidadM,
        this.precioUnitario,
        this.subtotal,
    });

    int idPedido;
    String nombreProducto;
    double cantidadPedido;
    double cantidadSurtida;
    int idProducto;
    String unidadM;
    double precioUnitario;
    double subtotal;

    factory Detalle.fromJson(Map<String, dynamic> json) => Detalle(
        idPedido: json["idPedido"],
        nombreProducto: json["nombreProducto"],
        cantidadPedido: json["cantidadPedido"].toDouble(),
        cantidadSurtida: json["cantidadSurtida"].toDouble(),
        idProducto: json["idProducto"],
        unidadM: json["unidadM"] == null ? null : json["unidadM"],
        precioUnitario: json["precioUnitario"].toDouble(),
        subtotal: json["subtotal"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "idPedido": idPedido,
        "nombreProducto": nombreProducto,
        "cantidadPedido": cantidadPedido,
        "cantidadSurtida": cantidadSurtida,
        "idProducto": idProducto,
        "unidadM": unidadM == null ? null : unidadM,
        "precioUnitario": precioUnitario,
        "subtotal": subtotal,
    };
}
