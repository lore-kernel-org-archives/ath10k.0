Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuOPh-0005AN-Q3
 for ath10k@lists.infradead.org; Fri, 28 Nov 2014 16:28:58 +0000
Message-ID: <5478A2B2.3090402@candelatech.com>
Date: Fri, 28 Nov 2014 08:28:34 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: IBSS mode is now supported by CT firmware.
References: <547525D4.5080701@candelatech.com>
 <CAD1M061uAfCfCnnVY1bh6kCcXXZhwOOiyww5mkU8VkxGov9DwA@mail.gmail.com>
 <CAEFj986B15pFo2WY_2x0VwEXBEBy+j0-nff2-B=Ff=qP66iP_w@mail.gmail.com>
 <CAEFj987HmrPz1vsjmckURuC4ZYT2h6MgBT6K3yQTWy3U5s+ZtQ@mail.gmail.com>
In-Reply-To: <CAEFj987HmrPz1vsjmckURuC4ZYT2h6MgBT6K3yQTWy3U5s+ZtQ@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, Pushpal Sidhu <psidhu@gateworks.com>
Cc: ath10k <ath10k@lists.infradead.org>

I'll investigate the rate-control logic.  I don't know enough
about IBSS currently to know why it would use different rate-ctrl logic than
the normal sta/ap, but hopefully I can figure it out.

Can you post some details on how you configure HT20 v/s legacy mode
for IBSS interfaces?

Do you have any reason to believe the problem is in the driver or mac80211
stack, or is this all a firmware issue?

And, if anyone has a different /AC NIC that can do IBSS, I'm curious
if ath10k will receive at higher speeds?

Thanks,
Ben


On 11/28/2014 03:42 AM, Yeoh Chun-Yeow wrote:
> For CT firmware, IBSS mode works, but again the Rate Control in HT20
> mode is not working at all. It always stuck with 6Mbps Tx Rate.
>
> [  196.030000] ath10k_pci 0000:00:00.0: rx skb 869a5840 len 116 peer
> 04:f0:21:0c:a5:44  ucast sn 95  rate_idx 0 vht_nss 0 freq 5180 band 1
> flag 0x200000 fcs-err 0 mic-err 0 amsdu-more 0
>
> For legacy mode, rate control works. rate_idx to 7 or 54Mbps.
>
> [  156.070000] ath10k_pci 0000:00:00.0: rx skb 86af0900 len 116 peer
> 04:f0:21:0c:a5:1c  ucast sn 95  rate_idx 7 vht_nss 0 freq 5180 band 1
> flag 0x200000 fcs-err 0 mic-err 0 amsdu-more 0
>
> Similar to 636 firmware.
>
> ----
> ChunYeow
>
> On Thu, Nov 27, 2014 at 9:04 AM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> On Thu, Nov 27, 2014 at 6:36 AM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
>>> On Tue, Nov 25, 2014 at 4:59 PM, Ben Greear <greearb@candelatech.com> wrote:
>>>> I still cannot get WPA2 encryption to work, but open authentication
>>>> seems to work fine.  I still have a good bit more testing to do.
>>>> I cannot get ath9k to do encryption in IBSS mode either, so I
>>>> probably am mis-configuring something.
>>>
>>> I don't believe WPA2 is supported with adhoc (at least through
>>> wpa_supplicant). However, WPA should be and while testing your
>>> firmware, I found that it doesn't seem to work (They don't see each
>>> other and thus don't associate).
>>>
>>> I also found that, like the 999.x firmware, the rate's do not go
>>> higher than 54mbit/s. Is this due to the firmware not advertising
>>> proper rates or..?
>>
>> Are you joining the adhoc network in non-HT mode? Anyway, even if you
>> use HT mode, the rate control is not working for 999.x firmware and
>> always stuck at 6Mbps as far as I know.
>>
>> -----
>> Chun-Yeow
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
