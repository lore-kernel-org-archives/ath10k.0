Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC44S-0008KC-2l
 for ath10k@lists.infradead.org; Tue, 29 Jul 2014 09:51:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: introduce a stricter scan state machine
References: <1405941081-17359-1-git-send-email-michal.kazior@tieto.com>
 <1405941081-17359-2-git-send-email-michal.kazior@tieto.com>
 <87egx4iksd.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnMKDCPTOZswZTg8s-_hmaKBiwDT_Rj4tt=ReR7RUWQ3w@mail.gmail.com>
Date: Tue, 29 Jul 2014 12:51:17 +0300
In-Reply-To: <CA+BoTQnMKDCPTOZswZTg8s-_hmaKBiwDT_Rj4tt=ReR7RUWQ3w@mail.gmail.com>
 (Michal Kazior's message of "Tue, 29 Jul 2014 11:46:48 +0200")
Message-ID: <87wqawh4ru.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "sw@simonwunderlich.de" <sw@simonwunderlich.de>

Michal Kazior <michal.kazior@tieto.com> writes:

>>> @@ -2323,8 +2348,6 @@ void ath10k_halt(struct ath10k *ar)
>>>               ath10k_monitor_stop(ar);
>>>       }
>>>
>>> -     del_timer_sync(&ar->scan.timeout);
>>> -     ath10k_reset_scan((unsigned long)ar);
>>>       ath10k_peer_cleanup_all(ar);
>>>       ath10k_core_stop(ar);
>>>       ath10k_hif_power_down(ar);
>>
>> Why you don't call ath10k_scan_reset() here? I would have assumed that
>> you do that.
>
> Hmm.. Good catch.
>
> Anyway I need to work on this patch a little bit more and fix another
> corner case.

Ok, I'll drop this patch and wait for the next version.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
