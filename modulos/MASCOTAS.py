import streamlit as st
from config.conexion import obtener_conexion


def obtener_mascotas(especie):
    conexion = obtener_conexion()

    if conexion is None:
        return None

    cursor = None

    try:
        cursor = conexion.cursor(dictionary=True)

        consulta = """
        SELECT
            mascota.Nombre AS Mascota,
            mascota.Especie AS Especie,
            mascota.Raza AS Raza,
            mascota.Sexo AS Sexo,
            mascota.Fecha_Nacimiento AS Nacimiento,
            CONCAT(dueno.Nombre, ' ', dueno.Apellido) AS `Dueño`,
            dueno.Telefono AS `Teléfono`
        FROM mascota
        INNER JOIN dueno ON mascota.Id_Dueno = dueno.Id_Dueno
        """

        if especie == "Todas":
            cursor.execute(consulta + " ORDER BY mascota.Nombre")
        else:
            cursor.execute(
                consulta + " WHERE mascota.Especie = %s ORDER BY mascota.Nombre",
                (especie,)
            )

        return cursor.fetchall()

    except Exception as error:
        st.error(f"Error al consultar las mascotas: {error}")
        return None

    finally:
        if cursor is not None:
            cursor.close()

        if conexion.is_connected():
            conexion.close()


def mostrar_mascotas():
    st.header("Mascotas registradas")

    st.write(
        "Consulte las mascotas atendidas en la clínica "
        "veterinaria y los datos de su dueño."
    )

    especie = st.selectbox(
        "Filtrar por especie",
        ["Todas", "Perro", "Gato", "Ave", "Conejo"]
    )

    mascotas = obtener_mascotas(especie)

    if mascotas is None:
        return

    st.metric("Mascotas encontradas", len(mascotas))

    if mascotas:
        st.dataframe(
            mascotas,
            width="stretch",
            hide_index=True
        )
    else:
        st.info("No hay mascotas registradas de esa especie.")
