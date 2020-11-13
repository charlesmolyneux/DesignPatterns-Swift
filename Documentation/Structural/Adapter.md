

## Builder - Creational
## Summary
Allows for the creation of complex objects in a step by step manner. 

The Builder Pattern is ideal for when you want to be able to create different representations of the same product. I.e. a networking query. You may want to build a path query up bit by bit. 

```
let query = PopularProductsQuery()
.take(100)
.skip(0)
.colour(green)
.category([popular, newIn])
.priceUnder(500)
```

The Builder Pattern also allows us to defer execution, we don't have to build the complete product in one go.

### Pattern Objective
The Builder pattern enables us to construct different representations and types of objects whilst reusing the same construction code. 

##

**PROS**
 - [x] SRP: Isolates complex construction code from business logic.
 - [x] Can construct objects step-by-step, defer steps or run steps recursively.
 - [x] Allows construction code to be reused.

**CONS**
- Overall app complexity increases as this pattern requires creating multiple new classes.
