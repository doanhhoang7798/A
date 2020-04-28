<%-- 
    Document   : product
    Created on : Mar 2, 2019, 11:44:32 PM
    Author     : Hp-Pc
--%>

<div class="product">
    <div class="item">
        <a href="?id=${item.getId()}"><h2>${item.getName()}</h2></a>
        <div class="contentProduct">
            <img src="${item.getImg()}"/>
            <div class="fulldescription">
                ${item.getShortdescription()}
            </div>

        </div>
    </div>
</div>
