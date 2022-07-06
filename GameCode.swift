import Foundation

// Circle
let ball = OvalShape(width: 150, height: 150)


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

fileprivate func ballFunc() {
    // Add circle to the scene
    ball.position = Point(x: 40, y: 40)
    ball.hasPhysics = true
    ball.fillColor = .blue
    scene.add(ball)
}

fileprivate func barrierFunc() {
    // Add barrier to the scene
    barrier.position = Point(x: 200, y: 150)
    barrier.hasPhysics = true
    barrier.fillColor = .brown
    scene.add(barrier)
    barrier.isImmobile = true
}

fileprivate func funnelFunc() {
    // Add funnel to the scene
    funnel.position = Point(x: 200,
                            y: scene.height - 25)
    funnel.fillColor = .gray
    scene.add(funnel)
    // callback for when user clicks funnel (like onEvents)
    funnel.onTapped = dropBall
}

func setup() {
    ballFunc()
    barrierFunc()
    funnelFunc()
}

// Drops the ball by moving it to the funnel's position
func dropBall() {
    ball.position = funnel.position
}





// to save to GitHub
// Source Control > New Git Rep. > create
// Source nav tab (second from left in left pane) > Repositories > right click on project >
// new ____ remote > create
//
// save after first time
// Source Control > commit > check "push to remote" (lower left) >
//comment > commit
// if you forgot to push to remote go to Source Control > push
//
