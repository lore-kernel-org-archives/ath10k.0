Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMd4-0000MZ-3p
 for ath10k@lists.infradead.org; Tue, 28 Apr 2020 09:34:19 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 1/4] ath10k: enable firmware peer stats info for wmi tlv
References: <20200427080416.8265-2-wgong@codeaurora.org>
 <20200428091303.089AEC433D2@smtp.codeaurora.org>
Date: Tue, 28 Apr 2020 12:33:54 +0300
In-Reply-To: <20200428091303.089AEC433D2@smtp.codeaurora.org> (Kalle Valo's
 message of "Tue, 28 Apr 2020 09:13:03 +0000 (UTC)")
Message-ID: <87k120eyyl.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Wen Gong <wgong@codeaurora.org> wrote:
>
>> For wmi tlv type, firmware disable peer stats info by default, after
>> enable it, firmware will report WMI_TLV_PEER_STATS_INFO_EVENTID if
>> ath10k send WMI_TLV_REQUEST_PEER_STATS_INFO_CMDID to firmware.
>> 
>> Enable it will only set a flag in firmware, firmware will not report
>> it without receive request WMI command.
>> 
>> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.
>> 
>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> 4 patches applied to ath-next branch of ath.git, thanks.
>
> 2289bef25e32 ath10k: enable firmware peer stats info for wmi tlv
> 0f7cb26830a6 ath10k: add rx bitrate report for SDIO
> 3344b99d69ab ath10k: add bitrate parse for peer stats info
> 4cc02c7c1494 ath10k: correct tx bitrate of iw for SDIO

I think these caused a new warning which I missed:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34:    expected restricted __le32 [usertype] reset_after_request
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34:    got unsigned int [usertype] reset

Please send a followup patch to fix that.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
