Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjsrG-00033d-L6
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 18:55:03 +0000
Received: by mail-wm0-x234.google.com with SMTP id l68so589513wml.1
 for <ath10k@lists.infradead.org>; Tue, 13 Sep 2016 11:54:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <15353347.MUgkgiNHdu@prime>
References: <2661831.slnB0LOeVt@prime>
 <87h99kjca5.fsf@kamboji.qca.qualcomm.com>
 <15353347.MUgkgiNHdu@prime>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 13 Sep 2016 20:54:20 +0200
Message-ID: <CAFBinCAXz3WiwiGO63NSn9jW5h8D_92=F_ZpEgjXxJr_cSnKeQ@mail.gmail.com>
Subject: Re: ath10k mesh + ap + encryption?
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Simon,

On Tue, Sep 13, 2016 at 1:13 PM, Simon Wunderlich <sw@simonwunderlich.de> wrote:
> On Tuesday, September 13, 2016 10:59:31 AM CEST Valo, Kalle wrote:
>> Simon Wunderlich <sw@simonwunderlich.de> writes:
>> > we have done some experiments last week on ath10k, trying to run mesh
>> > (802.11s) and access point at the same time, both encrypted.
>> >
>> > We have tested a recent LEDE (reboot-1519-g42f559e) but with
>> > firmware-5.bin_10.2.4.70.42-2 and the included wpa_supplicant, which gave
>> > us a working encrypted 802.11s network. However, starting an AP at the
>> > same time didn't work (AP doesn't beacon). This wasn't a problem when
>> > 802.11s was running unencrypted.
>> >
>> > We also tested version 10.2.4.97 (from codeaurora), which is now default
>> > in
>> > LEDE. However, this version apparently doesn't support 11s mesh at all
>> > (WMI_SERVICE_MESH_11S is disabled in the service map, but cfg/mac80211
>> > advertises support).
>> >
>> > So here are my questions:
>> >  * Did anyone succesfully run AP and mesh, both encrypted at the same
>> >  time?
>> >  * Do you have any pointers how we could fix this? Could it be fixable in
>> >  the>
>> > driver (i.e. not in firmware)?
>> >
>> >  * Does anyone have an idea if 11s will be supported in future versions? I
>> >
>> > didn't find any changelogs, but having 11s mode no longer in the service
>> > map does not make me optimistic.
>>
>> Why is LEDE using 10.2.4.97? It seems to be a quite old release and I
>> have no knowledge if anyone even tests that firmware branch with ath10k.
>> I recommend to only use firmware releases from ath10k-firmware.git as we
>> use those internally with ath10k. In any case, don't make any
>> assumptions about future from that firmware branch as it's so old.
Thanks for clarifying this.

> This was introduced in December 25th, 2015 after some firmware-related
> problems. I'm CC'ing Martin Blumenstingl who suggested this change.
>
> Since then, ath10k is pulling firmware from here (unless ct firmware is used):
>
> https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/plain/
> 10.2.4/firmware-5.bin_10.2.4.97-1
I initially updated to version 10.2.4.70.13-2, but we decided to
update to the "latest" firmware back then (see the thread at [0])
With the explanation from Kalle it makes sense to only use the
firmware binaries distributed in his repo (to ensure that the firmware
is tested by QCA's internal team).

> However, I don't understand the numbering? 10.2.4.97 > 10.2.4.70, but you say
> 10.2.4.70.42-2 is more recent? I would have assumed otherwise from the
> numbers.
That looks strange to me as well

as a side-note: I am currently preparing and testing a patch to update
the ath10k-firmware in LEDE to 10.2.4.70.52


Regards,
Martin


[0] https://www.mail-archive.com/openwrt-devel@lists.openwrt.org/msg35623.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
