Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK1Lj-0005Yw-7p
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 13:57:14 +0000
Subject: Re: [PATCHv2] ath10k: Add wrapper function to ath10k debug
References: <1556283505-29539-1-git-send-email-vnaralas@codeaurora.org>
 <b9f263a4-e9da-18bb-5932-941a018ee860@candelatech.com>
 <be151755e771423eaa0ad6e6e2e81c2b@APSANEXR01F.ap.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <380a88cf-9da4-a772-a119-d8df24d5b450@candelatech.com>
Date: Fri, 26 Apr 2019 06:57:10 -0700
MIME-Version: 1.0
In-Reply-To: <be151755e771423eaa0ad6e6e2e81c2b@APSANEXR01F.ap.qualcomm.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>, Venkateswara Naralasetty <vnaralas@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Kan Yan <kyan@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On 4/26/19 6:38 AM, Venkateswara Naralasetty wrote:

>>>    #ifdef CONFIG_ATH10K_DEBUG
>>> -void ath10k_dbg(struct ath10k *ar, enum ath10k_debug_mask mask,
>>> -		const char *fmt, ...)
>>> +void __ath10k_dbg(struct ath10k *ar, enum ath10k_debug_mask mask,
>>> +		  const char *fmt, ...)
>>>    {
>>>    	struct va_format vaf;
>>>    	va_list args;
>>
>> Do you still need the check later in this method:
>>
>> if (ath10k_debug_mask & mask)
>>
>> since you already checked in the ath10k_dbg() macro?
> Yes, we need this check.
> Otherwise all debug messages will be printed even without any debug mask set in case of tracing enabled.

Ahh, I see.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
