class Sprite {
  constructor(posX, posY, speedX, speedY, width, height, url) {
    this.X = posX;
    this.Y = posY;
    this.speedX = speedX;
    this.speedY = speedY;
    this.width = width;
    this.height = height;
    this.rotation = 0;
    this.image = new Image();
    this.alive = true; //let op of het sprite wel of niet in beeld komt
    if (typeof url != "undefined") {
      this.image.src = url;
    } else {
      console.warn("geen url opgegeven!");
    }
  }

  update() {
    this.X += this.speedX;
    this.Y += this.speedY;
    if (this.X > canvasWidth - this.width || this.X < 0) {
      this.speedX = -this.speedX;
    }
  }

  draw() {
    ctx.save();
    ctx.translate(this.X + this.width / 2, this.Y + this.height / 2);
    ctx.rotate(this.rotation);
    ctx.drawImage(
      this.image,
      -this.width / 2,
      -this.height / 2,
      this.width,
      this.height
    );
    ctx.restore();
  }
}
