# -*- coding: utf-8 -*-
"""
Created on Sat Apr 13 14:50:35 2019

@author: EvitanRelta
"""
from cpython cimport bool
cdef class Vector:
    cdef public double _x, _y, _magVal
    cdef public Vector _unitVecVal
    cdef public bool _resetUnitVecVal
    def __init__(self, double x, double y):
        self._x = x
        self._y = y
        self._magVal = 0
        self._resetUnitVecVal = True
        
    @property
    def x(self):
        return self._x
    
    @x.setter
    def x(self, double value):
        self._x = value
        self._resetCalVal()
    
    @property
    def y(self):
        return self._y
    
    @y.setter
    def y(self, double value):
        self._y = value
        self._resetCalVal()
        
    def setValue(self, double x, double y):
        self._x = x
        self._y = y
        self._resetCalVal()
    
    def _resetCalVal(self):
        if self._magVal != 0:
            self._magVal = 0
            self._resetUnitVecVal = True
    
    def __repr__(self):
        cdef str output
        output = '<%s, %s>' %(self.x, self.y)
        if self._x == 0 and self._y == 0:
                output += '\nMagnitude: 0\nUnit Vector: <Undefined>'
        elif self._magVal != 0:
            output += '\nMagnitude: %s' %self._magVal
            if self._resetUnitVecVal == False:
                output += '\nUnit Vector: %s' %self._unitVecVal
            else:
                output += '\nUnit Vector: <Not yet calculated>'
        else:
            output += '\nMagnitude: <Not yet calculated>\nUnit Vector: <Not yet calculated>'
        return output
    
    def __str__(self):
        return '<%s, %s>' %(self.x, self.y)
    

#%% Len & Indexer
    def __len__(self):
        return 2
    
    def __getitem__(self, int i):
        if i == 0:
            return self._x
        elif i == 1:
            return self._y
        else:
            raise IndexError
    
    def __setitem__(self, int i, double value):      
        if i == 0:
            self.x = value
        elif i == 1:
            self.y = value
        else:
            raise IndexError
        
            
            
#%% Arithmetic Operators
    def __neg__(self):
        return Vector(-self._x, -self._y)
    
    def __pos__(self):
        return self.copy
    
    def __eq__(self, other):
        if type(self) == type(other):
            if self._x == other.x:
                if self._y == other.y:
                    return True
        return False

    def __ne__(self, other):
        if type(self) != type(other):
            return True
        elif self._x != other.x:
            return True
        elif self._y != other.y:
            return True
        return False
    
    
    #%% Add
    def __add__(self, other):
        return Vector(self._x+other.x, self._y+other.y)
    
    def __iadd__(self, other):
        self.add(other)
        return self
    
    def add(self, other):
        self._x += other.x
        self._y += other.y
        self._resetCalVal()
    
    
    #%% Subtract
    def __sub__(self, other):
        return Vector(self._x-other.x, self._y-other.y)
    
    def __isub__(self, other):
        self.subtract(other)
        return self
    
    def subtract(self, other):
        self._x -= other.x
        self._y -= other.y
        self._resetCalVal()
    
    
    #%% Division
    def __truediv__(self, double other):
        return Vector(self._x/other, self._y/other)
    
    def __idiv__(self, double other):
        self.scalarDiv(other)
        return self
    
    def scalarDiv(self, double i):
        self._x /= i
        self._y /= i
        self._resetCalVal()
    
    
    #%% Multiplication
    def __mul__(first, second):
        if isinstance(first, Vector):
            if isinstance(second, Vector):
                return first._dot(first, second)    # doesn't matter whether first or second is self
            elif isinstance(second, int) or isinstance(second, float):
                return Vector(first._x*second, first._y*second)
        elif isinstance(first, int) or isinstance(first, float):
                return Vector(second._x*first, second._y*first)
    
    def __imul__(self, double other):
        if isinstance(other, int) or isinstance(other, float):
            self.scalarMul(other)
            return self
        else:
            raise TypeError
    
    @staticmethod
    def _dot(v1, v2):
        return v1._x * v2._x + v1._y * v2._y
    
    def dot(self, other):
        return self._dot(self, other)
    
    def scalarMul(self, double i):
        self._x *= i
        self._y *= i
        self._resetCalVal()
    
    
    
#%% Properties
    @property
    def magnitude(self):
        if self._magVal == 0:
            self._magVal = (self._x**2 + self._y**2)**0.5
        return self._magVal
    
    @property
    def unitVec(self):
        cdef double mag
        if self._resetUnitVecVal:
            mag = self.magnitude
            if mag != 0:
                self._unitVecVal = Vector(self._x / mag, self._y / mag)
            self._resetUnitVecVal = False
        return self._unitVecVal
    
    @property
    def copy(self):
        output = Vector(self._x, self._y)
        if self._magVal != 0:
            output._magVal = self._magVal
            if self._resetUnitVecVal == False:
                output._resetUnitVecVal = True
                output._unitVecVal = self._unitVecVal
        return output