Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG37h-0007rz-DZ
 for ath10k@lists.infradead.org; Wed, 31 May 2017 12:53:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] Per chain RSSI reporting
Date: Wed, 31 May 2017 12:52:37 +0000
Message-ID: <87tw41mbnq.fsf@kamboji.qca.qualcomm.com>
References: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
In-Reply-To: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
 (Norik Dzhandzhapanyan's message of "Fri, 26 May 2017 22:49:45 +0000")
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
To: Norik Dzhandzhapanyan <norikd@ethertronics.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Norik Dzhandzhapanyan <norikd@ethertronics.com> writes:

> Add support for per chain RSSI reporting w/smoothing.
>
> Signed-off-by: Norik Dzhandzhapanyan norikd@ethertronics.com
>
>
> --- htt_rx.c.orig  2017-05-26 15:26:37.918504255 -0700
> +++ htt_rx.c        2017-05-26 12:10:33.139809025 -0700
> @@ -825,14 +825,71 @@ static bool ath10k_htt_rx_h_channel(stru
>               return true;
> }

The patch formatting is broken and I can't apply this. Please use git
send-email, more info here:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches

But more importantly:

> The contents of this transmission are Ethertronics Inc. Confidential
> and may contain proprietary or legally privileged information which
> may not be disclosed, copied or distributed without the express
> written consent of Ethertronics Inc. The information is intended to be
> for the use of the individual or entity named on this transmission. If
> you are not the intended recipient, be aware that any disclosure,
> copying, distribution or use of the contents of this information is
> prohibited. If you have received this transmission in error, please
> notify us by telephone immediately so that we can arrange for the
> retrieval of the original documents at no cost to you. Alternatively,
> notify the sender by replying to this transmission and delete the
> message without disclosing it. Thank you

I will never apply a patch which has this kind of disclaimer. The
patches must follow the Developer's Certificate of Origin[1] and not
have any other disclaimer.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
