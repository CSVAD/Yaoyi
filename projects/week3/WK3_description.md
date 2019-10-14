#  WK3 description

Recently I am taking photography courses online, and those are my favorite photos taken by my teacher:

![](https://github.com/CSVAD/Yaoyi/blob/master/projects/week3/ref/ref1.jpg)
Image credit from my Photography teacher at Weibo [@刘顺儿妞](https://www.weibo.com/secretphotography?topnav=1&wvr=6&topsug=1&sudaref=www.weibo.com&display=0&retcode=6102&is_hot=1#_loginLayer_1570839167869)

![](https://github.com/CSVAD/Yaoyi/blob/master/projects/week3/ref/ref2.jpg)
Image credit from my Photography teacher at Weibo [@刘顺儿妞](https://www.weibo.com/secretphotography?topnav=1&wvr=6&topsug=1&sudaref=www.weibo.com&display=0&retcode=6102&is_hot=1#_loginLayer_1570839167869)

I love the feeling that snowing and flower  falling will bring about. So I would like to implement those effects in the virtual world. Since I also did a project about implementing snow falling effect using WebGL and Javascript when I was in UPenn, I would like to try implementing snow falling or flower falling effect again using Processing. 

The general idea of generating this effect is to paint ellipse every in every frame. A for loop will randomly generate snowflakes, and in draw function the ellipse will be updated every time it is processed. But we have to clear the screen every frame so that the snowflakes we painted late time will not stay on the screen. There are two parameters can be changed, one is the falling speed and the other is the snowflake size. When the parameters are change the result will be different. 

