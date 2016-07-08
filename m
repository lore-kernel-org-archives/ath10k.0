Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLWQt-0002r5-PG
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 14:07:08 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix possible wrong rx_busy time reporting in QCA4019
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1467371245-5426-1-git-send-email-vthiagar@qti.qualcomm.com>
Message-ID: <daa5435e9e124d1e8f2e0d05b1543c18@euamsexm01a.eu.qualcomm.com>
Date: Fri, 8 Jul 2016 16:06:25 +0200
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> wrote:
> As hw cycle counters in QCA4019 wraparound independantly in QCA4019
> it is possible cycle counter and rx clear counter would wraparound
> at the same time. Current logic assumes only one of the counters
> would wraparound at anytime. Fix this by moving 'else' part to
> another 'if'.
> 
> Fixes: 8e100354a98 ("ath10k: fix cycle counter wraparound handling for QCA4019")
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
> Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

c11e99396d0f ath10k: fix possible wrong rx_busy time reporting in QCA4019

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9209723/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
