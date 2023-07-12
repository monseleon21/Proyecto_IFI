import tkinter as tk
from tkinter import messagebox
from tkinter import ttk
import pyodbc


# Crear la conexión a la base de datos
connection = pyodbc.connect('DRIVER={SQL Server};SERVER=localhost\\SQLEXPRESS;DATABASE=Softsit2;Trusted_Connection=yes;')

# Función para abrir la ventana de registro
def open_register_window():
    window.withdraw()  # Ocultar la ventana principal

    def close_register_window():
        register_window.destroy()  # Cerrar la ventana de registro
        window.deiconify()  # Volver a mostrar la ventana principal

    register_window = tk.Toplevel()
    register_window.title("Registro")
    register_window.geometry("1600x900")

    username_label = tk.Label(register_window, text="Usuario:")
    username_label.pack()
    username_entry = tk.Entry(register_window)
    username_entry.pack()

    password_label = tk.Label(register_window, text="Contraseña:")
    password_label.pack()
    password_entry = tk.Entry(register_window, show="*")
    password_entry.pack()

    birthdate_label = tk.Label(register_window, text="Fecha de nacimiento:")
    birthdate_label.pack()
    birthdate_entry = tk.Entry(register_window)
    birthdate_entry.pack()

    email_label = tk.Label(register_window, text="Correo electrónico:")
    email_label.pack()
    email_entry = tk.Entry(register_window)
    email_entry.pack()

    register_button = tk.Button(register_window, text="Registrar",
                               command=lambda: register(register_window, username_entry.get(), password_entry.get(),
                                                       birthdate_entry.get(), email_entry.get()))
    register_button.pack()

    register_window.protocol("WM_DELETE_WINDOW", close_register_window)  # Manejar el evento de cierre de la ventana

# Función para realizar el inicio de sesión
def login():
    username = username_entry.get()
    password = password_entry.get()

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM Usuarios WHERE Usuario_Name=? AND Usuario_Password=?", (username, password))
    user = cursor.fetchone()

    if user:
        # Iniciar sesión exitoso
        messagebox.showinfo("Inicio de sesión", "Inicio de sesión exitoso")
        window.withdraw()  # Ocultar la ventana de inicio de sesión
        open_main_window(user[1])  # Pasar el nombre de usuario a la función para abrir la ventana principal
    else:
        # Credenciales inválidas
        messagebox.showerror("Inicio de sesión", "Credenciales inválidas")

# Función para realizar el registro de usuario
def register(window, username, password, birthdate, email):
    cursor = connection.cursor()
    cursor.execute("INSERT INTO Usuarios (Usuario_Name, Usuario_Password, Fecha_Nacimiento, Correo) VALUES (?, ?, ?, ?)",
                   (username, password, birthdate, email))
    connection.commit()

    messagebox.showinfo("Registro", "Registro exitoso")
    window.destroy()  # Cerrar la ventana de registro
    window.deiconify()  # Volver a mostrar la ventana principal

# Función para abrir la ventana principal
def open_main_window(username):
    global main_window
    main_window = tk.Tk()
    main_window.title("Ventana Principal")
    main_window.geometry("1600x900")

    # Mostrar el nombre de usuario en la ventana principal
    username_label = tk.Label(main_window, text=f"Bienvenido, {username}!", font=("Arial", 16, "bold"))
    username_label.pack()

    # Botones para ver los registros de terapias y masajes
    terapias_button = tk.Button(main_window, text="Ver Registros de Terapias", command=show_terapias)
    terapias_button.pack()

    masajes_button = tk.Button(main_window, text="Ver Registros de Masajes", command=show_masajes)
    masajes_button.pack()

    main_window.mainloop()

# Función para mostrar los registros de terapias
def show_terapias():
    terapias_window = tk.Toplevel()
    terapias_window.title("Registros de Terapias")
    terapias_window.geometry("1600x900")

    # Crear una barra de desplazamiento vertical
    scrollbar = tk.Scrollbar(terapias_window)
    scrollbar.pack(side="right", fill="y")

    # Crear un widget de lona para mostrar los registros de terapias con la barra de desplazamiento
    canvas = tk.Canvas(terapias_window, yscrollcommand=scrollbar.set)
    canvas.pack(side="left", fill="both", expand=True)

    # Configurar la barra de desplazamiento
    scrollbar.config(command=canvas.yview)

    # Crear un marco para contener los registros de terapias
    frame = tk.Frame(canvas)
    canvas.create_window((0, 0), window=frame, anchor="nw")

    # Consultar las terapias disponibles
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM Menu_Terapias WHERE Contractura_Rodilla=1 OR Contractura_Muneca=1 OR Contractura_Codo=1 OR Contractura_Talon=1 OR Contractura_Isquiotibiale=1")
    terapias = cursor.fetchall()

    # Crear etiquetas y mostrar los registros de terapias
    terapias_label = tk.Label(frame, text="Registros de Terapias:", font=("Arial", 16, "bold"))
    terapias_label.pack()

    for terapia in terapias:
        terapia_label = tk.Label(frame, text=f"Terapia ID: {terapia[0]}", font=("Arial", 12))
        terapia_label.pack()

        if terapia[1]:
            contractura_rodilla_label = tk.Label(frame, text="Contractura rodilla", font=("Arial", 12))
            contractura_rodilla_label.pack()

        if terapia[2]:
            contractura_muneca_label = tk.Label(frame, text="Contractura muñeca", font=("Arial", 12))
            contractura_muneca_label.pack()

        if terapia[3]:
            contractura_codo_label = tk.Label(frame, text="Contractura codo", font=("Arial", 12))
            contractura_codo_label.pack()

        if terapia[4]:
            contractura_talon_label = tk.Label(frame, text="Contractura talón", font=("Arial", 12))
            contractura_talon_label.pack()

        if terapia[5]:
            contractura_isquiotibial_label = tk.Label(frame, text="Contractura isquiotibial", font=("Arial", 12))
            contractura_isquiotibial_label.pack()

        tiempo_label = tk.Label(frame, text=f"Tiempo: {terapia[6]}", font=("Arial", 12))
        tiempo_label.pack()

        separator = tk.Label(frame, text="------------------------------", font=("Arial", 12))
        separator.pack()

    # Configurar el desplazamiento del marco y de la lona
    frame.bind("<Configure>", lambda event: canvas.configure(scrollregion=canvas.bbox("all")))

    # Botón para regresar a la ventana principal
    return_button = tk.Button(terapias_window, text="Regresar", command=terapias_window.destroy)
    return_button.pack()

# Función para mostrar los registros de masajes
def show_masajes():
    masajes_window = tk.Toplevel()
    masajes_window.title("Registros de Masajes")
    masajes_window.geometry("1600x900")

    # Crear una barra de desplazamiento vertical
    scrollbar = tk.Scrollbar(masajes_window)
    scrollbar.pack(side="right", fill="y")

    # Crear un widget de lona para mostrar los registros de masajes con la barra de desplazamiento
    canvas = tk.Canvas(masajes_window, yscrollcommand=scrollbar.set)
    canvas.pack(side="left", fill="both", expand=True)

    # Configurar la barra de desplazamiento
    scrollbar.config(command=canvas.yview)

    # Crear un marco para contener los registros de masajes
    frame = tk.Frame(canvas)
    canvas.create_window((0, 0), window=frame, anchor="nw")

    # Consultar los masajes disponibles
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM Menu_Masajes WHERE Velocidad0=1 OR Velocidad1=1 OR Velocidad2=1 OR Velocidad3=1 OR Temperatura0=1 OR Temperatura1=1 OR Temperatura2=1 OR Temperatura3=1")
    masajes = cursor.fetchall()

    # Crear etiquetas y mostrar los registros de masajes
    masajes_label = tk.Label(frame, text="Registros de Masajes:", font=("Arial", 16, "bold"))
    masajes_label.pack()

    for masaje in masajes:
        masaje_label = tk.Label(frame, text=f"Masaje ID: {masaje[0]}", font=("Arial", 12))
        masaje_label.pack()

        if masaje[1]:
            velocidad0_label = tk.Label(frame, text="Velocidad 0", font=("Arial", 12))
            velocidad0_label.pack()

        if masaje[2]:
            velocidad1_label = tk.Label(frame, text="Velocidad 1", font=("Arial", 12))
            velocidad1_label.pack()

        if masaje[3]:
            velocidad2_label = tk.Label(frame, text="Velocidad 2", font=("Arial", 12))
            velocidad2_label.pack()

        if masaje[4]:
            velocidad3_label = tk.Label(frame, text="Velocidad 3", font=("Arial", 12))
            velocidad3_label.pack()

        if masaje[5]:
            temperatura0_label = tk.Label(frame, text="Temperatura 0", font=("Arial", 12))
            temperatura0_label.pack()

        if masaje[6]:
            temperatura1_label = tk.Label(frame, text="Temperatura 1", font=("Arial", 12))
            temperatura1_label.pack()

        if masaje[7]:
            temperatura2_label = tk.Label(frame, text="Temperatura 2", font=("Arial", 12))
            temperatura2_label.pack()

        if masaje[8]:
            temperatura3_label = tk.Label(frame, text="Temperatura 3", font=("Arial", 12))
            temperatura3_label.pack()

        tiempo_label = tk.Label(frame, text=f"Tiempo: {masaje[9]}", font=("Arial", 12))
        tiempo_label.pack()

        separator = tk.Label(frame, text="------------------------------", font=("Arial", 12))
        separator.pack()

    # Configurar el desplazamiento del marco y de la lona
    frame.bind("<Configure>", lambda event: canvas.configure(scrollregion=canvas.bbox("all")))

    # Botón para regresar a la ventana principal
    return_button = tk.Button(masajes_window, text="Regresar", command=masajes_window.destroy)
    return_button.pack()

# Crear la ventana principal de inicio de sesión
window = tk.Tk()
window.title("Sistema de Terapias y Masajes")
window.geometry("1600x900")

# Etiquetas y campos de entrada para el inicio de sesión
username_label = tk.Label(window, text="Usuario:")
username_label.pack()
username_entry = tk.Entry(window)
username_entry.pack()

password_label = tk.Label(window, text="Contraseña:")
password_label.pack()
password_entry = tk.Entry(window, show="*")
password_entry.pack()

login_button = tk.Button(window, text="Iniciar sesión", command=login)
login_button.pack()

register_button = tk.Button(window, text="Registrar", command=open_register_window)
register_button.pack()

window.mainloop()







