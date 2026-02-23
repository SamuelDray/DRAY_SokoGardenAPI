from flask import*
import pymysql
import os
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'static/images'
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

# products route
@app.route("/api/add_product", methods=["POST"])
def add_product():
    product_name=request.form['product_name']
    product_description=request.form['product_description']
    product_category=request.form['product_category']
    product_cost=request.form['product_cost']
    product_image=request.files['product_image']
    print(product_name, product_description, product_category, product_cost, product_image)
    # Get image name
    image_name=product_image.filename
    
    # Save the image to folder
    file_path=os.path.join(app.config['UPLOAD_FOLDER'], image_name)
    product_image.save(file_path)

    connection=pymysql.connect(host='localhost', user='root', password='', database='dray_sokogarden')
    cursor=connection.cursor(pymysql.cursors.DictCursor)

    sql="insert into product_details (product_name, product_description, product_category, product_cost, product_image) values (%s, %s, %s, %s, %s)"
    data=(product_name, product_description, product_category, product_cost, product_image.filename)

    cursor.execute(sql, data)
    connection.commit()

    return jsonify({"message":"Product added successfully"})


@app.route("/api/get_products")
def get_products():
    connection=pymysql.connect(host='localhost', user='root', password='', database='dray_sokogarden')
    cursor=connection.cursor(pymysql.cursors.DictCursor)
    sql="select * from product_details"
    cursor.execute(sql)
    if cursor .rowcount==0:
        return jsonify({"message":"No products found"})
    else:
        products = cursor.fetchall()
        return jsonify(products)






if __name__ == "__main__":
    app.run(debug=True)