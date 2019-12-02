Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibijI-0008AC-QM
 for ath10k@lists.infradead.org; Mon, 02 Dec 2019 10:14:59 +0000
MIME-Version: 1.0
Date: Mon, 2 Dec 2019 10:14:53 +0000
From: wgong@codeaurora.org
Subject: Re: [PATCH] ath: add support for special 0x0 regulatory domain
In-Reply-To: <20191202100833.0C1B9C433CB@smtp.codeaurora.org>
References: <0101016eb614d832-1f2459b1-1555-4ce7-8f90-5704d201bc10-000000@us-west-2.amazonses.com>
 <20191202100833.0C1B9C433CB@smtp.codeaurora.org>
Message-ID: <0101016ec61b147a-7013f605-ca40-4860-ae5c-943904ed3ae0-000000@us-west-2.amazonses.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-12-02 18:08, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> wrote:
> 
>> Some sdio chips of rome QCA6174's regulatory domain code of EEPROM is
>> empty, then ath_is_world_regd will return false for this case, and
>> it will lead function __ath_reg_dyn_country not work, thus the 
>> regdomain
>> will not update for NL80211_REGDOM_SET_BY_COUNTRY_IE type, it result
>> ath10k set the same regdomain/reg_5ghz_ctl/reg_2ghz_ctl to firmware,
>> then the tx power will not changed with different regdomain's AP. The
>> regulatory domain code of EEPROM of some QCA6174 PCIE chip is 0x6c, it
>> means world wide regdomain, for this chip, it does not have the issue.
>> 
>> For empty reulatory domain code chip, set it to world regulatory 
>> domain
>> in functio ath_regd_sanitize, then it will fix the issue.
>> 
>> Tested with QCA6174 SDIO with firmware
>> WLAN.RMH.4.4.1-00029.
>> 
>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> Patch applied to ath-next branch of ath.git, thanks.
> 
> 2dc016599cfa ath: add support for special 0x0 regulatory domain
But I did not see it in ath-next now.
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/drivers/net/wireless/ath?h=ath-next
is it has some delay?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
