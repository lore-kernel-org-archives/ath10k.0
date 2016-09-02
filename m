Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqnG-0005ZY-BF
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 15:54:15 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix sending frame in management path in push txq logic
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1471514404-24098-1-git-send-email-arnagara@qti.qualcomm.com>
Message-ID: <d88420cfb8264f28ac04cce477ed5cf1@euamsexm01a.eu.qualcomm.com>
Date: Fri, 2 Sep 2016 17:53:46 +0200
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, arnagara@codeaurora.org, ath10k@lists.infradead.org

Ashok Raj Nagarajan <arnagara@qti.qualcomm.com> wrote:
> In the wake tx queue path, we are not checking if the frame to be sent
> takes management path or not. For eg. QOS null func frame coming here will
> take the management path. Since we are not incrementing the descriptor
> counter (num_pending_mgmt_tx) w.r.t tx management, on tx completion it is
> possible to see negative values.
> 
> When the above counter reaches a negative value, we will not be sending a
> probe response out.
> 
>     if (is_presp &&
> 	ar->hw_params.max_probe_resp_desc_thres < htt->num_pending_mgmt_tx)
> 
> For IPQ4019, max_probe_resp_desc_thres (u32) is 24 is compared against
> num_pending_mgmt_tx (int) and the above condtions comes true if the counter
> is negative and we drop the probe response.
> 
> To avoid this, check on the wake tx queue path as well for the tx path of
> the frame and increment the appropriate counters
> 
> Fixes: cac085524cf1 "ath10k: move mgmt descriptor limit handle under mgmt_tx"
> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

e4fd726f21cd ath10k: fix sending frame in management path in push txq logic

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9287191/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
