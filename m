Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7NA-0004NK-KC
 for ath10k@lists.infradead.org; Mon, 11 May 2020 12:17:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH net-next 2/2] ath10k: fix ath10k_pci struct layout
References: <20200509120707.188595-1-arnd@arndb.de>
 <20200509120707.188595-2-arnd@arndb.de>
 <87v9l24qz6.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 11 May 2020 15:17:12 +0300
In-Reply-To: <87v9l24qz6.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Mon, 11 May 2020 15:05:01 +0300")
Message-ID: <87r1vq4qev.fsf@kamboji.qca.qualcomm.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

Kalle Valo <kvalo@codeaurora.org> writes:

> Arnd Bergmann <arnd@arndb.de> writes:
>
>> gcc-10 correctly points out a bug with a zero-length array in
>> struct ath10k_pci:
>>
>> drivers/net/wireless/ath/ath10k/ahb.c: In function 'ath10k_ahb_remove':
>> drivers/net/wireless/ath/ath10k/ahb.c:30:9: error: array subscript 0
>> is outside the bounds of an interior zero-length array 'struct
>> ath10k_ahb[0]' [-Werror=zero-length-bounds]
>>    30 |  return &((struct ath10k_pci *)ar->drv_priv)->ahb[0];
>>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from drivers/net/wireless/ath/ath10k/ahb.c:13:
>> drivers/net/wireless/ath/ath10k/pci.h:185:20: note: while referencing 'ahb'
>>   185 |  struct ath10k_ahb ahb[0];
>>       |                    ^~~
>>
>> The last addition to the struct ignored the comments and added
>> new members behind the array that must remain last.
>>
>> Change it to a flexible-array member and move it last again to
>> make it work correctly, prevent the same thing from happening
>> again (all compilers warn about flexible-array members in the
>> middle of a struct) and get it to build without warnings.
>
> Very good find, thanks! This bug would cause all sort of strange memory
> corruption issues.

This motivated me to switch to using GCC 10.x and I noticed that you had
already upgraded crosstool so it was a trivial thing to do, awesome :)

https://mirrors.edge.kernel.org/pub/tools/crosstool/

I use crosstool like this using GNUmakefile:

CROSS_COMPILE=/opt/cross/gcc-10.1.0-nolibc/x86_64-linux/bin/x86_64-linux-
include Makefile

I think it's handy trick and would be good to mention that in the
crosstool main page. That way I could just point people to the crosstool
main page when they are using ancient compilers and would need to
upgrade.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
