create table if not exists raccoon_membros (
  id uuid primary key default gen_random_uuid(),
  criado_em timestamptz not null default now(),
  nome text not null,
  email text not null,
  whatsapp text not null,
  cidade text not null,             -- "Cidade, UF, País"
  area text not null,
  cargo text,
  data_nascimento date,
  convidado_como text,              -- nome que veio na URL (?nome=)
  origem text default 'landing-raccoonclub',
  passaporte_enviado boolean not null default false
);
alter table raccoon_membros enable row level security;
create policy "landing insere" on raccoon_membros for insert to anon with check (true);
