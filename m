Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibqGL-0002ew-Cr
 for ath10k@lists.infradead.org; Mon, 02 Dec 2019 18:17:34 +0000
Subject: Re: [PATCH] ath10k: set WMI_PEER_AUTHORIZE after a firmware crash
References: <0101016eaadee57a-54500c6d-4751-423f-8bab-5acd8fad2175-000000@us-west-2.amazonses.com>
 <0101016eb61d9520-b0306a23-c9b9-4b57-b708-9f80ac47eef1-000000@us-west-2.amazonses.com>
 <CAMrEMU-VOYeHO2F5AjyWJLqgEVq5HOUHZkMJqGio1qovFPo8ug@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <b5404ac0-1be1-229f-a9e3-8033cdf7eea9@candelatech.com>
Date: Mon, 2 Dec 2019 10:17:30 -0800
MIME-Version: 1.0
In-Reply-To: <CAMrEMU-VOYeHO2F5AjyWJLqgEVq5HOUHZkMJqGio1qovFPo8ug@mail.gmail.com>
Content-Language: en-US
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
To: Justin Capella <justincapella@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

On 12/1/19 8:45 PM, Justin Capella wrote:
> Are there security concerns here? Was the peer known to be authorized
> beforehand? Would it be better to just trash the peer in the event of
> a fw crash?

I think you should completely re-associate the peer(s) when firmware
crashes.  The driver does not cache all possible changes, so it cannot
exactly rebuild the config to the previous state.

Thanks,
Ben

> 
> On Thu, Nov 28, 2019 at 11:46 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Wen Gong <wgong@codeaurora.org> wrote:
>>
>>> After the firmware crashes ath10k recovers via ieee80211_reconfig(),
>>> which eventually leads to firmware configuration and including the
>>> encryption keys. However, because there is no new auth/assoc and
>>> 4-way-handshake, and firmware set the authorize flag after
>>> 4-way-handshake, so the authorize flag in firmware is not set in
>>> firmware without 4-way-handshake. This will lead to a failure of data
>>> transmission after recovery done when using encrypted connections like
>>> WPA-PSK. Set authorize flag after installing keys to firmware will fix
>>> the issue.
>>>
>>> This was noticed by testing firmware crashing using simulate_fw_crash
>>> debugfs file.
>>>
>>> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.
>>>
>>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>>
>> Patch applied to ath-next branch of ath.git, thanks.
>>
>> 382e51c139ef ath10k: set WMI_PEER_AUTHORIZE after a firmware crash
>>
>> --
>> https://patchwork.kernel.org/patch/11263357/
>>
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>>
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
