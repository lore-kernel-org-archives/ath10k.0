Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK48n-0008Tp-VU
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 16:23:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath10k: assign 'n_cipher_suites' for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181102171749.38680-1-briannorris@chromium.org>
References: <20181102171749.38680-1-briannorris@chromium.org>
Message-Id: <20181106162335.0C92E6049C@smtp.codeaurora.org>
Date: Tue,  6 Nov 2018 16:23:35 +0000 (UTC)
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@qti.qualcomm.com>, Rakesh Pillai <pillair@qti.qualcomm.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Brian Norris <briannorris@chromium.org> wrote:

> Commit 2ea9f12cefe4 ("ath10k: add new cipher suite support") added a new
> n_cipher_suites HW param with a fallback value and a warning log. Commit
> 03a72288c546 ("ath10k: wmi: add hw params entry for wcn3990") later
> added WCN3990 HW entries, but it missed the n_cipher_suites.
> 
> Rather than seeing this warning every boot
> 
>   ath10k_snoc 18800000.wifi: invalid hw_params.n_cipher_suites 0
> 
> let's provide the appropriate value.
> 
> Cc: Rakesh Pillai <pillair@qti.qualcomm.com>
> Cc: Govind Singh <govinds@qti.qualcomm.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

2bd345cd2bfc ath10k: assign 'n_cipher_suites' for WCN3990
79169f148655 ath10k: don't assume this is a PCI dev in generic code
cea04e3d8e37 ath10k: fix struct init whitespace in SNOC driver

-- 
https://patchwork.kernel.org/patch/10665915/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
