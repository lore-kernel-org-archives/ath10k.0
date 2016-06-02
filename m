Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8U5G-0002Rh-1Y
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 14:58:54 +0000
MIME-Version: 1.0
Subject: Re: ath10k: enable ipq4019 device probe in ahb module
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1464613883-24036-1-git-send-email-c_traja@qti.qualcomm.com>
Message-ID: <1d9f58c8d04842c19383fc5c9d84a442@euamsexm01a.eu.qualcomm.com>
Date: Thu, 2 Jun 2016 16:58:26 +0200
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
To: c_traja@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>, ath10k@lists.infradead.org

c_traja@qti.qualcomm.com wrote:
> From: Raja Mani <rmani@qti.qualcomm.com>
> 
> All the necessary patches to make wifi running (over AHB)
> on ipq4019 SoC are ready now. It's good to enable
> ipq4019 wifi device probing in ahb module and
> remove work in progress debug print.
> 
> Device tree change is there in the public review by
> below commit message
> "qcom: ipq4019: add wifi nodes to ipq4019 SoC device tree"
> 
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Thanks, 1 patch applied to ath.git:

280e762e9c72 ath10k: enable ipq4019 device probe in ahb module

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9141355/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
