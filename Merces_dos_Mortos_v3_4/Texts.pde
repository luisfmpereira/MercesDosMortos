boolean candleText = false;
float starttime, waittime; //global variables to set textboxes times
boolean readingFlag; //reading
int dialogueCount; //continue reading 
boolean continueReading; //next textbox
int nexttext = 0;
float textboxDelay; //delay to start textbox
boolean showE = false;

PFont pixel;



//EVERY NEW POSITION INDICATES A NEW DIALOGUE BOX

String [] dialogue = 
  {"Meu Deus! Então todas aquelas histórias eram verdade... Os mortos realmente voltam para a igreja!", //0 - level 1 entrance
  "Eu não posso ficar aqui, tenho que achar a saída... Espera, será então que o que dizem sobre armadilhas e passagens secretas é verdade?", //1 - level 1 entrance
  "Sempre ví estas alavancas e botões pela igreja, acho que chegou a hora de explorar isto melhor.", //2 - level 1 entrance
  "Hm... Eu vim por aqui, e estas salas estão cheias de mortos. Melhor eu encontrar outra saída.", //3 - level 1 interaction with closed door
  "Não é hora de dormir! Preciso achar a saída da igreja logo!", //4 - level 1 interaction with bed
  "Afinal essa passagem secreta me leva para os depósitos da igreja. Isso deve me levar para a saída... Espera, o que é aquilo ali na frente?", //5 - level 2 entrance
  "Não! Os mortos já chegaram aqui no subsolo! Preciso tomar muito cuidado com eles e não me aproximar...", //6 - level 2 entrance
  "Aqui tem livros sobre o que eu quiser ler... Inclusive sobre a igreja e a história das Missas dos Mortos.", //7 - level 2 interaction with books
  "Aparentemente isso acontece desde que construíram a igreja  perto deste cemitério. Acho que não foi uma boa ideia, não é mesmo?", //8 - level 2 interaction with books
  "Hm... Este desenho no piso é diferente do que vi nas últimas duas salas. Acho que eles funcionam de um jeito diferente.", //9 - level 3 entrance
  "A minha vela está apagando, tenho que sair logo desta sala, ou vou ficar no escuro completo!", //10 - candle running out
  "Sei que esta cozinha têm uma saída para o lado de fora... Talvez seja um jeito de fugir daqui.", //11 - level 4 entrance
  "Aqui é o cemitério, então nada de saída. E o pior é que com este vento, minha vela não vai iluminar nada.", //12 - level 5 entrance
  "Finalmente o salão principal. Aqui com certeza vou encontrar a saída... mas como?", //13 - level 6 entrance
  "Sempre achei esta parte do piso estranha. Talvez esse desenho no chão me dê uma dica.", //14 - interaction with first button ever
  "É aqui que eu tenho dormido nas últimas duas semanas, desde que fui contratado como sacristão desta Igreja.", //15 - joao leite's bed interaction 
  "Nunca puxei esta alavanca. Acho que por medo do que iria acontecer...", //16 - first level lever interaction
  "Então os bancos estão todos aqui no subsolo. O antigo sacristão deve ter os colocado aqui para reformar o saguão principal.", //17 - benches interaction
  "Aqui está escrito preste atenção nos desenhos no chão. Eles são a melhor chance de você entender os mecanismos da igreja.", //18 - level 2 table interaction
  "Parece que esse é o diário do sacristão anterior... Ele conta que pararam de realizar missas aqui por causa dos mortos.", //19 - level 2 desk interaction
  "Isso é só uma mancha de óleo, ou alguma coisa assim. Tenho que limpar isso, mas acho que tenho coisas mais importantes para me preocupar agora...",//20 - oil stain interaction
  "Eu reconheço esse desenho... É a estátua de Nossa Senhora de Mercês, que dá o nome desta Igreja!",//21 - level 3 first totem button interaction
  "Sei que as algemas que ela carrega significa a Libertação de todo e qualquer tipo de escravidão.",//22 - level 3 first totem button interaction
  "Esse quadro mostra o que tinha nessa colina onde está essa igreja. Aparentemente só o cemitério ficava aqui, até construírem a igreja.",//23 - level 3 painting 
  "Estes papéis são os desenhos das armadilhas e passagens secretas. Eles datam de três décadas e estão bastante ilegíveis, infelizmente.",//24 - level 3 table
  "Esses bolinhos parecem gostosos, mas eu realmente não estou com fome agora. Estou bem mais preocupado com os mortos me perseguindo.",//25 - level 4 cupcakes
  "Sério? Deixaram só um pão aqui? Vou precisar comprar mais para os outros funcionários.",//26 - level 4 one bread only
  "Nem para jogarem o lixo fora.",//27 - level 4 trash can
  "Aqui jaz Fabio. Quem é esse?",//28 - grave 1
  "Aqui jaz Luis Filipe. Esse nome não me soa estranho...",//29 - grave 2
  "Aqui jaz Júlio. Eu conheço essa pessoa?",//30 - grave 3
  "Aqui jaz Vinicius. É o nome do meu primo que não vejo a anos. Será?",//31 - grave 4
  "Aqui jaz Rafael. Uhm, acho que não conheço uma pessoa com este nome.",//32 - grave 5
  "Aqui jaz Marie. É, não conheço esta pessoa.",//33 - grave 6
  "Aqui jaz Matheus. Meu amigo tem esse nome. Ainda bem que não é ele.",//34 - grave 7
  "Aqui jaz PC, o recordista mundial de mais frutas ingeridas enquanto corre. Que?",//35 - easter egg grave
  "Estes vitrais são realmente muito bonitos. Pena que nenhuma luz entra por aqui, já que lá fora está muito escuro.",//36 - level 6 windows
  "Aqui é o altar principal. Sei que nessa sala já não tem mais bancos, porque não temos mais missas aqui.",//37 - level 6 altar
  "Acho que ficaram com medo de acontecer uma invasão dos mortos enquanto a igreja estivesse cheia. Meu Deus, imagine o caos.",//38 - level 6 altar
};

////DIALOGUEBOX POSITION

//POSX = 64
//POSY = 448
//WIDTH = 192
//LENGTH = 768

//// TEXT WILL WRAP AROUND THE DIALOGUEBOX 

void textInteraction()
{
  if (showE)
    image(readingE, playerX*64, (playerY-1)*64);

  showE = false; //refresh show "e" boolean - reading texts
}


//set reading variables to dialogue
void setReading(int time, boolean continuereading)
{
  waittime = time;  
  starttime = millis();
  gameState = READING;
  if (continuereading) continueReading = true;
  if (!continuereading) continueReading = false;
}

//draw text and textbox
void drawText()
{
  textFont(pixel);
  image(dialogueboxIm, 0, 0);
  textSize(25);
  fill(0);
  text(dialogue[dialogueCount], 64, 448, 768, 192);
}


//control of the text and interaction
void textControl()
{
  if (delayTime(starttime, waittime)) {
    textSize(15);
    text("pressione 'e' para continuar", 630, 640);
    //removed dialogue arrow indicator and replaced with text
    //image(dialoguearrowIm, 768, 576); 
    if (continueReading && read) {
      nexttext++;
      gameState = PLAYING;
      readingFlag = false;
      textboxDelay = millis();
    }
    if (!continueReading && read) {
      gameState = PLAYING;
      readingFlag = false;
      textboxDelay = millis();
      continueReading = false;
    }
  }
}


void candleTextInfo()
{
  if (candleText && timerMax == 600)
  {
    dialogueCount = 10;
    setReading(1000, false);
    candleText = false;
  }
}

boolean delayTime(float startTime, float waitTime)
{
  return millis() - startTime > waitTime;
}