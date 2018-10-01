Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6ynw-0006bC-Qo
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 14:04:21 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath10k: Advertize beacon_int_min_gcd as 100 while bring
 up multi vaps
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1537272446-22329-1-git-send-email-mkenna@codeaurora.org>
References: <1537272446-22329-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20181001140358.3B7BD60C89@smtp.codeaurora.org>
Date: Mon,  1 Oct 2018 14:03:58 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> With the latest firmware design, the beacon interval should be
> greater than 100 to bring the multiple vaps.
> 
> Set beacon_int_min_gcd to 100, when the wmi service
> WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT is enabled
> in the firmware. If not, beacon_int_min_gcd will be set
> to the default value 1.
> 
> Tested in QCA4019 with firmware ver 10.4-3.2.1.1-00015
> Tested in QCA9888 with firmware ver 10.4-3.5.1-0005
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4600563f9319 ath10k: advertize beacon_int_min_gcd as 100 while bring up multi vaps

-- 
https://patchwork.kernel.org/patch/10604255/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
