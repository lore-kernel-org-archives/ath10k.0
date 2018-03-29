Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1TIW-0006hw-CB
 for ath10k@lists.infradead.org; Thu, 29 Mar 2018 08:52:41 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: enable QCA6174/QCA9377 to read the chip temperature
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1521183942-4291-1-git-send-email-ryanhsu@codeaurora.org>
References: <1521183942-4291-1-git-send-email-ryanhsu@codeaurora.org>
Message-Id: <20180329085230.1DBF8602FC@smtp.codeaurora.org>
Date: Thu, 29 Mar 2018 08:52:30 +0000 (UTC)
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
To: ryanhsu@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

ryanhsu@codeaurora.org wrote:

> The firmware of QCA6174/QCA9377 already support the feature, just enable
> it to be able to handle the get_temperature command and process the event.
> 
> You can read the temperature by using the hwmon interface,
> 
> cat /sys/class/ieee80211/phy*/device/hwmon/hwmon2/temp1_input
> 
> Verified with the following hardware and software combination,
> QCA6174, only firmware-4.bin doesn't support this, otherwise all support.
> QCA9377, all the firmwares upstreamed support this command
> 
> Signed-off-by: Ryan Hsu <ryanhsu@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

e98199a8c27f ath10k: enable QCA6174/QCA9377 to read the chip temperature
e3814bec380f ath10k: add FW API 6 firmware image for QCA9377

-- 
https://patchwork.kernel.org/patch/10286439/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
