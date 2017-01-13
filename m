Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cS1uR-0003zp-TT
 for ath10k@lists.infradead.org; Fri, 13 Jan 2017 13:28:50 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: add accounting for the extended peer statistics
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
References: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
Message-ID: <270c5e95df7849f48fe0adf6ff448aed@euamsexm01a.eu.qualcomm.com>
Date: Fri, 13 Jan 2017 14:28:21 +0100
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Christian Lamparter <chunkeey@googlemail.com> wrote:
> The 10.4 firmware adds extended peer information to the
> firmware's statistics payload. This additional info is
> stored as a separate data field and the elements are
> stored in their own "peers_extd" list.
> 
> These elements can pile up in the same way as the peer
> information elements. This is because the
> ath10k_wmi_10_4_op_pull_fw_stats() function tries to
> pull the same amount (num_peer_stats) for every statistic
> data unit.
> 
> Fixes: 4a49ae94a448faa ("ath10k: fix 10.4 extended peer stats update")
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Patch applied to ath-next branch of ath.git, thanks.

c1e3330f22bc ath10k: add accounting for the extended peer statistics

-- 
https://patchwork.kernel.org/patch/9461631/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
