Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNaqm-0003YN-DQ
 for ath10k@lists.infradead.org; Fri, 16 Nov 2018 09:55:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: avoid -Wmaybe-uninitialized warning
References: <20181102161833.2956376-1-arnd@arndb.de>
 <CA+ASDXPVJMge_B-AUXj1sKc4dB+3FcXew8T5FYEXVsncKYotiw@mail.gmail.com>
Date: Fri, 16 Nov 2018 11:55:27 +0200
In-Reply-To: <CA+ASDXPVJMge_B-AUXj1sKc4dB+3FcXew8T5FYEXVsncKYotiw@mail.gmail.com>
 (Brian Norris's message of "Fri, 2 Nov 2018 09:34:53 -0700")
Message-ID: <87sh0173e8.fsf@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: srirrama@codeaurora.org, Arnd Bergmann <arnd@arndb.de>, bpothuno@codeaurora.org, akolli@codeaurora.org, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, yintang@qti.qualcomm.com, pillair@codeaurora.org, ath10k@lists.infradead.org, netdev@vger.kernel.org, davem@davemloft.net

Brian Norris <briannorris@chromium.org> writes:

> Hi,
>
> On Fri, Nov 2, 2018 at 9:19 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> In some configurations the inlining in gcc is suboptimal, causing
>> a false-positive warning:
>>
>> drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_mac_init_rd':
>> drivers/net/wireless/ath/ath10k/mac.c:8374:39: error: 'rd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>   ar->ath_common.regulatory.current_rd = rd;
>>
>> If we initialize the output of ath10k_mac_get_wrdd_regulatory()
>> before returning, this problem goes away.
>>
>> Fixes: 209b2a68de76 ("ath10k: add platform regulatory domain support")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index a1c2801ded10..0d5fde28ee44 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -8321,6 +8321,8 @@ static int ath10k_mac_get_wrdd_regulatory(struct ath10k *ar, u16 *rd)
>>         u32 alpha2_code;
>>         char alpha2[3];
>>
>> +       *rd = ar->hw_eeprom_rd;
>> +
>
> Maybe it's just me, but it seems kinda weird for this function to
> assign a (valid) value to its "output" and still potentially return an
> error.
>
> If you really need to work around this compiler bug, maybe just put
> the eeprom assignment back in ath10k_mac_init_rd()? I'll leave it up
> to Kalle as to whether he wants to work around the compiler at all :)

In general I'm happy take workaround to compiler problems, I prefer to
keep ath10k warning free much as possible.

> Oh wait, one more thing: this is actually an invalid refactoring. See
> how this function assigns '*rd' later in error cases. Today, we still
> treat those as errors and clobber those with the eeprom value, but
> now, you're making the fallback case continue to use the erroneous
> value (0xffff). You need to make that use a local variable and avoid
> clobbering *rd, if you want this to be correct.

But I agree with Brian here, I don't think this patch is correct.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
