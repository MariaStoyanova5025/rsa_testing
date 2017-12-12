def is_prime number
	i = 0
	not_prime = 0
	loop do
		break if i == number / 2
		if number % i == 0
			not_prime = 1
		end
		break if not_prime == 1
		i = i + 1
	end
	not_prime
end 

def coprime number
	i = 2;
	
	loop do 
		break if i.gcd(number) == 1	 
		i = i+1
	end
	return i;
	
end

def mmi e, b
	d = 0
	loop do
		break if (d * e)%b == 1 
		d = d + 1	
	end
	d
end

class RSA
   def initialize n, e, d
    @n = n
	@e = e
	@d = d
   end
   
   def n
      @n
   end
   
   def e
      @e
   end
   
   def d
      @d
   end
   
	def new_key
		#za n
		q = rand(5025)
		if is_prime(q) == 1
			loop do
				break if is_prime(q) != 1
				q = rand(5025)
			end	
		end	
		p = rand(5025)
		if is_prime(p) == 1
			loop do
				break if is_prime(p) != 1
				p = rand(5025)
			end	
		end	
		loop do
			break if p != q 
			p = rand(5025)
			if is_prime(p) == 1
				loop do
					break if is_prime(p) != 1
					p = rand(5025)
				end	
			end	
		end
		n = p*q
		b = (p - 1).lcm(q - 1)
		#za e
		e = coprime(b)
		#za d
		d = mmi(e,b);
		arr = [n, e, b]
		arr
   end
   
   def encrypt message
	i = 0
	c = []
	loop do
		break if i == message.length
		c[i] = (message[i].ord ** @e) % @n 
		i = i+1
	end
	c = c.join(",")
	c
   end
   
   def decrypt message
    i = 0
	c = message.split(",")
	mg = []
	loop do
		break if i == c.length
		mg[i] = ((c[i].to_i**@d) % @n).chr
		i = i+1
	end
	mg = mg.join("")
	mg
   end 
end


