Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6iZH-0004PT-Vz
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 18:34:52 +0000
Received: by mail-wm0-x244.google.com with SMTP id g23so2828241wme.1
 for <ath10k@lists.infradead.org>; Tue, 15 Nov 2016 10:34:30 -0800 (PST)
Subject: Re: [RFC 10/12] ath10k: Added QCA65XX hw definition
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
 <1479141222-8493-11-git-send-email-erik.stromdahl@gmail.com>
 <CA+BoTQmcyVQDOd2o0YDvepuLbSz76p8hetrWA6mWJeGxvbM8iQ@mail.gmail.com>
 <87wpg5qai1.fsf@qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <0c1172f0-2e3b-6147-646c-adb98b9ea3b7@gmail.com>
Date: Tue, 15 Nov 2016 19:34:28 +0100
MIME-Version: 1.0
In-Reply-To: <87wpg5qai1.fsf@qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 11/15/2016 11:54 AM, Valo, Kalle wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
> 
>> On 14 November 2016 at 17:33, Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
>>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>>> ---
>>>  drivers/net/wireless/ath/ath10k/hw.h |    1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
>>> index 46142e9..ef45ecf 100644
>>> --- a/drivers/net/wireless/ath/ath10k/hw.h
>>> +++ b/drivers/net/wireless/ath/ath10k/hw.h
>>> @@ -224,6 +224,7 @@ enum ath10k_hw_rev {
>>>         ATH10K_HW_QCA9377,
>>>         ATH10K_HW_QCA4019,
>>>         ATH10K_HW_QCA9887,
>>> +       ATH10K_HW_QCA65XX,
>>
>> Are you 100% positive that you're supporting all QCA65XX chips? The
>> rule of thumb is to avoid Xs as much as possible unless totally
>> perfectly completely sure.
> 
I admit that I am definitely not totally perfectly completely sure about
this :)
In fact, I don't have a clue what does numbers really mean. All I know
is that the chipset I am using is called QCA6584 which I think is an
automotive version of another chipses called QCA6574. I have tried to
google these numbers up, but it is really hard to find anything useful.
So I thought, hey, why don't I just add a few X'es in there and I have
support for both!

> But the thing is that nobody can't be absolutely sure as we never know
> what marketing comes up within few years again. So I would say that XX
> in chip names should be completely avoided to avoid any confusion. We
> already suffer from this in ath10k with QCA988X and QCA9888 which are
> different designs but the names overlap.
> 
> I haven't reviewed Erik's patches yet but I'm surprised why even a new
> enum value is needed here. I was assuming we could use ATH10K_HW_QCA6174
> because AFAIK they share the same design. Any particular reason for
> this?
> 
The reason for this was that the switch(hw_rev)-statement in
ath10k_core_create assigns ar->regs and ar->hw_values to structures
containing values that are not applicable for SDIO. I though that I
would potentially need other structures, but after investigating the
qca6174_regs struct, it seems that the values that are applicable for
SDIO are the same.
I will remove this enum and use ATH10K_HW_QCA6174 instead as you
propose. If for some reason I would need other regs and hw_values
structs in the future, we can figure out appropriate names then.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
