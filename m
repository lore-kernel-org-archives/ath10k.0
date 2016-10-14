Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buzhb-0007kA-0D
 for ath10k@lists.infradead.org; Fri, 14 Oct 2016 10:26:59 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/2] ath10k: add VHT160 support
Date: Fri, 14 Oct 2016 10:26:34 +0000
Message-ID: <87r37j9qg6.fsf@kamboji.qca.qualcomm.com>
References: <20161014101710.5300.21550.stgit@potku.adurom.net>
 <20161014101912.5300.66145.stgit@potku.adurom.net>
In-Reply-To: <20161014101912.5300.66145.stgit@potku.adurom.net> (Kalle Valo's
 message of "Fri, 14 Oct 2016 13:19:12 +0300")
Content-Language: en-US
Content-ID: <8FC703AAC96E484AAC7275A1D625E49C@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>
> This patch adds full VHT160 support for QCA9984 chipsets Tested on Netgear
> R7800. 80+80 is possible, but disabled so far since it seems to contain
> glitches like missing vht station flags (this may be firmware or mac80211
> related).
>
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> Patchwork-Id: 9335111

Oops, the patchwork id is a leftover from my patchwork script. I'll
remove it before I apply the patch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
