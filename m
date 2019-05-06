Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNUQR-0007UQ-39
 for ath10k@lists.infradead.org; Mon, 06 May 2019 03:36:25 +0000
Subject: RE: ath10k: Two missing sdio patches
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Mon, 6 May 2019 03:36:16 +0000
Message-ID: <68e788e5355c4f689e85d526b89da6a7@aptaiexm02f.ap.qualcomm.com>
References: <1d5b4f00-2da8-b435-9122-07f93890dda9@gmail.com>
In-Reply-To: <1d5b4f00-2da8-b435-9122-07f93890dda9@gmail.com>
Content-Language: en-US
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "wgong@codeaurora.org" <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Erik
> Stromdahl
> Sent: Sunday, May 5, 2019 10:23 PM
> To: kvalo@codeaurora.org; wgong@codeaurora.org;
> ath10k@lists.infradead.org
> Subject: [EXT] ath10k: Two missing sdio patches
> 
> Hej Kalle, Wen,
> 
> I see there are lots of SDIO patches coming in to the mailing ath10k list, great!
> 
> I while back I submitted two patches that adds an inline wrapper for an htt
> op.
> 
> patchwork:
> https://patchwork.kernel.org/project/linux-wireless/list/?series=97099
> 
> Without these patches I get a panic due to calling a NULL pointer callback
> with SDIO.
> 
> It is the htt->tx_ops->htt_h2t_aggr_cfg_msg() in ath10k_htt_setup() that
> causes the panic.
> 
> Kalle:
> I notice that you don't have these patches in your pending-sdio-usb branch.
> 
> Wen:
> Do you have any other patch that fixes this issue (I can't see how it can work
> without
> these patches unless you have some other fix)?
> 
Hi Erik,
I do not have other patch to fix the issue.
The patch change the ath10k_htt_h2t_aggr_cfg_msg to htt->tx_ops->htt_h2t_aggr_cfg_msg in ath10k_htt_setup.
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath10k/htt.c?id=5cbb117477501df2f8b3a384b042b08cd7174c92
I used chromeos which does not include the upper patch.
> --
> Erik
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
