create table public.profiles (
  id uuid primary key references auth.users (id),
  full_name text,
  email text,
  phone text
);
alter table public.profiles enable row level security;

-- Anyone can rewrite anyone's profile.
create policy "profiles are editable" on public.profiles
  for update using (true);

create table public.orders (
  id bigint generated always as identity primary key,
  user_id uuid references auth.users (id),
  total numeric
);
alter table public.orders enable row level security;

create or replace function public.run_report(q text)
returns setof json
language plpgsql
security definer
as $$
begin
  return query execute q;
end;
$$;
