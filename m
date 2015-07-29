Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKNko-0006zE-FW
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 09:34:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Support different txbf configuration schemes
References: <1437395401-2765-1-git-send-email-nataraja@qti.qualcomm.com>
Date: Wed, 29 Jul 2015 12:33:57 +0300
In-Reply-To: <1437395401-2765-1-git-send-email-nataraja@qti.qualcomm.com>
 (Vivek Natarajan's message of "Mon, 20 Jul 2015 18:00:00 +0530")
Message-ID: <87zj2f5muy.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vivek Natarajan <nataraja@qti.qualcomm.com> writes:

> qca61x4 uses the vdev param as a sole sufficient configuration
> for txbf while qca99x0 enables txbf during peer assoc by
> combining the vdev param value with peer assoc's vht capabilities
>
> This patch gets the appropriate txbf configuration scheme
> before passing the wmi command to enable the same in the firmware.
>
> Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>

The patches don't apply anymore and as they lacking proper sha1 ids I
cannot fix the conflicts myself, so please rebase. Please always use
ath.git master branch without _any_ extra patches because that way I can
usually fix conflicts myself with the help of 3-way merge.

Applying: ath10k: Support different txbf configuration schemes
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/mac.c).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0001 ath10k: Support different txbf configuration schemes

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
