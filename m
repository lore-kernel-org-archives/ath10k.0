Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WISzq-0005iJ-SL
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 01:09:15 +0000
Received: by mail-vc0-f169.google.com with SMTP id hq11so223104vcb.28
 for <ath10k@lists.infradead.org>; Tue, 25 Feb 2014 17:08:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <530D3A92.9080503@candelatech.com>
References: <530D128B.3030509@candelatech.com>
 <CAHqTa-0xkrJxiHTRJrc5hnA+-nA3AONOpMXFWS+1wcSuPdaFPA@mail.gmail.com>
 <530D3A92.9080503@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 25 Feb 2014 17:08:32 -0800
Message-ID: <CAHqTa-0rfAWWwyTHeiTXDUVQnUZC3TH76OZsE223CegRrPky6w@mail.gmail.com>
Subject: Re: Anyone have a working hostapd conf file for AC?
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, Feb 25, 2014 at 4:51 PM, Ben Greear <greearb@candelatech.com> wrote:
> On 02/25/2014 04:19 PM, Avery Pennarun wrote:
>> On Tue, Feb 25, 2014 at 2:00 PM, Ben Greear <greearb@candelatech.com> wrote:
>>> Does anyone have a working hostapd config file for
>>> ath10k?
>>
>> Here's mine (20/40/80 MHz all supported):
>
> Thanks...I managed to get something similar working
> (open authentication in my case).
>
> I also had to update the regulatory.bin, which enabled
> HT80.
>
> But, when using ath10k as AP, with both my firmware and the official
> 10.1.467 firmware, my stations (always ath10k with my hacked firmware) can associate
> but do not receive any DHCP responses.

I've seen some similar symptoms but I'm confused about which symptoms
occurred when, and don't have good reproduction steps yet.  I think
killing hostapd, then unloading/reloading the driver, then restarting
hostapd, generally fixes it.

Of course check the obvious things, like delete any bridge= line from
hostapd.conf, make sure you do 'ip link set wlan0 up', make sure dhcpd
is running on the right device, etc.

You might want to try a static IP configuration and then tcpdump to
see which direction(s) the data is going in.  My experience is it jams
in one direction or the other, but I can't remember which direction.

> When I use my ath10k stations against a Netgear AC AP, then they
> associate and get DHCP and pass traffic to each other...  The reported
> rx encoding rate is never reaches much above 200Mbps, though..seems like
> it would train up higher.

I've done better than 200 Mbps, but haven't attemped to max out the
speeds on my device yet.

Have fun,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
