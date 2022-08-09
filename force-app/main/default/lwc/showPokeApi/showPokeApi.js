import { NavigationMixin } from 'lightning/navigation';
import { LightningElement, wire } from 'lwc';
import searchPokemons from '@salesforce/apex/PokeApiController.searchPokemons';

export default class showPokeApi extends NavigationMixin(LightningElement){
	searchTerm = '';
	searchTipo = null;
	searchGen = null;
	
	//Wire para llamar métodos de APEX (Controller)
	@wire(searchPokemons, {searchTerm: '$searchTerm',searchTipo: '$searchTipo', searchGen: '$searchGen'}) 
	pokemons;

	//caja de busqueda...
	handleSearchTermChange(event) {
		// Retrasando 300ms para evitar gran cantidad de llamados a métodos APEX
		window.clearTimeout(this.delayTimeout);
		const searchTerm = event.target.value;
		// eslint-disable-next-line @lwc/lwc/no-async-operation
		this.delayTimeout = setTimeout(() => {
			this.searchTerm = searchTerm;
		}, 300);
	}
	get hasResults() {
		return (this.pokemons.data.length > 0);
	}

	handlePokemonRegister(event) {
		// Conseguir ID de pokemon
		const detail= 'a00IY000001FDSXYA4';
		console.log(detail);
		const pokemonId = event.detail;
		// Navegar por la recordpage
		this[NavigationMixin.Navigate]({
			type: 'standard__recordPage',
			attributes: {
				recordId: detail,
				objectApiName: 'Pokemon__c',
				actionName: 'view',
			},
		});
	}

	//COMBOBOX FILTRADO POR GENERACIÓN Y TIPO

    get options() {
        return [
			{ label: 'Tipo de Pokemon', value: null },
            { label: 'Fire', value: 'Fire' },
            { label: 'Grass', value: 'Grass' },
			{ label: 'Electric', value: 'Electric' },
            { label: 'Ice', value: 'Ice' },
            { label: 'Fighting', value: 'Fighting' },
			{ label: 'Poison', value: 'Poison' },
            { label: 'Ground', value: 'Ground' },
            { label: 'Flying', value: 'Flying' },
			{ label: 'Psychic', value: 'Psychic' },
            { label: 'Bug', value: 'Bug' },
			{ label: 'Rock', value: 'Rock' },
            { label: 'Ghost', value: 'Ghost' },
            { label: 'Dark', value: 'Dark' },
			{ label: 'Dragon', value: 'Dragon' },
            { label: 'Steel', value: 'Steel' },
            { label: 'Fairy', value: 'Fairy' },
        ];
    }

	get options2() {
        return [
			{ label: 'Generación', value: null },
            { label: 'Generación 1', value: '1' },
            { label: 'Generación 2', value: '2' },
            { label: 'Generación 3', value: '3' },
			{ label: 'Generación 4', value: '4' },
            { label: 'Generación 5', value: '5' },
            { label: 'Generación 6', value: '6' },
			{ label: 'Generación 7', value: '7' },
            { label: 'Generación 8', value: '8' },
		];
    }

	handleTipo(event) {
		this.searchTipo= event.detail.value;
		const selectEvent = new CustomEvent('filtroTipo', {detail: {searchTipo: this.searchTipo}});
		this.dispachtEvent(selectEvent);
    }
	
	handleGeneracion(event) {
		this.searchGen= event.detail.value;
		const selectEvent = new CustomEvent('filtroGeneración', {detail: {searchGen:this.searchGen}});
		this.dispachtEvent(selectEvent);
	}
}

