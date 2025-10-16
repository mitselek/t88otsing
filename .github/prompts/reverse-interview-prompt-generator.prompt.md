# Reverse Interview Prompt Generator

Last updated: 2025-10-17T00:45:22+03:00

**Purpose**: Generate optimized prompts through iterative interview process, suitable for any AI model

**Target AI**: Model-agnostic (works with GPT-4, Claude, Copilot, etc.)

**Use Case**: Creating custom prompts for specific tasks through guided conversation

---

## Task Instructions

**Primary objective**: Conduct an interview to understand the user's goal, then generate an optimized prompt based on their responses.

**Interview process**:

1. **Ask one question at a time** - each answer should inform the next question
2. **Build understanding progressively** - start broad, then focus on specifics
3. **Clarify requirements systematically** - cover task, context, constraints, format
4. **Validate understanding** - confirm key details before finalizing

**Key areas to explore**:

- **Task definition**: What specific outcome does the user want?
- **Target audience**: Who will use this prompt and in what context?
- **Input expectations**: What kind of information will be provided?
- **Output requirements**: Format, length, tone, structure needed?
- **Constraints**: Any limitations, safety requirements, or boundaries?
- **Success criteria**: How will effectiveness be measured?

**Question progression strategy**:

Start with: "What specific task or outcome do you want the AI to accomplish?"

Then explore based on responses:

- Clarify scope and boundaries
- Understand input/output relationships  
- Identify quality standards
- Determine success metrics
- Explore edge cases or special requirements

**Final prompt requirements**:

Generate a complete, ready-to-use prompt that includes:

- Clear task description
- Specific guidelines and constraints  
- Output format specifications
- Quality standards
- Examples when helpful
- Validation criteria

**Markdown formatting standards**:

Ensure the final prompt follows clean formatting:

- Use blank lines before and after all headings
- Use blank lines before and after all lists
- Use blank lines before and after all code blocks  
- Remove trailing spaces from lines
- Use emojis conservatively (avoid in formal contexts)
- Include validation step: "Review output for formatting compliance"

**Model adaptation note**: This prompt is designed to work across different AI models. Focus on universal best practices rather than model-specific syntax.

---

## Example Usage

**User Goal**: "Create a system prompt for an AI that can effectively rewrite my emails into a clearer, simpler writing style"

**Interview Flow**:

```text
AI: What specific aspects of your emails do you want to improve? For example, are they too formal, too wordy, unclear in purpose, or something else?

User: They tend to be too wordy and formal. I want them to be more direct and friendly.

AI: What types of emails are you typically writing? Are these professional emails to colleagues, client communications, personal messages, or a mix?

User: Mostly professional emails to colleagues and clients, but I want a friendlier tone without being unprofessional.

AI: How long are your typical emails, and what length would be ideal? Also, are there any specific phrases or elements you always want to keep (like signatures, legal disclaimers, etc.)?

[Continue interview based on responses...]
```

**Final Output**: Complete prompt ready for use with any AI model.

---

## Usage Instructions

1. **State your goal clearly** - describe what kind of prompt you want to create

2. **Engage with the interview** - answer questions thoughtfully and ask for clarification if needed

3. **Provide specific examples** - concrete details help create better prompts

4. **Review and refine** - test the final prompt and request adjustments if needed

### Tips for Best Results

- **Be specific about context**: Mention your typical use case, audience, and constraints
- **Share examples**: Describe both good and bad examples of the task
- **Consider edge cases**: Think about unusual situations the prompt should handle
- **Clarify success metrics**: How will you know the prompt is working well?
- **Iterate**: The first version can always be improved based on real use

### Interview Quality Guidelines

**For the AI conducting the interview**:

- Ask open-ended questions that reveal preferences and constraints
- Follow up on vague answers with specific clarifying questions
- Build on previous answers to create a complete picture
- Confirm understanding before moving to final prompt generation
- Focus on practical, actionable requirements

---

## Validation Resources

After receiving your custom prompt:

- **Test with sample inputs**: Try the prompt with real examples
- **Check for clarity**: Ensure instructions are unambiguous  
- **Verify completeness**: Confirm all requirements are covered
- **Iterate based on results**: Refine the prompt based on actual performance
- **Document successful patterns**: Keep track of what works well

---

## Markdown Formatting Requirements

This prompt generates markdown output. To ensure professional formatting:

- Use blank lines before and after all headings
- Use blank lines before and after all lists (bullet or numbered)
- Use blank lines before and after all code blocks
- Remove trailing spaces from lines
- Avoid inline HTML unless necessary
- Use emojis conservatively: avoid in formal documentation, use clear text prefixes instead

Before presenting final output:

- Review document for proper spacing around all elements
- Verify consistent markdown syntax throughout  
- Check that prompt includes all requested elements
- Ensure clear, actionable instructions

**RECURSIVE REQUIREMENT**: If the prompt generated through this interview process will itself create markdown content (such as documentation, reports, or other prompts), that prompt MUST also include these same markdown formatting requirements to ensure quality standards propagate through all levels of generation.

---

## Notes

This interview-based approach works with any AI model and creates more targeted, effective prompts than generic templates. The iterative process ensures the final prompt matches your specific needs and context.

**Research Date**: October 17, 2025
**Approach**: Model-agnostic interview methodology for custom prompt generation
