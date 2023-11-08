import mistralTokenizer from 'mistral-tokenizer-js';
import llamaTokenizer from 'llama-tokenizer-js';
import { OPENAI_API_TYPE } from '../utils/app/const';

export interface OpenAIModel {
  id: string;
  name: string;
  maxLength: number; // maximum length of a message
  tokenLimit: number;
}

export enum OpenAIModelID {
  // OpenChat
  OPENCHAT3_2 = 'openchat_v3.2',
  OPENCHAT_3_2_MISTRAL = 'openchat_v3.2_mistral',
}

// in case the `DEFAULT_MODEL` environment variable is not set or set to an unsupported model
export const fallbackModelID = OpenAIModelID.OPENCHAT_3_2_MISTRAL;

export const OpenAIModels: Record<OpenAIModelID, OpenAIModel> = {
  // OpenChat
  [OpenAIModelID.OPENCHAT3_2]: {
    id: OpenAIModelID.OPENCHAT3_2,
    name: 'OpenChat 3.2',
    maxLength: 4096 * 3,
    tokenLimit: 4096,
  },

  [OpenAIModelID.OPENCHAT_3_2_MISTRAL]: {
    id: OpenAIModelID.OPENCHAT_3_2_MISTRAL,
    name: 'OpenChat Aura',
    maxLength: 8192 * 3,
    tokenLimit: 8192,
  },
};

export const OpenAITokenizers: Record<OpenAIModelID, any> = {
  [OpenAIModelID.OPENCHAT3_2]: llamaTokenizer,

  [OpenAIModelID.OPENCHAT_3_2_MISTRAL]: mistralTokenizer,
};
