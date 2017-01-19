Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUCc6-0008I2-Bs
 for ath10k@lists.infradead.org; Thu, 19 Jan 2017 13:18:52 +0000
MIME-Version: 1.0
Subject: Re: ath10k: prevent sta pointer rcu violation
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1484234070-7431-1-git-send-email-michal.kazior@tieto.com>
References: <1484234070-7431-1-git-send-email-michal.kazior@tieto.com>
Message-ID: <09e8655e878946659bc62c52e59abd76@euamsexm01a.eu.qualcomm.com>
Date: Thu, 19 Jan 2017 14:18:20 +0100
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, mohammed@qti.qualcomm.com

Michal Kazior <michal.kazior@tieto.com> wrote:
> Station pointers are RCU protected so driver must
> be extra careful if it tries to store them
> internally for later use outside of the RCU
> section it obtained it in.
> 
> It was possible for station teardown to race with
> some htt events. The possible outcome could be a
> use-after-free and a crash.
> 
> Only peer-flow-control capable firmware was
> affected (so hardware-wise qca99x0 and qca4019).
> 
> This could be done in sta_state() itself via
> explicit synchronize_net() call but there's
> already a convenient sta_pre_rcu_remove() op that
> can be hooked up to avoid extra rcu stall.
> 
> The peer->sta pointer itself can't be set to
> NULL/ERR_PTR because it is later used in
> sta_state() for extra sanity checks.
> 
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Patch applied to ath-next branch of ath.git, thanks.

0a744d927406 ath10k: prevent sta pointer rcu violation

-- 
https://patchwork.kernel.org/patch/9513391/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
