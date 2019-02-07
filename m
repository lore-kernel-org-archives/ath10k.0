Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grkRo-0004vt-O3
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:14:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Enable Factory Test Mode for WCN3990
References: <1535526038-4299-1-git-send-email-pillair@codeaurora.org>
 <20190205010207.GA219734@google.com>
Date: Thu, 07 Feb 2019 16:14:31 +0200
In-Reply-To: <20190205010207.GA219734@google.com> (Brian Norris's message of
 "Mon, 4 Feb 2019 17:02:08 -0800")
Message-ID: <871s4jado8.fsf@kamboji.qca.qualcomm.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org

Brian Norris <briannorris@chromium.org> writes:

> On Wed, Aug 29, 2018 at 12:30:38PM +0530, Rakesh Pillai wrote:
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
>> ---
>>  drivers/net/wireless/ath/ath10k/ahb.c      |  3 ++-
>>  drivers/net/wireless/ath/ath10k/core.c     |  2 +-
>>  drivers/net/wireless/ath/ath10k/hif.h      |  7 ++++---
>>  drivers/net/wireless/ath/ath10k/mac.c      |  2 +-
>>  drivers/net/wireless/ath/ath10k/pci.c      |  3 ++-
>>  drivers/net/wireless/ath/ath10k/sdio.c     |  3 ++-
>>  drivers/net/wireless/ath/ath10k/snoc.c     | 20 ++++++++++++++++----
>>  drivers/net/wireless/ath/ath10k/testmode.c |  2 +-
>>  drivers/net/wireless/ath/ath10k/usb.c      |  3 ++-
>>  9 files changed, 31 insertions(+), 14 deletions(-)
>
> What ever happened here? I'm told this is useful, but I see no comments
> and it's marked Deferred in patchwork:
>
> https://patchwork.kernel.org/patch/10579559/

Not sure, I guess it just got accidentally hidden with other patches.
It's in new state now.

> FWIW, it looks OK to me:
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>

Thanks!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
