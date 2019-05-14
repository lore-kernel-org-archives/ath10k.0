Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQbeZ-00010T-7w
 for ath10k@lists.infradead.org; Tue, 14 May 2019 17:55:55 +0000
Subject: Re: [PATCH v2] mac80211: remove warning message
References: <1557824507-17668-1-git-send-email-yiboz@codeaurora.org>
 <7c92f5cf51eaec1d5449698d90f5b6c5ca6c2bea.camel@sipsolutions.net>
 <ccb48284f0d96e72f4c041e12c943f0a@codeaurora.org>
 <e2a6596b99085541a5886c0d0d6393c849ac2d57.camel@sipsolutions.net>
 <34f72d5db336b9898618bf1c5c15ec41094d7d06.camel@perches.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <4d013893-3302-14f0-c957-b3771f4b6b82@candelatech.com>
Date: Tue, 14 May 2019 10:55:49 -0700
MIME-Version: 1.0
In-Reply-To: <34f72d5db336b9898618bf1c5c15ec41094d7d06.camel@perches.com>
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
To: Joe Perches <joe@perches.com>, Johannes Berg <johannes@sipsolutions.net>, Yibo Zhao <yiboz@codeaurora.org>
Cc: Zhi Chen <zhichen@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 5/14/19 8:44 AM, Joe Perches wrote:
> On Tue, 2019-05-14 at 11:12 +0200, Johannes Berg wrote:
>> On Tue, 2019-05-14 at 17:10 +0800, Yibo Zhao wrote:
>>> On 2019-05-14 17:05, Johannes Berg wrote:
>>>> On Tue, 2019-05-14 at 17:01 +0800, Yibo Zhao wrote:
>>>>> In multiple SSID cases, it takes time to prepare every AP interface
>>>>> to be ready in initializing phase. If a sta already knows everything
>>>>> it
>>>>> needs to join one of the APs and sends authentication to the AP which
>>>>> is not fully prepared at this point of time, AP's channel context
>>>>> could be NULL. As a result, warning message occurs.
> []
>>> I was planning to use WARN_ON_ONCE() in the first place to replace
>>> WARN_ON() then after some discussion, we think removing it could be
>>> better. So the first patch was based on my first version which is sent
>>> incorrectly. Please check again.
> []
>> I guess changing it to WARN_ON_ONCE() makes sense,
> 
> WARN_ON_RATELIMIT exists.

We know the WARN hits, we have the backtrace, and it is easy enough (in my setup
at least) to reproduce this.  So, the WARN logic has done its job.

Having more of these spam the kernel doesn't add much benefit I think.

Anyone have any suggestions on how to fix the underlying issue?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
