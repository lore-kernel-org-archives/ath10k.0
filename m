Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUwl1-0006ln-Ah
 for ath10k@lists.infradead.org; Mon, 09 Mar 2015 12:26:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix AP/IBSS CSA with template based fw
References: <1423749198-11346-1-git-send-email-michal.kazior@tieto.com>
 <1424090094-28164-1-git-send-email-michal.kazior@tieto.com>
 <87mw3p1c90.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmmcSr7Nm1Z=fVSA9Ak1B3XmixN8Q8C3VBoPmxf3_rN1g@mail.gmail.com>
Date: Mon, 9 Mar 2015 14:25:33 +0200
In-Reply-To: <CA+BoTQmmcSr7Nm1Z=fVSA9Ak1B3XmixN8Q8C3VBoPmxf3_rN1g@mail.gmail.com>
 (Michal Kazior's message of "Mon, 9 Mar 2015 10:30:02 +0100")
Message-ID: <877fuqz7b6.fsf@kamboji.qca.qualcomm.com>
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

> On 7 March 2015 at 08:46, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> qca6174 with wmi-tlv firmware uses offloaded
>>> beaconing scheme (i.e. templates). This requires a
>>> little different approach when implementing CSA.
>>>
>>> Add missing code to update CS count and report CSA
>>> completion to mac80211. Without it channel switch
>>> was never finished.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> Thanks, applied.
>
> It seems you've merged v1 instead of v2..  I'll send a follow up fix later.

Oh, sorry about that. Please do send a followup patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
