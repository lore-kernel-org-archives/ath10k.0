Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZ148-0001PO-Pj
 for ath10k@lists.infradead.org; Thu, 25 Feb 2016 18:55:09 +0000
Message-ID: <56CF4DA3.8030803@codeaurora.org>
Date: Thu, 25 Feb 2016 10:53:23 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: set MAC timestamp in management Rx frame
References: <4c705dc7a2c0aa857da4e6eaf6e8ed47c354b9ea.1456351768.git.poh@qca.qualcomm.com>
 <87k2lsd9zv.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87k2lsd9zv.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "Oh, Peter" <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi,

On 02/25/2016 08:34 AM, Valo, Kalle wrote:
> Peter Oh <poh@qca.qualcomm.com> writes:
>
>> Check and set Rx MAC timestamp when firmware indicates it.
>> Firmware adds it in Rx beacon frame only at this moment.
>> Driver and mac80211 may utilize it to detect such clockdrift
>> or beacon collision and use the result for beacon collision
>> avoidance.
>>
>> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
>> ---
>>
>> v2:
>> 	- fix kbuild test robot warning, left shift count >= width of
> type,
>> 	at __le32_to_cpu(arg.ext_info.rx_mac_timestamp_u32) << 32
>> v3:
>> 	- correct ext_info to start 4-byte aligned
>> 	- make struct wmi_mgmt_rx_ext_info 4-byte aligned to comply FW's
> intention.
>
> I see new warnings:
>
> drivers/net/wireless/ath/ath10k/wmi.c:2199:16: warning: restricted __le32
> degrades to integer
> drivers/net/wireless/ath/ath10k/wmi.c:2201:41: warning: restricted __le32
> degrades to integer
> drivers/net/wireless/ath/ath10k/wmi.c:2201:41: warning: cast to restricted
> __le32
> drivers/net/wireless/ath/ath10k/wmi.c:2201:41: warning: restricted __le32
> degrades to integer
>
Do I have a way to run this check before submitting a patch such as 
checkpatch.pl?

Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
