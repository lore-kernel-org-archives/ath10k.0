Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6qGu-0006Ip-Rg
 for ath10k@lists.infradead.org; Sat, 15 Aug 2020 07:06:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: correct the array index from mcs index for HT mode
 for QCA6174
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1597392294-13124-1-git-send-email-wgong@codeaurora.org>
References: <1597392294-13124-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20200815070628.9FE80C433C6@smtp.codeaurora.org>
Date: Sat, 15 Aug 2020 07:06:28 +0000 (UTC)
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> The mcs index of HT mode is 0 to 31, please refer http://mcsindex.com/.
> Its spatial stream(Nss) number is from 1 to 4, mcs index is 0~7 for
> Nss=1, 8~15 for Nss=2, 16~23 for Nss=3 and 24~31 is for Nss=4.
> 
> The mcs is reported from firmware in wmi_tlv_peer_stats_info of
> event WMI_TLV_PEER_STATS_INFO_EVENTID, its range is from 0~15 for
> QCA6174 SDIO and PCIe. It is for both Nss=1 and Nss=2, and it has 2
> rate table supported_ht_mcs_rate_nss1 and supported_ht_mcs_rate_nss2
> in ath10k, they are for Nss=1 and Nss=2, each table has 8 rates.
> 
> It need to find the matched row number with the mcs index, for example,
> mcs index is 2, it is <=7, so it is Nss=1, and match row 2 in table of
> Nss=1. If mcs index is 12, it is >= 8 and <= 15, so it is Nss=2, it
> match row 4(12-8) in table of Nss=2. If mcs index is >=16, it is for
> Nss=3/4, it need to add rate table, so it is not support in current
> ath10k.
> 
> This patch is to find the row number in rate table of Nss=1 or Nss=2
> with the mcs index reported from firmware.
> 
> This patch only effect the chips which supports_peer_stats_info of its
> hw_params is true, it is true only for QCA6174 currently.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00048
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

db04b755edaa ath10k: correct the array index from mcs index for HT mode for QCA6174

-- 
https://patchwork.kernel.org/patch/11713809/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
