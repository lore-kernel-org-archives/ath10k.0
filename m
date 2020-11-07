Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbMUk-0002vB-FN
 for ath10k@lists.infradead.org; Sat, 07 Nov 2020 11:35:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] wireless: remove unneeded break
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201020125841.26791-1-trix@redhat.com>
References: <20201020125841.26791-1-trix@redhat.com>
Message-Id: <20201107113456.65275C433FE@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 11:34:56 +0000 (UTC)
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
To: trix@redhat.com
Cc: emmanuel.grumbach@intel.com, tova.mussai@intel.com, ath9k-devel@qca.qualcomm.com, saurav.girepunje@gmail.com, luciano.coelho@intel.com, shahar.s.matityahu@intel.com, linux-stm32@st-md-mailman.stormreply.com, shaul.triebitz@intel.com, lior2.cohen@intel.com, pkshih@realtek.com, ath10k@lists.infradead.org, kuba@kernel.org, alexandre.torgue@st.com, johannes.berg@intel.com, linuxwifi@intel.com, sara.sharon@intel.com, linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr, john@phrozen.org, linux-arm-kernel@lists.infradead.org, yanaijie@huawei.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, gustavoars@kernel.org, nathan.errera@intel.com, zhengbin13@huawei.com, mcoquelin.stm32@gmail.com, joe@perches.com, davem@davemloft.net, Larry.Finger@lwfinger.net

trix@redhat.com wrote:

> From: Tom Rix <trix@redhat.com>
> 
> A break is not needed if it is preceded by a return
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Patch applied to wireless-drivers-next.git, thanks.

3287953b0399 wireless: remove unneeded break

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201020125841.26791-1-trix@redhat.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
