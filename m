Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6bNu-0002mj-LV
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 10:54:39 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 10/12] ath10k: Added QCA65XX hw definition
Date: Tue, 15 Nov 2016 10:54:13 +0000
Message-ID: <87wpg5qai1.fsf@qca.qualcomm.com>
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
 <1479141222-8493-11-git-send-email-erik.stromdahl@gmail.com>
 <CA+BoTQmcyVQDOd2o0YDvepuLbSz76p8hetrWA6mWJeGxvbM8iQ@mail.gmail.com>
In-Reply-To: <CA+BoTQmcyVQDOd2o0YDvepuLbSz76p8hetrWA6mWJeGxvbM8iQ@mail.gmail.com>	(Michal
 Kazior's message of "Tue, 15 Nov 2016 11:34:11 +0100")
Content-Language: en-US
Content-ID: <83863CD04566E445AEE5F7C9EF966DCA@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 14 November 2016 at 17:33, Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/hw.h |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
>> index 46142e9..ef45ecf 100644
>> --- a/drivers/net/wireless/ath/ath10k/hw.h
>> +++ b/drivers/net/wireless/ath/ath10k/hw.h
>> @@ -224,6 +224,7 @@ enum ath10k_hw_rev {
>>         ATH10K_HW_QCA9377,
>>         ATH10K_HW_QCA4019,
>>         ATH10K_HW_QCA9887,
>> +       ATH10K_HW_QCA65XX,
>
> Are you 100% positive that you're supporting all QCA65XX chips? The
> rule of thumb is to avoid Xs as much as possible unless totally
> perfectly completely sure.

But the thing is that nobody can't be absolutely sure as we never know
what marketing comes up within few years again. So I would say that XX
in chip names should be completely avoided to avoid any confusion. We
already suffer from this in ath10k with QCA988X and QCA9888 which are
different designs but the names overlap.

I haven't reviewed Erik's patches yet but I'm surprised why even a new
enum value is needed here. I was assuming we could use ATH10K_HW_QCA6174
because AFAIK they share the same design. Any particular reason for
this?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
