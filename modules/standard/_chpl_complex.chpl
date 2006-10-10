pragma "inline" def _init(x: complex(?w)) return 0.0i:complex(w);

// complex(64) bound functions
def _complex64.real return __primitive( "complex_get_real", this);
def _complex64.imag return __primitive( "complex_get_imag", this);
def _complex64.=real (f:float(32)) { __primitive("complex_set_real", this, f); }
def _complex64.=imag (f:float(32)) { __primitive("complex_set_imag", this, f); }

// complex(128) bound functions
def complex.real return __primitive( "complex_get_real", this);
def complex.imag return __primitive( "complex_get_imag", this);
def complex.=real (f:float) { __primitive( "complex_set_real", this, f); }
def complex.=imag (f:float) { __primitive( "complex_set_imag", this, f); }

def =(a: complex(?w), b: complex(w)) return b;

pragma "inline" def +(a: complex(?w))
  return a;

pragma "inline" def -(a: complex(?w))
  return (-a.real, -a.imag):complex;

pragma "inline" def +(a: complex(?w), b: complex(w))
  return (a.real+b.real, a.imag+b.imag):complex;

pragma "inline" def -(a: complex(?w), b: complex(w))
  return (a.real-b.real, a.imag-b.imag):complex;

pragma "inline" def *(a: complex(?w), b: complex(w))
  return (a.real*b.real-a.imag*b.imag, a.imag*b.real+a.real*b.imag):complex;

pragma "inline" def /(a: complex(?w), b: complex(w))
  return let d = b.real*b.real+b.imag*b.imag in
    ((a.real*b.real+a.imag*b.imag)/d, (a.imag*b.real-a.real*b.imag)/d):complex;

pragma "inline" def conjg(a: complex(?w))
  return (a.real, -a.imag):complex;

pragma "inline" def bits(type t) where t == complex(64)  return 64;
pragma "inline" def bits(type t) where t == complex(128) return 128;
pragma "inline" def bits(type t) where t == complex(256) return 256;

pragma "inline"
def _tostring(x: complex, format: string) : string {
  return __primitive("to_string", format, x);
}

