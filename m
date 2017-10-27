Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e80u8-0002oa-Sg
 for ath10k@lists.infradead.org; Fri, 27 Oct 2017 09:26:18 +0000
MIME-Version: 1.0
Subject: Re: [v7,2/5] ath10k: Enable TDLS peer buffer STA feature
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1508835074-3384-3-git-send-email-yintang@qti.qualcomm.com>
References: <1508835074-3384-3-git-send-email-yintang@qti.qualcomm.com>
Message-ID: <1e51ea390a67441faf15f5696e0afea8@euamsexm01a.eu.qualcomm.com>
Date: Fri, 27 Oct 2017 11:25:49 +0200
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
To: yintang@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

yintang@qti.qualcomm.com wrote:

> From: Yingying Tang <yintang@qti.qualcomm.com>
> 
> Enable TDLS peer buffer STA feature.
> QCA6174 firmware(version: WLAN.RM.4.4) support TDLS peer buffer STA,
> it reports this capability through wmi service map in wmi service ready
> event. Set related parameter in TDLS WMI command to enable this feature.
> 
> Signed-off-by: Yingying Tang <yintang@qti.qualcomm.com>

Depends on:

a9cd27b34d66 mac80211: enable TDLS peer buffer STA feature

Currently in mac80211-next.

4 patches set to Awaiting Upstream.

10023753 [v7,2/5] ath10k: Enable TDLS peer buffer STA feature
10023743 [v7,3/5] ath10k: Enable TDLS peer inactivity detection
10023725 [v7,4/5] ath10k: Avoid to set WEP key for TDLS peer
10023737 [v7,5/5] ath10k: Fix TDLS peer TX data failure issue on encryped AP

-- 
https://patchwork.kernel.org/patch/10023753/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
