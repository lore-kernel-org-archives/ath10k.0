Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ1KU-0006El-Ge
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 13:48:51 +0000
Received: by mail-vc0-f180.google.com with SMTP id ks9so2411943vcb.25
 for <ath10k@lists.infradead.org>; Thu, 27 Feb 2014 05:48:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87ob1sg50c.fsf@kamboji.qca.qualcomm.com>
References: <1392197866-1261-1-git-send-email-yeohchunyeow@gmail.com>
 <877g8rxgyf.fsf@kamboji.qca.qualcomm.com>
 <CAEFj9870+z+2yxjO7F69bGv3XzKNmi+ddyF41WSnv2aR98kjrw@mail.gmail.com>
 <87ob1sg50c.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 27 Feb 2014 21:48:28 +0800
Message-ID: <CAEFj985OQMj8E7VJTRh5y2TFp03v6OqTcWBuQydJad21Va1mbQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: set the mactime of ieee80211_rx_status
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Feb 27, 2014 at 7:38 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>
>>> Why? Where do you need tsf exactly? And what bug are you actually fixing
>>> here?
>>
>> There are two type of configuration modes that require local TSF, IBSS
>> and mesh for operation and also monitor mode.
>>
>> For IBSS, it is use for merging of BSSID (mac address) with same SSID
>> name, but currently this is taking care by the following "ugly" patch.
>> http://lists.infradead.org/pipermail/ath10k/2014-February/001159.html
>>
>> Mesh mode needs this for more accurate synchronization purpose.
>>
>> Besides, the monitor mode requires this to add extra piece of
>> information in radiotap header for local TSF.
>>
>>> Do we get some regressions because of proving only a 32 bit TSF? Which
>>> one is better, provide a 32-bit TSF or not at all?
>>
>> 32-bit is not good. It could cause problem when inter-operate with
>> other non-ath10k drivers with 64-bit local TSF.
>
> Yeah, I understand that. But my question is will we create regressions
> if I apply this patch which provides only 32-bit TSF? I guess not as we
> haven't provided TSF at all before, but I would like to be sure.
>
>> The better is that we can get the 64-bit local TSF. providing high TSF
>> and low TSF as found in "struct wmi_comb_phyerr_rx_hd". Is this
>> possible with current FW?
>
> I'm not familiar with the firmware so I sent a question to the firmware
> team about this.

Great, appreciate if the FW team can take a look on this. Hope to hear
from you again on this.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
