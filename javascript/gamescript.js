let ctx, canvasWidth, canvasHeight, keyObjects;
const fps = 60;
const interval = 1000 / fps;
canvasWidth = 800;
canvasHeight = 600;

function start() {
  let volgende;
  (function gameloop(timestamp) {
    if (volgende === undefined) {
      volgende = timestamp;
    }

    const verschil = timestamp - volgende;
    if (verschil > interval) {
      volgende = timestamp - (verschil % interval);
      update();
      draw();
    }
    requestAnimationFrame(gameloop);
  })();
}

function init() {
  keyObjects = new Array(255);
  for (let i = 0; i < keyObjects.length; i++) {
    keyObjects[i] = false;
  }
  document.addEventListener("keydown", keyDownHandler, false);
  document.addEventListener("keyup", keyUpHandler, false);

  const canvas = document.getElementById("myCanvas");
  if (canvas) {
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;
    ctx = canvas.getContext("2d");

    background = new Image();
    background.src = "img/wolk.jpg";
    background.onload = () => {
      draw();
    };
    start();
  } else {
    console.error("Canvas-element niet gevonden!");
  }

  sprite1 = new Sprite(10, 500, 5, 0, 100, 100, "img/mario.jpg");

  sprites = new Array();
  for (let i = 0; i < 5; i++) {
    let randomX = Math.random() * canvasWidth;
    let speedY = Math.random() * 3 + 1;
    let sprite = new Sprite(randomX, 0, 0, speedY, 50, 50, "img/orb.jpg");
    sprites.push(sprite);
  }
  kogeltimer = 0;
  kogels = [];
  for (let i = 0; i < 5; i++) {
    let kogel = new Sprite(0, 0, 0, -6, 0, 10, 10, "img/orb.jpg");
    kogel.alive = false;
    kogels.push(kogel);
  }
}

function keyDownHandler(event) {
  keyObjects[event.keyCode] = true;
}

function keyUpHandler(event) {
  keyObjects[event.keyCode] = false;
}

function update() {
  if (keyObjects[37]) {
    sprite1.X -= 10; // is de snelheid om de character heen en weer te laten gaan
  }
  if (keyObjects[39]) {
    sprite1.X += 10; // is de snelheid om de character heen en weer te laten gaan
  }

  sprite1.X = Math.max(0, Math.min(sprite1.X, canvasWidth - sprite1.width)); // met deze stukje kan de sprite niet de scherm uitlopen

  if (sprite1.X > canvasWidth) {
    sprite1.X = -50;
  } else if (sprite1.X < -50) {
    sprite1.X = canvasWidth;
  }
  sprites.forEach((sprite) => {
    sprite.update();
    sprite.rotation += 0.05;

    if (sprite.Y > canvasHeight) {
      sprite.Y = -sprite.height;
      sprite.X = Math.random() * canvasWidth;
    }

    kogeltimer++;

    if (keyObjects[32] == true && kogeltimer > 10) {
      let kogelGeactiveerd = false;
      for (i = 0; i < 5; i++) {
        if (!kogels[i].alive) {
          kogels[i].X = sprite1.X + 20;
          kogels[i].Y = sprite1.Y;
          kogels[i].alive = true;
          kogeltimer = 0;
          kogelGeactiveerd = true;
          console.log("Kogel geactiveerd: " + i);
          break;
        }
      }
      if (!kogelGeactiveerd) {
        console.log("Geen inactieve kogel gevonden");
      }
    }

    for (let i = 0; i < 5; i++) {
      if (kogels[i].alive) {
        kogels[i].rotation += 0.05;
        kogels[i].update();
        if (kogels[i].Y < 0) {
          kogels[i].alive = false;
          console.log("Kogel gereset: " + i);
        }
      }
    }
  });
}

function draw() {
  ctx.clearRect(0, 0, canvasWidth, canvasHeight);
  ctx.drawImage(background, 0, 0, canvasWidth, canvasHeight);
  ctx.fillStyle = "#c7b96b";
  ctx.fillRect(0, 400, 800, 200);

  sprites.forEach((sprite) => {
    sprite.draw();
  });
  sprite1.draw();

  for (i = 0; i < 5; i++) {
    if (kogels[i].alive) {
      kogels[i].draw();
    }
  }
}

window.onload = init;
