var print_log=true;
var start_debug=false;
function getUrlParam(name) {

    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象

    var r = window.location.search.substr(1).match(reg);  //匹配目标参数

    if (r != null) return unescape(r[2]);

    return null; //返回参数值

}

/**
 * 打印
 * @param data
 */
function log(data) {
    if(print_log)
    {
        console.log("data:"+JSON.stringify(data));
    }
}

function debug(){
    if(start_debug){

        debugger;
    }
}

/**
 * 去登录
 */
function  go_login() {
    sessionStorage.removeItem("username");
    $(location).prop("href","login.jsp");

}