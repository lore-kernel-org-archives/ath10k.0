Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuJx6-0000vN-2l
 for ath10k@lists.infradead.org; Fri, 28 Nov 2014 11:43:09 +0000
Received: by mail-wi0-f174.google.com with SMTP id h11so18290783wiw.13
 for <ath10k@lists.infradead.org>; Fri, 28 Nov 2014 03:42:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAEFj986B15pFo2WY_2x0VwEXBEBy+j0-nff2-B=Ff=qP66iP_w@mail.gmail.com>
References: <547525D4.5080701@candelatech.com>
 <CAD1M061uAfCfCnnVY1bh6kCcXXZhwOOiyww5mkU8VkxGov9DwA@mail.gmail.com>
 <CAEFj986B15pFo2WY_2x0VwEXBEBy+j0-nff2-B=Ff=qP66iP_w@mail.gmail.com>
Date: Fri, 28 Nov 2014 19:42:44 +0800
Message-ID: <CAEFj987HmrPz1vsjmckURuC4ZYT2h6MgBT6K3yQTWy3U5s+ZtQ@mail.gmail.com>
Subject: Re: IBSS mode is now supported by CT firmware.
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
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

For CT firmware, IBSS mode works, but again the Rate Control in HT20
mode is not working at all. It always stuck with 6Mbps Tx Rate.

[  196.030000] ath10k_pci 0000:00:00.0: rx skb 869a5840 len 116 peer
04:f0:21:0c:a5:44  ucast sn 95  rate_idx 0 vht_nss 0 freq 5180 band 1
flag 0x200000 fcs-err 0 mic-err 0 amsdu-more 0

For legacy mode, rate control works. rate_idx to 7 or 54Mbps.

[  156.070000] ath10k_pci 0000:00:00.0: rx skb 86af0900 len 116 peer
04:f0:21:0c:a5:1c  ucast sn 95  rate_idx 7 vht_nss 0 freq 5180 band 1
flag 0x200000 fcs-err 0 mic-err 0 amsdu-more 0

Similar to 636 firmware.

----
ChunYeow

On Thu, Nov 27, 2014 at 9:04 AM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
> On Thu, Nov 27, 2014 at 6:36 AM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
>> On Tue, Nov 25, 2014 at 4:59 PM, Ben Greear <greearb@candelatech.com> wrote:
>>> I still cannot get WPA2 encryption to work, but open authentication
>>> seems to work fine.  I still have a good bit more testing to do.
>>> I cannot get ath9k to do encryption in IBSS mode either, so I
>>> probably am mis-configuring something.
>>
>> I don't believe WPA2 is supported with adhoc (at least through
>> wpa_supplicant). However, WPA should be and while testing your
>> firmware, I found that it doesn't seem to work (They don't see each
>> other and thus don't associate).
>>
>> I also found that, like the 999.x firmware, the rate's do not go
>> higher than 54mbit/s. Is this due to the firmware not advertising
>> proper rates or..?
>
> Are you joining the adhoc network in non-HT mode? Anyway, even if you
> use HT mode, the rate control is not working for 999.x firmware and
> always stuck at 6Mbps as far as I know.
>
> -----
> Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
