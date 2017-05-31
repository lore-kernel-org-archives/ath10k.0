Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dG3FC-0003eI-Ke
 for ath10k@lists.infradead.org; Wed, 31 May 2017 13:01:01 +0000
Subject: Re: [3/3] ath10k: Log when longer bmi cmds happen.
References: <1494883540-18558-3-git-send-email-greearb@candelatech.com>
 <1397d1d690d84c178290b6e06f92bf27@euamsexm01a.eu.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <c46ac155-199e-55cc-d253-6133d7a27924@candelatech.com>
Date: Wed, 31 May 2017 06:00:36 -0700
MIME-Version: 1.0
In-Reply-To: <1397d1d690d84c178290b6e06f92bf27@euamsexm01a.eu.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org



On 05/31/2017 05:46 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> wrote:
>
>> This lets one have a clue that maybe timeouts are happening
>> when we just aren't waiting long enough.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>
> I did some cosmetic changes and ret is now initialised after the loop:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=13e31da60b738512ab1ac4429789d79a983ae5be

Looks OK to me.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
