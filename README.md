# 🧠 AI Fitness Coach App

An AI-powered personalized fitness coach built using **Next.js**, **OpenAI**, **Gemini Nano Banana**, **Supabase**, **Shadcn UI**, and **Tailwind CSS**.

This app generates **personalized Workout Plans, Diet Plans, Lifestyle Tips, Motivations, AI Images, and Voice Output** using multiple AI APIs.  
A fully interactive, modern, and scalable fitness assistant.

---

## 🚀 Features

### 🧬 **AI-Powered Personalized Fitness Plan**

Users can enter their details:

- Name, Age, Gender
- Height & Weight
- Fitness Goal (Weight Loss, Muscle Gain, etc.)
- Current Fitness Level
- Workout Location (Home / Gym / Outdoor)
- Dietary Preference (Veg / Vegan / Keto / Non-Veg)
- Lifestyle Info (Stress Level, Sleep, Medical History)

The app dynamically generates:

- 🏋️ **Workout Plan** (Exercises, sets, reps, rest time)
- 🥗 **Diet Plan** (Breakfast, lunch, dinner, snacks)
- 💡 **Lifestyle Tips & Posture Advice**
- 💬 **Daily Motivation Quotes**
- ⚡ No hardcoding — fully AI-generated

---

## 🔊 Voice Features (TTS)

Powered by **ElevenLabs**:

- “**Read My Plan**” voice output option
- Listen to **Workout Plan** or **Diet Plan**
- Natural human-like voices

---

## 🖼️ AI Image Generation

When a user clicks any exercise or meal:

- “Barbell Squat” → exercise image
- “Oats Bowl” → food-style AI image
- Uses **OpenAI Images API** or **Gemini Nano Banana** (configurable)

---

## 📤 Export & Utilities

- 📄 Export generated plan as **PDF**
- 🌗 **Dark / Light mode**
- 💾 Save plan in **LocalStorage** or **Supabase**
- 🔄 Regenerate Plan
- 🎬 Smooth animations (Framer Motion)

---

## 🛠️ Tech Stack

| Category       | Tools                              |
| -------------- | ---------------------------------- |
| **Frontend**   | Next.js 14+, React                 |
| **UI**         | Tailwind CSS, Shadcn UI            |
| **AI APIs**    | OpenAI (GPT-4/GPT-4o), Nano Banana |
| **Voice**      | ElevenLabs TTS                     |
| **Database**   | Supabase                           |
| **Deployment** | Vercel                             |
| **Styling**    | Tailwind + Custom Components       |

---

---

# 🧠 Prompt Engineering

`lib/prompts.ts` contains:

- Workout Prompt
- Diet Prompt
- Motivation Prompt
- Lifestyle/Posture Tips Prompt

AI responses are fully dynamic and personalized based on user input.

---

# ▶️ Running the Project

### 1️⃣ Install packages

```bash
npm install
npm run dev
```

---

## 🧩 Future Enhancements

- User Accounts & History
- Weekly Plan Generation
- Custom Workout Library
- Chat with AI Fitness Coach
- Wearable Device Integration

---

## 🚀 Deployment

### Deploy instantly using Vercel:

vercel deploy

---

📄 License

MIT License — free to use and modif
