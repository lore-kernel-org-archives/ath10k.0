Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwNd6-0005sm-KF
 for ath10k@lists.infradead.org; Mon, 25 Sep 2017 07:16:43 +0000
MIME-Version: 1.0
Subject: Re: ath10k: make ath10k_hw_ce_regs const
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1505329312-26432-1-git-send-email-bhumirks@gmail.com>
References: <1505329312-26432-1-git-send-email-bhumirks@gmail.com>
Message-ID: <7dc5dd650ee340bb9d2e96287e1c4ece@euamsexm01a.eu.qualcomm.com>
Date: Mon, 25 Sep 2017 09:16:05 +0200
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
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, julia.lawall@lip6.fr

Bhumika Goyal <bhumirks@gmail.com> wrote:

> Make them const as they are not modified in the file referencing
> them. They are only stored in the const field 'hw_ce_reg' of an ath10k
> structure. Also, make the declarations in the header const.
> 
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

496cbf3ebb6b ath10k: make ath10k_hw_ce_regs const

-- 
https://patchwork.kernel.org/patch/9951901/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
