{% extends 'common:page/layout.tpl' %}


{% block content %}

</br>
</br>
</br>
</br>
</br>

isVip: {{isVip}}

<ul>
{% for item in getUserInfoList %}
    <li>{{item.lastTime}}</li>
    <li>{{item.userPwd}}</li>
    <li>{{item.userName}}</li>
    <li>{{item.userId}}</li>
    <li>{{item.createTime}}</li>
    -----------------------------
{% endfor %}
</ul>

   {% require 'common:static/js/bus/test.js' %}


{% endblock %}