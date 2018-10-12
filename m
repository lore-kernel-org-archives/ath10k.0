Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAzkv-0003Bx-6J
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 15:53:41 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fill the channel survey results for WCN3990
 correctly
References: <1538564267-19863-1-git-send-email-pillair@codeaurora.org>
 <20181012143434.3F49060A98@smtp.codeaurora.org>
Date: Fri, 12 Oct 2018 18:53:19 +0300
In-Reply-To: <20181012143434.3F49060A98@smtp.codeaurora.org> (Kalle Valo's
 message of "Fri, 12 Oct 2018 14:34:34 +0000 (UTC)")
Message-ID: <87murj2mc0.fsf@kamboji.qca.qualcomm.com>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

Kalle Valo <kvalo@codeaurora.org> writes:

> Rakesh Pillai <pillair@codeaurora.org> wrote:
>
>> The host driver currently expects the channel info event to be
>> received in pairs for all the channels, i.e. the first
>> chan_info event for a particular channel will not have the
>> COMPLETE flag set and the second chan_info event for the
>> same channel will have the COMPLETE flag set.
>> 
>> The HL2.0 firmware sends only one channel info event per channel
>> which is scanned without the COMPLETE flag set. After sending the
>> chan_info_event for all the channels, the HL2.0 firmware sends a
>> chan_info_event with COMPLETE flag set to indicate the completion
>> of the channel info event.
>> 
>> The firmware does not indicate this behavior with any service bitmap
>> and hence a new firmware feature flag is used to handle the modified
>> parsing of the channel info events, in the host driver, for the
>> firmware which sends single channel info event per scanned channel.
>> 
>> Tested HW: WCN3990
>> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
>> 
>> Co-developed-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
>> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> Kbuild bot reported some errors:
>
>>> ERROR: "__udivdi3" [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
>>> ERROR: "__divdi3" [drivers/net/wireless/ath/ath10k/ath10k_core.ko] undefined!
>
> Need to investigate those if they are valid or problem with the bot.

Arnd explained the problem in the other thread:

  "I think the problem is that 'clock_freq' is a 'u64', which means we
   can't use a normal 32-bit division. It looks like it cannot actually
   go beyond the range of a u32, so changing the type should be
   sufficient."

Please investigate that and submit v2.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
