<template>
    <v-container>
        <v-form
        action="/something"
        method="post">

        <p>
            <label>Nome</label>
            <v-text-field 
            solo
            v-model="text"
            label="name"></v-text-field>
        </p>

         <p>
            <label>Email</label>
            <v-text-field
            id="email"
            type="text"
            name="name"></v-text-field>
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
        </v-form>
    </v-container>
</template>


<style>
    input,select {
        margin-left: 10px;
    }
</style>

<script>

</script>