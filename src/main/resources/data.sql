-- ----------------------------
-- Insert into quiz table
-- ----------------------------
INSERT INTO quiz (quiz_id, quiz_name) VALUES
(1, 'Java Fundamentals'),
(2, 'OOP Concepts'),
(3, 'Multithreading & Memory Management'),
(4, 'Java Compilation & Class Loading'),
(5, 'Java Integration with Oracle'),
(6, 'Security & Permissions'),
(7, 'Java Performance & Monitoring'),
(8, 'Java Database Connectivity'),
(9, 'Tools & Utilities'),
(10, 'Web Services & Networking'),
(11, 'Advanced Concepts');

-- ----------------------------
-- Quiz 1: Java Fundamentals
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(1, 'What does JVM stand for?', 'Java Virtual Machine', 'Java Vendor Module', 'Joint Virtual Module', 'Java Value Model', 'Java Virtual Machine'),
(1, 'Which of these is not a Java keyword?', 'if', 'then', 'else', 'class', 'then'),
(1, 'Java is:', 'Compiled only', 'Interpreted only', 'Both Compiled and Interpreted', 'Neither', 'Both Compiled and Interpreted'),
(1, 'Which method is the entry point in Java?', 'start()', 'main()', 'run()', 'init()', 'main()'),
(1, 'Which of the following is not a primitive type?', 'int', 'float', 'String', 'char', 'String'),
(1, 'Which tool compiles Java code?', 'javac', 'java', 'javadoc', 'jar', 'javac'),
(1, 'Extension of compiled Java files is:', '.java', '.class', '.exe', '.jar', '.class'),
(1, 'Java was developed by:', 'Microsoft', 'Apple', 'Sun Microsystems', 'IBM', 'Sun Microsystems'),
(1, 'Which version introduced generics?', 'J2SE 1.2', 'J2SE 1.5', 'Java 11', 'Java 1.0', 'J2SE 1.5'),
(1, 'Java supports multiple inheritance through:', 'Classes', 'Interfaces', 'Packages', 'Constructors', 'Interfaces');

-- Quiz 2: OOP Concepts
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(2, 'Which is not a pillar of OOP?', 'Encapsulation', 'Inheritance', 'Compilation', 'Polymorphism', 'Compilation'),
(2, 'Java supports method overriding?', 'Yes', 'No', 'Only in static context', 'Only in constructors', 'Yes'),
(2, 'What is abstraction?', 'Hiding internal details', 'Showing all details', 'Making fields public', 'None', 'Hiding internal details'),
(2, 'Which class cannot be instantiated?', 'Static', 'Abstract', 'Final', 'Public', 'Abstract'),
(2, 'Polymorphism is:', 'Multiple forms', 'Single function', 'Only overloading', 'Encapsulation', 'Multiple forms'),
(2, 'Which keyword is used to inherit?', 'extends', 'inherits', 'super', 'this', 'extends'),
(2, 'Which method cannot be overridden?', 'public', 'static', 'private', 'protected', 'private'),
(2, 'Constructor is:', 'Method with return type', 'Special method without return type', 'Optional method', 'Static method', 'Special method without return type'),
(2, 'Which OOP concept binds data and functions?', 'Abstraction', 'Encapsulation', 'Inheritance', 'Polymorphism', 'Encapsulation'),
(2, 'Can constructors be overloaded?', 'Yes', 'No', 'Only one allowed', 'Depends on class', 'Yes');

-- Quiz 3: Multithreading & Memory Management
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(3, 'Which interface must be implemented for multithreading?', 'Runnable', 'Threadable', 'Startable', 'Concurrent', 'Runnable'),
(3, 'Which method starts a thread?', 'run()', 'start()', 'init()', 'execute()', 'start()'),
(3, 'Threads share:', 'Code only', 'Data only', 'Code and Data', 'Nothing', 'Code and Data'),
(3, 'Thread.sleep() throws:', 'IOException', 'InterruptedException', 'SleepException', 'TimeoutException', 'InterruptedException'),
(3, 'Synchronized keyword is used for:', 'Parallel execution', 'Thread safety', 'Delays', 'Recursion', 'Thread safety'),
(3, 'Default thread priority in Java is:', '0', '5', '1', '10', '5'),
(3, 'Deadlock occurs when:', 'Threads wait forever', 'Thread ends', 'Thread sleeps', 'None', 'Threads wait forever'),
(3, 'Which is a thread-safe class?', 'StringBuilder', 'Vector', 'ArrayList', 'HashMap', 'Vector'),
(3, 'To create a thread you can extend:', 'Runnable', 'Thread', 'Executor', 'Object', 'Thread'),
(3, 'ExecutorService is part of:', 'java.util.concurrent', 'java.lang', 'java.thread', 'java.executor', 'java.util.concurrent');

-- Quiz 4: Java Compilation & Class Loading
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(4, 'What is the first step in Java compilation?', 'Source code to bytecode', 'Bytecode to machine code', 'Linking', 'Loading', 'Source code to bytecode'),
(4, 'Which file contains bytecode?', '.java file', '.class file', '.exe file', '.jar file', '.class file'),
(4, 'What is the role of ClassLoader?', 'Compile source code', 'Load classes into JVM', 'Execute bytecode', 'Create objects', 'Load classes into JVM'),
(4, 'Which ClassLoader loads core Java classes?', 'Bootstrap', 'Extension', 'System', 'Application', 'Bootstrap'),
(4, 'What is the order of ClassLoader delegation?', 'Bootstrap -> Extension -> System', 'System -> Extension -> Bootstrap', 'Extension -> Bootstrap -> System', 'Random order', 'Bootstrap -> Extension -> System'),
(4, 'What happens during class initialization?', 'Static blocks execute', 'Instance variables initialize', 'Constructor runs', 'All of the above', 'All of the above'),
(4, 'Which keyword prevents class loading?', 'final', 'static', 'volatile', 'transient', 'final'),
(4, 'What is lazy loading?', 'Loading classes immediately', 'Loading classes when needed', 'Loading all classes at startup', 'Not loading classes', 'Loading classes when needed'),
(4, 'Which exception occurs during class loading?', 'ClassNotFoundException', 'NullPointerException', 'ArrayIndexOutOfBoundsException', 'IOException', 'ClassNotFoundException'),
(4, 'What is the purpose of -verbose:class flag?', 'Show compilation details', 'Show class loading details', 'Show garbage collection', 'Show thread details', 'Show class loading details');

-- Quiz 5: Java Integration with Oracle
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(5, 'What is Oracle JDBC driver class name?', 'oracle.jdbc.OracleDriver', 'com.mysql.jdbc.Driver', 'org.postgresql.Driver', 'com.sqlserver.jdbc.Driver', 'oracle.jdbc.OracleDriver'),
(5, 'Which package contains Oracle JDBC classes?', 'java.sql', 'oracle.jdbc', 'com.oracle', 'javax.sql', 'oracle.jdbc'),
(5, 'What is the default Oracle port?', '1433', '3306', '1521', '5432', '1521'),
(5, 'Which method creates Oracle connection?', 'DriverManager.getConnection()', 'OracleConnection.create()', 'Connection.new()', 'OracleDriver.connect()', 'DriverManager.getConnection()'),
(5, 'What is Oracle SID?', 'System Identifier', 'Service ID', 'Session ID', 'Server ID', 'System Identifier'),
(5, 'Which Oracle data type maps to Java String?', 'NUMBER', 'VARCHAR2', 'DATE', 'BLOB', 'VARCHAR2'),
(5, 'What is Oracle TNS?', 'Transparent Network Substrate', 'Transport Network Service', 'Transaction Network System', 'Type Network Service', 'Transparent Network Substrate'),
(5, 'Which Oracle feature provides connection pooling?', 'UCP', 'JPA', 'Hibernate', 'Spring', 'UCP'),
(5, 'What is Oracle RAC?', 'Real Application Clusters', 'Remote Access Control', 'Resource Access Control', 'Runtime Application Cache', 'Real Application Clusters'),
(5, 'Which Oracle tool is used for database administration?', 'SQL Developer', 'Eclipse', 'IntelliJ', 'NetBeans', 'SQL Developer');

-- Quiz 6: Security & Permissions
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(6, 'What is Java Security Manager?', 'Class that manages threads', 'Class that enforces security policies', 'Class that manages memory', 'Class that handles I/O', 'Class that enforces security policies'),
(6, 'Which file defines security policies?', 'policy.txt', 'security.policy', 'java.policy', 'config.policy', 'java.policy'),
(6, 'What is a SecurityException?', 'Runtime exception for security violations', 'Checked exception for I/O errors', 'Error for memory issues', 'Exception for network errors', 'Runtime exception for security violations'),
(6, 'Which permission allows file read access?', 'FilePermission', 'ReadPermission', 'AccessPermission', 'SecurityPermission', 'FilePermission'),
(6, 'What is code signing?', 'Adding comments to code', 'Digitally signing JAR files', 'Writing unit tests', 'Code review process', 'Digitally signing JAR files'),
(6, 'Which tool is used for code signing?', 'javac', 'jarsigner', 'java', 'javadoc', 'jarsigner'),
(6, 'What is a trusted certificate?', 'Any certificate', 'Certificate from trusted CA', 'Self-signed certificate', 'Expired certificate', 'Certificate from trusted CA'),
(6, 'Which security feature prevents code injection?', 'Input validation', 'Output encoding', 'Both A and B', 'Neither A nor B', 'Both A and B'),
(6, 'What is the principle of least privilege?', 'Give maximum permissions', 'Give minimum required permissions', 'Give no permissions', 'Give all permissions', 'Give minimum required permissions'),
(6, 'Which class provides cryptographic functions?', 'java.security.Cipher', 'java.crypto.Encrypt', 'java.util.Security', 'java.lang.Crypto', 'java.security.Cipher'),
(6, 'What is SSL/TLS?', 'Secure Socket Layer/Transport Layer Security', 'Simple Security Layer', 'System Security Layer', 'Server Security Layer', 'Secure Socket Layer/Transport Layer Security');

-- Quiz 7: Java Performance & Monitoring
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(7, 'What is JVM heap memory?', 'Memory for static variables', 'Memory for objects', 'Memory for threads', 'Memory for classes', 'Memory for objects'),
(7, 'Which garbage collector is default in Java 8?', 'Parallel GC', 'G1 GC', 'CMS GC', 'Serial GC', 'Parallel GC'),
(7, 'What is the purpose of -Xmx flag?', 'Set minimum heap size', 'Set maximum heap size', 'Set stack size', 'Set permgen size', 'Set maximum heap size'),
(7, 'Which tool monitors JVM performance?', 'javac', 'jconsole', 'java', 'javadoc', 'jconsole'),
(7, 'What is a memory leak?', 'Objects not garbage collected', 'Too much memory usage', 'Memory fragmentation', 'All of the above', 'Objects not garbage collected'),
(7, 'Which profiler is built into JDK?', 'VisualVM', 'JProfiler', 'YourKit', 'Eclipse MAT', 'VisualVM'),
(7, 'What is the purpose of -XX:+PrintGCDetails?', 'Print garbage collection details', 'Print thread details', 'Print class loading details', 'Print memory details', 'Print garbage collection details'),
(7, 'Which memory pool stores class metadata?', 'Eden', 'Survivor', 'Old Generation', 'Metaspace', 'Metaspace'),
(7, 'What is the purpose of -XX:+UseG1GC?', 'Enable G1 garbage collector', 'Enable parallel collector', 'Enable CMS collector', 'Enable serial collector', 'Enable G1 garbage collector'),
(7, 'Which method triggers garbage collection?', 'System.gc()', 'Runtime.gc()', 'Both A and B', 'Neither A nor B', 'Both A and B'),
(7, 'What is a memory dump?', 'Snapshot of memory state', 'Memory allocation', 'Memory deallocation', 'Memory fragmentation', 'Snapshot of memory state');

-- Quiz 8: Java Database Connectivity
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(8, 'What does JDBC stand for?', 'Java Database Connection', 'Java Data Binding Component', 'Java Database Connectivity', 'Java Data Base Control', 'Java Database Connectivity'),
(8, 'Which interface represents a database connection?', 'Connection', 'Database', 'Session', 'Link', 'Connection'),
(8, 'What is a PreparedStatement?', 'Pre-compiled SQL statement', 'Pre-defined connection', 'Pre-loaded data', 'Pre-configured database', 'Pre-compiled SQL statement'),
(8, 'Which method executes a SELECT query?', 'executeUpdate()', 'executeQuery()', 'execute()', 'executeSelect()', 'executeQuery()'),
(8, 'What is a ResultSet?', 'Database table', 'Query result container', 'Connection pool', 'Transaction object', 'Query result container'),
(8, 'Which method moves cursor to next row?', 'next()', 'moveNext()', 'advance()', 'skip()', 'next()'),
(8, 'What is connection pooling?', 'Reusing database connections', 'Creating new connections', 'Closing connections', 'Sharing connections', 'Reusing database connections'),
(8, 'Which interface manages transactions?', 'Transaction', 'Connection', 'Statement', 'ResultSet', 'Connection'),
(8, 'What is the purpose of setAutoCommit(false)?', 'Disable transactions', 'Enable manual transaction control', 'Disable connection pooling', 'Enable batch processing', 'Enable manual transaction control'),
(8, 'Which method commits a transaction?', 'commit()', 'save()', 'store()', 'write()', 'commit()'),
(8, 'What is a CallableStatement?', 'Statement for stored procedures', 'Statement for batch operations', 'Statement for transactions', 'Statement for connections', 'Statement for stored procedures'),
(8, 'Which exception is thrown for SQL errors?', 'SQLException', 'DatabaseException', 'ConnectionException', 'QueryException', 'SQLException');

-- Quiz 9: Tools & Utilities
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(9, 'What is Maven?', 'Build tool', 'IDE', 'Database', 'Web server', 'Build tool'),
(9, 'Which file contains Maven configuration?', 'pom.xml', 'build.xml', 'settings.xml', 'config.xml', 'pom.xml'),
(9, 'What is Gradle?', 'Build automation tool', 'Testing framework', 'Database tool', 'IDE plugin', 'Build automation tool'),
(9, 'Which tool is used for dependency management?', 'Maven', 'Ant', 'Make', 'GCC', 'Maven'),
(9, 'What is JUnit?', 'Testing framework', 'Build tool', 'IDE', 'Database', 'Testing framework'),
(9, 'Which annotation marks a test method?', '@Test', '@TestMethod', '@JUnit', '@TestCase', '@Test'),
(9, 'What is Log4j?', 'Logging framework', 'Database tool', 'Build tool', 'IDE', 'Logging framework'),
(9, 'Which tool analyzes code quality?', 'SonarQube', 'Maven', 'JUnit', 'Log4j', 'SonarQube'),
(9, 'What is Git?', 'Version control system', 'Build tool', 'IDE', 'Database', 'Version control system'),
(9, 'Which command commits changes in Git?', 'git commit', 'git save', 'git store', 'git push', 'git commit'),
(9, 'What is Jenkins?', 'CI/CD tool', 'Build tool', 'IDE', 'Database', 'CI/CD tool'),
(9, 'Which tool is used for code formatting?', 'Checkstyle', 'Maven', 'JUnit', 'Log4j', 'Checkstyle');

-- Quiz 10: Web Services & Networking
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(10, 'What is REST?', 'Representational State Transfer', 'Remote Service Transfer', 'Resource State Transfer', 'Request Service Transfer', 'Representational State Transfer'),
(10, 'Which HTTP method is used for creating resources?', 'GET', 'POST', 'PUT', 'DELETE', 'POST'),
(10, 'What is SOAP?', 'Simple Object Access Protocol', 'Service Oriented Architecture Protocol', 'Simple Access Protocol', 'Service Object Protocol', 'Simple Object Access Protocol'),
(10, 'Which annotation creates a REST endpoint?', '@RestController', '@Service', '@Component', '@Repository', '@RestController'),
(10, 'What is JAX-RS?', 'Java API for RESTful Services', 'Java API for XML', 'Java API for Web Services', 'Java API for JSON', 'Java API for RESTful Services'),
(10, 'Which HTTP status code indicates success?', '200', '404', '500', '302', '200'),
(10, 'What is JSON?', 'JavaScript Object Notation', 'Java Serialization Object', 'JavaScript Output Node', 'Java Service Object', 'JavaScript Object Notation'),
(10, 'Which library is used for JSON processing?', 'Jackson', 'Gson', 'Both A and B', 'Neither A nor B', 'Both A and B'),
(10, 'What is a WebSocket?', 'Full-duplex communication protocol', 'HTTP request', 'Database connection', 'File transfer protocol', 'Full-duplex communication protocol'),
(10, 'Which annotation enables WebSocket?', '@WebSocket', '@EnableWebSocket', '@Socket', '@Connection', '@EnableWebSocket'),
(10, 'What is CORS?', 'Cross-Origin Resource Sharing', 'Cross-Origin Request Service', 'Cross-Origin Response Service', 'Cross-Origin Resource Service', 'Cross-Origin Resource Sharing'),
(10, 'Which HTTP header is used for CORS?', 'Access-Control-Allow-Origin', 'Content-Type', 'Authorization', 'Accept', 'Access-Control-Allow-Origin');

-- Quiz 11: Advanced Concepts
INSERT INTO questions (quiz_id, question_text, optiona, optionb, optionc, optiond, correct_ans) VALUES
(11, 'What is reflection?', 'Examining and modifying classes at runtime', 'Looking at code in mirror', 'Code review process', 'Debugging technique', 'Examining and modifying classes at runtime'),
(11, 'Which class provides reflection capabilities?', 'Class', 'Object', 'Reflection', 'Runtime', 'Class'),
(11, 'What is annotation processing?', 'Processing annotations at compile time', 'Reading annotations at runtime', 'Creating annotations', 'Deleting annotations', 'Processing annotations at compile time'),
(11, 'Which annotation is meta-annotation?', '@Target', '@Test', '@Override', '@Deprecated', '@Target'),
(11, 'What is lambda expression?', 'Anonymous function', 'Named function', 'Static method', 'Constructor', 'Anonymous function'),
(11, 'Which functional interface has one abstract method?', 'Runnable', 'Callable', 'Supplier', 'All of the above', 'All of the above'),
(11, 'What is Stream API?', 'API for processing collections', 'API for file I/O', 'API for networking', 'API for database', 'API for processing collections'),
(11, 'Which method is terminal operation?', 'map()', 'filter()', 'collect()', 'distinct()', 'collect()'),
(11, 'What is Optional class?', 'Container for null values', 'Container for objects', 'Container for primitives', 'Container for arrays', 'Container for objects'),
(11, 'Which method checks if Optional has value?', 'isPresent()', 'hasValue()', 'contains()', 'exists()', 'isPresent()'),
(11, 'What is CompletableFuture?', 'Future with completion stage', 'Thread pool', 'Executor service', 'Scheduled executor', 'Future with completion stage'),
(11, 'Which method creates async task?', 'supplyAsync()', 'runAsync()', 'Both A and B', 'Neither A nor B', 'Both A and B');

-- ----------------------------
-- (Optional) Insert student test entry
-- ----------------------------
INSERT INTO student (student_id, name, email_id, password) VALUES
(1, 'Test Student', 'student@test.com', 'password123');

