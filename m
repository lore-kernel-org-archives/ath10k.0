Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvfWw-0008CF-AD
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 07:43:54 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix station nss computation
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1490342248-6213-1-git-send-email-c_vnaral@qti.qualcomm.com>
References: <1490342248-6213-1-git-send-email-c_vnaral@qti.qualcomm.com>
Message-ID: <1078a1d3e46744f4bf0ff96e047c54c5@euamsexm01a.eu.qualcomm.com>
Date: Wed, 5 Apr 2017 09:36:26 +0200
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
To: c_vnaral@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

c_vnaral@qti.qualcomm.com wrote:
> From: Venkateswara Rao Naralasetty <c_vnaral@qti.qualcomm.com>
> 
> If station advertises diffferent NSS capabilities in Rx_mcs set
> of HT and VHT IEs in assoc req, the current NSS computation
> logic configures the NSS support only based on Rx_mcs set of
> HT capabilities in the driver. This is configuring the station
> NSS capabilities incorreclty in the target.
> 
> For example, if station advertise Rx_mcs set as 2 spatial streams
> in HT capabilities and 1 spatial streams in VHT capabilities in
> assoc request, as per current logic we are calculating nss from
> HT capabilities and the driver sets peer_num_spatial_streams as
> 2 for the station which is configured in VHT 1*1.
> 
> This patchs fix this issue by calculating the nss from VHT cap if
> station supports vht.
> 
> Signed-off-by: Venkateswara Rao Naralasetty <c_vnaral@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

fefcd11535ab ath10k: fix station nss computation

-- 
https://patchwork.kernel.org/patch/9642345/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
