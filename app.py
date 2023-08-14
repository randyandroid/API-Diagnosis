from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

# Conexión a la base de datos MySQL
db = mysql.connector.connect(
    host='localhost',
    user='root',
    password='randy1234',
    database='Imagenes'
)

# Crear cursor para ejecutar consultas SQL
cursor = db.cursor(dictionary=True)

# Endpoint para listar todos los pacientes
@app.route('/pacientes', methods=['GET'])
def obtener_pacientes():
    cursor.execute("SELECT * FROM pacientes")
    pacientes = cursor.fetchall()
    return jsonify(pacientes)

# Endpoint para obtener un paciente por ID
@app.route('/pacientes/<int:paciente_id>', methods=['GET'])
def obtener_paciente(paciente_id):
    cursor.execute("SELECT * FROM pacientes WHERE _paciente_id = %s", (paciente_id,))
    paciente = cursor.fetchone()
    if paciente:
        return jsonify(paciente)
    return jsonify({"mensaje": "Paciente no encontrado"}), 404

# Endpoint para crear un paciente
@app.route('/pacientes', methods=['POST'])
def crear_paciente():
    nuevo_paciente = {
        "nombre": request.json['nombre'],
        "apellido": request.json['apellido'],
        "fecha_nacimiento": request.json['fecha_nacimiento'],
        "documento": request.json['documento'],
        "_id_seguro": request.json['_id_seguro']
    }
    consulta = "INSERT INTO pacientes (nombre, apellido, fecha_nacimiento, documento, _id_seguro) VALUES (%s, %s, %s, %s, %s)"
    valores = (nuevo_paciente['nombre'], nuevo_paciente['apellido'], nuevo_paciente['fecha_nacimiento'], nuevo_paciente['documento'], nuevo_paciente['_id_seguro'])
    cursor.execute(consulta, valores)
    db.commit()
    nuevo_paciente['_paciente_id'] = cursor.lastrowid
    return jsonify(nuevo_paciente), 201

# ... otros endpoints ...

if __name__ == '__main__':
    app.run(debug=True)
