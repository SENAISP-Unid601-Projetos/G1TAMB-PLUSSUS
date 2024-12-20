PGDMP                  
    |            sus    16.1    16.1 D    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    16828    sus    DATABASE     ~   CREATE DATABASE sus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE sus;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            =           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16843    adm    TABLE     r   CREATE TABLE public.adm (
    login character varying(255) NOT NULL,
    senha character varying(200) NOT NULL
);
    DROP TABLE public.adm;
       public         heap    postgres    false    4            �            1259    16899 	   consultas    TABLE       CREATE TABLE public.consultas (
    id_consulta integer NOT NULL,
    horario time without time zone NOT NULL,
    descricao character varying(255) NOT NULL,
    data date NOT NULL,
    fk_cpf_paciente character varying(14),
    fk_crm_medico character varying(20)
);
    DROP TABLE public.consultas;
       public         heap    postgres    false    4            �            1259    16898    consultas_id_consulta_seq    SEQUENCE     �   CREATE SEQUENCE public.consultas_id_consulta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.consultas_id_consulta_seq;
       public          postgres    false    4    225            >           0    0    consultas_id_consulta_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.consultas_id_consulta_seq OWNED BY public.consultas.id_consulta;
          public          postgres    false    224            �            1259    16863    exames    TABLE     f  CREATE TABLE public.exames (
    id_exame integer NOT NULL,
    tipo character varying(255) NOT NULL,
    data_exame date NOT NULL,
    resultado character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    observacoes character varying(255) NOT NULL,
    fk_cpf_paciente character varying(14),
    fk_crm_medico character varying(20)
);
    DROP TABLE public.exames;
       public         heap    postgres    false    4            �            1259    16862    exames_id_exame_seq    SEQUENCE     �   CREATE SEQUENCE public.exames_id_exame_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.exames_id_exame_seq;
       public          postgres    false    4    221            ?           0    0    exames_id_exame_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.exames_id_exame_seq OWNED BY public.exames.id_exame;
          public          postgres    false    220            �            1259    16976    ficha_medica_paciente    TABLE     �  CREATE TABLE public.ficha_medica_paciente (
    id_ficha integer NOT NULL,
    fez_cirurgia character varying(1),
    cirurgia character varying(500),
    teve_internacao character varying(1),
    internacao character varying(500),
    toma_remedio character varying(1),
    remedio character varying(500),
    tem_alergia character varying(1),
    alergia character varying(500),
    fez_tratamento character varying(1),
    tratamento character varying(500),
    possui_problema_respiratorio character varying(1),
    problema_respiratorio character varying(500),
    possui_problema_figado_rin character varying(1),
    problema_figado_rin character varying(500),
    fuma character varying(1),
    tem_hepatite character varying(1),
    tem_diabetes character varying(1),
    possui_problema_cardiaco character varying(1),
    problema_cardiaco character varying(500),
    tipo_sanguineo character varying(3),
    fk_cpf character varying(14)
);
 )   DROP TABLE public.ficha_medica_paciente;
       public         heap    postgres    false    4            �            1259    16975 "   ficha_medica_paciente_id_ficha_seq    SEQUENCE     �   CREATE SEQUENCE public.ficha_medica_paciente_id_ficha_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.ficha_medica_paciente_id_ficha_seq;
       public          postgres    false    4    229            @           0    0 "   ficha_medica_paciente_id_ficha_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.ficha_medica_paciente_id_ficha_seq OWNED BY public.ficha_medica_paciente.id_ficha;
          public          postgres    false    228            �            1259    16849    medicamentos    TABLE       CREATE TABLE public.medicamentos (
    id_medicamentos integer NOT NULL,
    nome character varying(255) NOT NULL,
    marca character varying(255) NOT NULL,
    quantidade integer NOT NULL,
    fk_login_adm character varying(255),
    dosagem character varying(50)
);
     DROP TABLE public.medicamentos;
       public         heap    postgres    false    4            �            1259    16848     medicamentos_id_medicamentos_seq    SEQUENCE     �   CREATE SEQUENCE public.medicamentos_id_medicamentos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.medicamentos_id_medicamentos_seq;
       public          postgres    false    4    219            A           0    0     medicamentos_id_medicamentos_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.medicamentos_id_medicamentos_seq OWNED BY public.medicamentos.id_medicamentos;
          public          postgres    false    218            �            1259    16916    medicamentos_paciente    TABLE     �   CREATE TABLE public.medicamentos_paciente (
    id integer NOT NULL,
    fk_cpf_paciente character varying(14),
    fk_id_medicamentos integer
);
 )   DROP TABLE public.medicamentos_paciente;
       public         heap    postgres    false    4            �            1259    16915    medicamentos_paciente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medicamentos_paciente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.medicamentos_paciente_id_seq;
       public          postgres    false    227    4            B           0    0    medicamentos_paciente_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.medicamentos_paciente_id_seq OWNED BY public.medicamentos_paciente.id;
          public          postgres    false    226            �            1259    16836    medico    TABLE     E  CREATE TABLE public.medico (
    crm character varying(20) NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    cpf character varying(14) NOT NULL,
    telefone character varying(15) NOT NULL,
    senha character varying(30) NOT NULL,
    especialidade character varying(255)
);
    DROP TABLE public.medico;
       public         heap    postgres    false    4            �            1259    16829    paciente    TABLE     )  CREATE TABLE public.paciente (
    cpf character varying(14) NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    carteirinha_sus character varying(15) NOT NULL,
    telefone character varying(15) NOT NULL,
    senha character varying(30) NOT NULL
);
    DROP TABLE public.paciente;
       public         heap    postgres    false    4            �            1259    16882 
   prontuario    TABLE     �   CREATE TABLE public.prontuario (
    id_prontuario integer NOT NULL,
    tipo character varying(50) NOT NULL,
    descricao character varying(255) NOT NULL,
    fk_cpf_paciente character varying(14),
    fk_crm_medico character varying(20)
);
    DROP TABLE public.prontuario;
       public         heap    postgres    false    4            �            1259    16881    prontuario_id_prontuario_seq    SEQUENCE     �   CREATE SEQUENCE public.prontuario_id_prontuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.prontuario_id_prontuario_seq;
       public          postgres    false    4    223            C           0    0    prontuario_id_prontuario_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.prontuario_id_prontuario_seq OWNED BY public.prontuario.id_prontuario;
          public          postgres    false    222            x           2604    16902    consultas id_consulta    DEFAULT     ~   ALTER TABLE ONLY public.consultas ALTER COLUMN id_consulta SET DEFAULT nextval('public.consultas_id_consulta_seq'::regclass);
 D   ALTER TABLE public.consultas ALTER COLUMN id_consulta DROP DEFAULT;
       public          postgres    false    225    224    225            v           2604    16866    exames id_exame    DEFAULT     r   ALTER TABLE ONLY public.exames ALTER COLUMN id_exame SET DEFAULT nextval('public.exames_id_exame_seq'::regclass);
 >   ALTER TABLE public.exames ALTER COLUMN id_exame DROP DEFAULT;
       public          postgres    false    220    221    221            z           2604    16979    ficha_medica_paciente id_ficha    DEFAULT     �   ALTER TABLE ONLY public.ficha_medica_paciente ALTER COLUMN id_ficha SET DEFAULT nextval('public.ficha_medica_paciente_id_ficha_seq'::regclass);
 M   ALTER TABLE public.ficha_medica_paciente ALTER COLUMN id_ficha DROP DEFAULT;
       public          postgres    false    228    229    229            u           2604    16852    medicamentos id_medicamentos    DEFAULT     �   ALTER TABLE ONLY public.medicamentos ALTER COLUMN id_medicamentos SET DEFAULT nextval('public.medicamentos_id_medicamentos_seq'::regclass);
 K   ALTER TABLE public.medicamentos ALTER COLUMN id_medicamentos DROP DEFAULT;
       public          postgres    false    218    219    219            y           2604    16919    medicamentos_paciente id    DEFAULT     �   ALTER TABLE ONLY public.medicamentos_paciente ALTER COLUMN id SET DEFAULT nextval('public.medicamentos_paciente_id_seq'::regclass);
 G   ALTER TABLE public.medicamentos_paciente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            w           2604    16885    prontuario id_prontuario    DEFAULT     �   ALTER TABLE ONLY public.prontuario ALTER COLUMN id_prontuario SET DEFAULT nextval('public.prontuario_id_prontuario_seq'::regclass);
 G   ALTER TABLE public.prontuario ALTER COLUMN id_prontuario DROP DEFAULT;
       public          postgres    false    223    222    223            *          0    16843    adm 
   TABLE DATA                 public          postgres    false    217   FV       2          0    16899 	   consultas 
   TABLE DATA                 public          postgres    false    225   �V       .          0    16863    exames 
   TABLE DATA                 public          postgres    false    221   �W       6          0    16976    ficha_medica_paciente 
   TABLE DATA                 public          postgres    false    229   X       ,          0    16849    medicamentos 
   TABLE DATA                 public          postgres    false    219   �X       4          0    16916    medicamentos_paciente 
   TABLE DATA                 public          postgres    false    227   [Y       )          0    16836    medico 
   TABLE DATA                 public          postgres    false    216   uY       (          0    16829    paciente 
   TABLE DATA                 public          postgres    false    215   3Z       0          0    16882 
   prontuario 
   TABLE DATA                 public          postgres    false    223   �[       D           0    0    consultas_id_consulta_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.consultas_id_consulta_seq', 12, true);
          public          postgres    false    224            E           0    0    exames_id_exame_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.exames_id_exame_seq', 1, false);
          public          postgres    false    220            F           0    0 "   ficha_medica_paciente_id_ficha_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ficha_medica_paciente_id_ficha_seq', 3, true);
          public          postgres    false    228            G           0    0     medicamentos_id_medicamentos_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.medicamentos_id_medicamentos_seq', 17, true);
          public          postgres    false    218            H           0    0    medicamentos_paciente_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.medicamentos_paciente_id_seq', 1, false);
          public          postgres    false    226            I           0    0    prontuario_id_prontuario_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.prontuario_id_prontuario_seq', 1, false);
          public          postgres    false    222            �           2606    16847    adm adm_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.adm
    ADD CONSTRAINT adm_pkey PRIMARY KEY (login);
 6   ALTER TABLE ONLY public.adm DROP CONSTRAINT adm_pkey;
       public            postgres    false    217            �           2606    16904    consultas consultas_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (id_consulta);
 B   ALTER TABLE ONLY public.consultas DROP CONSTRAINT consultas_pkey;
       public            postgres    false    225            �           2606    16870    exames exames_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.exames
    ADD CONSTRAINT exames_pkey PRIMARY KEY (id_exame);
 <   ALTER TABLE ONLY public.exames DROP CONSTRAINT exames_pkey;
       public            postgres    false    221            �           2606    16985 6   ficha_medica_paciente ficha_medica_paciente_fk_cpf_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.ficha_medica_paciente
    ADD CONSTRAINT ficha_medica_paciente_fk_cpf_key UNIQUE (fk_cpf);
 `   ALTER TABLE ONLY public.ficha_medica_paciente DROP CONSTRAINT ficha_medica_paciente_fk_cpf_key;
       public            postgres    false    229            �           2606    16983 0   ficha_medica_paciente ficha_medica_paciente_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.ficha_medica_paciente
    ADD CONSTRAINT ficha_medica_paciente_pkey PRIMARY KEY (id_ficha);
 Z   ALTER TABLE ONLY public.ficha_medica_paciente DROP CONSTRAINT ficha_medica_paciente_pkey;
       public            postgres    false    229            �           2606    16921 0   medicamentos_paciente medicamentos_paciente_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.medicamentos_paciente
    ADD CONSTRAINT medicamentos_paciente_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.medicamentos_paciente DROP CONSTRAINT medicamentos_paciente_pkey;
       public            postgres    false    227            �           2606    16856    medicamentos medicamentos_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT medicamentos_pkey PRIMARY KEY (id_medicamentos);
 H   ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT medicamentos_pkey;
       public            postgres    false    219            ~           2606    16842    medico medico_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (crm);
 <   ALTER TABLE ONLY public.medico DROP CONSTRAINT medico_pkey;
       public            postgres    false    216            |           2606    16835    paciente paciente_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (cpf);
 @   ALTER TABLE ONLY public.paciente DROP CONSTRAINT paciente_pkey;
       public            postgres    false    215            �           2606    16887    prontuario prontuario_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.prontuario
    ADD CONSTRAINT prontuario_pkey PRIMARY KEY (id_prontuario);
 D   ALTER TABLE ONLY public.prontuario DROP CONSTRAINT prontuario_pkey;
       public            postgres    false    223            �           2606    16905 (   consultas consultas_fk_cpf_paciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_fk_cpf_paciente_fkey FOREIGN KEY (fk_cpf_paciente) REFERENCES public.paciente(cpf);
 R   ALTER TABLE ONLY public.consultas DROP CONSTRAINT consultas_fk_cpf_paciente_fkey;
       public          postgres    false    225    215    4732            �           2606    16910 &   consultas consultas_fk_crm_medico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_fk_crm_medico_fkey FOREIGN KEY (fk_crm_medico) REFERENCES public.medico(crm);
 P   ALTER TABLE ONLY public.consultas DROP CONSTRAINT consultas_fk_crm_medico_fkey;
       public          postgres    false    225    4734    216            �           2606    16871 "   exames exames_fk_cpf_paciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.exames
    ADD CONSTRAINT exames_fk_cpf_paciente_fkey FOREIGN KEY (fk_cpf_paciente) REFERENCES public.paciente(cpf);
 L   ALTER TABLE ONLY public.exames DROP CONSTRAINT exames_fk_cpf_paciente_fkey;
       public          postgres    false    221    215    4732            �           2606    16876     exames exames_fk_crm_medico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.exames
    ADD CONSTRAINT exames_fk_crm_medico_fkey FOREIGN KEY (fk_crm_medico) REFERENCES public.medico(crm);
 J   ALTER TABLE ONLY public.exames DROP CONSTRAINT exames_fk_crm_medico_fkey;
       public          postgres    false    4734    221    216            �           2606    16986 7   ficha_medica_paciente ficha_medica_paciente_fk_cpf_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ficha_medica_paciente
    ADD CONSTRAINT ficha_medica_paciente_fk_cpf_fkey FOREIGN KEY (fk_cpf) REFERENCES public.paciente(cpf);
 a   ALTER TABLE ONLY public.ficha_medica_paciente DROP CONSTRAINT ficha_medica_paciente_fk_cpf_fkey;
       public          postgres    false    229    4732    215            �           2606    16857 +   medicamentos medicamentos_fk_login_adm_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT medicamentos_fk_login_adm_fkey FOREIGN KEY (fk_login_adm) REFERENCES public.adm(login);
 U   ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT medicamentos_fk_login_adm_fkey;
       public          postgres    false    217    4736    219            �           2606    16922 @   medicamentos_paciente medicamentos_paciente_fk_cpf_paciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicamentos_paciente
    ADD CONSTRAINT medicamentos_paciente_fk_cpf_paciente_fkey FOREIGN KEY (fk_cpf_paciente) REFERENCES public.paciente(cpf);
 j   ALTER TABLE ONLY public.medicamentos_paciente DROP CONSTRAINT medicamentos_paciente_fk_cpf_paciente_fkey;
       public          postgres    false    215    4732    227            �           2606    16927 C   medicamentos_paciente medicamentos_paciente_fk_id_medicamentos_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicamentos_paciente
    ADD CONSTRAINT medicamentos_paciente_fk_id_medicamentos_fkey FOREIGN KEY (fk_id_medicamentos) REFERENCES public.medicamentos(id_medicamentos);
 m   ALTER TABLE ONLY public.medicamentos_paciente DROP CONSTRAINT medicamentos_paciente_fk_id_medicamentos_fkey;
       public          postgres    false    219    227    4738            �           2606    16888 *   prontuario prontuario_fk_cpf_paciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prontuario
    ADD CONSTRAINT prontuario_fk_cpf_paciente_fkey FOREIGN KEY (fk_cpf_paciente) REFERENCES public.paciente(cpf);
 T   ALTER TABLE ONLY public.prontuario DROP CONSTRAINT prontuario_fk_cpf_paciente_fkey;
       public          postgres    false    223    215    4732            �           2606    16893 (   prontuario prontuario_fk_crm_medico_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prontuario
    ADD CONSTRAINT prontuario_fk_crm_medico_fkey FOREIGN KEY (fk_crm_medico) REFERENCES public.medico(crm);
 R   ALTER TABLE ONLY public.prontuario DROP CONSTRAINT prontuario_fk_crm_medico_fkey;
       public          postgres    false    223    4734    216            *   I   x���v
Q���W((M��L�KL�Us�	uV�P�/I,��W�QP742615S״��$��-5'� U a��      2   J  x���_k�0 �w?E����]�?i�4��p2��c\�5�V��>Ⱦ��Yuc	}����5��|�� ���l�˵ʇ�.���y�|��Hy���o�Q�
4�n"EL#�q��Y����ۻ���:%��ʃީ�X��S�9�k��F�2��PD�����K<p�� ��W7҆�%��či��4gbk���ZC�ڨZHaK*���4n�N��
I�J�o�]��'��CB�K(���N��c�Ρ�ZV����M'E	%T�` �/������
�s20 ���Ȝ�P���_�Q;�������z_+�E.      .   
   x���          6      x���v
Q���W((M��L�K�L�H��MM�LN�/HL�L�+IUs�	uV�0�QP�S "s�Ks�1��s�s3�RQ�0�p��Т�̒�L���N� �����������H]Ӛ�� ��-�      ,   �   x���v
Q���W((M��L��MM�LN�M�+�/Vs�	uV�0�QP�,�/)��Q��S��,�L�r��|��ĲLG�0]]Ӛ˓HsM�Z�3sSӋ2RA��Rʳ�3S@���m`@��f@=~��ŉ9)�y� RSʁ������9��d�� 7�bs0 �+j�      4   
   x���          )   �   x����
�0��{�ަ�ŴE7�Ld�@T���mu::����y69��CB��2�W��TW2L�Ɔ���Ɛ����K�����ĕ�Ny���dig޴} c�sf!Maog��Тqj��x���� ��֕�! ��ʺ^����Ñ�H� "�����`�/�rl�hӡu�!�>kIF�      (   �  x��TQk�0~ϯ�[6��I��^\F(�э�۞�T�U���n�������6P}���th{����Xl���ˮs���{g��)~�~��y(ޭ	!�R `l��X[��tXۃv]��$	�EB\*�K~��~�q����If��I�؜tp��33�Ͳ�Wi8�o({�R۷�գF��c��%� 3��2� 3��sG;�c�����I������b]��t8��\o.�gZ��B2#��d0��6�,�'��fjC�8DK�`�2z*���s���MԚU�`�|_P����$O#��g��r��R0 �J���>9AzZ��T�pF��Yf�ƥ&�WR�`��?�Y|�᤻֟���G�n����œb��*5�����@+' ���CT�ŝ~�.�~�J;Q�`7���܅�Eq&�I���V���dc      0   
   x���         