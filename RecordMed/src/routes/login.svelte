<script lang="ts">
    import { Row, Col } from 'sveltestrap';
    import firebase from 'firebase/compat/app';
    import { goto } from '$app/navigation';
    import { onDestroy } from 'svelte';
    import authStore from '../scripts/session';
    import { Button,
    Card,
    CardBody,
    CardHeader,
    CardSubtitle,
    CardText,
    Form,
    FormGroup,
    Input,
    Label,
    Container,
    CardTitle} from 'sveltestrap';
 

    let credentials = {
        email: "",
        password: "",
    };

    const changeUser = (e) =>{
        credentials = {
            ...credentials,
            [e.target.name]: e.target.value,
        };
        console.log(credentials)
    };
    
    const sub = authStore.subscribe(async (info) => {
      if (info.isLoggedIn) {
        await goto('/');
      }
    });
    onDestroy(() => {
      sub();
    });
  </script>
<Container style="display: flex;
align-items: center;
justify-content: center;
min-height: 100vh;">
    <Card class="text-center" style="width: 20rem; border-radius:20px">
    <CardHeader style="border-top-left-radius: 20px; border-top-right-radius: 20px;">
        <CardTitle >Ingreso</CardTitle>
    </CardHeader>
    <CardBody>
        <Form >
            <FormGroup>
                <label for="email">Email</label>
                <Input type="email" name="email" required on:input={(e)=>{changeUser(e)}}/>
            </FormGroup>
            <FormGroup>
                <label for="password">Contraseña</label>
                <Input type="password" name="password" on:input={(e)=>{changeUser(e)}}/>
            </FormGroup>
            <Button type="submit">Ingresar</Button>
        </Form>
    </CardBody>

</Card>
</Container>

