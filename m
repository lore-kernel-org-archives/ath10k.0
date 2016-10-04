Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brRBv-0005Iu-25
 for ath10k@lists.infradead.org; Tue, 04 Oct 2016 14:59:36 +0000
MIME-Version: 1.0
Subject: Re: ath10k: add cc_wraparound type for QCA9888 and QCA9884
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1474026327-7065-1-git-send-email-akolli@qti.qualcomm.com>
References: <1474026327-7065-1-git-send-email-akolli@qti.qualcomm.com>
Message-ID: <6ec942c23a6144d9a15af4fa8f1238fd@euamsexm01a.eu.qualcomm.com>
Date: Tue, 4 Oct 2016 16:58:43 +0200
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
To: akolli@qti.qualcomm.com
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

akolli@qti.qualcomm.com wrote:
> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
> 
> During offchannel scan, iw survey dump shows wrong values.
> Fix this by assigning cycle counter wranarround type for
> QCA9888 and QCA9884, they share same config with QCA4019.
> 
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

bafe492610d5 ath10k: add cc_wraparound type for QCA9888 and QCA9884

-- 
https://patchwork.kernel.org/patch/9335581/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
