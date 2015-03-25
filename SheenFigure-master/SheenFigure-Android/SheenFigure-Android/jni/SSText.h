/*
 * Copyright (C) 2013 SheenFigure
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _SS_TEXT_H
#define _SS_TEXT_H

#include "SSJNI.h"
#include "SSFont.h"

typedef struct SSTextClass {
	SFTextRef _sfText;
	SSFontClass *_font;
} SSTextClass;

int register_com_sheenfigure_graphics_Text(JNIEnv *env);

#endif
