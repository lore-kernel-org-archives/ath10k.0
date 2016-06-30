Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIZch-0006vO-KV
 for ath10k@lists.infradead.org; Thu, 30 Jun 2016 10:55:08 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix potential null dereference bugs
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1465563164-783-1-git-send-email-me@bobcopeland.com>
Message-ID: <fa78b1942cf2454898cc33b31a253b81@euamsexm01a.eu.qualcomm.com>
Date: Thu, 30 Jun 2016 12:54:40 +0200
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
To: Bob Copeland <me@bobcopeland.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bob Copeland <me@bobcopeland.com> wrote:
> Smatch warns about a number of cases in ath10k where a pointer is
> null-checked after it has already been dereferenced, in code involving
> ath10k private virtual interface pointers.
> 
> Fix these by making the dereference happen later.
> 
> Addresses the following smatch warnings:
> 
> drivers/net/wireless/ath/ath10k/mac.c:3651 ath10k_mac_txq_init() warn: variable dereferenced before check 'txq' (see line 3649)
> drivers/net/wireless/ath/ath10k/mac.c:3664 ath10k_mac_txq_unref() warn: variable dereferenced before check 'txq' (see line 3659)
> drivers/net/wireless/ath/ath10k/htt_tx.c:70 __ath10k_htt_tx_txq_recalc() warn: variable dereferenced before check 'txq->sta' (see line 52)
> drivers/net/wireless/ath/ath10k/htt_tx.c:740 ath10k_htt_tx_get_vdev_id() warn: variable dereferenced before check 'cb->vif' (see line 736)
> drivers/net/wireless/ath/ath10k/txrx.c:86 ath10k_txrx_tx_unref() warn: variable dereferenced before check 'txq' (see line 84)
> drivers/net/wireless/ath/ath10k/wmi.c:1837 ath10k_wmi_op_gen_mgmt_tx() warn: variable dereferenced before check 'cb->vif' (see line 1825)
> 
> Signed-off-by: Bob Copeland <me@bobcopeland.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

a66cd733a729 ath10k: fix potential null dereference bugs

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9169669/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
