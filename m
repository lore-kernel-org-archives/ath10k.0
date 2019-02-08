Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs7KL-0004wv-2P
 for ath10k@lists.infradead.org; Fri, 08 Feb 2019 14:40:26 +0000
MIME-Version: 1.0
Date: Fri, 08 Feb 2019 20:10:23 +0530
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: Re: [PATCH] ath10k: Enable Factory Test Mode for WCN3990
In-Reply-To: <20190208141604.B2D266074F@smtp.codeaurora.org>
References: <1535526038-4299-1-git-send-email-pillair@codeaurora.org>
 <20190208141604.B2D266074F@smtp.codeaurora.org>
Message-ID: <ab3140ba07ac91bc3729e9e2e31d9333@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Kalle,
I have checked the patch, and it is fine.

Thanks,
Rakesh Pillai.


On 2019-02-08 19:46, Kalle Valo wrote:
> Rakesh Pillai <pillair@codeaurora.org> wrote:
> 
>> The support to put WCN3990 firmware into Factory
>> test mode is not present currently. The WCN3990
>> firmware can operate in Factory test mode based
>> on the mode it receives in the wlan enable message
>> from the host driver.
>> 
>> When the host driver is started in testmode send
>> the operating mode as UTF mode, to the WCN3990
>> firmware, in the wlan enable message to start the
>> firmware in Factory test mode.
>> 
>> Tested on: WCN3990
>> Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1.
>> 
>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>> Reviewed-by: Brian Norris <briannorris@chromium.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> I was able to apply with 3-way merge but please double check the 
> results:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=ef562f95826f412c14f59ca916ff55931bed0813
> 
> Applying: ath10k: Enable Factory Test Mode for WCN3990
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath10k/ahb.c
> M       drivers/net/wireless/ath/ath10k/core.c
> M       drivers/net/wireless/ath/ath10k/hif.h
> M       drivers/net/wireless/ath/ath10k/mac.c
> M       drivers/net/wireless/ath/ath10k/pci.c
> M       drivers/net/wireless/ath/ath10k/sdio.c
> M       drivers/net/wireless/ath/ath10k/snoc.c
> M       drivers/net/wireless/ath/ath10k/usb.c
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath10k/usb.c
> Auto-merging drivers/net/wireless/ath/ath10k/snoc.c
> Auto-merging drivers/net/wireless/ath/ath10k/sdio.c
> Auto-merging drivers/net/wireless/ath/ath10k/pci.c
> Auto-merging drivers/net/wireless/ath/ath10k/mac.c
> Auto-merging drivers/net/wireless/ath/ath10k/hif.h
> Auto-merging drivers/net/wireless/ath/ath10k/core.c
> Auto-merging drivers/net/wireless/ath/ath10k/ahb.c

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
