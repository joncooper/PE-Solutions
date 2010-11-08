# PE#59

# The ciphertext file is in the format i,i,i,i ... where each i is a string version of an ASCII value
ciphertext = File.open("pe-59.txt").readlines()[0].chop.split(",").map(&:to_i).map(&:chr).join

# 100 most commonly used english words make up about 1/2 of all written material according to:
# http://www.duboislc.org/EducationWatch/First100Words.html

@wordlist = <<EOT
the
of
and
a
to
in
is
you
that
it
he
was
for
on
are
as
with
his
they
I
at
be
this
have
from
or
one
had
by
word
but
not
what
all
were
we
when
your
can
said
there
use
an
each
which
she
do
how
their
if
will
up
other
about
out
many
then
them
these
so
some
her
would
make
like
him
into
time
has
look
two
more
write
go
see
number
no
way
could
people
my
than
first
water
been
call
who
oil
its
now
find
long
down
day
did
get
come
made
may
part
EOT

@wordlist = @wordlist.split("\n")

# The encryption key consists of 3 lower case characters
# The plaintext must contain common English words

p ciphertext 
@c = ciphertext

# Generate random keys
def gen_keys
  keys = []
  a_chr = ?a
  z_chr = ?z
  for k1 in a_chr..z_chr
    for k2 in a_chr..z_chr
      for k3 in a_chr..z_chr
        keys << [k1.chr, k2.chr, k3.chr]
      end
    end
  end
  return keys
end

# For each key, apply to the ciphertext
def decrypt(ciphertext, key)
  plaintext = []
  i = 0
  ciphertext.each_byte do |c|
    p = c ^ key[i % 3][0]
    i += 1
    plaintext << p.chr
  end
  return plaintext.join
end

# Quick test
shizzle = "Pimpin' yippiyo own yo' sit amizzle, crackalackin shiznit elit. Nullam for sure velizzle, shizznit volutpizzle, you son of a bizzle quis, shit vizzle, shizznit. Pellentesque eget tortizzle. Sed erizzle. Izzle izzle hizzle dapibus da bomb tempizzle dang. Maurizzle shiznit nibh et turpizzle. Funky fresh you son of a bizzle shit. Pellentesque cool crackalackin rizzle. In hizzle check it out platea dictumst. Shizzlin dizzle dapibizzle. Dang tellus shiznit, gangsta dang, mattis ac, boom shackalack vitae, nunc. Mammasay mammasa mamma oo sa fo shizzle mah nizzle fo rizzle, mah home g-dizzle. Ma nizzle pimpin' izzle sizzle purus."
test_key = "abc".chars.to_a
if (decrypt(decrypt(shizzle, test_key), test_key) != shizzle)
  puts "xor cryption is broken"
end

# Then score the candidate plaintext based on how many of the common english words it contains
def score(plaintext)
  score = 0
  @wordlist.each do |word|
    score += plaintext.scan(/\b#{word}\b/).count
  end
  return score
end

# Generate keys
candidate_keys = gen_keys()

# The maximum score is our ticket
scores = {}
candidate_keys.each do |key|
  puts "trying key #{key}"
  plaintext = decrypt(ciphertext, key)
  scores[key] = score(plaintext)
end

max_score_key = ""
max_score = 0
scores.each do |key, value|
  if value > max_score
    max_score_key = key
    max_score = value
  end
end

p max_score
p max_score_key.join
plaintext = decrypt(ciphertext, max_score_key)
p plaintext

p plaintext.each_byte.to_a.inject(0) { |sum, ascii_value| sum += ascii_value }



