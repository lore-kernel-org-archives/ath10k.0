Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibid8-0005sI-NO
 for ath10k@lists.infradead.org; Mon, 02 Dec 2019 10:08:36 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath: add support for special 0x0 regulatory domain
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016eb614d832-1f2459b1-1555-4ce7-8f90-5704d201bc10-000000@us-west-2.amazonses.com>
References: <0101016eb614d832-1f2459b1-1555-4ce7-8f90-5704d201bc10-000000@us-west-2.amazonses.com>
Message-ID: <0101016ec615464b-6f346795-8985-4af9-84cc-641751d88fef-000000@us-west-2.amazonses.com>
Date: Mon, 2 Dec 2019 10:08:33 +0000
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> Some sdio chips of rome QCA6174's regulatory domain code of EEPROM is
> empty, then ath_is_world_regd will return false for this case, and
> it will lead function __ath_reg_dyn_country not work, thus the regdomain
> will not update for NL80211_REGDOM_SET_BY_COUNTRY_IE type, it result
> ath10k set the same regdomain/reg_5ghz_ctl/reg_2ghz_ctl to firmware,
> then the tx power will not changed with different regdomain's AP. The
> regulatory domain code of EEPROM of some QCA6174 PCIE chip is 0x6c, it
> means world wide regdomain, for this chip, it does not have the issue.
> 
> For empty reulatory domain code chip, set it to world regulatory domain
> in functio ath_regd_sanitize, then it will fix the issue.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00029.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2dc016599cfa ath: add support for special 0x0 regulatory domain

-- 
https://patchwork.kernel.org/patch/11266721/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
