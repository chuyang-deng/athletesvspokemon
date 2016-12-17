
	connection.query("SET @rank = 0");
	connection.query("SET @sport = (select sport from Athletes where name = \"Michael Phelps\")");
	connection.query("SET @athRank = (select rank from (select @rank:=@rank+1 as rank, name from (select a.name from Athletes a inner join Medal m on a.name = m.name where a.sport = @sport order by m.score DESC) as prerank) as rank where name = \"Michael Phelps\")");
	connection.query("SET @athTotal = @rank");
	connection.query("SET @type = (select type from Activities where sport = @sport)");
	connection.query("SET @pokeTotal = (select count(*) from Pokemon where type = @type)");
	connection.query("SET @pokeRank = ceiling(@athRank * (@pokeTotal * 1.0 / @athTotal))");

	connection.query("SET @rank = 0");
	connection.query("select rank2.* from (select @rank:=@rank+1 as rank, prerank2.* from (select * from Pokemon where type = @type order by total DESC) as prerank2) as rank2 where rank = @pokeRank");


SET @rank = 0;
SET @sport = (select sport from Athletes where name = "Michael Phelps");
SET @athRank = (select rank from (select @rank:=@rank+1 as rank, name 
								  from (select a.name 
										from Athletes a inner join Medal m on a.name = m.name 
										where a.sport = @sport 
										order by m.score DESC) as prerank) as rank 
						 	where name = "Michael Phelps");
SET @athTotal = @rank;
SET @type = (select type from Activities where sport = @sport);
SET @pokeTotal = (select count(*) from Pokemon where type = @type);
SET @pokeRank = ceiling(@athRank * (@pokeTotal * 1.0 / @athTotal));

SET @rank = 0;
select name, total, image_no from (select @rank:=@rank+1 as rank, prerank2.* 
								   from (select * from Pokemon 
								   	     where type = @type 
								   	     order by total DESC) as prerank2) as rank2 
							 where rank = @pokeRank;




Helge Meeuw

            <h3 id = "poke0"><%=result[0].name+"; "+result[0].total+"; "+result[0].image_no %></h3>
            <h3 id = "poke1"><%=result[1].name+"; "+result[1].total+"; "+result[1].image_no %></h3>
            <h3 id = "poke2"><%=result[2].name+"; "+result[2].total+"; "+result[2].image_no %></h3>
            <h3 id = "poke3"><%=result[3].name+"; "+result[3].total+"; "+result[3].image_no %></h3>
            <h3 id = "poke4"><%=result[4].name+"; "+result[4].total+"; "+result[4].image_no %></h3>
            <h3 id = "poke5"><%=result[5].name+"; "+result[5].total+"; "+result[5].image_no %></h3>
            <h3 id = "poke6"><%=result[6].name+"; "+result[6].total+"; "+result[6].image_no %></h3>
            <h3 id = "poke7"><%=result[7].name+"; "+result[7].total+"; "+result[7].image_no %></h3>
            <h3 id = "poke8"><%=result[8].name+"; "+result[8].total+"; "+result[8].image_no %></h3>
            <h3 id = "poke9"><%=result[9].name+"; "+result[9].total+"; "+result[9].image_no %></h3>
            <h3 id = "poke10"><%=result[10].name+"; "+result[10].total+"; "+result[10].image_no %></h3>
            <h3 id = "poke11"><%=result[11].name+"; "+result[11].total+"; "+result[11].image_no %></h3>
            <h3 id = "poke12"><%=result[12].name+"; "+result[12].total+"; "+result[12].image_no %></h3>
            <h3 id = "poke13"><%=result[13].name+"; "+result[13].total+"; "+result[13].image_no %></h3>
            <h3 id = "poke14"><%=result[14].name+"; "+result[14].total+"; "+result[14].image_no %></h3>
            <h3 id = "poke15"><%=result[15].name+"; "+result[15].total+"; "+result[15].image_no %></h3>
            <h3 id = "poke16"><%=result[16].name+"; "+result[16].total+"; "+result[16].image_no %></h3>
            <h3 id = "poke17"><%=result[17].name+"; "+result[17].total+"; "+result[17].image_no %></h3>
            <h3 id = "poke18"><%=result[18].name+"; "+result[18].total+"; "+result[18].image_no %></h3>
            <h3 id = "poke19"><%=result[19].name+"; "+result[19].total+"; "+result[19].image_no %></h3>




               <section>

      <div id="content">
        <img src=<%= url0 %> class="imagesRow" />
        <img src=<%= url0 %> class="imagesRow" />
        <img src=<%= url0 %> class="imagesRow" />
        <img src=<%= url0 %> class="imagesRow" />
      </div>

        <div class="container-fluid">
          <h1>Hello World!</h1>
          <p>Resize the browser window to see the effect.</p>
          <div class="row">
            <div class="col-sm-3" ><img src=<%= url0 %> class="imagesRow" /></div>
            <div class="col-sm-3" ><img src=<%= url0 %> class="imagesRow" /></div>
            <div class="col-sm-3" ><img src=<%= url0 %> class="imagesRow" /></div>
            <div class="col-sm-3" ><img src=<%= url0 %> class="imagesRow" /></div>
          </div>
        </div>

      <div id="content">
        <button id = "guess_button3" onclick="popup(false)" class="btn btn-warning btn-lg"><%= other[10].name %></button>
        <button id = "guess_button3" onclick="popup(false)" class="btn btn-warning btn-lg"><%= other[10].name %></button>
        <button id = "guess_button3" onclick="popup(false)" class="btn btn-warning btn-lg"><%= other[10].name %></button>
        <button id = "guess_button3" onclick="popup(false)" class="btn btn-warning btn-lg"><%= other[10].name %></button>
      </div>
      <h2 id = "right or wrong" class = "text-center"></h2>
      <div>
      </div>
        </section>




        <div class = "guess_options" id = "option0">
          <% var url0 = "https://s3-us-west-2.amazonaws.com/pokemonimage/image/"+ other[0].image_no +".png" %>
          <img id = "img1" class = "guess_images" src = <%= url0 %>>
          <h3 id = "total1" style="visibility:hidden;"><%=other[0].total%></h3>
          <button id = "guess_button1" onclick="popup(true)" class="btn btn-warning btn-lg"><%= other[0].name %></button>
        </div>

        <div class = "guess_options" id = "option1">
          <% var url1 = "https://s3-us-west-2.amazonaws.com/pokemonimage/image/"+ other[10].image_no +".png" %>
          <img id = "img2" class = "guess_images" src=<%= url1 %>>
          <h3 id = "total2" style="visibility:hidden;"><%=other[10].total%></h3>
          <button id = "guess_button2" onclick="popup(false)" class="btn btn-warning btn-lg"><%= other[10].name %></button>
        </div>
        <div class = "guess_options" id = "option0">
          <% var url0 = "https://s3-us-west-2.amazonaws.com/pokemonimage/image/"+ other[0].image_no +".png" %>
          <img id = "img1" class = "guess_images" src = <%= url0 %>>
          <h3 id = "total1" style="visibility:hidden;"><%=other[0].total%></h3>
          <button id = "guess_button1" onclick="popup(true)" class="btn btn-warning btn-lg"><%= other[0].name %></button>
        </div>

        <div class = "guess_options" id = "option1">
          <% var url1 = "https://s3-us-west-2.amazonaws.com/pokemonimage/image/"+ other[10].image_no +".png" %>
          <img id = "img2" class = "guess_images" src=<%= url1 %>>
          <h3 id = "total2" style="visibility:hidden;"><%=other[10].total%></h3>
          <button id = "guess_button2" onclick="popup(false)" class="btn btn-warning btn-lg"><%= other[10].name %></button>
        </div>


set @rank = 0;
select rank, name, year from (select @rank:=@rank+1 as rank, name, year from (select a.name, a.year from AthleticsView a inner join Medal m on a.name = m.name order by m.score DESC) as prerank) as rankkk order by rank;
