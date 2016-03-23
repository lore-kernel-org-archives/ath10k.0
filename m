Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aihbu-0008Lh-LH
 for ath10k@lists.infradead.org; Wed, 23 Mar 2016 12:10:04 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix null deref if device crashes early
Date: Wed, 23 Mar 2016 12:09:37 +0000
Message-ID: <87d1qlfla6.fsf@kamboji.qca.qualcomm.com>
References: <1458208328-16827-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1458208328-16827-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 17 Mar 2016 10:52:08 +0100")
Content-Language: en-US
Content-ID: <DCC419A9AD9BAC4E82A261FE2444FF90@qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> If device failed to init during early probing
> (which is quite rare) it triggered driver to
> compute crc before ar->firmware was ready causing
> an oops.
>
> Fixes: 3e58044b61a9 ("ath10k: print crc32 checksums for firmware and board files")
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
