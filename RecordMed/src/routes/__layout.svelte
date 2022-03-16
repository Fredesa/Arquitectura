<script lang="ts">

import { Collapse,
    Navbar,
    NavbarBrand,
    Nav,
    NavItem,
    NavLink,
} from "sveltestrap";

</script>
<Navbar color="light" light expand="md">
    <NavbarBrand href="/">
        <img src="../static/Captura.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
        RecordMed</NavbarBrand>
      <Nav class="ms-auto" navbar>
        <NavItem>
          <NavLink href="/login">Login</NavLink>
        </NavItem>
        <NavItem>
            <NavLink href="/">Home</NavLink>
          </NavItem>
      </Nav>
  </Navbar>

  <slot/>