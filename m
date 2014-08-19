Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJg3S-0007LW-6a
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 09:50:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix wmi service bitmap debug
References: <1406628239-31322-1-git-send-email-michal.kazior@tieto.com>
 <87y4uuqhip.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmTvcLDWeKnRXKnAVh27DGrvk+xgr_9DFmuZ3gA6yedYw@mail.gmail.com>
Date: Tue, 19 Aug 2014 12:49:40 +0300
In-Reply-To: <CA+BoTQmTvcLDWeKnRXKnAVh27DGrvk+xgr_9DFmuZ3gA6yedYw@mail.gmail.com>
 (Michal Kazior's message of "Tue, 19 Aug 2014 09:46:07 +0200")
Message-ID: <87bnrgbyh7.fsf@kamboji.qca.qualcomm.com>
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

> On 12 August 2014 09:44, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> The 10.x and main firmware branches have
>>> conflicting WMI service bitmap definitions.
>>>
>>> This also fixes WMI services parsing on big-endian
>>> hosts and changes debugfs output to be more human
>>> friendly.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> Thanks, applied.
>
> Your tree has wmi_10x_svc_map() and wmi_main_svc_map() swapped[1][2].
> This results in invalid wmi service mappings.

Doh.

> Did you have a conflict on this patch?

Maybe, I can't really remember anymore. I'm always supposed to mention
about conflicts separately, but maybe I forgot this time? Can you send a
followup patch to fix this, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
