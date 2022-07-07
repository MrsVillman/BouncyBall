import Foundation

//creating barriers
var barriers: [Shape] = []

//creating targets
var targets: [Shape] = []

// Circle
let ball = OvalShape(width: 150, height: 150)

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

func setupBall() {
    ball.onTapped = resetGame
    // Add circle to the scene
    ball.position = Point(x: 200, y: scene.height - 25)
    scene.add(ball)
    ball.hasPhysics = true
    ball.fillColor = .blue
    ball.onCollision = ballCollided(with:)
    ball.isDraggable = false
    scene.trackShape(ball)
    ball.onExitedScene = ballExitedScene
    ball.bounciness = 0.6
    
}

func addBarrier(position: Point, width: Double, height: Double, angle: Double) {
    //creating new barrier and appending to the barrier array
    let barrierPoints = [
        Point(x: 0, y: 0),
        Point(x: 0, y: height),
        Point(x: width, y: height),
        Point(x: width, y: 0)
    ]
    
    let barrier = PolygonShape(points: barrierPoints)
    
    barriers.append(barrier)
    // Add barrier to the scene
    barrier.position = position
    barrier.hasPhysics = true
    scene.add(barrier)
    barrier.isImmobile = true
    barrier.fillColor = .brown
    barrier.angle = angle
}

fileprivate func setupFunnel() {
    // Add funnel to the scene
    funnel.position = Point(x: 200,
                            y: scene.height - 25)
    scene.add(funnel)
    // callback for when user clicks funnel (like onEvents)
    funnel.onTapped = dropBall
    funnel.fillColor = .gray
    funnel.isDraggable = false
}

func addTarget(position: Point) {
    //creating new target and appending to the target array
    let targetPoints = [
        Point(x: 10, y: 0),
        Point(x: 0, y: 10),
        Point(x: 10, y: 20),
        Point(x: 20, y: 10)
    ]

    let target = PolygonShape(points: targetPoints)
    
    targets.append(target)
    
    //setup diamond shaped targets
    target.position = position
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
    target.fillColor = .yellow
    target.name = "target"
    scene.add(target)
    target.isDraggable = false
}

func setup() {
    setupBall()
    addBarrier(position: Point(x: 200, y: 150), width: 80, height: 25, angle: 0.1)
    setupFunnel()
    addTarget(position: Point(x: 150, y: 400))
    resetGame()
    scene.onShapeMoved = printPosition(of:)
}

// Drops the ball by moving it to the funnel's position
func dropBall() {
    ball.position = funnel.position
    ball.stopAllMotion()
    for barrier in barriers {
        barrier.isDraggable = false
    }
}

// Handles collisions between the ball and the targets.
func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" { return }
    
    otherShape.fillColor = .green
}

// Callback for when ball exits the scene
func ballExitedScene() {
    for barrier in barriers {
        barrier.isDraggable = true
    }
}

// Resets the ghame by moving the ball below the scene,
// which will unlock the barriers
func resetGame() {
    ball.position = Point(x: 0, y: -80)
}

// Prints shape position aafter dragging target around so that it lies in the path of the ball
// using this to figure out the correct coordinates.
func printPosition(of shape: Shape) {
    print(shape.position)
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
