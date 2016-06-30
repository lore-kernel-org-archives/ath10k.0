Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIZjC-00039c-Qg
 for ath10k@lists.infradead.org; Thu, 30 Jun 2016 11:01:51 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Disable TX_STBC for tx chainmask of 1
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1466081713-8122-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <acc7cf0119594113851574777077856c@euamsexm01a.eu.qualcomm.com>
Date: Thu, 30 Jun 2016 13:01:03 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Disable TX_STBC for both HT and VHT if the devices tx chainmask is '1'
> TX_STBC is required only for devices with tx_chainmask > 1. This fixes
> a ping failure for QCA9887 (1x1) in HT/VHT mode
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

34663241d81f ath10k: disable TX_STBC for tx chainmask of 1

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9180781/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
