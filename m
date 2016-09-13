Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjmmj-00010e-3f
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 12:25:57 +0000
MIME-Version: 1.0
Subject: Re: ath10k: remove unused variable ar_pci
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160905133802.18755-1-chaehyun.lim@gmail.com>
Message-ID: <ab838c70bd944270ac482115c9194223@euamsexm01a.eu.qualcomm.com>
Date: Tue, 13 Sep 2016 14:25:28 +0200
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
To: Chaehyun Lim <chaehyun.lim@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Chaehyun Lim <chaehyun.lim@gmail.com> wrote:
> Trival fix to remove unused variable ar_pci in ath10k_pci_tx_pipe_cleanup
> when building with W=1:
> drivers/net/wireless/ath/ath10k/pci.c:1696:21: warning: variable
> 'ar_pci' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

214d55394481 ath10k: remove unused variable ar_pci

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9313963/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
