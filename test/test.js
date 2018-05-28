const HC = artifacts.require("HelloWorld");

contract('HelloWorld', async (account) => {
    let instance;

    beforeEach("setup contract for each test", async () => {
        instance = await HC.new();
    })

    it("should return HelloWorld", async () => {
        var expected = await instance.sayHello();
        assert.equal(expected, "hello world");
    })
})