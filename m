Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YccQ8-0007H7-1o
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 16:20:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: implement more versatile set_bitrate_mask
References: <1427201836-7741-1-git-send-email-michal.kazior@tieto.com>
 <1427201836-7741-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 30 Mar 2015 19:19:38 +0300
In-Reply-To: <1427201836-7741-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 24 Mar 2015 12:57:16 +0000")
Message-ID: <87mw2u31b8.fsf@kamboji.qca.qualcomm.com>
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

> Until now only a single fixed tx rate or nss was
> allowed to be set.
>
> The patch attempts to improve this by allowing
> most bitrate masks. The limitation is VHT MCS
> rates cannot be expressed separately and only the
> following VHT MCS ranges are supported: none, 0-7,
> 0-8, and 0-9.
>
> This keeps the old behaviour when requesting
> single tx rate or single nss. The new bitrate mask
> logic is only applied to other cases that would
> return -EINVAL until now.
>
> Depending on firmware revisions some combinations
> may crash firmware so use with care, please.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

kbuild reported:

drivers/net/wireless/ath/ath10k/mac.c:2163 ath10k_peer_assoc_h_ht() warn: buffer overflow 'vht_mcs_mask' 8 <= 9

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
