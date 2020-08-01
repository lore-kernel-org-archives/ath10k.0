Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1k0N-0003S9-NN
 for ath10k@lists.infradead.org; Sat, 01 Aug 2020 05:24:24 +0000
Received: by mail-qv1-xf44.google.com with SMTP id o2so15116166qvk.6
 for <ath10k@lists.infradead.org>; Fri, 31 Jul 2020 22:24:21 -0700 (PDT)
Subject: Re: [PATCH v2 0/3]
References: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
 <c6c5b3c5-f862-9cee-6863-24f666cc28f5@gmail.com>
 <000701d667c2$0782fe70$1688fb50$@codeaurora.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e96d720c-5a60-7535-b615-c186bc14b38f@gmail.com>
Date: Fri, 31 Jul 2020 22:24:17 -0700
MIME-Version: 1.0
In-Reply-To: <000701d667c2$0782fe70$1688fb50$@codeaurora.org>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org



On 7/31/2020 10:10 PM, Rakesh Pillai wrote:
> 
> 
>> -----Original Message-----
>> From: Florian Fainelli <f.fainelli@gmail.com>
>> Sent: Saturday, August 1, 2020 12:17 AM
>> To: Rakesh Pillai <pillair@codeaurora.org>; ath10k@lists.infradead.org
>> Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org;
>> kvalo@codeaurora.org; davem@davemloft.net; kuba@kernel.org;
>> netdev@vger.kernel.org
>> Subject: Re: [PATCH v2 0/3]
>>
>> On 7/31/20 11:27 AM, Rakesh Pillai wrote:
>>> The history recording will be compiled only if
>>> ATH10K_DEBUG is enabled, and also enabled via
>>> the module parameter. Once the history recording
>>> is enabled via module parameter, it can be enabled
>>> or disabled runtime via debugfs.
>>
>> Why not use trace prints and retrieving them via the function tracer?
>> This seems very ad-hoc.
> 
> Tracing needs to be enabled to capture the events.
> But these events can be turned on in some kind of a debug build and capture the history to help us debug in case there is a crash.
> It wont even allocate memory if not enabled via module parameter.

I would suggest researching what other drivers do and also considering
the benefits, for someone doing system analysis of plugging into the
kernel's general tracing mechanism to have all information in the same
place and just do filtering on the record/report side.
-- 
Florian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
