Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAsui-0001pF-Np
 for ath10k@lists.infradead.org; Tue, 24 Apr 2018 08:03:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC v2] ath10k: report tx rate using ieee80211_tx_status()
References: <1524291786-30850-1-git-send-email-akolli@codeaurora.org>
Date: Tue, 24 Apr 2018 11:02:46 +0300
In-Reply-To: <1524291786-30850-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Sat, 21 Apr 2018 11:53:06 +0530")
Message-ID: <87zi1tav6h.fsf@kamboji.qca.qualcomm.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> Mesh path metric needs txrate information from ieee80211_tx_status()
> call but in ath10k there is no mechanism to report tx rate information
> via ieee80211_tx_status(), the rate is only accessible via
> sta_statiscs() op.
>
> Per peer stats has tx rate info available, this patch stores per peer
> last tx rate and updates the tx rate info structures in tx completition.
> The rate updated in ieee80211_tx_status() is not exactly for the last
> transmitted frame instead the rate is from one of the previous frames.
>
> Per peer txrate information is updated through per peer statistics
> and is available for QCA9888/QCA9984/QCA4019/QCA998X only
>
> Tested on QCA9984 with firmware-5.bin_10.4-3.5.3-00053
> Tested on QCA998X with firmware-5.bin_10.2.4-1.0-00036
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

BTW, your name in patchwork is "akolli@codeaurora.org" but it should be
"Anilkumar Kolli" and that's why my script uses the wrong name. Please
fix it by registering to patchwork as it's possible to change your name
during registration, but only one time. If that doesn't work then send a
request to helpdesk@kernel.org and the admins will fix it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
