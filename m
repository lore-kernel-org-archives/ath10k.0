Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V097v-0005Zx-4u
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 11:45:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: prevent HTC from being used after stopping
References: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
 <1374129193-3533-2-git-send-email-michal.kazior@tieto.com>
 <8761w64xr0.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkD7U4KY5xq7YhTWz-qFP2f3NuQ=nHDZ2LgYaq+5M3pjg@mail.gmail.com>
Date: Fri, 19 Jul 2013 14:44:55 +0300
In-Reply-To: <CA+BoTQkD7U4KY5xq7YhTWz-qFP2f3NuQ=nHDZ2LgYaq+5M3pjg@mail.gmail.com>
 (Michal Kazior's message of "Fri, 19 Jul 2013 13:08:12 +0200")
Message-ID: <87siza3hag.fsf@kamboji.qca.qualcomm.com>
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

> On 19 July 2013 13:04, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> It was possible to submit new HTC commands
>>> after/while HTC stopped. This led to memory
>>> corruption in some rare cases.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> [...]
>>
>>> @@ -957,7 +955,6 @@ void ath10k_htc_stop(struct ath10k_htc *htc)
>>>       }
>>>
>>>       ath10k_hif_stop(htc->ar);
>>> -     ath10k_htc_reset_endpoint_states(htc);
>>>  }
>>
>> Is this on purpose? I can't fit it to the description.
>
> You're right. I should've mentioned that in the commit message.
>
> This line is simply unnecessary. Do you prefer fixing the commit
> message accordingly or should I post it as a separate patch?

A separate patch, please. Makes it easier to bisect issues later on.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
