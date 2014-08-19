Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJifj-0006Qz-U3
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 12:37:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/5] ath10k: split ce irq/handler setup
References: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
 <1407402260-29854-5-git-send-email-michal.kazior@tieto.com>
 <87a977o450.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmgcBKfNKrAH5jKsehemx7rTxHHXMr8Qf+ctgfZpVj0Dg@mail.gmail.com>
Date: Tue, 19 Aug 2014 15:37:23 +0300
In-Reply-To: <CA+BoTQmgcBKfNKrAH5jKsehemx7rTxHHXMr8Qf+ctgfZpVj0Dg@mail.gmail.com>
 (Michal Kazior's message of "Tue, 19 Aug 2014 14:30:39 +0200")
Message-ID: <87a970ac58.fsf@kamboji.qca.qualcomm.com>
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

> On 14 August 2014 10:40, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> It doesn't make much sense to overwrite send_cb
>>> and recv_cb callbacks over and over again whenever
>>> transport starts. Just make sure to unmask copy
>>> engine interrupts when starting.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> The patch looks, just a followup question for the future:
>>
>>> @@ -1674,7 +1639,9 @@ static int ath10k_pci_ce_init(struct ath10k *ar)
>>>               pipe_info->hif_ce_state = ar;
>>>               attr = &host_ce_config_wlan[pipe_num];
>>>
>>> -             ret = ath10k_ce_init_pipe(ar, pipe_num, attr);
>>> +             ret = ath10k_ce_init_pipe(ar, pipe_num, attr,
>>> +                                       ath10k_pci_ce_send_done,
>>> +                                       ath10k_pci_ce_recv_data);
>>
>> As we call ath10k_ce_init_pipe() only once and seem to have only one set
>> of functions, why even bother bother with function pointers? What if we
>> just call the functions directly?
>
> Yeah, we can remove this abstraction later. I don't there's anything
> depending on it anymore.

Good, again something for a rainy day :)

I added it to the TODO list (which we should cleanup as well):

http://wireless.kernel.org/en/users/Drivers/ath10k/todo

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
