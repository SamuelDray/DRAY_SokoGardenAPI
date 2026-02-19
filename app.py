from flask import*
import pymysql
app = Flask(__name__)
@app.route("/api/signup", methods=["POST"])
def signup ():
    username=request.form['username']
    email=request.form['email']
    phone=request.form['phone']
    password=request.form['password']
    print(username, email, phone, password)
    
    # create connection to db
    connection = pymysql.connect(host="localhost", user="root", password="", database="dray_sokogarden")

    # create cursor to handle sql queries
    cursor=connection.cursor()

    # create the sql query
    sql="insert into users (username, email, phone, password) values (%s, %s, %s, %s)"
    print(sql)

    # data to be saved
    data=(username, email, phone, password)
    print(data)


    # execute the sql query
    cursor.execute(sql, data)

    # Save data
    connection.commit()

    # Return the response
    return jsonify({"message":"Sign up successful"})

# login route
@app.route("/api/login", methods=["POST"])
def login():
    email=request.form['email']
    password=request.form['password']
    print(email, password)

    # Create a connection to the database
    connection=pymysql.connect(host="localhost", user="root", password="", database="dray_sokogarden")

    # Create a cursor to handle SQL queries
    # cursor=connection.cursor()

    # cursor to fetch data as a ky - value pair
    cursor = connection.cursor(pymysql.cursors.DictCursor)

    # Create the SQL query to execute
    sql="SELECT user_id, username, email, phone FROM users WHERE email=%s AND password=%s"

    # Data to execute the query
    data=(email, password)

    # Execute the SQL query
    cursor.execute(sql, data)

    # Check resulting rows
    if cursor.rowcount == 0:
        return jsonify({"message":"Invalid Credentials"})
    else:
        # Get the user data
        user=cursor.fetchone()
        return jsonify({"message":"Login successful", "user": user})









if __name__ == "__main__":
    app.run(debug=True)