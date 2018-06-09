angular.module("angular-d3", []).factory("angularD3Svc", [function() {
    var t = 0;
    return {
        getId: function() {
            return "uid" + t++
        }
    }
}]).directive("treeChart", ['$timeout','$rootScope','$http',function ($timeout,$rootScope,$http) {
    return {
        restrict: "E",
        replace: !1,
        scope: {
            ngData: "=",
            ngCollapse: "@",
            ngNodeWidth: "@",
            ngNodeHeight: "@",
            ngDuration: "@",
            ngSpacer: "@"
        },

        link: function(t, e,scope) {
			//console.log(scope);
             scope.clickID=0;
            var r = d3.select(e[0]),
                a = d3.select(e[0].parentNode).node().getBoundingClientRect(),
                n = {
                    top: 20,
                    right: 20,
                    bottom: 20,
                    left: 20
                },
                i = a.width - n.left - n.right,
                l = a.height - n.top - n.bottom,
                c = i / 2,
                o = t.ngDuration || 750,
                d = parseInt(t.ngNodeWidth || "60"),
                s = parseInt(t.ngNodeHeight || "30"),
                u = parseInt(t.ngSpacer || s + 30);
				
				
            t.$watch("ngData", function(e) {

				d3.select("svg").remove();
                function a(t) {
					console.log(t );
                    t.children && (t._children = t.children, t._children.forEach(a), t.children = null)
                }

                function f(t) {
			console.log("asdasdasd t",t)
			//scope.clickID=t.id;
                    	var e = m.nodes(y).reverse(),
                        r = m.links(e);
                    	e.forEach(function(t) {
                        	t.y = t.depth * u
                    	});
                    var a = x.selectAll("g.node").data(e, function(t) {
                            return t.id || (t.id = ++g)
                        }),
                        n = a.enter().append("g").attr("class", "node").attr("transform", function(e) {
                            return "translate(" + t.x0 + "," + t.y0 + ")"
                        }).on("click", function(h){
				//debugger;
				console.log('h',h)
				$rootScope.clickRootSource_key=h.source_key;
				$rootScope.clickRootTarget_key=h.target_key;
				console.log("On click function...",$rootScope.clickRootSource_key);
				console.log("On click function...",$rootScope.clickRootTarget_key);
			});
						
                    n.append("rect").attr("width", d).attr("height", s).attr("stroke", "#ccc").attr("stroke-width", 1)
			.attr("class", function	(t) {
                        return t._children ? "expandable" : ""
                    	})
					
				.style("fill",function(d) 
					{
								 if(d._children)
									return 'lightsteelblue';
								else if(d.InciState=="Operational")
									return '#8bef4d';
								else if(d.InciState=="Incident")
									return '#ff505e'; 
								else if(d.InciState=="Warning")
									return '#ffdd50 ';
								else if(d.InciState=="Production")
									return '#cdcdcd ';
								else if(d.InciState=="Active")
									return 'green';
								else if(d.InciState=="InActive")
									return 'red';
								else
									return '#ccc';
	
								})
					
		   .append("title").text(function(t) {
                        return null == t.title ? "" : t.title
                    }), n.append("text").attr("x", d / 2).attr("y", s / 2).attr("dy", ".35em").attr("text-anchor", "middle").text(function(t) {
                        return t.name
                    });
                    var i = a.transition().duration(o).attr("transform", function(t) {
                        return "translate(" + t.x + "," + t.y + ")"
                    });
			//debugger;

                    i.select("rect").attr("width", d).attr("height", s).attr("stroke", "#ccc").attr("stroke-width", 1)
						.style("fill",function(d) 
								{
									 if(d._children)
									return 'lightsteelblue';
								else if(d.InciState=="Operational")
									return '#8bef4d';
								else if(d.InciState=="Incident")
									return '#ff505e';
								else if(d.InciState=="Warning")
									return '#ffdd50 '; 
								else if(d.InciState=="Production")
									return '#cdcdcd ';
								else if(d.InciState=="Active")
									return 'green';
								else if(d.InciState=="InActive")
									return 'red';
								else
								    return '#ccc';
								} ), i.select("text").style("fill-opacity", 1);
                    var l = a.exit().transition().duration(o).attr("transform", function(e) {
                        return "translate(" + t.x + "," + t.y + ")"
                    }).remove();

			//debugger;

                    l.select("rect").attr("width", d).attr("height", s).attr("stroke", "#ccc").attr("stroke-width", 1), l.select("text");
                    var c = x.selectAll("path.link")
				

                     .data(r, function(t) {
                       
			//debugger;
                       // console.log('path.link ...............',t);
                        return t.target.id
                    });

 			//console.log('After path.link t.target.id...............',c);

                    c.enter().insert("path", "g")

			     		//.attr("class", "link")
				     /*	1-Normal or part of
				  	2-ParentChild or required for
				 	3-DependsOn
    					4-AlternativeTo
					5-RelevantTo
					6-ConnectedTo
					7-Includes*/
			     .attr("stroke", function (d) { 

                             		//debugger;
                        		console.log("In c.enter().insert.............. ",d)

					if(d.target.type_id==1)
                       				return '#80dfff';
					else if(d.target.type_id==2)
                       				return '#862d59';
					else if(d.target.type_id==3)
                       				return 'blue';
					else if(d.target.type_id==4)
                       				return '#e600e6';
					else if(d.target.type_id==5)
                       				return '#006600';
					else if(d.target.type_id==6)
                       				return '#9900cc';
					else if(d.target.type_id==7)
                       				return '#ff9933';
					else
						return '#ccc';


 				}) 
                             .attr("fill",'none')
			     .attr("stroke-width",'1.5px')

			   /*  .style("fill",function(r) 
							debugger;
								console.log("stroke....",r);
								console.log("stroke r[0].target.type_id....",r[0].target.type_id);
								if(r[0].target.type_id=="5")
								return "";
								} )	*/
				
				
			     .attr("x", d / 2).attr("y", s / 2).attr("d", function(e) {
                           
                          var r = {
                            x: t.x0,
                            y: t.y0
                        };
                        return v({
                            source: r,
                            target: r
                        })
                    }), c.transition().duration(o).attr("d", v), c.exit().transition().duration(o).attr("d", function(e) {
                        var r = {
                            x: t.x,
                            y: t.y
                        };
                        return v({
                            source: r,
                            target: r
                        })
                    }).remove(), e.forEach(function(t) {
                        t.x0 = t.x, t.y0 = t.y
                    })
                }


         
                function h(t) {
                    t.children ? (t._children = t.children, t.children = null) : (t.children = t._children, t._children = null), f(t)
                }

                function p() {
                    x.attr("transform", "translate(" + d3.event.translate + ") scale(" + d3.event.scale + ")")
                }
                if (e) {
					console.log(e);
                    var g = 0,
                        m = d3.layout.tree().nodeSize([d + 10, s]),
                        v = d3.svg.diagonal().projection(function(t) {
                            return [t.x + d / 2, t.y + s / 2]
                        }),
                        x = r.append("svg").attr("width", i).attr("height", l)
                        .call(zm = d3.behavior.zoom().scaleExtent([1, 3]).on("zoom", p))
                        .append("g").attr("transform", "translate(" + c + "," + n.top + ")");
                    zm.translate([c, n.top]);
                    var y = t.ngData;
                    y.x0 = 0, y.y0 = l / 2, t.ngCollapse && y.children.forEach(a), f(y)
                }
            })
        }
    }


}]);