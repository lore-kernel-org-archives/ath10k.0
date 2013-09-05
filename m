Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHfNS-00060V-NT
 for ath10k@lists.infradead.org; Thu, 05 Sep 2013 19:38:03 +0000
Message-ID: <5228DD79.2010306@hauke-m.de>
Date: Thu, 05 Sep 2013 21:37:29 +0200
From: Hauke Mehrtens <hauke@hauke-m.de>
MIME-Version: 1.0
Subject: Re: [OpenWrt-Devel] [PATCH] ath10k: enable Atheros 802.11ac driver
References: <1377211635-29100-1-git-send-email-mcgrof@qca.qualcomm.com>
In-Reply-To: <1377211635-29100-1-git-send-email-mcgrof@qca.qualcomm.com>
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
To: OpenWrt Development List <openwrt-devel@lists.openwrt.org>
Cc: Matthew McClintock <mmcclint@qca.qualcomm.com>, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, Jerome Proffit <jproffit@qca.qualcomm.com>, "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>, Sujith Manoharan <c_manoha@qca.qualcomm.com>, Kathy Giori <kgiori@qca.qualcomm.com>

On 08/23/2013 12:47 AM, Luis R. Rodriguez wrote:
> From: "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>
> 
> This enables usage of the ath10k driver on OpenWrt. Only 2.0 PCI hardware
> is supported. The ath10k firmware is currently only available
> through github so use that as its source for now.
> 
> This goes build tested, not run time tested.
> 
> Cc: ath10k@lists.infradead.org
> Cc: Kalle Valo <kvalo@qca.qualcomm.com>
> Cc: Kathy Giori <kgiori@qca.qualcomm.com>
> Cc: Mathieu Olivari <mathieu@qca.qualcomm.com>
> Cc: Jerome Proffit <jproffit@qca.qualcomm.com>
> Cc: Sujith Manoharan <c_manoha@qca.qualcomm.com>
> Cc: Matthew McClintock <mmcclint@qca.qualcomm.com>
> Signed-off-by: Luis R. Rodriguez <mcgrof@qca.qualcomm.com>

Hi Luis,

Thank you for the patch, it was added with some minor changes in r37898.

Hauke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
