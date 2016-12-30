Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMtHo-0005yp-9P
 for ath10k@lists.infradead.org; Fri, 30 Dec 2016 09:15:41 +0000
MIME-Version: 1.0
Subject: Re: ath10k: recal the txpower when removing interface
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1482445906-20421-1-git-send-email-ryanhsu@qca.qualcomm.com>
References: <1482445906-20421-1-git-send-email-ryanhsu@qca.qualcomm.com>
Message-ID: <9db0c0c5b7294f3fa73d25bf70eebad6@euamsexm01a.eu.qualcomm.com>
Date: Fri, 30 Dec 2016 10:15:13 +0100
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
To: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ryan Hsu <ryanhsu@qca.qualcomm.com> wrote:
> From: Ryan Hsu <ryanhsu@qca.qualcomm.com>
> 
> The txpower is being recalculated when adding interface to make sure
> txpower won't overshoot the spec, and when removing the interface,
> the txpower should again to be recalculated to restore the correct value
> from the active interface list.
> 
> Following is one of the scenario
> 	vdev0 is created as STA and connected: txpower:23
> 	vdev1 is created as P2P_DEVICE for control interface: txpower:0
> 	vdev2 is created as p2p go/gc interface: txpower is 21
> 
> So the vdev2@txpower:21 will be set to firmware when vdev2 is created.
> When we tear down the vdev2, the txpower needs to be recalculated to
> re-set it to vdev0@txpower:23 as vdev0/vdev1 are the active interface.
> 
> 	ath10k_pci mac vdev 0 peer create 8c:fd:f0:01:62:98
> 	ath10k_pci mac vdev_id 0 txpower 23
> 	... (adding interface)
> 	ath10k_pci mac vdev create 2 (add interface) type 1 subtype 3
> 	ath10k_pci mac vdev_id 2 txpower 21
> 	ath10k_pci mac txpower 21
> 	... (removing interface)
> 	ath10k_pci mac vdev 2 delete (remove interface)
> 	ath10k_pci vdev 1 txpower 0
> 	ath10k_pci vdev 0 txpower 23
> 	ath10k_pci mac txpower 23
> 
> Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

d679fa1b3c89 ath10k: recal the txpower when removing interface

-- 
https://patchwork.kernel.org/patch/9486925/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
