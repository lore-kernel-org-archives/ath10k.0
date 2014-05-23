Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wnl6v-0004IF-CU
 for ath10k@lists.infradead.org; Fri, 23 May 2014 08:45:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 3/5] ath10k: drain tx before restarting hw
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 <87oayovr1m.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmJTsh3Kcwmqx19WAzoBhYrhkQaPT_S=JFVPptkVaaKyw@mail.gmail.com>
Date: Fri, 23 May 2014 11:45:26 +0300
In-Reply-To: <CA+BoTQmJTsh3Kcwmqx19WAzoBhYrhkQaPT_S=JFVPptkVaaKyw@mail.gmail.com>
 (Michal Kazior's message of "Fri, 23 May 2014 10:38:20 +0200")
Message-ID: <87bnuovq6x.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 23 May 2014 10:27, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> +static void ath10k_drain_tx(struct ath10k *ar)
>>> +{
>>> +     /* workers can hold conf_mutex -- avoid deadlock */
>>> +     WARN_ON(lockdep_is_held(&ar->conf_mutex));
>>
>> If CONFIG_LOCKDEP is disabled this will fail with:
>>
>> drivers/net/wireless/ath/ath10k/mac.c:2301:2: error: implicit declaration of function 'lockdep_is_held' [-Werror=implicit-function-declaration]
>>
>> I wasn't able to come up with any other way than adding '#ifdef
>> CONFIG_LOCKDEP' which is quite ugly. What should we do?
>
> I guess we could define lockdep_assert_not_held() in debug.h?

Sure, but I still think it's a bit ugly. The right way to fix this would
be to add it to include/lockdep.h, instead of adding custom checks to a
driver. But does this check even make sense? There's nothing preventing
to another thread to take lock just after the WARN_ON(), right?

Oh, and if we add it to debug.h we should name ath10k_assert_not_held().
We should not use lockdep's namespace for anything inside ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
