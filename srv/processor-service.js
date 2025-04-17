module.exports = async (srv) => {
    srv.on('restock', async (req) => {
        const { ID, quantity } = req.data;
        const product = await UPDATE(my.Products)
            .set({ stock: { '+=': quantity } })
            .where({ ID });
        return product;
    });
};