# dhbwvs-quiz-mtfrnn
Public collaboration for DHBW VS Quiz Group: mtfrnn

## Single Page application
### Architecture
#### Tier 1: User Interface
Following the workflow described in 'the job'.<br>
The user interface is the users way of interacting with the application.
#### Tier 2: Logic 
Javascript logic on the client side.<br>
The javascript logic is supposed to control the application in the background by feeding the model with data from the database and controlling database access/ communicating with TIER 3 compliant to the interface Definition. Asynchronous communication will be used to realize this layer.
#### Tier 3: Database
Database model will be attached in the files.
Redbean to be used to set up a REST compliant interface.

#### Testing
For REST Functions postman will be used:
<div class="postman-run-button"
data-postman-action="collection/import"
data-postman-var-1="4f963c18c654341d5504"></div>
<script type="text/javascript">
  (function (p,o,s,t,m,a,n) {
    !p[s] && (p[s] = function () { (p[t] || (p[t] = [])).push(arguments); });
    !o.getElementById(s+t) && o.getElementsByTagName("head")[0].appendChild((
      (n = o.createElement("script")),
      (n.id = s+t), (n.async = 1), (n.src = m), n
    ));
  }(window, document, "_pm", "PostmanRunObject", "https://run.pstmn.io/button.js"));
</script>

#### Interface
 [Interface Definition](http://htmlpreview.github.com/?https://github.com/kuromogeko/dhbwvs-quiz-mtfrnn/blob/master/Dokumentation/schnittstellenDefinitionRedBean.html)<br>
[Database Tables](https://github.com/kuromogeko/dhbwvs-quiz-mtfrnn/blob/master/Dokumentation/eer_quiz_vs.png)
## Folder structure Explanation

The following folders are to be used with the following description:

- Dokumentation: holding all the documentations and interface descriptions
- Application: holds the application divided by the parts
  - cordova: contains the Apache Cordova web application structure. Entry point is {app-name}/www/index.html
  - php: holds the php files which are used as REST Client

