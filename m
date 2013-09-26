Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP7Xo-0007qj-GE
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 09:07:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 01/13] ath10k: introduce dynamic WMI structures
References: <1380101891-18312-1-git-send-email-bartosz.markowski@tieto.com>
 <1380101891-18312-2-git-send-email-bartosz.markowski@tieto.com>
 <87ob7grmhv.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQk98WwdqyVtyHy9A1Z5kWgmkC6sHVjgaQNbrRLfm8YSiA@mail.gmail.com>
Date: Thu, 26 Sep 2013 12:07:01 +0300
In-Reply-To: <CA+BoTQk98WwdqyVtyHy9A1Z5kWgmkC6sHVjgaQNbrRLfm8YSiA@mail.gmail.com>
 (Michal Kazior's message of "Thu, 26 Sep 2013 11:03:17 +0200")
Message-ID: <87fvssrlxm.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 26 September 2013 10:54, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Bartosz Markowski <bartosz.markowski@tieto.com> writes:
>>
>>> @@ -1293,7 +1438,8 @@ int ath10k_wmi_pdev_resume_target(struct ath10k *ar)
>>>       if (skb == NULL)
>>>               return -ENOMEM;
>>>
>>> -     return ath10k_wmi_cmd_send(ar, skb, WMI_PDEV_RESUME_CMDID);
>>> +     return ath10k_wmi_cmd_send(ar, skb,
>>> +                                ar->wmi.cmd->wmi_pdev_resume_cmdid);
>>>  }
>>
>> I was thinking of adding a macro WMI_PDEV_RESUME_CMDID(ar) for all
>> dynamic wmi ids, that way it would look as closely as possible with the
>> original code. But I'm not sure if that makes sense anymore. Thoughts?
>
> Seems like an unnecessary indirection to me. You still need to have
> the mapping structure, unless you want to use macro concatenation (##)
> instead.

Yeah, there's no real benefit from the macro.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
