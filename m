Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8tYi-0003d4-AK
 for ath10k@lists.infradead.org; Mon, 12 Aug 2013 14:57:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/4] ath10k: fix HTC endpoint worker starvation
References: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
 <1375949813-10969-3-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQk4n=kiWhwvzieuvXp5Wou_QpkY=8iU474XPwG7P4KSiQ@mail.gmail.com>
Date: Mon, 12 Aug 2013 17:56:58 +0300
In-Reply-To: <CA+BoTQk4n=kiWhwvzieuvXp5Wou_QpkY=8iU474XPwG7P4KSiQ@mail.gmail.com>
 (Michal Kazior's message of "Thu, 8 Aug 2013 12:12:03 +0200")
Message-ID: <874navt0sl.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

>> @@ -602,7 +602,8 @@ static void ath10k_htc_reset_endpoint_states(struct ath10k_htc *htc)
>>                 skb_queue_head_init(&ep->tx_queue);
>>                 ep->htc = htc;
>>                 ep->tx_credit_flow_enabled = true;
>> -               INIT_WORK(&ep->send_work, ath10k_htc_send_work);
>> +               tasklet_init(&ep->send_task, ath10k_htc_send_task,
>> +                             (unsigned long)ep);
>>         }
>>  }
>>
>
> Indentation is off by one here. Is it okay if I just resend this
> single patch or is it easier for applying if I resend the whole
> patchset?

It's errorprone if I start to pick patches from different sets. So
please resend the whole series. But take a look at my other comment
first.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
