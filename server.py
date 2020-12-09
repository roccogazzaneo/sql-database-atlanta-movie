#!flask/bin/python
from __future__ import print_function
from flask import Flask, jsonify, abort, request, make_response, url_for, redirect, session
from flask import render_template, redirect
from flask_session import Session

import pymysql
import sys

USERNAME = 'root'
PASSWORD = 'password'
DB_NAME = 'Team52'
HOST = '127.0.0.1'

app = Flask(__name__, static_url_path="")
app.config['SESSION_TYPE'] = 'filesystem'
app.config['SESSION_FILE_DIR'] = '.flask_sessions'
Session(app)

def get_states():
    states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA", 
              "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", 
              "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", 
              "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", 
              "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    return states

def get_states_filter():
    states = ["ALL", "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA", 
              "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", 
              "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", 
              "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", 
              "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    return states

def get_statuses():
    statuses = ["ALL", "Pending", "Declined", "Approved"]
    return statuses


def get_conn():
    conn = pymysql.connect (    
                                host = HOST,
                                user = USERNAME,
                                passwd = PASSWORD,
                                db = DB_NAME,
                                port = 3306
                            )
    return conn

def get_companies():
    conn = get_conn()
    cursor = conn.cursor()
    companies = ["ALL"]
    cursor.execute("SELECT company_name FROM Team52.company")
    results = cursor.fetchall()
    for result in results:
        companies.append(result[0])
    cursor.close()
    conn.close()
    return companies

def get_movies():
    conn = get_conn()
    cursor = conn.cursor()
    movies = ["ALL"]
    cursor.execute("SELECT movie_name FROM Team52.movie")
    results = cursor.fetchall()
    for result in results:
        movies.append(result[0])
    cursor.close()
    conn.close()
    return movies

def get_theaters():
    conn = get_conn()
    cursor = conn.cursor()
    theaters = ["ALL"]
    cursor.execute("SELECT theater_name FROM Team52.theater")
    results = cursor.fetchall()
    for result in results:
        theaters.append(result[0])
    cursor.close()
    conn.close()
    return theaters

@app.route('/', methods=['GET'])
def login_page():
    return render_template('login.html')

@app.route('/register', methods=['GET'])
def user_registration_page():
    return render_template('index.html')

@app.route('/functionality', methods=['GET'])
def functionality_page():
    isAdmin = session['isAdmin']
    isManager = session['isManager']
    isCustomer = session['isCustomer']

    if isAdmin:
        if isCustomer:
            user_type = "Admin-Customer"
        else:
            user_type = "Admin"
    elif isManager:
        if isCustomer:
            user_type = "Manager-Customer"
        else:
            user_type = "Manager"
    else:
        if isCustomer:
            user_type = "Customer"
        else:
            user_type = "User"

    return render_template('functionality.html', isAdmin=isAdmin, isManager=isManager, isCustomer=isCustomer, user_type=user_type)

@app.route('/user/login', methods=['POST'])
def user_login():
    conn = get_conn()
    cursor = conn.cursor()
    username = request.form['username']
    password = request.form['password']
    args = (username, password)
    print("args: {}".format(args))
    cursor.callproc('user_login', args)
    #result = result[0][0]
    conn.commit()
    cursor.execute("SELECT * FROM UserLogin")
    result = cursor.fetchall()
    print("result: {}".format(result))
    if result == ():
        conn.commit()
        cursor.close()
        conn.close()
        return redirect('/')
    else:
        cursor.execute("SELECT * FROM UserLogin")
        result = cursor.fetchall()
        username, status, isCustomer, isAdmin, isManager = result[0]
        print("username: {}".format(username))
        print("status: {}".format(status))
        print("isAdmin: {}".format(isAdmin))
        print("isCustomer: {}".format(isCustomer))
        print("isManager: {}".format(isManager))
        session['username'] = username
        session['status'] = status
        session['isAdmin'] = isAdmin
        session['isCustomer'] = isCustomer
        session['isManager'] = isManager
        conn.commit()
        cursor.close()
        conn.close()
        return redirect('/functionality')

@app.route('/user/register', methods=['GET', 'POST'])
def user_register():
    if request.method == 'POST':
        conn = get_conn()
        cursor = conn.cursor()
        firstname = request.form['firstname']
        lastname = request.form['lastname']
        username = request.form['username']
        password = request.form['password']
        confirm_password = request.form['confirm_password']
        #TODO: display error message when passwords dont match?
        if password != confirm_password:
            return redirect('/user/register')
        args = (username, password, firstname, lastname)
        cursor.callproc('user_register', args)
        conn.commit()
        cursor.close()
        conn.close()
        return redirect('/')
    else:
        return render_template('user_registration.html')

@app.route('/users', methods=['GET'])
def users():
    conn = get_conn()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Team52.users")
    users = cursor.fetchall()
    for user in users:
        print(user)
    args = (1, 2)
    cursor.callproc('debug_msg', args)
    msg = cursor.fetchall()
    print("msg: {}".format(msg))
    return redirect('/')

@app.route('/customer/register', methods=['GET', 'POST'])
def customer_register():
    if request.method == 'POST':
        if request.form['type'] == 'add':
            if request.form['card_number'] == "":
                return render_template('customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5)
            card_number = int(request.form['card_number'])
            print("card number : {}".format(card_number))
            if len(session['cards']) < 5 and card_number not in session['cards']:
                session['cards'].append(card_number)
            print("Cardcheck: {}".format(len(session['cards'])<5))
            return render_template('customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5)
        elif request.form['type'] == 'remove':
            remove_number = request.form['remove']
            print("remove number : {}".format(remove_number))
            if remove_number in session['cards']:
                session['cards'].remove(remove_number)
            return render_template('customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5)
        else:
            if len(session['cards']) == 0:
                print("no cards!")
                return render_template('customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5)
            else:
                conn = get_conn()
                cursor = conn.cursor()
                firstname = request.form['firstname']
                lastname = request.form['lastname']
                username = request.form['username']
                password = request.form['password']
                confirm_password = request.form['confirm_password']
                #TODO: display error message when passwords dont match?
                if password != confirm_password:
                    return redirect('/customer/register')
                args = (username, password, firstname, lastname)
                #TODO: Cleanup customer register and add cards across types of users
                cursor.callproc('customer_only_register', args)
                result = cursor.fetchall()
                print("register result: {}".format(result))
                for card in session['cards']:
                    args = (username, card)
                    cursor.callproc('customer_add_creditcard', args)
                conn.commit()
                cursor.close()
                conn.close()
                return redirect('/')
    else:
        session['cards'] = []
        return render_template('customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5)

@app.route('/manager/register', methods=['GET', 'POST'])
def manager_register():
    if request.method == 'POST':
        conn = get_conn()
        cursor = conn.cursor()
        firstname = request.form['firstname']
        lastname = request.form['lastname']
        username = request.form['username']
        password = request.form['password']
        confirm_password = request.form['confirm_password']
        company = request.form['company']
        street_address = request.form['street_address']
        city = request.form['city']
        state = request.form['state']
        zipcode = request.form['zipcode']
        #TODO: display error message when passwords dont match?
        if password != confirm_password:
            return redirect('/manager/register')
        args = (username, password, firstname, lastname, company, street_address, city, state, zipcode)
        cursor.callproc('manager_only_register', args)
        msg = cursor.fetchall()
        print("args: {}".format(args))
        print("msg: {}".format(msg))
        conn.commit()
        cursor.close()
        conn.close()
        return redirect('/')
    else:
        conn = get_conn()
        cursor = conn.cursor()
        cursor.execute("SELECT company_name FROM Team52.company")
        company_names = cursor.fetchall()
        cursor.close()
        conn.close()
        names = []
        for name in company_names:
            names.append(name[0])
        print("company_names: {}".format(names))
        return render_template('manager_registration.html', company_names=names, states=get_states())

@app.route('/manager_customer/register', methods=['GET', 'POST'])
def manager_customer_register():
    if request.method == 'POST':
        conn = get_conn()
        cursor = conn.cursor()
        cursor.execute("SELECT company_name FROM Team52.company")
        company_names = cursor.fetchall()
        if request.form['type'] == 'add':
            if request.form['card_number'] == "":
                return render_template('manager_customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5, company_names=company_names, states=get_states())
            card_number = int(request.form['card_number'])
            print("card number : {}".format(card_number))
            if len(session['cards']) < 5 and card_number not in session['cards']:
                session['cards'].append(card_number)
            print("Cardcheck: {}".format(len(session['cards'])<5))
            return render_template('manager_customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5, company_names=company_names, states=get_states())
        elif request.form['type'] == 'remove':
            remove_number = request.form['remove']
            print("remove number : {}".format(remove_number))
            if remove_number in session['cards']:
                session['cards'].remove(remove_number)
            return render_template('manager_customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5, company_names=company_names, states=get_states())
        else:
            if len(session['cards']) == 0:
                return render_template('manager_customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5, company_names=company_names, states=get_states())
            else:
                conn = get_conn()
                cursor = conn.cursor()
                firstname = request.form['firstname']
                lastname = request.form['lastname']
                username = request.form['username']
                company = request.form['company']
                password = request.form['password']
                confirm_password = request.form['confirm_password']
                street_address = request.form['street_address']
                city = request.form['city']
                state = request.form['state']
                zipcode = request.form['zipcode']
                #TODO: display error message when passwords dont match?
                if password != confirm_password:
                    return redirect('/manager_customer/register')
                args = (username, password, firstname, lastname, company, street_address, city, state, zipcode)
                cursor.callproc('manager_customer_register', args)
                for card in session['cards']:
                    args = (username, card)
                    cursor.callproc('manager_customer_add_creditcard', args)
                conn.commit()
                cursor.close()
                conn.close()
                return redirect('/')
    else:
        conn = get_conn()
        cursor = conn.cursor()
        cursor.execute("SELECT company_name FROM Team52.company")
        company_names = cursor.fetchall()
        session['cards'] = []
        return render_template('manager_customer_registration.html', cards=session['cards'], not_max=len(session['cards'])<5, company_names=company_names, states=get_states())

@app.route('/manage_user_sort/<field>', methods=['GET', 'POST'])
def manage_user_sort(field):
    if session['args'][2] == field and session['args'][3] == "ASC":
        session['args'] = [session['args'][0], session['args'][1], field, "DESC"]
    else:
        session['args'] = [session['args'][0], session['args'][1], field, "ASC"]
    return redirect('/manage_user/false')

@app.route('/manage_user/<init>', methods=['GET', 'POST'])
def manage_user(init):
    conn = get_conn()
    cursor = conn.cursor()
    if request.method == "GET":
        if init == "true":
            args = ("", "ALL", "", "")
            session['args'] = args
        else:
            args = session['args']
        cursor.callproc('admin_filter_user', args)
        cursor.execute("SELECT * FROM AdFilterUser")
        result = cursor.fetchall()
        #print("manage user result: {}".format(result))
        users = result
        statuses = get_statuses()
        conn.commit()
        cursor.close()
        conn.close()
        return render_template('manage_user.html', users=users, statuses=statuses)

    elif request.method == "POST":
        if request.form['type'] == "filter":
            status = request.form['status']
            username = request.form['username']
            args = (username, status, "", "")
            session['args'] = args
            cursor.callproc('admin_filter_user', args)
            conn.commit()
            cursor.execute("SELECT * FROM AdFilterUser")
            result = cursor.fetchall()
            #print("manage user result: {}".format(result))
            users = result
            statuses = get_statuses()
            cursor.close()
            conn.close()
            return render_template('manage_user.html', users=users, statuses=get_statuses())
        elif request.form['type'] == "action":
            try:
                username = request.form['user']
            except:
                return redirect('/manage_user/false')
            action = request.form['action']
            print("action: {}".format(action))
            if action == "approve":
                args = (username,)
                print("args: {}".format(args))
                cursor.callproc('admin_approve_user', args)
            elif action == "decline":
                #args = (username)
                #args = ("m")
                args = (username,)
                print("args: {}".format(args))
                cursor.callproc('admin_decline_user', args)
            args = session['args']
            cursor.callproc('admin_filter_user', args)
            conn.commit()
            cursor.execute("SELECT * FROM AdFilterUser")
            result = cursor.fetchall()
            users = result
            return render_template('manage_user.html', users=users, statuses=get_statuses())

@app.route('/manage_company_sort/<field>', methods=['GET', 'POST'])
def manage_company_sort(field):
    if session['args'][7] == field and session['args'][8] == "ASC":
        args = [session['args'][i] for i in range(7)]
        args.append(field)
        args.append("DESC")
    else:
        args = [session['args'][i] for i in range(7)]
        args.append(field)
        args.append("ASC")
    #print("sort args: {}".format(args))
    session['args'] = args
    return redirect('/manage_company/false')

@app.route('/manage_company/<init>', methods=['GET', 'POST'])
def manage_company(init):
    conn = get_conn()
    cursor = conn.cursor()
    if request.method == "GET":
        if init == "true":
            args = ("ALL", None, None, None, None, None, None, "", "")
            session['args'] = args
        else:
            args = session['args']
        cursor.callproc('admin_filter_company', args)
        cursor.execute("SELECT * FROM AdFilterCom")
        result = cursor.fetchall()
        #print("manage company result: {}".format(result))
        companies = result
        conn.commit()
        cursor.close()
        conn.close()
        return render_template('manage_company.html', companies=companies, company_names=get_companies())

    elif request.method == "POST":
        if request.form['type'] == "filter":
            comName = request.form['comName']
            minCity = request.form['minCity']
            minCity = None if (minCity ==  "") else minCity
            maxCity = request.form['maxCity']
            maxCity = None if (maxCity ==  "") else maxCity
            minTheater = request.form['minTheater']
            minTheater = None if (minTheater ==  "") else minTheater
            maxTheater = request.form['maxTheater']
            maxTheater = None if (maxTheater ==  "") else maxTheater
            minEmployee = request.form['minEmployee']
            minEmployee = None if (minEmployee ==  "") else minEmployee
            maxEmployee = request.form['maxEmployee']
            maxEmployee = None if (maxEmployee ==  "") else maxEmployee
            args = (comName, minCity, maxCity, minTheater, maxTheater, minEmployee, maxEmployee, "", "")
            print("filter args: {}".format(args))
            session['args'] = args
            cursor.callproc('admin_filter_company', args)
            conn.commit()
            cursor.execute("SELECT * FROM AdFilterCom")
            result = cursor.fetchall()
            companies = result
            cursor.close()
            conn.close()
            return render_template('manage_company.html', companies=companies, company_names=get_companies())
        elif request.form['type'] == "detail":
            try:
                company_name = request.form['company_name']
            except:
                company_name = "None"
            return redirect('/company_detail/{}'.format(company_name))

@app.route('/company_detail/<company_name>', methods=['GET'])
def company_detail(company_name):
    if company_name == "None":
        return redirect('/manage_company/false')
    conn = get_conn()
    cursor = conn.cursor()
    args = (company_name,)
    cursor.callproc('admin_view_comDetail_th', args)
    cursor.callproc('admin_view_comDetail_emp', args)
    conn.commit()
    cursor.execute("SELECT * FROM AdComDetailTh")
    theaters = cursor.fetchall()
    cursor.execute("SELECT * FROM AdComDetailEmp")
    employees = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('company_detail.html', theaters=theaters, employees=employees, company_name=company_name)

@app.route('/create_theater', methods=['GET', 'POST'])
def create_theater():
    if request.method == 'POST':
        conn = get_conn()
        cursor = conn.cursor()
        name = request.form['name']
        company = request.form['company']
        street_address = request.form['street_address']
        city = request.form['city']
        state = request.form['state']
        zipcode = request.form['zipcode']
        capacity = request.form['capacity']
        manager = request.form['manager']
        args = (name, company, street_address, city, state, zipcode, capacity, manager)
        cursor.callproc('admin_create_theater', args)
        msg = cursor.fetchall()
        print("theater create msg: {}".format(msg))
        conn.commit()
        cursor.close()
        conn.close()
        return redirect('/manage_company/true')
    else:
        conn = get_conn()
        cursor = conn.cursor()
        cursor.execute("SELECT company_name FROM Team52.company")
        company_names = cursor.fetchall()
        cursor.execute("SELECT * from available_managers")
        managers = cursor.fetchall()
        managers = [manager[0] for manager in managers]
        cursor.close()
        conn.close()
        return render_template('create_theater.html', company_names=company_names, states=get_states(), managers=managers)

@app.route('/create_movie', methods=['GET', 'POST'])
def create_movie():
    conn = get_conn()
    cursor = conn.cursor()
    if request.method == 'POST':
        movName = request.form['movName']
        movDuration = request.form['movDuration']
        movReleaseDate = request.form['movReleaseDate']
        args = (movName, movDuration, movReleaseDate)
        cursor.callproc('admin_create_mov', args)
        msg = cursor.fetchall()
        print("create movie msg: {}".format(msg))
        conn.commit()
        cursor.close()
        conn.close()
        return redirect('/functionality')
    else:
        return render_template('create_movie.html')

@app.route('/theater_overview/<init>', methods=['GET', 'POST'])
def theater_overview(init):
    conn = get_conn()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM UserLogin") 
    result = cursor.fetchall()
    username, status, isCustomer, isAdmin, isManager = result[0]
    if request.method == 'GET':
        if init == "true":
            args = (username, "", None, None, None, None, None, None, None)
            session['args'] = args
        else:
            args = session['args']
        cursor.callproc('manager_filter_th', args)
        conn.commit()
        msg = cursor.fetchall()
        print("th overview msg: {}".format(msg))
        if msg == "Manager does not manage a theater":
            return redirect('/functionality')
        cursor.execute("SELECT * FROM ManFilterTh")
        movies = cursor.fetchall()
        cursor.close()
        conn.close()
        return render_template('theater_overview.html', movies=movies)
    else:
        movName = request.form['movName']
        minMovDuration = request.form['minMovDuration']
        minMovDuration = None if (minMovDuration ==  "") else minMovDuration
        maxMovDuration = request.form['maxMovDuration']
        maxMovDuration = None if (maxMovDuration ==  "") else maxMovDuration
        minMovReleaseDate = request.form['minMovReleaseDate']
        minMovReleaseDate = None if (minMovReleaseDate ==  "") else minMovReleaseDate
        maxMovReleaseDate = request.form['maxMovReleaseDate']
        maxMovReleaseDate = None if (maxMovReleaseDate ==  "") else maxMovReleaseDate
        minMovPlayDate = request.form['minMovPlayDate']
        minMovPlayDate = None if (minMovPlayDate ==  "") else minMovPlayDate
        maxMovPlayDate = request.form['maxMovPlayDate']
        maxMovPlayDate = None if (maxMovPlayDate ==  "") else maxMovPlayDate
        try:
            includedNotPlay = request.form['includedNotPlay']
        except:
            includedNotPlay = "No"
        print("includedNotPlay: {}".format(includedNotPlay))
        includedNotPlay = False if (includedNotPlay == "No") else True
        args = (username, movName, minMovDuration, maxMovDuration, minMovReleaseDate, maxMovReleaseDate, minMovPlayDate, maxMovPlayDate, includedNotPlay)
        print("filter args: {}".format(args))
        session['args'] = args
        cursor.callproc('manager_filter_th', args)
        conn.commit()
        cursor.execute("SELECT * FROM ManFilterTh")
        result = cursor.fetchall()
        movies = result
        cursor.close()
        conn.close()
        return render_template('theater_overview.html', movies=movies)

@app.route('/schedule_movie', methods=['GET', 'POST'])
def schedule_movie():
    conn = get_conn()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM UserLogin") 
    result = cursor.fetchall()
    username, status, isCustomer, isAdmin, isManager = result[0]
    if request.method == 'POST':
        movName = request.form['movName']
        movReleaseDate = request.form['movReleaseDate']
        movPlayDate = request.form['movPlayDate']
        if movReleaseDate == "" or movPlayDate == "":
            return redirect('/schedule_movie')
        args = (username, movName, movReleaseDate, movPlayDate)
        cursor.callproc('manager_schedule_mov', args)
        msg = cursor.fetchall()
        print("schedule movie msg: {}".format(msg))
        conn.commit()
        cursor.close()
        conn.close()
        return redirect('/functionality')
    else:
        args = (username, "", None, None, None, None, None, None, None)
        cursor.callproc('manager_filter_th', args)
        conn.commit()
        cursor.execute("SELECT * FROM ManFilterTh")
        result = cursor.fetchall()
        movie_names = [movie[0] for movie in result]
        cursor.close()
        conn.close()
        return render_template('schedule_movie.html', movie_names=movie_names)

@app.route('/explore_movie/<init>', methods=['GET', 'POST'])
def explore_movie(init):
    conn = get_conn()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM UserLogin") 
    result = cursor.fetchall()
    username, status, isCustomer, isAdmin, isManager = result[0]
    statement = "SELECT creditcardnum FROM creditcard WHERE username = \"{}\"".format(username)
    print("statement: {}".format(statement))
    cursor.execute(statement)
    #cursor.execute("SELECT creditcardnum FROM creditcard WHERE username = \"{}\"".format(username))
    cards = cursor.fetchall()
    print("cards: {}".format(cards))
    cards = [card[0] for card in cards]
    print("cards: {}".format(cards))
    if request.method == "GET":
        if init == "true":
            args = ("ALL", "ALL", "", "ALL", None, None)
            session['args'] = args
        else:
            args = session['args']
        cursor.callproc('customer_filter_mov', args)
        cursor.execute("SELECT * FROM CosFilterMovie")
        movies = cursor.fetchall()
        #print("movies: {}".format(movies))
        conn.commit()
        cursor.close()
        conn.close()
        return render_template('explore_movie.html', movies=movies, movie_names=get_movies(), company_names=get_companies(), states=get_states_filter(), cards=cards)

    elif request.method == "POST":
        if request.form['type'] == "filter":
            movName = request.form['movName']
            comName = request.form['comName']
            city = request.form['city']
            state = request.form['state']
            minMovPlayDate = request.form['minMovPlayDate']
            minMovPlayDate = None if (minMovPlayDate ==  "") else minMovPlayDate
            maxMovPlayDate = request.form['maxMovPlayDate']
            maxMovPlayDate = None if (maxMovPlayDate ==  "") else maxMovPlayDate
            args = (movName, comName, city, state, minMovPlayDate, maxMovPlayDate)
            session['args'] = args
            cursor.callproc('customer_filter_mov', args)
            conn.commit()
            cursor.execute("SELECT * FROM CosFilterMovie")
            movies = cursor.fetchall()
            cursor.close()
            conn.close()
            return render_template('explore_movie.html', movies=movies, movie_names=get_movies(), company_names=get_companies(), states=get_states_filter(), cards=cards)
        elif request.form['type'] == "view":
            cursor.execute("SELECT * FROM CosFilterMovie")
            movies = cursor.fetchall()
            try:
                movIndex = request.form['movie_index']
                movIndex = int(movIndex)
                card = request.form['card']
            except:
                return redirect('/explore_movie/false')
            movie = movies[movIndex]
            args = (card, movie[0], movie[8], movie[1], movie[6], movie[7]) 
            cursor.callproc('customer_view_mov', args)
            conn.commit()
            return redirect('/explore_movie/false')

@app.route('/view_history', methods=['GET'])
def view_history():
    conn = get_conn()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM UserLogin") 
    result = cursor.fetchall()
    username, status, isCustomer, isAdmin, isManager = result[0]
    args = (username,)
    cursor.callproc('customer_view_history', args)
    conn.commit()
    cursor.execute("SELECT * FROM CosViewHistory")
    visits = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('view_history.html', visits=visits)

@app.route('/explore_theater/<init>', methods=['GET', 'POST'])
def explore_theater(init):
    conn = get_conn()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM UserLogin") 
    result = cursor.fetchall()
    username, status, isCustomer, isAdmin, isManager = result[0]
    if request.method == "GET":
        if init == "true":
            args = ("ALL", "ALL", "", "ALL")
            session['args'] = args
        else:
            args = session['args']
        cursor.callproc('user_filter_th', args)
        cursor.execute("SELECT * FROM UserFilterTh")
        theaters = cursor.fetchall()
        conn.commit()
        cursor.close()
        conn.close()
        return render_template('explore_theater.html', theaters=theaters, theater_names=get_theaters(), company_names=get_companies(), states=get_states_filter())

    elif request.method == "POST":
        if request.form['type'] == "filter":
            thName = request.form['theaterName']
            comName = request.form['comName']
            city = request.form['city']
            state = request.form['state']
            args = (thName, comName, city, state)
            session['args'] = args
            cursor.callproc('user_filter_th', args)
            cursor.execute("SELECT * FROM UserFilterTh")
            theaters = cursor.fetchall()
            conn.commit()
            cursor.close()
            conn.close()
            return render_template('explore_theater.html', theaters=theaters, theater_names=get_theaters(), company_names=get_companies(), states=get_states_filter())
        elif request.form['type'] == "view":
            cursor.execute("SELECT * FROM UserFilterTh")
            theaters = cursor.fetchall()
            try:
                theaterIndex = request.form['theater_index']
                theaterIndex = int(theaterIndex)
                visit_date = request.form['visit_date']
            except:
                return redirect('/explore_theater/false')
            theater = theaters[theaterIndex]
            print("theater: {}".format(theater))
            args = (theater[0], theater[5], visit_date, username) 
            print("explore theater args: {}".format(args))
            cursor.callproc('user_visit_th', args)
            conn.commit()
            return redirect('/explore_theater/false')

@app.route('/visit_history/<init>', methods=['GET', 'POST'])
def visit_history(init):
    conn = get_conn()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM UserLogin") 
    result = cursor.fetchall()
    username, status, isCustomer, isAdmin, isManager = result[0]
    if request.method == "GET":
        if init == "true":
            args = (username, None, None)
            session['args'] = args
        else:
            args = session['args']
        cursor.callproc('user_filter_visitHistory', args)
        cursor.execute("SELECT * FROM UserVisitHistory")
        visits = cursor.fetchall()
        conn.commit()
        cursor.close()
        conn.close()
        return render_template('visit_history.html', visits=visits, company_names=get_companies())

    elif request.method == "POST":
        if request.form['type'] == "filter":
            comName = request.form['comName']
            minVisitDate = request.form['minVisitDate']
            minVisitDate = None if (minVisitDate ==  "") else minVisitDate
            maxVisitDate = request.form['maxVisitDate']
            maxVisitDate = None if (maxVisitDate ==  "") else maxVisitDate
            args = (username, minVisitDate, maxVisitDate)
            session['args'] = args
            cursor.callproc('user_filter_visitHistory', args)
            cursor.execute("SELECT * FROM UserVisitHistory")
            visits = cursor.fetchall()
            conn.commit()
            cursor.close()
            conn.close()
            return render_template('visit_history.html', visits=visits, company_names=get_companies())

if __name__ == '__main__':
     app.run(debug=True, port=80, host = '0.0.0.0')
