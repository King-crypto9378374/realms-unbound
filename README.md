# Realms Unbound

A fantasy campaign dashboard with character stats, inventory, gold ledger, property, followers, factions, quests, skills, reputation, and a story journal.

## Run or deploy

This is a static site. Open `index.html` for local browser testing, or enable GitHub Pages under repository **Settings → Pages**, selecting the `main` branch and root folder.

## Enable accounts and cloud saves

The site uses Supabase Auth (email/password) and a private per-user JSON save table.

1. Create a project at https://supabase.com/.
2. In Supabase, open **SQL Editor**, paste and run [supabase/schema.sql](supabase/schema.sql).
3. Open **Project Settings → API** and copy the Project URL and anon/publishable key.
4. Put those two public values into [supabase-config.js](supabase-config.js), replacing the placeholders.
5. In Supabase **Authentication → URL Configuration**, add your deployed site URL to the allowed redirect URLs. Add your local testing URL too, if needed.
6. In **Authentication → Providers**, make sure Email is enabled.
7. Open the site and choose **Account** to create an account or sign in.

The site supports account creation, sign-in, sign-out, password reset, and automatic cloud syncing. If an account has no cloud save yet, its current browser save is uploaded.

## Security

- Row Level Security is enabled on `realm_saves`. Each signed-in user can access only the row matching their Supabase Auth user ID.
- Only the Supabase anon/publishable key belongs in browser config. **Never put a service_role key or database password in this repository.**
- Do not store real financial, medical, or other sensitive personal records here. Health, money, assets, and followers are fictional game statistics.
- Local browser saves remain available before cloud configuration is complete.
