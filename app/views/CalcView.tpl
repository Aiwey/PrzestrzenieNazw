{extends file="main.tpl"}

{block name = footer} Przykładowa treść stopki {/block}

{block name = content} 
    
<div class="inner">
	<header class="align-center">
            <div class="content">
		<h2 class="align-center">Oblicz swój podatek</h2>
                    <p>Wybierz rodzaj obliczeń:</p>
			<hr>
                            <form action="{$conf->action_root}calcCompute" method="post">
                                <fieldset>
				<div class="field">
                                  
                                        <label for="typPodatku"> Typ Podatku </label>
                                        <div class ="select-wrapper">
                                            
                                            <select name ="typPodatku" id = "typPodatku">
                                                <option value = "brutto-netto"> Brutto-Netto </option>
                                                <option value = "netto-brutto"> Netto- Brutto </option>
                                            </select>
                                        </div>	
                                        <div>
                                            </br><label for="id_x">Kwota przed obliczeniami: </label>
                                    <input id="id_x" type="text" name="x" value="{$form->x}" placeholder="Wpisz kwotę: "><p>  </p> </div>
                                    <label for="id_op">Podatek</label>                                
                                        <div class="select-wrapper">
                                            <select name="procent" id="procent">
                                                <option value="" style = "color:#6b6b6b;">- Oprocentowanie -</option>
                                                <option value="3" style = "color:#6b6b6b;">3%</option>
                                                <option value="5" style = "color:#6b6b6b;">5%</option>
                                                <option value="7" style = "color:#6b6b6b;">7%</option>
                                                <option value="8" style = "color:#6b6b6b;">8%</option>
                                                <option value="22" style = "color:#6b6b6b;">22%</option>
                                                <option value="23" style = "color:#6b6b6b;">23%</option>	
                                            </select>
                                        </div>
                                    </fieldset>
                                        <div>
                                            <p></p><p></p>
                                            <ul class="actions align-center">
                                            <li><input value="Oblicz!" class="button special" type="submit"></li>
                                            </ul>
                                        </div>
				</form>
				</div>
        </header>
</div>
				{*wyświetlenie listy błędów*}

{/block}
{block name = infos}
    {if $msgs->isError()}  
    <ol style="margin: 20px; padding: 10px 10px 10px 30px; border-radius: 5px; background-color: #f88; width:300px;">
        {foreach $msgs->getErrors() as $err}
        {strip}
            <li>{$msg}</li>
        {/strip}
        {/foreach}
    </ol>
{/if}
				{*wyświetlenie listy informacji*}
{if $msgs->isInfo()}
	<ol style="margin: 20px; padding: 10px 10px 10px 30px; border-radius: 5px; background-color: #f88; width:300px;">
	{foreach $msgs->getInfos() as $inf}
	{strip}
		<li>{$inf}</li>
	{/strip}
	{/foreach}
	</ol>
{/if}
{if isset($result->result)}
<div style="margin: 20px; padding: 10px; border-radius: 5px; background-color: #ff0; width:300px;">
<p>Sposób obliczania: {$form->typPodatku}</p>
<p>Kwota przed konwersją: {$form->kwota}PLN</p>
<p>Stawka VAT: {$form->procent}%</p>
<p>Obliczona kwota VAT: {$result->kwotaVat} PLN</p>
<p>Obliczona kwota: {$result->result} PLN</p>
</div>
{/if}
{/block}