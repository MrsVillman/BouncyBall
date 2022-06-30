import Foundation

// Circle
let circle = OvalShape(width: 150, height: 150)


// Polygon (rectangular) Barrier
let barrierWidth = 300.0
let barrierHeight = 25.0

let barrierPoints = [
    Point(x: 0, y: 0),
    Point(x: 0, y: barrierHeight),
    Point(x: barrierWidth, y: barrierHeight),
    Point(x: barrierWidth, y: 0)
]

let barrier = PolygonShape(points: barrierPoints)

// Funnel
let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]

let funnel = PolygonShape(points: funnelPoints)


/*
The setup() function is called once when the app launches. Without it, your app won't compile.
Use it to set up and start your app.

You can create as many other functions as you want, and declare variables and constants,
at the top level of the file (outside any function). You can't write any other kind of code,
for example if statements and for loops, at the top level; they have to be written inside
of a function.
*/

func setup() {
    
    // Add circle to the scene
    circle.position = Point(x: 250, y: 400)
    circle.hasPhysics = true
    scene.add(circle)
    
    // Add barrier to the scene
    barrier.position = Point(x: 200, y: 150)
    barrier.hasPhysics = true
    scene.add(barrier)
    barrier.isImmobile = true
    
    // Add funnel to the scene
    funnel.position = Point(x: 200, y: scene.height - 25)
    scene.add(funnel)
    
    // callback for when user clicks funnel (like onEvents)
    funnel.onTapped = dropBall
}

// Drops the ball by moving it to the funnel's position
func dropBall() {
    circle.position = funnel.position
}


// to save to GitHub
// Source Control > New Git Rep.

