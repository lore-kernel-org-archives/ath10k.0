Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gte8l-0008Mm-Uq
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 19:54:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Enable support for beacon interval per VAP
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1549979286-9255-1-git-send-email-dundi@codeaurora.org>
References: <1549979286-9255-1-git-send-email-dundi@codeaurora.org>
Message-Id: <20190212195447.603FD60770@smtp.codeaurora.org>
Date: Tue, 12 Feb 2019 19:54:47 +0000 (UTC)
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
To: Dundi Raviteja <dundi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Dundi Raviteja <dundi@codeaurora.org> wrote:

> Enable support to configure different beacon interval per VAP.
> 
> To support this feature, map different beacon interval service bit
> to wmi tlv service.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Dundi Raviteja <dundi@codeaurora.org>

Does not compile:

In file included from drivers/net/wireless/ath/ath10k/mac.c:34:
drivers/net/wireless/ath/ath10k/wmi-tlv.h: In function 'wmi_tlv_svc_map_ext':
drivers/net/wireless/ath/ath10k/wmi-tlv.h:1571:15: error: 'WMI_TLV_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT' undeclared (first use in this function); did you mean 'WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT'?
  SVCMAP(WMI_TLV_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     
               WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT
drivers/net/wireless/ath/ath10k/wmi-tlv.h:1571:15: note: each undeclared identifier is reported only once for each function it appears in
In file included from drivers/net/wireless/ath/ath10k/wmi.c:26:
drivers/net/wireless/ath/ath10k/wmi-tlv.h: In function 'wmi_tlv_svc_map_ext':
drivers/net/wireless/ath/ath10k/wmi-tlv.h:1571:15: error: 'WMI_TLV_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT' undeclared (first use in this function); did you mean 'WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT'?
  SVCMAP(WMI_TLV_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     
               WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT
drivers/net/wireless/ath/ath10k/wmi-tlv.h:1571:15: note: each undeclared identifier is reported only once for each function it appears in
In file included from drivers/net/wireless/ath/ath10k/wmi-tlv.c:24:
drivers/net/wireless/ath/ath10k/wmi-tlv.h: In function 'wmi_tlv_svc_map_ext':
drivers/net/wireless/ath/ath10k/wmi-tlv.h:1571:15: error: 'WMI_TLV_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT' undeclared (first use in this function); did you mean 'WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT'?
  SVCMAP(WMI_TLV_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     
               WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT
drivers/net/wireless/ath/ath10k/wmi-tlv.h:1571:15: note: each undeclared identifier is reported only once for each function it appears in
make[5]: *** [drivers/net/wireless/ath/ath10k/mac.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[5]: *** [drivers/net/wireless/ath/ath10k/wmi.o] Error 1
make[5]: *** [drivers/net/wireless/ath/ath10k/wmi-tlv.o] Error 1
make[4]: *** [drivers/net/wireless/ath/ath10k] Error 2
make[3]: *** [drivers/net/wireless/ath] Error 2
make[2]: *** [drivers/net/wireless] Error 2
make[1]: *** [drivers/net] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [drivers] Error 2

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10807921/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
