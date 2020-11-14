

## Builder - Creational
## Summary
Allows for the creation of complex objects in a step by step manner.

### Pattern Objective
The **Builder Pattern** promotes reuse through reusing the construction code.
The **Builder Pattern** is ideal for when you want to be able to create different representations of the same product, this can be done during runtime.

#### Example
Building up a path query to send in a URLRequest. Sometimes you may want to send additional path parameters (i.e. skip the first 10 results, or request a particular type of game.

**Pseudo Code**
```
//Builder Interface - the shared functionality between builders
public  protocol  Query {
  func pathWithQueryItems(for path: String?) -> URLComponents
}

//Base Builder Concrete Implementation
class  BaseQueryBuilder: Query {
 public var items: [URLQueryItem] = []

   public func append(item: URLQueryItem) {
    items.append(item)
  }

  open func pathWithQueryItems(for path: String?) -> URLComponents {
	 var urlComponent = URLComponents(string: path ?? "") ?? URLComponents()
	 let queryItems = urlComponent.queryItems ?? []
	 urlComponent.queryItems = queryItems + items
	 return urlComponent
  }
}

//Concrete Builder Implementation
public class PopularProductsQuery: BaseQueryBuilder {
  @discardableResult
  func take(_ take: Int) -> PopularProductsQuery { //returns `self` so we can chain the method calls.
   items.append(URLQueryItem(name: "take", value: String(take)))
   return  self
  }

  @discardableResult
  func skip(_ skip: Int) -> PopularProductsQuery { //returns `self` so we can chain the method calls.
   items.append(URLQueryItem(name: "skip", value: String(skip)))
   return  self
  }
  ...
}

//Usage
let query = PopularProductsQuery()
.take(100)
.skip(0)
.colour(green)
.category([popular, newIn])
.priceUnder(500)
```

### Swift Notes
Use the @discardableResult keyword on each function that builds the request when returning `self`. This will suppress the `Result unused` warning.

##

**PROS**
 - [x] SRP: Isolates complex construction code from business logic.
 - [x] Can construct objects step-by-step, defer steps or run steps recursively.
 - [x] Allows construction code to be reused.
 - [x] Allows us to defer execution, we don't have to build the complete product in one go.

**CONS**
- Overall app complexity increases as this pattern requires creating multiple new classes.
