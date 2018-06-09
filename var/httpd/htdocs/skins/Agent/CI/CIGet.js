angular.module("angular-d3", []).factory("angularD3Svc", [function() {
    var t = 0;
    return {
        getId: function() {
            return "uid" + t++
        }
    }
}]).directive("horizontalTreeChart", function() {
    return {
        restrict: "E",
        replace: !1,
        scope: {
            ngData: "=",
            ngCollapse: "@",
            ngSpacer: "@"
        },
        link: function(t, e) {
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
                c = parseInt(t.ngSpacer || "180");
            t.$watch("ngData", function(e) {
            	debugger;
                function a(t) {
                    t.children && (t._children = t.children, t._children.forEach(a), t.children = null)
                }

                function o(t) {
                    var e = f.nodes(d).reverse(),
                        r = f.links(e);
                    e.forEach(function(t) {
                        t.y = t.depth * c
                    });
                    var a = p.selectAll("g.node").data(e, function(t) {
                            return t.id || (t.id = ++s)
                        }),
                        n = a.enter().append("g").attr("class", "node").attr("transform", function(e) {
                            return "translate(" + t.y0 + "," + t.x0 + ")"
                        }).on("click", function(t) {
                            t.children ? (t._children = t.children, t.children = null) : (t.children = t._children, t._children = null), o(t)
                        });
                    n.append("circle").attr("r", 1e-6).style("fill", function(t) {
                        return t._children ? "lightsteelblue" : "#fff"
                    }), n.append("text").attr("x", function(t) {
                        return t.children || t._children ? -13 : 13
                    }).attr("dy", ".35em").attr("text-anchor", function(t) {
                        return t.children || t._children ? "end" : "start"
                    }).text(function(t) {
                        return t.name
                    }).style("fill-opacity", 1e-6);
                    var i = a.transition().duration(u).attr("transform", function(t) {
                        return "translate(" + t.y + "," + t.x + ")"
                    });
                    i.select("circle").attr("r", 10).style("fill", function(t) {
                        return t._children ? "lightsteelblue" : "#fff"
                    }), i.select("text").style("fill-opacity", 1);
                    var l = a.exit().transition().duration(u).attr("transform", function(e) {
                        return "translate(" + t.y + "," + t.x + ")"
                    }).remove();
                    l.select("circle").attr("r", 1e-6), l.select("text").style("fill-opacity", 1e-6);
                    var g = p.selectAll("path.link").data(r, function(t) {
                        return t.target.id
                    });
                    g.enter().insert("path", "g")
                   // .attr("class", "link")
                     .attr("stroke", function (d) { 

                             		debugger;
                        		console.log("In c.enter().insert.............. ",d)

					if(d.target.type_id==1)
                       				return '#80dfff';
					else if(d.target.type_id==2)
                       				return '#862d59';
					else if(d.target.type_id==3)
                       				return 'blue';
					else if(d.target.type_id==4)
                       				return '#ff6699';
					else if(d.target.type_id==5)
                       				return '#006600';
					else if(d.target.type_id==6)
                       				return '#ffff00';
					else if(d.target.type_id==7)
                       				return '#ff9933';
					//else
						//return '#ccc';


 				}) 
                 .attr("fill",'none')
			     .attr("stroke-width",'1.5px')  
                    .attr("d", function(e) {
                        var r = {
                            x: t.x0,
                            y: t.y0
                        };
                        return h({
                            source: r,
                            target: r
                        })
                    }), g.transition().duration(u).attr("d", h), g.exit().transition().duration(u).attr("d", function(e) {
                        var r = {
                            x: t.x,
                            y: t.y
                        };
                        return h({
                            source: r,
                            target: r
                        })
                    }).remove(), e.forEach(function(t) {
                        t.x0 = t.x, t.y0 = t.y
                    })
                }
                if (e) {
                    var d, s = 0,
                        u = 750,
                        f = d3.layout.tree().size([l, i]),
                        h = d3.svg.diagonal().projection(function(t) {
                            return [t.y, t.x]
                        });
                    r.selectAll("*").remove();
                    var p = r.append("svg").attr("width", i + n.right + n.left).attr("height", l + n.top + n.bottom).append("g").attr("transform", "translate(" + n.left + "," + n.top + ")");
                    d = t.ngData, d.x0 = l / 2, d.y0 = 0, t.ngCollapse && d.children.forEach(a), o(d)
                }
                
            })// watch function closing
        }// link function closing
    }
});



