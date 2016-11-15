Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6bGS-0005FJ-UX
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 10:46:58 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 05/12] ath10k: htc: Added ATH10K_HTC_FLAG_BUNDLE_LSB
Date: Tue, 15 Nov 2016 10:46:30 +0000
Message-ID: <8760nprpfa.fsf@qca.qualcomm.com>
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
 <1479141222-8493-6-git-send-email-erik.stromdahl@gmail.com>
 <CA+BoTQmcB7+aH3wvG-mRSdBS8VaJ1OrLYQ0HCbCJeoH9ccxXNQ@mail.gmail.com>
In-Reply-To: <CA+BoTQmcB7+aH3wvG-mRSdBS8VaJ1OrLYQ0HCbCJeoH9ccxXNQ@mail.gmail.com>	(Michal
 Kazior's message of "Tue, 15 Nov 2016 11:25:40 +0100")
Content-Language: en-US
Content-ID: <B702BCF17FDF6643B8370D833055D637@qualcomm.com>
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
>>  drivers/net/wireless/ath/ath10k/htc.h |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
>> index 589800a..df16a04 100644
>> --- a/drivers/net/wireless/ath/ath10k/htc.h
>> +++ b/drivers/net/wireless/ath/ath10k/htc.h
>> @@ -62,6 +62,8 @@ enum ath10k_htc_rx_flags {
>>         ATH10K_HTC_FLAG_BUNDLE_MASK     = 0xF0
>>  };
>>
>> +#define ATH10K_HTC_FLAG_BUNDLE_LSB         4
>
> Just an idea - we could start using FIELD_GET() with
> ATH10K_HTC_FLAG_BUNDLE_MASK alone. I would love to see Jakub's
> bitfield stuff be used more. Kalle, thoughts?

Yeah, the bitfield macros are handy and we should definitely switch to
them (slowly). But definitely not a must for these SDIO patches, more
like a nice bonus.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
