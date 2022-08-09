import { LightningElement, api } from 'lwc';

export default class selectPoke extends LightningElement {
	@api pokemons;

	handleAbrirID() {
        const selectEvent = new CustomEvent('pokeview', {
            detail: this.pokemons.Id
        });
        this.dispatchEvent(selectEvent);
	}
}