import Foundation

// Challenge 10 – Bloginator (use Xcode6-Beta6)

/**
R1 – Create a constant array of String literals called “types” with the
values: technology, memes, cat videos
**/
// implement code for R1 below
let types : [String]  = ["technology", "memes", "cat videos"];

/**
R2 – Create a BlogPost class with the following properties:

1. type – String, constant. A random value from the types
array. (Hint: you can use arc4random_uniform to randomly select a value.)
2. views – Optional Int. Set to nil.
3. author – String
4. email – String
5. order – Int. Set to zero.

Create an initializer to set the author’s name (the author property) and email property. Create a “teaser”
method that returns a String with the author’s name and number of views:
“Mike Smith has 5 views for this blog post”. If views are nil,
return “No one has read your blog post yet. Pity.”.
**/
// implement code for R2 below

class BlogPost
{
/* class variables */
    let type: String = types[Int(arc4random_uniform(3))];
    var views: Int?;
    var author: String;
    var email: String;
    var order: Int = 0;
    
/* initializer */
    init(_author: String, _email: String) {
        author = _author;
        email = _email;
    }
    
/* teaser */
    func teaser() -> String {
        if (views == nil) {
            return "No one has read your blog post yet. Pity"
        }
        let greeting : String = author + " has " + String(views!) + " for this blog post";
        return greeting;
    }
}

/**
R3 – Create a “randomAuthor” function that returns a tuple. Then create
an “Author” struct with a “name” and “email” property. Add 5 Author structs
to a dictionary using the author’s name as the key. This function returns
a randomly selected name and email of an Author from the dictionary.
**/
// implement code for R3 below

/* Author struct */
struct Author
{
    var name : String;
    var email : String;
};

func randomAuthor() -> (name: String, email: String) {
    var authorOne = Author(name: "Ronan", email: "Creative");
    var authorTwo = Author(name: "Vinnie", email: "Create");
    var authorThree = Author(name: "Bee", email: "Cream");
    var authorFour = Author(name: "Atale", email: "Crepe");
    var authorFive = Author(name: "Foggle", email: "Creatine");
    
    var authorDictionary : [String: Author] = [authorOne.name: authorOne, authorTwo.name: authorTwo, authorThree.name: authorThree, authorFour.name: authorFour, authorFive.name: authorFive];
    
    let number : Int = Int(arc4random_uniform(5));
    let names : [String] = ["Ronan", "Vinnie", "Bee", "Atale", "Foggle"];

    var theAuthor : Author = (authorDictionary[names[number]])!
    //println(theAuthor.name)
    return (theAuthor.email, theAuthor.email)
}



/**
R4 – Create an array of 10 blog posts with a for loop. Set the “author”
property to the value returned from “randomAuthor” function and set
the “order” property to the value of the index of the for loop used to
populate this array.
**/
// implement code for R4 below

var blogPostArray : [BlogPost] = [];

for index in 0...9 {
    var authorData = randomAuthor();
    let newAuthor = Author(name: authorData.name, email: authorData.email);
    var newBlogPost = BlogPost(_author: newAuthor.name, _email: newAuthor.email)
    newBlogPost.order = index;
    blogPostArray.append(newBlogPost);
    }


/**
R5 – Create a “randomViews” function that accepts the “type” of blog post
for an input. Create an array literal of Ints (these are the possible view
counts) with the values: 10, 20, 30, 40, 50. Select a random value from
this possible view count array and create a switch that returns nil if
the views are 10, 0 if the views are either 20 or 30, else return the randomly
selected number of views. If the “type” passed to the function is
“cat videos” always return nil.
**/
// implement code for R5 below

func randomViews(newType: String) -> Int? {
    if (newType == "cat videos") {
        return nil;
    }
    let arrayLiterals : [Int] = [10, 20, 30, 40, 50];
    let choice : Int = arrayLiterals[Int(arc4random_uniform(5))]
        switch choice {
        case 10:
            return nil;
        case 20:
            return 0;
        case 30:
            return 0;
        default:
            return choice;
    }
    
}


/**
R6 – Iterate the array of blog posts, generate a value from “randomViews” function
for each one and set it to the blog post “views” property. Then println the
value of each post.teaser().
**/
// implement code for R6 below

// adding views to the blog posts
for index in 0...9 {
    let numberOfViews : Int? = randomViews(blogPostArray[index].type)
    blogPostArray[index].views = numberOfViews;
    let post = blogPostArray[index];
    println(post.teaser())
}

/**
R7 – Write a simple stack using a struct with Generics
that has three methods. It should push and pop BlogPosts and also
returns the current count of BlogPosts. Iterate the array of blog posts
and push each one onto the “blogs” stack. Println the count of items in
the stack. Use a for loop to iterate the “blogs” stack, pop the top one
off and println the blog’s teaser. Println the count of items in the stack.
**/
// implement code for R7 below


struct Stack<ItemType> {
/* Variables */
    var counter : Int = 0;
    var items = [ItemType]();
    
/* Mutating Functions */
    mutating func push(item: ItemType) {
        items.append(item);
        counter++;
    }
    mutating func pop() -> ItemType {
        counter--;
        return items.removeLast();
    }
    
/* Constant Functions */
    func currentCount() -> Int {
        return counter;
    }
};


var blogs = Stack<BlogPost>();

// pushing onto the stack
for index in 0...9 {
    blogs.push(blogPostArray[index]);
}
println(blogs.counter)

// popping off the stack
for index in 0...9 {
    var readMe = blogs.pop();
    println(readMe.teaser())
}
println(blogs.counter)
















