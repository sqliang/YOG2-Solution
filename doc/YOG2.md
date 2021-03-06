# 命令行

## 常用命令

启动yog web服务器 命令
```
npm run debug-win
```
启动App发布命令
```
yog2 release debug -w -L --fis3
```
## 命令详解

监听文件修改，对修改文件进行增量编译并发布

```
yog2 release debug --watch
```

监听文件修改，并自动刷新页面
> 自动刷新页面需要下载 livereload 插件，
> 并且 yog2 release 命令执行后需手动刷新一次页面

```
yog2 release debug --watch --live
```

压缩静态资源

```
yog2 release debug --optimize
```

为静态资源添加MD5后缀

```
yog2 release debug --md5
```

打包静态资源

```
yog2 release debug --pack
```

为静态资源添加 domain

```
yog2 release debug --domains
```

上述的所有参数均可以组合使用，比如使用以下命令

```
yog2 release --watch --live --optimize --md5 --domains --pack --dest debug
```

这些参数还提供了缩写和组合的功能，比如上述的命令缩写后可以写成

```
yog2 release -w -L -o -m -D -p -d debug
```

# 开发区别

## less编写区别

- 需要手动加上width 和 height,部分需要加上'inline-block'、overflow:hidden;
- 图片路径写相对路径，需要图片合并的后面加上'?__sprite'

```css
width: 68px;
height: 68px;
background-image: url('../images/icon/search.png?__sprite');
```

## js 模块化开发区别

- widget 中的组建会自动加模块包裹
```javascript
define(id, function(require, exports, module) {
    // body...
})
```

- static中的js可以调用static中的js,前提是需要封装
- page/widget中的tpl都可以可以嵌入{% script %} 标签, 然后使用模块调用
    也可以嵌入{% require '' %}，但是这种要求js是非模块化的

### Usage
- Demo1

```javascript
// index.tpl
{% require 'easydesign:static/js/index.js' %}

// easydesign:static/js/index.js
var result = require('easydesign:widget/js/mock.js');
require('easydesign:widget/js/jquery/jquery');
alert(result);
$('.nav2').hide();

// easydesign:widget/js/mock.js
module.exports = 'A';
```
- Demo2

```javascript
// index.tpl
{% require 'easydesign:static/js/index.js' %}

// easydesign:static/js/index.js
var result = require('easydesign:widget/js/mock.js');
alert(result);

// easydesign:widget/js/mock.js
require('easydesign:widget/js/jquery/jquery');
$('.nav2').hide();
module.exports = 'A';
```
- Demo3
```javascript
// index.tpl
{% widget 'easydesign:widget/tpl/banner/banner.tpl' %}

// widget/tpl/banner/banner.tpl
{% script %}
    var result = require('easydesign:widget/js/mock.js');
    alert(result.string());
{% endscript %}

// widget/js/mock.js
module.exports.string = 'A';
module.exports.val = function() {
    return 'This is a Function';
}
```

## mod

> lib 统一打包为一个文件
> 业务js写到 static 下，并且定义为模块，然后手动设置文件的打包

- 加载 js 
```
 require('common:jquery'); 
```

- 加载 css
```
  require.loadCss({url: 'static/common/static/js/lib/layer/skin/layer.css'}); 
```