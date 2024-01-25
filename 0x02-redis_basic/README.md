<h1>Redis Basic Tasks</h1>

<h2>Tasks To Complete</h2>

<ol>
    <li>
        <p>Writing strings to Redis</p>
        <p>exercise.py contains a Python script that meets the following requirements:</p>
        <ul>
            <li>Create a Cache class. In the __init__ method, store an instance of the Redis client as a private variable named _redis (using redis.Redis()) and flush the instance using flushdb.</li>
            <li>Create a store method that takes a data argument and returns a string. The method should generate a random key (e.g. using uuid), store the input data in Redis using the random key and return the key.</li>
            <li>Type-annotate store correctly. Remember that data can be a str, bytes, int or float.</li>
        </ul>
    </li>
    <li>
        <p>Reading from Redis and recovering original type</p>
        <p>exercise.py contains a Python script with the following updates to the previous task:</p>
        <ul>
            <li>Redis only allows to store string, bytes and numbers (and lists thereof). Whatever you store as single elements, it will be returned as a byte string. Hence if you store "a" as a UTF-8 string, it will be returned as b"a" when retrieved from the server.</li>
            <li>In this exercise we will create a get method that take a key string argument and an optional Callable argument named fn. This callable will be used to convert the data back to the desired format.</li>
            <li>Remember to conserve the original Redis.get behavior if the key does not exist.</li>
            <li>Also, implement 2 new methods: get_str and get_int that will automatically parametrize Cache.get with the correct conversion function.</li>
            <li>The following code should not raise an Exception:</li>
            <code>
                cache = Cache()
                TEST_CASES = {
                    b"foo": None,
                    123: int,
                    "bar": lambda d: d.decode("utf-8")
                }
                for value, fn in TEST_CASES.items():
                    key = cache.store(value)
                    assert cache.get(key, fn=fn) == value
            </code>
        </ul>
    </li>
    <li>
        <p>Incrementing values</p>
        <p>exercise.py contains a Python script with the following updates to the previous task:</p>
        <ul>
            <li>Familiarize yourself with the INCR command and its python equivalent.</li>
            <li>In this task, we will implement a system to count how many times methods of the Cache class are called.</li>
            <li>Above Cache define a count_calls decorator that takes a single method Callable argument and returns a Callable.</li>
            <li>As a key, use the qualified name of method using the __qualname__ dunder method.</li>
            <li>Create and return function that increments the count for that key every time the method is called and returns the value returned by the original method.</li>
            <li>Remember that the first argument of the wrapped function will be self which is the instance itself, which lets you access the Redis instance.</li>
            <li>Protip: when defining a decorator it is useful to use functool.wraps to conserve the original function’s name, docstring, etc. Make sure you use it as described here.</li>
            <li>Decorate Cache.store with count_calls.</li>
        </ul>
    </li>
    <li>
        <p>Storing lists</p>
        <p>exercise.py contains a Python script with the following updates to the previous task:</p>
        <ul>
            <li>Familiarize yourself with redis commands RPUSH, LPUSH, LRANGE, etc.</li>
            <li>In this task, we will define a call_history decorator to store the history of inputs and outputs for a particular function.</li>
            <li>Everytime the original function will be called, we will add its input parameters to one list in redis, and store its output into another list.</li>
            <li>In call_history, use the decorated function’s qualified name and append ":inputs" and ":outputs" to create input and output list keys, respectively.</li>
            <li>call_history has a single parameter named method that is a Callable and returns a Callable.</li>
            <li>In the new function that the decorator will return, use rpush to append the input arguments. Remember that Redis can only store strings, bytes and numbers. Therefore, we can simply use str(args) to normalize. We can ignore potential kwargs for now.</li>
            <li>Execute the wrapped function to retrieve the output. Store the output using rpush in the "...:outputs" list, then return the output.</li>
            <li>Decorate Cache.store with call_history.</li>
        </ul>
    </li>
    <li>
        <p>Retrieving lists</p>
        <p>exercise.py contains a Python script with the following updates to the previous task:</p>
        <ul>
            <li>In this task, we will implement a replay function to display the history of calls of a particular function.</li>
            <li>The output generated should look like this:</li>
            <code>
                &gt;&gt;&gt; cache = Cache()
                &gt;&gt;&gt; cache.store("foo")
                &gt;&gt;&gt; cache.store("bar")
                &gt;&gt;&gt; cache.store(42)
                &gt;&gt;&gt; replay(cache.store)
                Cache.store was called 3 times:
                Cache.store(*('foo',)) -&gt; 13bf32a9-a249-4664-95fc-b1062db2038f
                Cache.store(*('bar',)) -&gt; dcddd00c-4219-4dd7-8877-66afbe8e7df8
                Cache.store(*(42,)) -&gt; 5e752f2b-ecd8-4925-a3ce-e2efdee08d20
            </code>
        </ul>
    </li>
    <li>
        <p>Implementing an expiring web cache and tracker</p>
        <p>web.py contains a Python script that meets the following requirements:</p>
        <ul>
            <li>In this tasks, we will implement a get_page function (prototype: def get_page(url: str) -&gt; str:). The core of the function is very simple. It uses the requests module to obtain the HTML content of a particular URL and returns it.</li>
            <li>Start in a new file named web.py and do not reuse the code written in exercise.py.</li>
            <li>Inside get_page track how many times a particular URL was accessed in the key "count:{url}" and cache the result with an expiration time of 10 seconds.</li>
            <li>Tip: Use http://slowwly.robertomurray.co.uk to simulate a slow response and test your caching.</li>
            <li>Bonus: implement this use case with decorators.</li>
        </ul>
    </li>
</ol>