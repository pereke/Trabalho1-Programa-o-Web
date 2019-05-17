<template>
    <v-container>
        <form
        action="/something"
        method="post">

        <p>
            <label>Nome</label>
            <input style="border: 1px solid black;"
            id="name"
            type="text"
            name="name">
        </p>

         <p>
            <label>Email</label>
            <input style="border: 1px solid black;"
            id="name"
            type="text"
            name="name">
        </p>

        <p>
            <label>Formação</label>
            <input style="border: 1px solid black;"
            id="name"
            type="text"
            name="name">
        </p>

        <p>
            <label>Sala </label>
            <input style="border: 1px solid black;"
            id="name"
            type="text"
            name="name">
        </p>

        <p>
            <label>Telefone</label>
            <input style="border: 1px solid black;"
            id="name"
            type="text"
            name="name">
        </p>

        <p>
            <v-btn>
                <input
                type="submit"
                value="Enviar">
            </v-btn>
        </p>
        </form>
    </v-container>
</template>


<style>
    input,select {
        margin-left: 10px;
    }
</style>

<script>

</script>