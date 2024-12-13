package states;

import flixel.FlxSubState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class ResultSubstate extends FlxSubState {
    private var scoreText:FlxText;
    private var missesText:FlxText;
    private var rankText:FlxText;

    public function new(score:Int, misses:Int) {
        super();

        // Fundo preto
        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        add(bg);

        // Exibir o Score
        scoreText = new FlxText(0, 50, FlxG.width, "Score: " + score);
        scoreText.setFormat(null, 32, FlxColor.WHITE, "center");
        add(scoreText);

        // Exibir Misses
        missesText = new FlxText(0, 100, FlxG.width, "Misses: " + misses);
        missesText.setFormat(null, 32, FlxColor.RED, "center");
        add(missesText);

        // Determinar o rank
        var rank:String = getRank(misses);
        rankText = new FlxText(0, 150, FlxG.width, "Rank: " + rank);
        rankText.setFormat(null, 40, FlxColor.YELLOW, "center");
        add(rankText);

        // Adicionar instrução para fechar a tela
        var infoText:FlxText = new FlxText(0, FlxG.height - 50, FlxG.width, "Pressione qualquer tecla para continuar");
        infoText.setFormat(null, 24, FlxColor.GRAY, "center");
        add(infoText);
    }

    // Função para calcular o Rank
    private function getRank(misses:Int):String {
        if (misses == 0) {
            return "P (Perfect)";
        } else if (misses < 5) {
            return "G (Good)";
        } else {
            return "B (Bad)";
        }
    }

override public function update(elapsed:Float):Void {
    super.update(elapsed);

    // Detecta toque ou clique
    if (FlxG.touches.justPressed() || FlxG.keys.justPressed.ANY) {
        close(); // Fecha o substate de resultados
        FlxG.switchState(new MenuState()); // Retorna ao menu principal
    }
}