create table public.profiles (
  id uuid primary key references auth.users (id),
  full_name text,
  email text,
  phone text
);
alter table public.profiles enable row level security;

-- Each user edits only their own profile.
create policy "own profile is editable" on public.profiles
  for update using (auth.uid() = id);

create table public.orders (
  id bigint generated always as identity primary key,
  user_id uuid references auth.users (id),
  total numeric
);
alter table public.orders enable row level security;
