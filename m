Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6ymC-000212-OO
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 13:30:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: QCA9880 driver crash with FW 10.2.4-1.0-00029
References: <4ecc0004-f026-1682-3f19-a8e82fdb1eb5@hauke-m.de>
Date: Fri, 13 Apr 2018 16:29:48 +0300
In-Reply-To: <4ecc0004-f026-1682-3f19-a8e82fdb1eb5@hauke-m.de> (Hauke
 Mehrtens's message of "Thu, 22 Mar 2018 21:30:40 +0100")
Message-ID: <87tvsfqlo3.fsf@kamboji.qca.qualcomm.com>
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
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Rosen Penev <rosenp@gmail.com>, ath10k@lists.infradead.org, Felix Fietkau <nbd@nbd.name>

Hauke Mehrtens <hauke@hauke-m.de> writes:

> I am using a BT home Hub 5A (Lantiq VR9 MIPS BE SoC). The wifi provided
> by the QCA9880 chip is unstable with OpenWrt master from 26. Feb 2018.
>
> With FW 10.2.4-1.0-00033 and 10.2.4-1.0-00037 the wifi stops working
> after about 1 to 3 days and I do not get any error message. With FW
> 10.2.4-1.0-00029 I got this error message. FW 10.2.4.70.54 crashes
> immediately.
>
> The 2.4 GHz wifi provided by ath9k is very stable.
>
> The wireless drivers shipped in OpenWrt master, which I am suing, are
> based on backports with a snapshot of wireless testing from 1. November
> 2017, and I am running kernel 4.9.85.

Are you saying that it's unstable only on this product you have? Or is
it a more general problem with all QCA9880 hardware?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
