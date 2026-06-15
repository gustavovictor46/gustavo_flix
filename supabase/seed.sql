'-- ============================================================================
-- GUSTAVO FLIX — Seed de Filmes Clássicos
-- ============================================================================
-- Arquivo gerado para popular o banco Supabase com 82 filmes clássicos.
-- Cada filme possui: título, descrição (PT-BR), capa via Unsplash,
-- URL de vídeo (placeholder Google Drive), categoria, ano e qualidade.
--
-- Para re-executar este seed, basta colar no Supabase SQL Editor.
-- ============================================================================

-- -------------------------------------------------------
-- 1. CRIAÇÃO DA TABELA
-- -------------------------------------------------------

DROP TABLE IF EXISTS videos;

CREATE TABLE videos (
  id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  titulo      TEXT NOT NULL,
  descricao   TEXT,
  capa_url    TEXT NOT NULL,
  video_url   TEXT NOT NULL,
  categoria   TEXT NOT NULL DEFAULT 'Drama Clássico',
  ano         INTEGER,
  qualidade   TEXT DEFAULT '1080p',
  em_destaque BOOLEAN NOT NULL DEFAULT FALSE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE videos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Videos são públicos para leitura"
  ON videos FOR SELECT USING (true);

CREATE INDEX idx_videos_categoria ON videos (categoria);
CREATE INDEX idx_videos_destaque  ON videos (em_destaque DESC);
CREATE INDEX idx_videos_ano       ON videos (ano);


-- ============================================================================
-- 2. INSERÇÃO DE FILMES — Agrupados por Categoria
-- ============================================================================


-- -------------------------------------------------------
-- ★  HORROR & SOBRENATURAL
-- -------------------------------------------------------
INSERT INTO videos (titulo, descricao, capa_url, video_url, categoria, ano, qualidade, em_destaque) VALUES

-- ★ FILME EM DESTAQUE
('Häxan',
 'Documentário-ensaio sueco que explora a história da bruxaria e da superstição na Europa medieval, combinando dramatizações perturbadoras com imagens de arquivo e ilustrações da época.',
 'https://images.unsplash.com/photo-1509023464722-18d996393ca8?w=400&h=600&fit=crop&q=80',
 'hhttps://drive.google.com/file/d/1zn7vJRM-BFEICxUa0pdRbpBZ7f9w76HI/view?usp=drive_link/preview',
 'Horror & Sobrenatural', 1922, '1080p', TRUE),

('Faust',
 'Obra-prima do expressionismo alemão de F.W. Murnau, onde o diabo Mefistófeles faz um pacto com o velho alquimista Fausto, oferecendo-lhe juventude em troca de sua alma.',
 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Horror & Sobrenatural', 1926, '1080p', FALSE),

('Vampyr',
 'Filme onírico de Carl Theodor Dreyer sobre um jovem viajante que chega a uma vila isolada e descobre que seus habitantes são atormentados por uma vampira e forças sobrenaturais.',
 'https://images.unsplash.com/photo-1494548162494-384bba4ab999?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Horror & Sobrenatural', 1932, '720p', FALSE),

('Cat People',
 'Clássico do terror psicológico produzido por Val Lewton, sobre uma jovem sérvia que acredita estar amaldiçoada e que se transformará em pantera ao sentir ciúmes ou desejo.',
 'https://images.unsplash.com/photo-1518834107812-67b0b7c58434?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Horror & Sobrenatural', 1942, '1080p', FALSE),

('I Walked with a Zombie',
 'Dirigido por Jacques Tourneur, o filme reimagina Jane Eyre num cenário caribenho, onde uma enfermeira descobre rituais vodu ao cuidar da esposa catatônica de um fazendeiro.',
 'https://images.unsplash.com/photo-1501862700950-18382cd41497?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Horror & Sobrenatural', 1943, '1080p', FALSE),

('Carnival of Souls',
 'Após sobreviver a um acidente de carro, uma jovem organista é perseguida por figuras espectrais enquanto tenta recomeçar a vida numa nova cidade, num pesadelo hipnótico e atmosférico.',
 'https://images.unsplash.com/photo-1533158326339-7f3cf2404354?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Horror & Sobrenatural', 1962, '1080p', FALSE),

('Onibaba',
 'No Japão feudal devastado pela guerra, duas mulheres sobrevivem matando samurais perdidos nos campos de junco, até que uma máscara demoníaca roubada desencadeia o horror.',
 'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Horror & Sobrenatural', 1964, '720p', FALSE),

('Viy',
 'Baseado no conto de Nikolai Gogol, um jovem seminarista é obrigado a passar três noites rezando pelo corpo de uma bruxa morta numa igreja isolada, enfrentando criaturas infernais.',
 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Horror & Sobrenatural', 1967, '1080p', FALSE),

('Kuroneko',
 'Fábula sobrenatural japonesa sobre duas mulheres assassinadas por samurais que retornam como espíritos-gato para se vingar, seduzindo e matando guerreiros na escuridão de um portão de bambu.',
 'https://images.unsplash.com/photo-1524712245354-2c4e5e7121c0?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Horror & Sobrenatural', 1968, '1080p', FALSE),

('Blind Beast',
 'Thriller perturbador de Yasuzō Masumura sobre um escultor cego que sequestra uma modelo e a aprisiona em seu ateliê repleto de esculturas gigantescas de partes do corpo humano.',
 'https://images.unsplash.com/photo-1495344517868-8ebaf0a2044a?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Horror & Sobrenatural', 1969, '1080p', FALSE);


-- -------------------------------------------------------
-- ★  DRAMA CLÁSSICO
-- -------------------------------------------------------
INSERT INTO videos (titulo, descricao, capa_url, video_url, categoria, ano, qualidade, em_destaque) VALUES

('The Passion of Joan of Arc',
 'Obra-prima de Carl Theodor Dreyer que retrata o julgamento e a execução de Joana d''Arc, célebre por seus close-ups intensos e pela atuação devastadora de Maria Falconetti.',
 'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1928, '720p', FALSE),

('Mädchen in Uniform',
 'Drama alemão pioneiro que retrata o amor proibido entre uma estudante e sua professora num internato prussiano autoritário, sendo um dos primeiros filmes com temática abertamente lésbica.',
 'https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1931, '1080p', FALSE),

('Children of Paradise',
 'Épico do cinema francês ambientado no Boulevard du Crime na Paris do século XIX, entrelaçando as vidas de artistas, criminosos e amantes em torno da bela Garance.',
 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1945, '720p', FALSE),

('Portrait of Jennie',
 'Romance fantástico em que um pintor empobrecido encontra uma jovem misteriosa num parque e descobre que ela pertence a outra época, enquanto sua obsessão por ela se aprofunda.',
 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1948, '1080p', FALSE),

('The Red Shoes',
 'Deslumbrante drama de Powell e Pressburger sobre uma jovem bailarina dividida entre o amor e a arte, inspirado no conto de Hans Christian Andersen sobre sapatilhas encantadas.',
 'https://images.unsplash.com/photo-1574267432553-4b4628081c31?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1948, '1080p', FALSE),

('Olivia',
 'Drama francês intimista de Jacqueline Audry sobre as tensões emocionais e os afetos proibidos entre alunas e diretoras num internato feminino na França do século XIX.',
 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1951, '1080p', FALSE),

('Summer with Monika',
 'Drama de Ingmar Bergman sobre dois jovens que fogem de Estocolmo para viver um verão idílico numa ilha, antes que a realidade da vida adulta destrua seu romance.',
 'https://images.unsplash.com/photo-1505533321630-975218a5f66f?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1953, '720p', FALSE),

('The Cranes Are Flying',
 'Vencedor da Palma de Ouro em 1958, o filme acompanha uma jovem soviética que luta para manter a esperança após a partida de seu amado para a frente de batalha na Segunda Guerra.',
 'https://images.unsplash.com/photo-1516410529446-2c777cb7366d?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1957, '1080p', FALSE),

('The Children''s Hour',
 'Drama de William Wyler sobre duas professoras cuja vida é destruída quando uma aluna maliciosa espalha a mentira de que elas mantêm um caso amoroso.',
 'https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1961, '1080p', FALSE),

('When the Cat Comes',
 'Fábula tchecoslovaca encantadora em que um gato mágico com óculos de sol revela, por meio de cores, os verdadeiros sentimentos ocultos dos habitantes de uma pequena cidade.',
 'https://images.unsplash.com/photo-1485163819542-13adeb5e0068?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1963, '1080p', FALSE),

('My Fair Lady',
 'Adaptação luxuosa do musical da Broadway em que o professor Henry Higgins aposta que pode transformar a florista cockney Eliza Doolittle numa dama da alta sociedade londrina.',
 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1964, '720p', FALSE),

('The Battle of Algiers',
 'Reconstituição documental e visceral da luta pela independência da Argélia contra o domínio colonial francês, filmado com estilo neorrealista e intensidade política arrebatadora.',
 'https://images.unsplash.com/photo-1542204165-65bf26472b9b?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Drama Clássico', 1966, '1080p', FALSE);


-- -------------------------------------------------------
-- ★  CINEMA BRASILEIRO
-- -------------------------------------------------------
INSERT INTO videos (titulo, descricao, capa_url, video_url, categoria, ano, qualidade, em_destaque) VALUES

('Mulher',
 'Um dos primeiros longas sonoros brasileiros, dirigido por Octávio Gabus Mendes, retratando a trajetória de uma mulher na sociedade paulistana dos anos 1930 com rara sensibilidade para a época.',
 'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1931, '1080p', FALSE),

('Rio, 40 Graus',
 'Marco do cinema brasileiro, o filme de Nelson Pereira dos Santos acompanha cinco meninos vendedores de amendoim por diferentes pontos do Rio de Janeiro num domingo escaldante de verão.',
 'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1955, '1080p', FALSE),

('Rio, Zona Norte',
 'Nelson Pereira dos Santos narra a história trágica de um compositor de samba do subúrbio carioca que é explorado pela indústria musical enquanto luta pela sobrevivência.',
 'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1957, '1080p', FALSE),

('Orfeu Negro',
 'Vencedor da Palma de Ouro e do Oscar, o filme de Marcel Camus transpõe o mito de Orfeu e Eurídice para o carnaval carioca, com trilha sonora icônica de bossa nova e samba.',
 'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1959, '1080p', FALSE),

('Deus e o Diabo na Terra do Sol',
 'Obra seminal do Cinema Novo de Glauber Rocha que acompanha um vaqueiro nordestino dividido entre o fanatismo religioso e o cangaço no sertão brasileiro.',
 'https://images.unsplash.com/photo-1534796636912-3b95b3ab5986?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1964, '1080p', FALSE),

('Os Fuzis',
 'Drama de Ruy Guerra sobre soldados enviados para proteger um armazém de comida de retirantes famintos no Nordeste, revelando a violência estrutural contra os pobres do sertão.',
 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1964, '720p', FALSE),

('A Falecida',
 'Adaptação da peça de Nelson Rodrigues por Leon Hirszman, sobre uma mulher da Zona Norte do Rio obcecada com seu próprio funeral suntuoso enquanto seu casamento desmorona.',
 'https://images.unsplash.com/photo-1504593811423-6dd665756598?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1965, '1080p', FALSE),

('São Paulo, Sociedade Anônima',
 'Filme de Luís Sérgio Person que retrata a crise existencial de um jovem na São Paulo em plena industrialização, capturando a alienação e o vazio da metrópole em expansão.',
 'https://images.unsplash.com/photo-1519608487953-e999c86e7455?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1965, '576p', FALSE),

('Todas as Mulheres do Mundo',
 'Comédia romântica brasileira de Domingos de Oliveira sobre um homem carioca incapaz de se decidir entre seu amor por uma mulher e sua atração por todas as outras.',
 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1966, '720p', FALSE),

('Processo de Satanás na Vila de Leva-e-Traz',
 'Curta-metragem brasileiro que mistura folclore e sátira social ao encenar um julgamento do diabo numa vila fictícia do interior, expondo hipocrisias morais com humor ácido.',
 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1967, '720p', FALSE),

('Terra em Transe',
 'Alegoria política de Glauber Rocha sobre um poeta-jornalista dividido entre um político populista e um líder autoritário num país fictício da América Latina em crise.',
 'https://images.unsplash.com/photo-1477346611705-65d1883cee1e?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Brasileiro', 1967, '720p', FALSE);


-- -------------------------------------------------------
-- ★  NOUVELLE VAGUE
-- -------------------------------------------------------
INSERT INTO videos (titulo, descricao, capa_url, video_url, categoria, ano, qualidade, em_destaque) VALUES

('Pickpocket',
 'Filme minimalista de Robert Bresson sobre um jovem intelectual parisiense que se torna batedor de carteiras por convicção filosófica, numa espiral de isolamento e obsessão.',
 'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1959, '1080p', FALSE),

('Léon Morin, Priest',
 'Drama de Jean-Pierre Melville sobre a relação intensa entre uma viúva ateía e comunista e um jovem padre carismático durante a ocupação nazista na França.',
 'https://images.unsplash.com/photo-1515542622106-78bda8ba0e5b?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1961, '1080p', FALSE),

('Cléo from 5 to 7',
 'Obra-prima de Agnès Varda que acompanha em tempo quase real uma cantora parisiense durante duas horas de espera pelo resultado de uma biópsia, transformando a cidade em espelho de sua angústia.',
 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1962, '720p', FALSE),

('Vivre Sa Vie',
 'Jean-Luc Godard divide em doze quadros a trajetória de uma jovem parisiense que abandona o marido e, sem perspectivas, acaba enveredando pela prostituição.',
 'https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1962, '1080p', FALSE),

('Le Bonheur',
 'Agnès Varda constrói uma fábula provocadora sobre um jovem marceneiro que considera perfeitamente natural amar sua esposa e sua amante ao mesmo tempo, num filme de cores impressionistas.',
 'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1965, '720p', FALSE),

('Au Hasard Balthazar',
 'Obra transcendental de Robert Bresson que narra a vida de um burro chamado Balthazar, passando de dono em dono, como alegoria da inocência sacrificada pela crueldade humana.',
 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1966, '1080p', FALSE),

('Masculin Féminin',
 'Godard retrata a juventude parisiense dos anos 60 através de um jovem idealista apaixonado por uma aspirante a cantora pop, em quinze ''fatos precisos'' sobre uma geração.',
 'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1966, '1080p', FALSE),

('Belle de Jour',
 'Luis Buñuel dirige Catherine Deneuve como uma jovem burguesa parisiense que, entediada com seu casamento, passa a trabalhar secretamente numa casa de prostituição durante as tardes.',
 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1967, '1080p', FALSE),

('La Chinoise',
 'Sátira política de Godard sobre um grupo de jovens maoístas parisienses que debatem revolução e ideologia num apartamento decorado com o Livro Vermelho de Mao.',
 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1967, '720p', FALSE),

('Je t''aime, Je t''aime',
 'Ficção científica existencialista de Alain Resnais sobre um homem que, após uma tentativa de suicídio, é usado como cobaia num experimento de viagem no tempo que o prende em memórias fragmentadas.',
 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1968, '720p', FALSE),

('Stolen Kisses',
 'Truffaut retoma o personagem Antoine Doinel, agora um jovem desajeitado que, após sair do exército, trabalha como detetive particular enquanto se apaixona por uma mulher mais velha.',
 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Nouvelle Vague', 1968, '720p', FALSE);


-- -------------------------------------------------------
-- ★  CINEMA JAPONÊS
-- -------------------------------------------------------
INSERT INTO videos (titulo, descricao, capa_url, video_url, categoria, ano, qualidade, em_destaque) VALUES

('Ugetsu',
 'Obra-prima de Kenji Mizoguchi ambientada nas guerras civis do Japão feudal, onde dois camponeses ambiciosos abandonam suas famílias e encontram consequências sobrenaturais e trágicas.',
 'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1952, '1080p', FALSE),

('A Story from Chikamatsu',
 'Mizoguchi adapta uma peça de bunraku sobre o amor proibido entre a esposa de um rico mercador e um de seus empregados no Japão do período Edo, levando ambos à condenação social.',
 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1954, '720p', FALSE),

('The Blue Sky Maiden',
 'Drama japonês dos anos 50 que retrata com delicadeza as aspirações e os dilemas de uma jovem mulher enfrentando as expectativas sociais conservadoras do pós-guerra.',
 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1957, '1080p', FALSE),

('Trilogia The Human Condition',
 'Épico monumental de Masaki Kobayashi que acompanha um pacifista japonês forçado a servir na Segunda Guerra, retratando a brutalidade do militarismo imperial em mais de nove horas.',
 'https://images.unsplash.com/photo-1534796636912-3b95b3ab5986?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1959, '1080p', FALSE),

('When a Woman Ascends the Stairs',
 'Drama intimista de Mikio Naruse sobre uma viúva que trabalha como hostess em bares de Ginza, lutando pela independência financeira e emocional numa sociedade que a sufoca.',
 'https://images.unsplash.com/photo-1519608487953-e999c86e7455?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1960, '1080p', FALSE),

('Harakiri',
 'Obra devastadora de Masaki Kobayashi sobre um samurai sem mestre que chega a um castelo pedindo permissão para cometer seppuku, desmascarando a hipocrisia do código de honra feudal.',
 'https://images.unsplash.com/photo-1524712245354-2c4e5e7121c0?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1962, '1080p', FALSE),

('Woman in the Dunes',
 'Alegoria existencialista de Hiroshi Teshigahara sobre um entomologista que fica preso no fundo de uma cova de areia com uma mulher misteriosa, forçado a escavar eternamente para sobreviver.',
 'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1964, '1080p', FALSE),

('A Story Written with Water',
 'Drama psicológico japonês que explora tabus familiares e desejos reprimidos através da relação complexa e perturbadora entre um jovem e sua mãe adotiva.',
 'https://images.unsplash.com/photo-1505533321630-975218a5f66f?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1965, '1080p', FALSE),

('Samurai Rebellion',
 'Masaki Kobayashi dirige Toshirō Mifune como um samurai que desafia seu senhor feudal ao recusar devolver a nora que foi obrigado a aceitar e que trouxe felicidade ao seu filho.',
 'https://images.unsplash.com/photo-1477346611705-65d1883cee1e?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1967, '1080p', FALSE),

('Eros + Massacre',
 'Épico experimental de Yoshishige Yoshida que entrelaça duas narrativas paralelas: a vida do anarquista Sakae Ōsugi nos anos 1920 e duas jovens estudantes nos turbulentos anos 1960.',
 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Japonês', 1969, '1080p', FALSE);


-- -------------------------------------------------------
-- ★  CINEMA ITALIANO
-- -------------------------------------------------------
INSERT INTO videos (titulo, descricao, capa_url, video_url, categoria, ano, qualidade, em_destaque) VALUES

('L''Avventura',
 'Marco da modernidade cinematográfica de Michelangelo Antonioni, onde o desaparecimento de uma mulher numa ilha vulcânica leva seu namorado e sua melhor amiga a uma busca que se dissolve em apatia e desejo.',
 'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Italiano', 1960, '1080p', FALSE),

('La Dolce Vita',
 'Federico Fellini retrata a vida fútil e glamourosa da alta sociedade romana através dos olhos de um jornalista de fofocas que vaga pela Via Veneto em busca de sentido.',
 'https://images.unsplash.com/photo-1515542622106-78bda8ba0e5b?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Italiano', 1960, '720p', FALSE),

('La Notte',
 'Antonioni examina a crise de um casamento burguês durante 24 horas em Milão, onde um escritor e sua esposa confrontam o vazio emocional que se instalou entre eles.',
 'https://images.unsplash.com/photo-1542204165-65bf26472b9b?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Italiano', 1961, '1080p', FALSE),

('L''Eclisse',
 'Antonioni conclui sua trilogia da incomunicabilidade com a história de uma jovem tradutora que termina um relacionamento e inicia outro, igualmente fadado ao vazio existencial.',
 'https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Italiano', 1962, '1080p', FALSE),

('8½',
 'Obra autobiográfica e visionária de Fellini sobre um cineasta em crise criativa que se refugia em memórias, sonhos e fantasias enquanto tenta conceber seu próximo filme.',
 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Italiano', 1963, '1080p', FALSE),

('Medea',
 'Pier Paolo Pasolini reimagina a tragédia grega de Eurípides com Maria Callas no papel titular, contrastando o mundo arcaico e ritualístico de Medeia com a racionalidade de Jasão.',
 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Italiano', 1969, '720p', FALSE),

('Porcile',
 'Provocação radical de Pasolini que entrelaça duas parábolas: um jovem canibal na antiguidade e o filho de um industrial nazista na Alemanha moderna, ambos consumidos por tabus.',
 'https://images.unsplash.com/photo-1501862700950-18382cd41497?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Italiano', 1969, '1080p', FALSE);


-- -------------------------------------------------------
-- ★  CINEMA INDIANO
-- -------------------------------------------------------
INSERT INTO videos (titulo, descricao, capa_url, video_url, categoria, ano, qualidade, em_destaque) VALUES

('Pather Panchali',
 'Primeiro filme da Trilogia de Apu de Satyajit Ray, retratando a infância de um menino numa aldeia empobrecida de Bengala, com uma poesia visual que revolucionou o cinema indiano.',
 'https://images.unsplash.com/photo-1528164344885-47b852f56fd7?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Indiano', 1955, '1080p', FALSE),

('Aparajito',
 'Segundo filme da Trilogia de Apu, acompanhando o jovem protagonista que deixa a aldeia natal para estudar em Calcutá, dividido entre a busca pelo conhecimento e o dever filial.',
 'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Indiano', 1956, '1080p', FALSE),

('Apur Sansar',
 'Conclusão da Trilogia de Apu de Satyajit Ray, em que Apu, agora adulto e escritor fracassado, encontra o amor inesperado e enfrenta perdas devastadoras que o forçam a amadurecer.',
 'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Indiano', 1959, '1080p', FALSE),

('Anuradha',
 'Drama musical de Hrishikesh Mukherjee sobre uma talentosa cantora que abandona sua carreira para se casar com um médico idealista numa vila remota, definhando em silêncio e solidão.',
 'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Cinema Indiano', 1959, 'DVDRip', FALSE);


-- -------------------------------------------------------
-- ★  SUSPENSE & NOIR
-- -------------------------------------------------------
INSERT INTO videos (titulo, descricao, capa_url, video_url, categoria, ano, qualidade, em_destaque) VALUES

('The Maltese Falcon',
 'Clássico noir de John Huston com Humphrey Bogart como o detetive Sam Spade, envolvido numa teia de mentiras e assassinatos em torno de uma valiosa estátua de falcão.',
 'https://images.unsplash.com/photo-1504593811423-6dd665756598?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Suspense & Noir', 1941, '1080p', FALSE),

('Vertigo',
 'Alfred Hitchcock tece um labirinto de obsessão e identidade em que um detetive acrofóbico se apaixona por uma mulher misteriosa e tenta recriá-la após sua morte aparente.',
 'https://images.unsplash.com/photo-1516410529446-2c777cb7366d?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Suspense & Noir', 1958, '1080p', FALSE),

('Night Tide',
 'Um jovem marinheiro de licença em Los Angeles se apaixona por uma misteriosa artista de feira que afirma ser uma sereia de verdade, enquanto mortes suspeitas se acumulam.',
 'https://images.unsplash.com/photo-1505533321630-975218a5f66f?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Suspense & Noir', 1961, '1080p', FALSE),

('What Ever Happened to Baby Jane',
 'Duelo psicológico aterrorizante entre Bette Davis e Joan Crawford como duas irmãs ex-estrelas de Hollywood, uma das quais mantém a outra prisioneira em sua própria mansão decadente.',
 'https://images.unsplash.com/photo-1495344517868-8ebaf0a2044a?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Suspense & Noir', 1962, '1080p', FALSE),

('Bonnie and Clyde',
 'Arthur Penn reinventou o cinema americano com esta história explosiva dos amantes criminosos Bonnie Parker e Clyde Barrow, que aterrorizaram o interior dos EUA durante a Grande Depressão.',
 'https://images.unsplash.com/photo-1542204165-65bf26472b9b?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Suspense & Noir', 1967, '1080p', FALSE);


-- -------------------------------------------------------
-- ★  EXPERIMENTAL & VANGUARDA
-- -------------------------------------------------------
INSERT INTO videos (titulo, descricao, capa_url, video_url, categoria, ano, qualidade, em_destaque) VALUES

('Dainah, the Mixed',
 'Curta experimental francês de Jean Grémillon que combina vanguarda visual e ritmo musical ao bordo de um navio, desafiando as convenções narrativas do cinema dos anos 30.',
 'https://images.unsplash.com/photo-1505533321630-975218a5f66f?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1932, '720p', FALSE),

('Guns of the Trees',
 'Filme seminal de Jonas Mekas sobre dois casais no Greenwich Village dos anos 60 que buscam sentido existencial através da arte, do ativismo e da vida boêmia nova-iorquina.',
 'https://images.unsplash.com/photo-1494548162494-384bba4ab999?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1961, '1080p', FALSE),

('La Jetée',
 'Obra-prima de Chris Marker composta quase inteiramente de fotografias estáticas, narrando a história de um prisioneiro do pós-apocalipse enviado ao passado através de memórias.',
 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1962, '720p', FALSE),

('Salut les Cubains',
 'Documentário experimental de Agnès Varda que anima milhares de fotografias tiradas durante sua visita a Cuba, criando um retrato vibrante e musical da revolução cubana.',
 'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1963, '1080p', FALSE),

('Soy Cuba',
 'Produção soviético-cubana de Mikhail Kalatozov com virtuosismo cinematográfico extremo, retratando quatro episódios de opressão em Cuba antes da revolução de Fidel Castro.',
 'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1964, '1080p', FALSE),

('The Koumiko Mystery',
 'Ensaio cinematográfico de Chris Marker sobre uma jovem japonesa que ele conheceu durante as Olimpíadas de Tóquio de 1964, misturando documentário, poesia e reflexão cultural.',
 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1965, '1080p', FALSE),

('Daisies',
 'Subversão anarquista e colorida de Věra Chytilová em que duas jovens decidem que o mundo é ''estragado'' e se dedicam a destruir tudo ao seu redor numa celebração dadaísta.',
 'https://images.unsplash.com/photo-1485163819542-13adeb5e0068?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1966, '1080p', FALSE),

('EMOTION',
 'Curta-metragem experimental japonês de Nobuhiko Ōbayashi que mistura animação, colagem e filmagens caseiras numa exploração lúdica e fragmentada da emoção e da memória.',
 'https://images.unsplash.com/photo-1574267432553-4b4628081c31?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1966, '1080p', FALSE),

('Fuses',
 'Filme experimental de Carolee Schneemann que sobrepõe imagens de intimidade sexual com texturas pintadas e arranhadas diretamente na película, desafiando os tabus da representação do corpo.',
 'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1967, '1080p', FALSE),

('Uncle Yanco',
 'Curta documental de Agnès Varda sobre seu encontro com um tio-avô grego-americano excêntrico que vive numa casa flutuante em Sausalito, celebrando a liberdade e a arte.',
 'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1967, '1080p', FALSE),

('Tetralogia das Estações de Marcel Hanoun',
 'Conjunto de quatro filmes experimentais de Marcel Hanoun que exploram o ciclo das estações como metáforas da passagem do tempo, da vida e da morte, com estética radical e contemplativa.',
 'https://images.unsplash.com/photo-1533158326339-7f3cf2404354?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1968, '1080p', FALSE),

('Black Panthers',
 'Documentário curto de Agnès Varda que registra as atividades dos Panteras Negras em Oakland, Califórnia, durante a campanha pela libertação de Huey Newton em 1968.',
 'https://images.unsplash.com/photo-1504593811423-6dd665756598?w=400&h=600&fit=crop&q=80',
 'https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview',
 'Experimental & Vanguarda', 1968, '1080p', FALSE);


-- ============================================================================
-- 3. VERIFICAÇÃO RÁPIDA
-- ============================================================================

-- Contagem total de filmes (esperado: 82)
-- SELECT COUNT(*) AS total_filmes FROM videos;

-- Contagem por categoria
-- SELECT categoria, COUNT(*) AS qtd FROM videos GROUP BY categoria ORDER BY qtd DESC;

-- Filme em destaque
-- SELECT titulo, ano FROM videos WHERE em_destaque = TRUE;


-- ============================================================================
-- 4. INSTRUÇÕES — COMO SUBSTITUIR AS URLs DE VÍDEO
-- ============================================================================
--
-- Todos os campos `video_url` estão com o placeholder:
--   https://drive.google.com/file/d/SEU_FILE_ID_AQUI/preview
--
-- Para obter o FILE_ID real de cada vídeo no Google Drive:
--
--   1. Abra o Google Drive e localize o arquivo de vídeo.
--   2. Clique com o botão direito → "Compartilhar" → "Qualquer pessoa com o link".
--   3. Copie o link. Ele terá o formato:
--        https://drive.google.com/file/d/1aBcDeFgHiJkLmNoPqRsTuVwXyZ/view?usp=sharing
--   4. O FILE_ID é a parte entre /d/ e /view:
--        1aBcDeFgHiJkLmNoPqRsTuVwXyZ
--   5. Substitua SEU_FILE_ID_AQUI pelo FILE_ID real:
--        https://drive.google.com/file/d/1aBcDeFgHiJkLmNoPqRsTuVwXyZ/preview
--
-- DICA: Use um UPDATE para trocar todos de uma vez. Exemplo:
--
--   UPDATE videos
--   SET video_url = 'https://drive.google.com/file/d/SEU_ID_REAL/preview'
--   WHERE titulo = 'Häxan';
--
-- Ou, para atualizar em lote via script:
--
--   UPDATE videos SET video_url = CASE titulo
--     WHEN 'Häxan'   THEN 'https://drive.google.com/file/d/ID_1/preview'
--     WHEN 'Faust'   THEN 'https://drive.google.com/file/d/ID_2/preview'
--     -- ... continue para cada filme
--     ELSE video_url
--   END;
--
-- ============================================================================
-- FIM DO SEED — 82 filmes clássicos inseridos com sucesso.
-- ============================================================================
