Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvL2k-0002Bq-AP
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 07:05:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Do not limit RTS threshold value to 2347
References: <1416830240-3019-1-git-send-email-nataraja@qti.qualcomm.com>
Date: Mon, 1 Dec 2014 09:04:41 +0200
In-Reply-To: <1416830240-3019-1-git-send-email-nataraja@qti.qualcomm.com>
 (Vivek Natarajan's message of "Mon, 24 Nov 2014 17:27:20 +0530")
Message-ID: <87vblvrgty.fsf@kamboji.qca.qualcomm.com>
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
To: Vivek Natarajan <nataraja@qti.qualcomm.com>
Cc: ath10k@lists.infradead.org

Vivek Natarajan <nataraja@qti.qualcomm.com> writes:

> Increase the rts threshold from the legacy value of 2347 to support higher
> threshold limit.
>
> Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>

Thanks, applied.

In the future, please also CC linux-wireless as documented here:

http://wireless.kernel.org/en/users/Drivers/ath10k/sources#Submitting_patches

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
