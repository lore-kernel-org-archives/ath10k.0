Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMxCD-00087L-IM
 for ath10k@lists.infradead.org; Thu, 07 Dec 2017 14:31:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath9k: remove stray backslash in Makefile
Date: Thu, 7 Dec 2017 14:30:14 +0000
Message-ID: <87374mvcej.fsf@kamboji.qca.qualcomm.com>
References: <e60138924429ca428efc6e3154606887b3bc5201.1511804622.git.mschiffer@universe-factory.net>
 <20171127193516.682827ea@cakuba.netronome.com>
In-Reply-To: <20171127193516.682827ea@cakuba.netronome.com> (Jakub Kicinski's
 message of "Mon, 27 Nov 2017 19:35:16 -0800")
Content-Language: en-US
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
To: Jakub Kicinski <kubakici@wp.pl>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, ath9k-devel <ath9k-devel@qca.qualcomm.com>, Matthias Schiffer <mschiffer@universe-factory.net>, "nbd@nbd.name" <nbd@nbd.name>

Jakub Kicinski <kubakici@wp.pl> writes:

> On Mon, 27 Nov 2017 18:56:21 +0100, Matthias Schiffer wrote:
>> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
>> ---
>>  drivers/net/wireless/ath/ath9k/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath9k/Makefile b/drivers/net/wireless/ath/ath9k/Makefile
>> index 36a40ffdce15..90e4a341076c 100644
>> --- a/drivers/net/wireless/ath/ath9k/Makefile
>> +++ b/drivers/net/wireless/ath/ath9k/Makefile
>> @@ -59,7 +59,7 @@ obj-$(CONFIG_ATH9K_HW) += ath9k_hw.o
>>  obj-$(CONFIG_ATH9K_COMMON) += ath9k_common.o
>>  ath9k_common-y:=	common.o \
>>  			common-init.o \
>> -			common-beacon.o \
>> +			common-beacon.o
>>  
>
> It's not necessarily stray, there is nothing on the next line so it's
> OK, and if you add \ at the end of all lines, you don't have to touch
> the last line every time you add/remove something.  Sort of like
> putting a , after last enum value.

I agree with Jakub, I think the backslash is there on purpose so I
dropped this patch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
