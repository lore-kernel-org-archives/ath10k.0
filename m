Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTT5M-0008Pb-2e
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 14:18:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH net-next] ath10k: make some functions static
References: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
 <87lgbhagrz.fsf@kamboji.qca.qualcomm.com>
 <20180614135515.i47fj4bn47ntn6wb@mwanda>
Date: Thu, 14 Jun 2018 17:18:32 +0300
In-Reply-To: <20180614135515.i47fj4bn47ntn6wb@mwanda> (Dan Carpenter's message
 of "Thu, 14 Jun 2018 16:55:15 +0300")
Message-ID: <87vaal8n9j.fsf@kamboji.qca.qualcomm.com>
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, Wei Yongjun <weiyongjun1@huawei.com>, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Thu, Jun 14, 2018 at 11:55:44AM +0300, Kalle Valo wrote:
>> Wei Yongjun <weiyongjun1@huawei.com> writes:
>> 
>> > Fixes the following sparse warnings:
>> >
>> > drivers/net/wireless/ath/ath10k/snoc.c:823:5: warning:
>> >  symbol 'ath10k_snoc_get_ce_id_from_irq' was not declared. Should it be static?
>> > drivers/net/wireless/ath/ath10k/snoc.c:871:6: warning:
>> >  symbol 'ath10k_snoc_init_napi' was not declared. Should it be static?
>> >
>> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> 
>> Your name in patchwork is wrong[1] and hence my script uses the wrong
>> name. Please fix it by registering to patchwork[2] where it's possible
>> to change your name during registration, but only one time. If that
>> doesn't work then send a request to helpdesk@kernel.org and the admins
>> can fix it.
>> 
>> But no need to resend this patch, I can fix your name manually this
>> time.
>> 
>> [1] "weiyongjun (A)" in https://patchwork.kernel.org/patch/10440159/
>> 
>> [2] https://patchwork.kernel.org/register/
>
> That's a weird patchwork issue...  It sounds like this is a known bug?

Yeah, it's a known bug. Patchwork stores the name from the first mail it
sees from the user and it's impossible to change it afterwards (or
something like that). I think it's fixed in the latest patchwork version
but kernel.org admins are really slow updating patchwork.kernel.org.

In all these cases I direct the users to contact helpdesk, hopefully
that eventually gives admins enough motivation to update patchwork :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
