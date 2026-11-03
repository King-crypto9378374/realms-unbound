-- Realms Unbound: private per-user campaign saves
-- Run this in Supabase Dashboard > SQL Editor.
create table if not exists public.realm_saves (
  user_id uuid primary key references auth.users(id) on delete cascade,
  save_data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.realm_saves enable row level security;

drop policy if exists "Users can read their own realm save" on public.realm_saves;
create policy "Users can read their own realm save"
  on public.realm_saves for select
  to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists "Users can create their own realm save" on public.realm_saves;
create policy "Users can create their own realm save"
  on public.realm_saves for insert
  to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update their own realm save" on public.realm_saves;
create policy "Users can update their own realm save"
  on public.realm_saves for update
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can delete their own realm save" on public.realm_saves;
create policy "Users can delete their own realm save"
  on public.realm_saves for delete
  to authenticated
  using ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.realm_saves to authenticated;
