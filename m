Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCn0b-0000ix-PO
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 11:59:54 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: Define an enum to enable cycle counter wraparound
 logic
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1464968596-19834-1-git-send-email-vthiagar@qti.qualcomm.com>
Message-ID: <751c58687e0842228c179608fd4018ce@euamsexm01a.eu.qualcomm.com>
Date: Tue, 14 Jun 2016 13:59:27 +0200
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
> QCA988X hw implements a different cycle counter wraparound
> behaviour when compared to QCA4019. To properly handle different
> wraparound logic for these chipsets replace already available
> bool hw_params member, has_shifted_cc_wraparound, with an
> enum which could be extended to handle different wraparound
> behaviour. This patch keeps the existing logic functionally
> same and a prepares cycle counter wraparound handling to
> extend for other chips.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, 2 patches applied to ath-next branch of ath.git:

26c197600b43 ath10k: define an enum to enable cycle counter wraparound logic
8e100354a985 ath10k: fix cycle counter wraparound handling for QCA4019

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9153403/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
