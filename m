Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtd5y-000620-S0
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 18:47:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: add dynamic vlan support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1542798288-8946-1-git-send-email-mpubbise@codeaurora.org>
References: <1542798288-8946-1-git-send-email-mpubbise@codeaurora.org>
Message-Id: <20190212184750.8F5106030D@smtp.codeaurora.org>
Date: Tue, 12 Feb 2019 18:47:50 +0000 (UTC)
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Manikanta Pubbisetty <mpubbise@codeaurora.org> wrote:

> Multicast/broadcast traffic destined for a particular vlan group will
> always be encrypted in software. To enable dynamic VLANs, it requires
> driver support for sending software encrypted packets.
> 
> In ath10k, sending software encrypted frames is allowed only when we insmod
> the driver with cryptmode param set to 1, this configuration disables
> hardware crypto and enables RAW mode implicitly. Since, enabling raw
> mode has performance impact, this cannot be considered as an ideal
> solution for supporting VLANs in the driver.
> 
> As an alternative take, in this approach, cryptographic keys for
> unicast traffic (per peer PTKs) and keys for non-vlan group traffic
> will be configured in hardware, allowing hardware encryption for unicast
> and non-vlan group traffic. Only vlan group traffic will be encrypted in
> software and pushed to the target with encap mode set to RAW in the TX
> descriptors.
> 
> Not all firmwares can support this type of key configuration(having few
> keys installed in hardware and few only in software); for this purpose a
> new WMI service flag "WMI_SERVICE_PER_PACKET_SW_ENCRYPT" is introduced to
> advertise this support.
> 
> Also, adding the logic required to send sw encrypted frames in raw mode.
> 
> Hardwares Tested : QCA9984, QCA988X
> Firmwares Tested : 10.4-3.5.3-00057, 10.2.4-1.0-00042
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4920ce3bf7e0 ath10k: add dynamic vlan support

-- 
https://patchwork.kernel.org/patch/10692385/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
