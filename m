Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hflHg-00023I-4P
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 13:14:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v5] ath10k: add support for controlling tx power to a
 station
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559209638-23887-1-git-send-email-bpothuno@codeaurora.org>
References: <1559209638-23887-1-git-send-email-bpothuno@codeaurora.org>
Message-Id: <20190625131451.D07FA6028D@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 13:14:51 +0000 (UTC)
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
To: Balaji Pothunoori <bpothuno@codeaurora.org>
Cc: Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Balaji Pothunoori <bpothuno@codeaurora.org> wrote:

> This patch will add the support to control the transmit power for traffic
> to a station associated with the AP.
> 
> Underlying firmware will enforce that the maximum tx power will be based
> on the regulatory requirements. If the user given transmit power is greater
> than the allowed tx power in the given channel, then the firmware will use
> the maximum tx power in the same channel.
> 
> Max and Min tx power values will depends on no of tx chain masks,
> for QCA9984 allowed tx power range values from 6 to 23.
> 
> When 0 is sent to the firmware as tx power, it will revert to the default
> tx power for the station.
> 
> Tested Hardware : QCA9984
> Tested Firmware : 10.4-3.9.0.2-00046
> 
> Co-developed-by: Balaji Pothunoori <bpothuno@codeaurora.org>
> Signed-off-by: Ashok Raj Nagarajan <arnagara@codeaurora.org>
> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

33410a51468f ath10k: add support for controlling tx power to a station

-- 
https://patchwork.kernel.org/patch/10968517/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
