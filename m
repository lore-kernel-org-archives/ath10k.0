Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJr3D-0003sl-58
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 21:34:44 +0000
Received: by mail-qc0-f179.google.com with SMTP id m20so6773187qcx.24
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 14:34:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53F39AB3.10601@candelatech.com>
References: <CAD1M062MNW7y_hf+5btNA14xt9K69TqQy=Q-rCm+2xuHCZDEsA@mail.gmail.com>
 <53F39AB3.10601@candelatech.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Tue, 19 Aug 2014 14:33:44 -0700
Message-ID: <CAD1M062FPxZyj86LvvaomwR3z2KeScnYDCNT_g6zMQzK10+vxA@mail.gmail.com>
Subject: Re: Timeout Issues
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
Cc: ath10k@lists.infradead.org

On Tue, Aug 19, 2014 at 11:42 AM, Ben Greear <greearb@candelatech.com> wrote:
> Have you tried a WLE900 VX NIC?  Those have worked well for me.

I haven't yet, though I'll get my hands on one to try out.  I have
tried a WLE900N5-20 with the
same results below, however.

>> I am using the following software on an ARM board:
>> ath10k branch of linux kernel: 3.16.0-wl-ath-182333-g6a69f0c
>> latest git of hostapd
>> latest git of iw
>> latest git of wpa_supplicant
>>
>> I have tried both firmware-2 binary blobs (the "AP" and "STA"
>> versions) as well as the newer firmware-3 binary with the same exact
>> messages being displayed.
>
> Probably this is not a firmware issue, but if you have nothing else
> to try, you can try my version of the 10.1.x firmware:
>
> http://www.candelatech.com/ath10k.php
>
> and possibly my hacked 3.14.14 kernel, which may spew out some additional
> debug info if you have something like OTP issues.
>
> git clone git://dmz2.candelatech.com/linux-3.14.dev.y

With the Kernel I was using (the 3.16.0-wl-ath-x-x), your firmware
produced the following:
[    5.466186] ath10k: Unknown FW IE: 5

and then output the same timed out messages. The upstream ath10k
driver that I'm using is
looking for firmware-3.bin it seems.

I cloned your kernel and built it, but was having the same exact
errors I posted before (no extra
debug info). One interesting thing I found is if I use OpenWrt trunk,
ath10k seems to behave fine,
but another distro seems to break things. I'll need to dig further
into that, but in the mean time, do
you have any thoughts?

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
