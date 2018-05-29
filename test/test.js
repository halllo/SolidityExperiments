const HC = artifacts.require("HelloWorld");

contract('HelloWorld', async (account) => {
    let instance;

    beforeEach("setup contract for each test", async () => {
        instance = await HC.new();
    })

    it("no hellos should return empty list", async () => {
        var expected = await instance.listHellos();
        assert.equal(expected, "");
    })

    it("one hello should return increment count", async () => {
        var transaction = await instance.sayHello("Manuel");
        var expected = await instance.countHellos();
         
        assert.equal(expected, 1);
    })

    it("two hello should return increment count", async () => {
        var transaction = await instance.sayHello("Manuel");
        var transaction = await instance.sayHello("Manuel2");
        var expected = await instance.countHellos();
        
        assert.equal(expected, 2);
    })

    // it("should never end", async () => {
    //     var expected = await instance.loopInfinitively();
        
    //     assert.equal(expected, 2);
    // })
})