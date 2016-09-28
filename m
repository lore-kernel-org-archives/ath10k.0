Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpBUU-0005Bu-Cj
 for ath10k@lists.infradead.org; Wed, 28 Sep 2016 09:49:26 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix copy engine 5 destination ring stuck
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160921105806.23980-1-rmanohar@qti.qualcomm.com>
References: <20160921105806.23980-1-rmanohar@qti.qualcomm.com>
Message-ID: <69a6e1629c9048da8db94c38bd911466@euamsexm01a.eu.qualcomm.com>
Date: Wed, 28 Sep 2016 11:48:58 +0200
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: rmanohar@codeaurora.org, linux-wireless@vger.kernel.org, stable@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> Firmware is running watchdog timer for tracking copy engine ring index
> and write index. Whenever both indices are stuck at same location for
> given duration, watchdog will be trigger to assert target. While
> updating copy engine destination ring write index, driver ensures that
> write index will not be same as read index by finding delta between these
> two indices (CE_RING_DELTA).
> 
> HTT target to host copy engine (CE5) is special case where ring buffers
> will be reused and delta check is not applied while updating write index.
> In rare scenario, whenever CE5 ring is full, both indices will be referring
> same location and this is causing CE ring stuck issue as explained
> above. This issue is originally reported on IPQ4019 during long hour stress
> testing and during veriwave max clients testsuites. The same issue is
> also observed in other chips as well. Fix this by ensuring that write
> index is one less than read index which means that full ring is
> available for receiving data.
> 
> Cc: stable@vger.kernel.org
> Tested-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

0628467f97b5 ath10k: fix copy engine 5 destination ring stuck

-- 
https://patchwork.kernel.org/patch/9343317/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
