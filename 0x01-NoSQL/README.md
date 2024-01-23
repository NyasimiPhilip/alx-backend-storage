<h1>Alx Backend Storage - NoSQL Tasks</h1>

<h2>Task 0: List all databases</h2>
<p>Write a script that lists all databases in MongoDB.</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 0-list_databases | mongo
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.6.3
admin        0.000GB
config       0.000GB
local        0.000GB
logs         0.005GB
bye
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 0-list_databases</li>
</ul>

<h2>Task 1: Create a database</h2>
<p>Write a script that creates or uses the database my_db:</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 1-use_or_create_database | mongo
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.6.3
switched to db my_db
bye
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 1-use_or_create_database</li>
</ul>

<h2>Task 2: Insert document</h2>
<p>Write a script that inserts a document in the collection school:</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 2-insert | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
WriteResult({ "nInserted" : 1 })
bye
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 2-insert</li>
</ul>

<!-- Repeat similar sections for the remaining tasks -->

<h2>Task 3: All documents</h2>
<p>Write a script that lists all documents in the collection school:</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 3-all | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
{ "_id" : ObjectId("5a8fad532b69437b63252406"), "name" : "Holberton school" }
bye
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 3-all</li>
</ul>

<h2>Task 4: All matches</h2>
<p>Write a script that lists all documents with name="Holberton school" in the collection school:</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 4-match | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
{ "_id" : ObjectId("5a8fad532b69437b63252406"), "name" : "Holberton school" }
bye
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 4-match</li>
</ul>

<h2>Task 5: Count</h2>
<p>Write a script that displays the number of documents in the collection school:</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 5-count | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
1
bye
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 5-count</li>
</ul>

<h2>Task 6: Update</h2>
<p>Write a script that adds a new attribute to a document in the collection school:</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 6-update | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
bye
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 6-update</li>
</ul>

<h2>Task 7: Delete by match</h2>
<p>Write a script that deletes all documents with name="Holberton school" in the collection school:</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 7-delete | mongo my_db
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017/my_db
MongoDB server version: 3.6.3
{ "acknowledged" : true, "deletedCount" : 1 }
bye
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 7-delete</li>
</ul>

<h2>Task 8: List all documents in Python</h2>
<p>Write a Python function that lists all documents in a collection:</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 8-main.py
#!/usr/bin/env python3
""" 8-main """
from pymongo import MongoClient
list_all = __import__('8-all').list_all

if __name__ == "__main__":
    client = MongoClient('mongodb://127.0.0.1:27017')
    school_collection = client.my_db.school
    schools = list_all(school_collection)
    for school in schools:
        print("[{}] {}".format(school.get('_id'), school.get('name')))
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 8-all.py</li>
</ul>

<h2>Task 9: Insert a document in Python</h2>
<p>Write a Python function that inserts a new document in a collection based on kwargs:</p>
<pre>
guillaume@ubuntu:~/0x01$ cat 9-main.py
#!/usr/bin/env python3
""" 9-main """
from pymongo import MongoClient
list_all = __import__('8-all').list_all
insert_school = __import__('9-insert_school').insert_school

if __name__ == "__main__":
    client = MongoClient('mongodb://127.0.0.1:27017')
    school_collection = client.my_db.school
    new_school_id = insert_school(school_collection, name="UCSF", address="505 Parnassus Ave")
    print("New school created: {}".format(new_school_id))

    schools = list_all(school_collection)
    for school in schools:
        print("[{}] {} {}".format(school.get('_id'), school.get('name'), school.get('address', "")))
</pre>
<p><strong>Repo:</strong></p>
<ul>
    <li>GitHub repository: alx-backend-storage</li>
    <li>Directory: 0x01-NoSQL</li>
    <li>File: 9-insert_school.py</li>
</ul>