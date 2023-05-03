import java.util.Random;

public class TV {
	public static void main(String[] args)
	{
		int n = 5000;

		if (args.length > 0)
		{
			n = Integer.parseInt(args[0]);
		}
		System.out.println(n + " iterations.");

		Vec[] r = new Vec[n], a = new Vec[n], b = new Vec[n];

		System.out.println("Allocated vector vectors");

		Random random = new Random(89071);

		System.out.println("Allocated random number generator");

		for (int i = 0; i < n; i++)
		{
			a[i] = new Vec(
				random.nextDouble(),
				random.nextDouble(),
				random.nextDouble());
			b[i] = new Vec(
				random.nextDouble(),
				random.nextDouble(),
				random.nextDouble());
		}

		System.out.println("Starting...");

		long start = System.currentTimeMillis();
		for (int i = 0; i < n; i++)
		{
			r[i] = Vec.cross(a[i] , b[i]);
		}
		long stop = System.currentTimeMillis();

		System.out.println("That took " + (stop - start) + " milliseconds.");
	}
}

class Vec {
	public Vec()
	{
		v = new double[3];
		v[0] = v[1] = v[2] = 0.0;
	}
	public Vec(double v0, double v1, double v2)
	{
		v = new double[3];
		v[0] = v0;
		v[1] = v1;
		v[2] = v2;
	}
	public Vec(double[] _v)
	{
		v = _v;
	}
	public String toString()
	{
		return "( " + v[0] + ", " + v[1] + ", " + v[2] + " )";
	}
	public static double dot(Vec p, Vec q)
	{
		return
			p.v[0] * q.v[0] +
			p.v[1] * q.v[1] +
			p.v[2] * q.v[2];
	}
	public static Vec cross(Vec p, Vec q)
	{
		return new Vec(
			p.v[1] * q.v[2] - p.v[2] * q.v[1],
			p.v[2] * q.v[0] - p.v[0] * q.v[2],
			p.v[0] * q.v[1] - p.v[1] * q.v[0]);
	}
	public static double min(Vec p)
	{
		return Math.min(Math.min(p.v[0], p.v[1]), p.v[2]);
	}
	public static double max(Vec p)
	{
		return Math.max(Math.max(p.v[0], p.v[1]), p.v[2]);
	}
	public static Vec vmax(Vec p, Vec q)
	{
		return new Vec(
			Math.max(p.v[0], q.v[0]),
			Math.max(p.v[1], q.v[1]),
			Math.max(p.v[2], q.v[2]));
	}
	public static Vec vmin(Vec p, Vec q)
	{
		return new Vec(
			Math.min(p.v[0], q.v[0]),
			Math.min(p.v[1], q.v[1]),
			Math.min(p.v[2], q.v[2]));
	}
	public static double length(Vec p)
	{
		return Math.sqrt(p.v[0] * p.v[0] + p.v[1] * p.v[1] + p.v[2] * p.v[2]);
	}
	public static Vec add(Vec p, Vec q)
	{
		return new Vec(
			p.v[0] + q.v[0],
			p.v[1] + q.v[1],
			p.v[2] + q.v[2]);
	}
	public static Vec neg(Vec p)
	{
		return new Vec(
			-p.v[0],
			-p.v[1],
			-p.v[2]);
	}
	public static Vec sub(Vec p, Vec q)
	{
		return new Vec(
			p.v[0] - q.v[0],
			p.v[1] - q.v[1],
			p.v[2] - q.v[2]);
	}
	public static Vec mul(double p, Vec q)
	{
		return new Vec(
			p * q.v[0],
			p * q.v[1],
			p * q.v[2]);
	}
	public static Vec mul(Vec p, double q)
	{
		return new Vec(
			p.v[0] * q,
			p.v[1] * q,
			p.v[2] * q);
	}
	public static Vec div(Vec p, double q)
	{
		double r = 1.0 / q;
		return new Vec(
			p.v[0] * r,
			p.v[1] * r,
			p.v[2] * r);
	}
	public double elt(int i)
	{
		return v[i];
	}
	public double[] elts()
	{
		return v;
	}
	protected double[] v;
};
