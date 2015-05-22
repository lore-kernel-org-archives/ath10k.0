Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvkTp-0008HQ-OG
 for ath10k@lists.infradead.org; Fri, 22 May 2015 10:47:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add new 4addr related fw_feature
References: <1432037374-26339-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 22 May 2015 13:46:33 +0300
In-Reply-To: <1432037374-26339-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 19 May 2015 14:09:34 +0200")
Message-ID: <874mn46gae.fsf@kamboji.qca.qualcomm.com>
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

> Some firmware revisions pad 4th hw address in
> Native Wifi Rx decap. This is the case with 10.x
> and it was assumed that this is true for all
> firmware images.
>
> However QCA988X with 999.999.0.636 and QCA61X4
> with WLAN.RM.2.0-00088 don't have the padding.
> Hence add a feature flag indicating that the
> padding isn't present so firmware images can
> advertise it appropriately. This way driver will
> behave as it was before with old firmware blobs
> and doesn't cause any regressions from user
> perspective.
>
> Effectively this patch enables QCA988X with
> 999.999.0.636 and QCA61X4 with WLAN.RM.2.0-00088
> to set up client bridging provided user has an
> updated firmware blob.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
