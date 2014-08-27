Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMX11-0007TG-PV
 for ath10k@lists.infradead.org; Wed, 27 Aug 2014 06:47:33 +0000
Received: by mail-wg0-f47.google.com with SMTP id b13so15543068wgh.30
 for <ath10k@lists.infradead.org>; Tue, 26 Aug 2014 23:47:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=QGc+bqN+9NA39AxTeN7Xr-PDK13dDD8JxuYxorbmayw@mail.gmail.com>
References: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
 <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1ZWg38dkT1N0fm3JkLL1kVc_pP1dsuCuorZxXm8z6M7Q@mail.gmail.com>
 <87wqa5au7q.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=Qcrrutt6ZUtbrgKzx0Mo9186SRuV7dc97FnOxwn3Jxg@mail.gmail.com>
 <87siktat4d.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=QGc+bqN+9NA39AxTeN7Xr-PDK13dDD8JxuYxorbmayw@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 27 Aug 2014 02:46:48 -0400
Message-ID: <CAHqTa-0Z=VbsZvWNW_=prAU4gCYq4D4ab6m+P8di2s6PHL7bbA@mail.gmail.com>
Subject: Re: Support for scan while in AP mode, and offchannel while in AP mode
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

On Tue, Aug 19, 2014 at 3:01 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 19 August 2014 08:30, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Yes, my understanding as well is that the ath10k firmware is like that.
>> But I'm no firmware expert :)
>>
>> I assume that the 10.x firmware does support hw_scan when in AP mode and
>> we would need to "just" change mac80211 to support that. But no idea how
>> big task that actually is.
>
> Yes it does. If we raise internal scan priority from low to at least
> high then beaconing does not preempt scanning. I haven't checked how
> well this works with traffic to/from connected stations though.
>
> I've also found the OpenWRT hack I've mentioned earlier:
>
> http://git.openwrt.org/?p=openwrt.git;a=blob;f=package/kernel/mac80211/patches/310-ap_scan.patch;h=23ecd370300f13c25983bbbeaa7d718c3e250997;hb=HEAD

Followup: I tried the above patch and it "works", though with some problems.

To check channel reliability, I ran my isoping tool:
https://gfiber.googlesource.com/vendor/google/platform/+/master/cmds/isoping.c

On the client:
   isoping -q
On the AP:
   isoping -r33 <ipaddr-of-client>

This sends a packet in each direction every 10ms and prints the time
delay for each packet as well as the total packet loss.

I have my AP running on channel 149 with 80 MHz width and things work
fine (typical measured delay is <1ms).  Then I run this on the ath10k
AP:

iw wlan1 scan freq 5180 flush ap-force passive | grep KNOWN_SSID_ON_CHANNEL_36

The result is:
- isoping reports zero packets lost (very consistent)
- packets in each direction are delayed by some amount *less* than
100ms.  (It looks to be about 40-50ms but sometimes less.)
- the passive channel scan *sometimes* sees the KNOWN_SSID beacons
(roughly 50% of the time)

When I stop hostapd, the passive channel scan succeeds about 100% of the time.

Removing the 'passive' parameter also makes it work, even without
killing hostapd.  Of course this sends unwanted Probe packets on the
channel.

With an ath9k AP instead of an ath10k, it works correctly: isoping
reports no loss, a roughly 100ms delay (within its precision), and
passive scanning works about 100% of the time.

Any guesses about why the offchannel time would be too short on ath10k?

I haven't investigated whether the packets are enqueued or simply
retransmitted after it returns to the channel, but in any case,
userspace and TCP don't see packet loss, so it's fine with me.

This is the ath10k driver from 3.15rc1 and firmware 10.1.467.2-1.

Suggestions?

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
