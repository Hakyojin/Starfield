int pixelsNum = 1000;
Particle[] pixels = new Particle[pixelsNum];
void setup()
{
	size(400,400);
	background(0);
	for(int i = 0;i<pixelsNum;i++)
	{
		if(Math.random()*500<499)
		{
		pixels[i] = new NormalParticle();
		}
		else
		{
		pixels[i] = new JumboParticle();
		}
	}
	pixels[pixelsNum-1] = new OddballParticle();
}
void draw()
{
	background(0);
	fill(255);
	rect(160,160,100,100);
	for(int i=0;i<pixelsNum;i++)
	{
		pixels[i].show();
		pixels[i].move();
	}
}
class NormalParticle implements Particle
{
	double x,y,mySpeed,myAngle;
	int myColor;
	NormalParticle()
	{
		x = 200+(Math.random()*100-50);
		y = 200+(Math.random()*100-50);
		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		mySpeed=(int)(Math.random()*4)+4;
		myAngle = Math.random()*2*Math.PI;
	}
	void move()
	{
		x = x + Math.cos(myAngle)*mySpeed;
		y = y + Math.sin(myAngle)*mySpeed;
		if(x<0 || x>400 || y<0 || y>400)
		{
			x = 200;
			y = 200;
		}
	}
	void show()
	{
		fill(myColor);
		rect((float)x,(float)y,20,20);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double x,y,mySpeed,myAngle;
	int myColor;
	OddballParticle()
	{
		x = 200+(Math.random()*100-50);
		y = 200+(Math.random()*100-50);
		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		mySpeed=10;
		myAngle = Math.random()*2*Math.PI;
	}
	void move()
	{
		x = x + Math.cos(myAngle)*mySpeed;
		y = y + Math.sin(myAngle)*mySpeed;
		if(x<0 || x>400 || y<0 || y>400)
		{
			x = 200;
			y = 200;
		}
	}
	void show()
	{
		fill(myColor);
		ellipse((float)x,(float)y,40,40);
	}
}
class JumboParticle extends NormalParticle
{
	JumboParticle()
	{
	mySpeed=(int)(Math.random()*2)+2;
	}
	void show()
	{
	fill(myColor);
	rect((float)x,(float)y,50,50);
	}
}


