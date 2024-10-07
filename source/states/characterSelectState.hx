package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.group.FlxTypedGroup;
import flixel.FlxState;

class CharacterSelectState extends MusicBeatState
{
    var bg:FlxSprite;
    var menuItems:Array<String>;  // Lista de personagens
    var selectedIndex:Int = 0;    // Índice do personagem selecionado
    var selector:FlxText;         // Texto que exibe o personagem selecionado

    override function create()
    {
        // Carregar o background
        bg = new FlxSprite(0, 0).loadGraphic(Paths.image("characterSelect/selBG"));
        add(bg);
        
        // Definir os personagens disponíveis
        menuItems = ["achura", "kamile"]; // Adicione mais personagens aqui
        
        // Exibir o personagem selecionado
        selector = new FlxText(0, 200, FlxG.width, menuItems[selectedIndex]);
        selector.setFormat(null, 32, 0xFFFFFF, "center");
        add(selector);
        
        super.create();
    }
    
    override function update(elapsed:Float)
    {
        // Navegar entre os personagens com setas esquerda/direita
        if (FlxG.keys.justPressed.RIGHT)
        {
            selectedIndex = (selectedIndex + 1) % menuItems.length;  // Próximo personagem
            selector.text = menuItems[selectedIndex];
        }
        else if (FlxG.keys.justPressed.LEFT)
        {
            selectedIndex = (selectedIndex - 1 + menuItems.length) % menuItems.length;  // Personagem anterior
            selector.text = menuItems[selectedIndex];
        }
        
        // Confirmar a escolha com ENTER/SPACE
        if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE)
        {
            FlxG.log.menuItems[selectedIndex];  // Pode usar isso para salvar a escolha do personagem
            // Aqui você pode armazenar o personagem escolhido e voltar para a week
            MusicBeatState.switchState(new PlayState());  // Trocar para o estado do jogo com o personagem escolhido
        }
        
        // Voltar ao menu principal com ESCAPE
        if (FlxG.keys.justPressed.ESCAPE)
        {
            MusicBeatState.switchState(new MainMenuState());
        }
        
        super.update(elapsed);
    }
}