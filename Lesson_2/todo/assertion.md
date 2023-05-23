assert(test)  Fails unless test is truthy.

assert_equal(exp, act)  Fails unless exp == act.

assert_nil(obj) Fails unless obj is nil.

assert_raises(exp) { ... } Fails unless block raises one of exp.

assert_instance_of(cls, obj)  Fails unless obj is an instance of cls.

assert_includes(collection, obj)  Fails unless collection includes obj.

assert_kind_of(class, obj) Fails if the class of the second argument is not an instance of the named class or the of the named class's subclass.

assert_same(obj, obj.method) it fails if the second and the first argument are the same object. It uses the #equal method.