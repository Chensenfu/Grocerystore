$(function () {
    /* 客服 */
    var qq_chat = true;
    $('#service').click(function () {
        if (qq_chat) {
            popwin = window.location.href = 'tencent://message/?uin=984180458&Site=小霸王.html&Menu=yes';
        }
    });
    setTimeout("PlayJsAdPopWin()", 1000);
    //详情-图片和评价切换
    $(".xiangqing").click(function () {
        $(".xiangqing").addClass("p");
        $(".pingjia").removeClass("p");
        $("#xiangqing").show();
        $("#pingjia").hide();
    })
    $(".pingjia").click(function () {
        $(".pingjia").addClass("p");
        $(".xiangqing").removeClass("p");
        $("#xiangqing").hide();
        $("#pingjia").show();
    })
    /* 发表评价 */
    /* $(".btn").click(function() {
        var li = $("<li></li>");
        var num = Math.ceil(Math.random() * 9);
        var div = $("<div class=touxiang><img src='img/xiaobawang0" + num + ".jpg'/></div>");
        var textarea = $(".sharecontent").val();
        var h1 = $("<h1>五星好评:<span>" + textarea + "</span></h1>");
        var p = $("<p></p>");
        var sec = $("#sec").val();
        var span1 = $("<span>型号：" + sec + "</span>");
        var d = new Date();
        var dStr = d.getFullYear() + "-" + (d.getMonth() + 1);
        var span2 = $("<span>分享时间：" + dStr + "</span>");
        var div2  = $("<div id='star_grade'></div>");
        p.append(span1).append(span2);
        li.append(div).append(h1).append(p).append(div2);
        $("#postList").prepend(li);
        $("#post").hide();
        $(".bbs").show();
        $(".sharecontent").val("");
    }); */
    //数量加减
    $(".reduce").click(function () {
        var count = parseInt($(".amount").val()) - 1;
        if (count < 1) {
            alert("不能再减了，再减就没有啦！");
        } else {
            $(".amount").val(count);
        }
    })
    $(".increase").click(function () {
        var count = parseInt($(".amount").val()) + 1;
        $(".amount").val(count);
    });
    //相关分类
    $("dl").toggle(function () {
            $(this).find("dd").slideDown("slow");
        },
        function () {
            $(this).find("dd").slideUp("fast");
        }
    )
    //价格切换
    /*$(function () {
        $("#jingjie2").click(function () {
            $(".newprice").html("￥98");
            $(".oldprice").html("￥107");
        })
        $("#putong").click(function () {
            $(".newprice").html("￥78.3");
            $(".oldprice").html("￥87");
        })
        $("#jingjie1").click(function () {
            $(".newprice").html("￥88");
            $(".oldprice").html("￥97");
        })
    })*/
});
(function ($, window, document, undefined) {
    var Marking = function (ele, opt) {
        this.$element = ele,
            this.defaults = {
                'height': 20,
                'width': 20,
                'spaceBetween': 2,
                'backgroundImageInitial': 'images/star_hollow.png', //图标初始样式
                'backgroundImageOver': 'images/star_solid.png', //点击后图标
                'num': 5, //图标数量
                'havePoint': false, //是否有小数
                'haveGrade': false, //是否有分数
                'unit': '', //单位内容
                'grade': 0, //分数
            },
            this.options = $.extend({}, this.defaults, opt)
    }
    //定义Marking的方法
    Marking.prototype = {
        setImages: function () {
            var htmlItem = '<div class="set_image_item"><img style="height:100%;" src="' + this.options.backgroundImageInitial + '" alt=""></div>';
            var htmlAll = '';
            for (var i = 0; i < this.options.num; i++) {
                htmlAll = htmlItem + htmlAll;
            }
            ;
            var html = '<div class="set_image_all">' + htmlAll + '</div>';
            return this.$element.append(html);
        },
        //初始状态
        begin: function () {
            var that = this.$element;
            var This = this;
            var grade = this.options.grade;
            if (This.options.haveGrade) {
                that.append('<span class="grade">' + grade + This.options.unit + '</span>');
                that.find('.grade').css({
                    'display': 'inline-block',
                    'height': This.options.height + 'px',
                    'line-height': This.options.height + 'px',
                })
            }
            console.log(This.options.height)
            that.find('.set_image_item').css({
                'height': This.options.height + 'px',
                'width': This.options.width + 'px',
            })
            var htmlTop = '';
            console.log(Math.ceil(grade))
            for (var i = 0; i < Math.ceil(grade); i++) {
                htmlTop = htmlTop + '<div><img style="height:100%;" src="' + This.options.backgroundImageOver + '" alt=""></div>';
            }
            that.find('.set_image_all').append('<div class="set_image_top">' + htmlTop + '</div>');
            that.find('.set_image_top>div').css({
                'height': This.options.height + 'px',
                'width': This.options.width + 'px',
            })
            if ((This.options.havePoint) && (grade % 1 != 0)) {
                that.find('.set_image_top>div').last().css({
                    'width': This.options.width * (grade - Math.floor(grade)) + 'px',
                })
            }
        },
        // 点击改变显示
        clickChangeAll: function () {
            var that = this.$element;
            var This = this;
            var grade = this.options.grade;
            that.find('.set_image_item').click(function (e) {
                grade = $(this).index() + 1
                // console.log(grade)
                that.find('.set_image_top').remove()
                var htmlTop = '';
                for (var i = 0; i <= $(this).index(); i++) {
                    htmlTop = htmlTop + '<div><img style="height:100%;" src="' + This.options.backgroundImageOver + '" alt=""></div>';
                }
                that.find('.set_image_all').append('<div class="set_image_top">' + htmlTop + '</div>');
                that.find('.set_image_top>div').css({
                    'height': This.options.height + 'px',
                    'width': This.options.width + 'px',
                    'margin-right': This.options.spaceBetween + 'px',
                })
                // 判断需要小数
                if (This.options.havePoint) {
                    var X1 = e.pageX - $(this).offset().left;
                    console.log(X1)
                    that.find('.set_image_top>div').last().css({
                        'width': X1 + 'px',
                    })
                    grade = grade + X1 / This.options.width - 1;
                    grade = grade.toFixed(1)
                    // console.log(grade)  
                }
                // 添加分数
                if (This.options.haveGrade) {
                    that.find('.grade').remove()
                    that.append('<span class="grade">' + grade + This.options.unit + '</span>');
                    that.find('.grade').css({
                        'display': 'inline-block',
                        'height': This.options.height + 'px',
                        'line-height': This.options.height + 'px',
                    })
                }
            })

        },
        // 添加样式
        myCss: function () {
            $('.set_image_item').parent().css({
                'display': 'inline-block',
            })
            $('.set_image_item').css({
                'margin-right': this.options.spaceBetween + 'px',
            })
            $('.set_image_top>div').css({
                'margin-right': this.options.spaceBetween + 'px',
            })
        }
    }
    //在插件中使用markingSystem对象
    $.fn.markingSystem = function (options) {
        //创建Beautifier的实体
        var marking = new Marking(this, options);
        //调用其方法
        marking.setImages();
        marking.begin();
        marking.clickChangeAll();
        return marking.myCss();
    }
})(jQuery, window, document);