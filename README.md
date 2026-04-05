# Kindroid News

Supports **Anthropic (Claude)**, **OpenAI (GPT)**, and **xAI (Grok)** as providers. No news API key needed — the AI does the web searching itself.

## What It Does
**Searches** the web for today's top news across your configured categories
**Summarizes** chosen categories into headlines
**Sends** the three basic news snippets to your Kindroid AI companion

## Customize

1. **config.json** choose categories you want shuffled plus omit topics, customize kindroid message opener
2. **railway** enter environment variables into railway:

NEWS_PROVIDER="..." <-- anthropic, openai, or grok
*PROVIDER*_API_KEY="sk..." <--- replace *provider* w/ anthropic, openai, or xai
KINDROID_AI_ID="..."
KINDROID_API_KEY="kn..."
SCHEDULE_CRON=" 0 11 * * * " <-- daily @ 6:00AM CDT

3. **default models:** grok-4-1-fast-reasoning, gpt-4.1, claude-haiku-4-5-20251001

## Prompt Hardening
URL verification — After the LLM responds, verify_headlines does an HTTP HEAD/GET on each source URL. Headlines with dead or missing URLs get dropped and logged:

✓ Verified: NASA confirms water ice deposits on lunar south pole
✗ Dropped (unverifiable): OpenAI releases AGI-level model surpassing human benchmarks

Only verified headlines get sent to Kindroid. If all 3 fail, nothing is sent rather than forwarding hallucinations. Check railway logs if nothing sends. 

## For Extra Help
Feed this repo into Claude Code or OpenAI Codex if you'd like guided setup or edits for personalization.