Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y62h3-0007Qz-S7
 for ath10k@lists.infradead.org; Tue, 30 Dec 2014 19:43:02 +0000
Date: Tue, 30 Dec 2014 20:42:39 +0100
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH 0/4] ath10k: a few incorrect return handling fix-up
Message-ID: <20141230194239.GA13655@opentech.at>
References: <1419942046-17985-1-git-send-email-der.herr@hofr.at>
 <54A2DE7C.1050602@cogentembedded.com> <20141230182842.GA18361@opentech.at>
 <54A2F151.6040205@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54A2F151.6040205@cogentembedded.com>
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>, Yanbo Li <yanbol@qti.qualcomm.com>, Ben Greear <greearb@candelatech.com>

On Tue, 30 Dec 2014, Sergei Shtylyov wrote:

> On 12/30/2014 09:28 PM, Nicholas Mc Guire wrote:
>
>>>> wait_for_completion_timeout does not return negative values so the tests
>>>> for <= 0 are not needed and the case differentiation in the error handling
>>>> path unnecessary.
>
>>>     I decided to verify your statement and I saw that it seems wrong.
>>> do_wait_for_common() can return -ERESTARTSYS and the return value gets
>>> returned by its callers unchanged.
>
>> the -ERESTARTSYS only can be returned if state matches but
>> wait_for_completion_timemout passes TASK_UNINTERRUPTIBLE
>> so signal_pending_state will return 0 and never negativ
>
>> my understanding of the callchain is:
>> wait_for_completion_timemout with TASK_UNINTERRUPTIBLE
>>    -> wait_for_common(...TASK_UNINTERRUPTIBLE)
>>      -> __wait_for_common(...TASK_UNINTERRUPTIBLE)
>>        -> do_wait_for_common(...TASK_UNINTERRUPTIBLE)
>>          -> signal_pending_state(TASK_UNINTERRUPTIBLE...)
>
>> static inline int signal_pending_state(long state, struct task_struct *p)
>> {
>>          if (!(state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
>>                  return 0;
>
>    Right. I didn't look into TASK_UNINTERRUPTIBLE thing before sending my mail.
>
>> so wait_for_completion_timemout should return 0 or 1 only
>
>    0 or the remaining time, to be precise.
>

yup - thanks for the confirmation!

>>>> patch was only compile tested x86_64_defconfig + CONFIG_ATH_CARDS=m
>>>> CONFIG_ATH10K=m
>
>>>> patch is against linux-next 3.19.0-rc1 -next-20141226
>
>>>     Rather patches. It would have been better to send one patch instead of
>>> 4 patches with the same name.
>
>> sorry for that - I had split it into separate patches as it was
>> in different files - giving them the same name of course was a bit
>> brain-dead.
>
>    You should have mentioned the modified files in the subject. But IMHO 
> it would be better to have just one patch.
>
resent as a single patch as v2

thx!
hofrat

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
