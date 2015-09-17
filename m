Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcXDi-0006OZ-Op
 for ath10k@lists.infradead.org; Thu, 17 Sep 2015 11:19:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add ATH10K_FW_FEATURE_RAW_MODE_SUPPORT to
 ath10k_core_fw_feature_str[]
References: <20150909083437.12465.89335.stgit@potku.adurom.net>
Date: Thu, 17 Sep 2015 14:18:51 +0300
In-Reply-To: <20150909083437.12465.89335.stgit@potku.adurom.net> (Kalle Valo's
 message of "Wed, 09 Sep 2015 11:34:37 +0300")
Message-ID: <87zj0ltht0.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> This was missed in the original commit adding the flag and ath10k only printed "bit10":
>
> ath10k_pci 0000:02:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.2.4.70.6-2 api 3
> htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1 features no-p2p,bit10
>
> Also add a build test to avoid this happening again.
>
> Fixes: ccec9038c721 ("ath10k: enable raw encap mode and software crypto engine")
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
