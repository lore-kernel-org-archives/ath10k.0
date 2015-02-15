Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YN0rU-0005n8-P6
 for ath10k@lists.infradead.org; Sun, 15 Feb 2015 15:11:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: defer AP self-peer removal wait
References: <1422606682-12121-1-git-send-email-michal.kazior@tieto.com>
Date: Sun, 15 Feb 2015 17:11:28 +0200
In-Reply-To: <1422606682-12121-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 30 Jan 2015 09:31:22 +0100")
Message-ID: <87zj8fgqfz.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Some firmware revisions don't notify host about
> self-bss-peer removal until after associated vdev
> is deleted. This has been observed with qca6174
> WLAN.RM.2.0-00073 firmware.
>
> This patch fixes AP teardown slowdowns and
> prevents delays and warnings:
>
>  ath10k_pci 0000:00:05.0: failed to remove peer for AP vdev 0: -110
>  ath10k_pci 0000:00:05.0: removing stale peer xx:xx:xx:xx:xx:xx from vdev_id 0
>  ath10k_pci 0000:00:05.0: peer-unmap-event: unknown peer id 24
>  ath10k_pci 0000:00:05.0: peer-unmap-event: unknown peer id 8
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
