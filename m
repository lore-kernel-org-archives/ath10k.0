Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cr52E-0004Jr-D3
 for ath10k@lists.infradead.org; Thu, 23 Mar 2017 15:52:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v6 09/10] ath10k: different fw file names for usb and sdio
Date: Thu, 23 Mar 2017 15:51:58 +0000
Message-ID: <87mvccyorl.fsf@kamboji.qca.qualcomm.com>
References: <148959263520.31432.8488419244476213373.stgit@potku.adurom.net>
 <148959280431.31432.16087997710973721077.stgit@potku.adurom.net>
 <e25f7672-0114-7928-7f4a-cf64638dc900@qca.qualcomm.com>
In-Reply-To: <e25f7672-0114-7928-7f4a-cf64638dc900@qca.qualcomm.com> (Ryan
 Hsu's message of "Thu, 16 Mar 2017 21:08:20 +0000")
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
To: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ryan Hsu <ryanhsu@qca.qualcomm.com> writes:

> On 03/15/2017 08:46 AM, Kalle Valo wrote:
>
>> From: Erik Stromdahl <erik.stromdahl@gmail.com>
>>
>> Since both SDIO and USB based chipsets will use different
>
> nitpick, since the patch is separating the USB and SDIO support now,
> maybe you want to remove the "USB" from the patch title?

Will fix in v7.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
