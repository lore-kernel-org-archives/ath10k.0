Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3KoU-00023N-6G
 for ath10k@lists.infradead.org; Wed, 26 Apr 2017 11:08:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RESEND] ath10k: fix out of bounds access to local buffer
Date: Wed, 26 Apr 2017 11:08:22 +0000
Message-ID: <87r30fxw7u.fsf@kamboji.qca.qualcomm.com>
References: <20170424071157.6979-1-dev@michaelmera.com>
 <0a7aa133740b4488a19bd95115831988@euamsexm01a.eu.qualcomm.com>
 <87a873wjak.fsf@michaelmera.com>
In-Reply-To: <87a873wjak.fsf@michaelmera.com> (Michael Mera's message of "Wed, 
 26 Apr 2017 19:32:51 +0900")
Content-Language: en-US
MIME-Version: 1.0
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
To: Michael Mera <dev@michaelmera.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michael Mera <dev@michaelmera.com> writes:

> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>> I fixed a checkpatch warning in the pending branch:
>>
>> drivers/net/wireless/ath/ath10k/debug.c:636: spaces preferred around
>> that '-' (ctx:VxV)
>
> Hum... but then you will have a line longer than 80 characters (81), so
> another warning.

I have extended the line length in my check script to 90 chars just
because of cases like this:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/codingstyle#checking_code

> I prefered this version since I feel that splitting this line would hurt
> readability and on the other hand the expression is clearly delimited
> by the spaces around the ',' so I don't think spaces around the operator
> add any value (except for compliance with the coding style that is).

I actually guessed why you did that. But I want to keep the output of my
test script clean, makes review a lot easier. Making exceptions to the
script is more work for me.

Anyway, I already did the change in my pending branch and will apply the
patch in few days. Thanks for the fix.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
