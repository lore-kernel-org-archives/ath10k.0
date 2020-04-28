Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMrz-00057n-E7
 for ath10k@lists.infradead.org; Tue, 28 Apr 2020 09:49:43 +0000
MIME-Version: 1.0
Date: Tue, 28 Apr 2020 17:49:27 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2 1/4] ath10k: enable firmware peer stats info for wmi tlv
In-Reply-To: <87k120eyyl.fsf@kamboji.qca.qualcomm.com>
References: <20200427080416.8265-2-wgong@codeaurora.org>
 <20200428091303.089AEC433D2@smtp.codeaurora.org>
 <87k120eyyl.fsf@kamboji.qca.qualcomm.com>
Message-ID: <2c0d03590f2ecf55aaff86e760232807@codeaurora.org>
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

On 2020-04-28 17:33, Kalle Valo wrote:
> Kalle Valo <kvalo@codeaurora.org> writes:
> 
>> Wen Gong <wgong@codeaurora.org> wrote:
>> 
>>> For wmi tlv type, firmware disable peer stats info by default, after
>>> enable it, firmware will report WMI_TLV_PEER_STATS_INFO_EVENTID if
>>> ath10k send WMI_TLV_REQUEST_PEER_STATS_INFO_CMDID to firmware.
>>> 
>>> Enable it will only set a flag in firmware, firmware will not report
>>> it without receive request WMI command.
>>> 
>>> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.
>>> 
>>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>> 
>> 4 patches applied to ath-next branch of ath.git, thanks.
>> 
>> 2289bef25e32 ath10k: enable firmware peer stats info for wmi tlv
>> 0f7cb26830a6 ath10k: add rx bitrate report for SDIO
>> 3344b99d69ab ath10k: add bitrate parse for peer stats info
>> 4cc02c7c1494 ath10k: correct tx bitrate of iw for SDIO
> 
> I think these caused a new warning which I missed:
> 
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34: warning: incorrect
> type in assignment (different base types)
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34:    expected
> restricted __le32 [usertype] reset_after_request
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34:    got unsigned int
> [usertype] reset
ok. I will give new patch to fix the 3 warning.
> 
> Please send a followup patch to fix that.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
