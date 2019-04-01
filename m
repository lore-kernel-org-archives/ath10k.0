Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB5yQ-0000BS-Mt
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 23:04:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id w15so1255757wmc.3
 for <ath10k@lists.infradead.org>; Mon, 01 Apr 2019 16:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUausqyscU3yt-f-5XjnpHPiLHN7QJ_96sA1pMfB4V459Wb+Q@mail.gmail.com>
 <b75d752f-dc9e-a2a2-ac57-ae2a4716f0dc@candelatech.com>
In-Reply-To: <b75d752f-dc9e-a2a2-ac57-ae2a4716f0dc@candelatech.com>
From: Carlito Nueno <carlitonueno@gmail.com>
Date: Mon, 1 Apr 2019 16:04:01 -0700
Message-ID: <CAEUausqcA-FGhAzLBcdt9Y-cWk7zYM4wsMBetOaCSLyS4+LMKQ@mail.gmail.com>
Subject: Re: QCA9984 all devices being de-authenticated and unable to
 re-connect
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

Hi Ben,

Can you tell me how I can compile ath10k-ct firmware version present
in 18.06.2 into the latest snapshot?

I want to try and see if it's firmware related.

Awesome to know you had 64+ stations connected to your firmware.

Thanks for the help.

On Sun, Mar 31, 2019 at 8:06 PM Ben Greear <greearb@candelatech.com> wrote:
>
> Hello,
>
> You could try using the ath10k-ct firmware that does NOT work for you (18.06.2) in
> the latest snapshot.  If problem still happens, then it is firmware related,
> and I can then build you a series of images so you can do a bisect to find what
> commit fixes the issue if you really want to know what is the fix.
>
> Otherwise, maybe something else fixed the problem.  For what it is worth, we
> have regularly done 64+ stations connected to our ath10k firmware/driver
> for years.
>
> Thanks,
> Ben
>
> On 03/29/2019 07:02 PM, Carlito Nueno wrote:
> > Hi all,
> >
> > I am using:
> >
> > ath10k-firmware-qca9984 - 2018-12-16-211de167-1
> > kmod-ath10k - 4.14.109+4.19.23-1-5
> >
> > ## Problem
> > I am able to associate and authenticate many clients. Max I tested was
> > 15 clients.
> > But when more than 4 clients start to play video stream (youtube,
> > twitch, netflix):
> >
> > 1. all the clients loose internet connectivity
> > 2. all of them are _de-authenticated_
> >
> > 3. when trying to reconnect, they connect but are _disassociated_ immediately.
> >
> > c2:44:2f:f3:3c:22  -64 dBm / -109 dBm (SNR 45)  40 ms ago
> >     RX: 200.0 MBit/s, VHT-MCS 9, 40MHz, VHT-NSS 1        48 Pkts.
> >     TX: 12.0 MBit/s                                    9 Pkts.
> >     expected throughput: unknown
> >
> > c2:44:2f:f3:3c:22  -57 dBm / -109 dBm (SNR 52)  10 ms ago
> >     RX: 12.0 MBit/s                                   17 Pkts.
> >     TX: 12.0 MBit/s                                    5 Pkts.
> >     expected throughput: unknown
> >
> > 4. internet on the AP works. (I am able to ping google.com)
> >
> > ## Firmware and OS this problem occurs
> > - ath10k + 18.06.2 = yes, there is this problem
> > - ath10k + snapshot = yes, there is this problem
> > - ath10k-ct + 18.06.2 = yes, similar problem occurs
> > (https://github.com/greearb/ath10k-ct/issues/82)
> > - ath10k-ct + snapshot = no, works fine
> >
> > ## OpenWRT info
> >
> > ### Release
> > DISTRIB_ID='OpenWrt'
> > DISTRIB_RELEASE='SNAPSHOT'
> > DISTRIB_REVISION='r9753-6df5ab89cf'
> > DISTRIB_TARGET='ar71xx/generic'
> > DISTRIB_ARCH='mips_24kc'
> > DISTRIB_DESCRIPTION='OpenWrt SNAPSHOT r9753-6df5ab89cf'
> > DISTRIB_TAINTS='no-all'
> >
> > ### Logs
> > Include:
> > - Full list of OPKGs installed: 2_opkg_installed-txt
> > - Logs up to the point of crash: 3_ath10k_crash-txt
> > - Logs after the crash and trying to reconnect: 4_after_crash_reconnect-txt
> >
> > https://gist.github.com/ironpillow/96ce9173721163a8c8c93113b2a677d7
> >
> > ### More logs
> > I noticed that the some devices stay connected :man_shrugging: and
> > when these connected devices make a dns request, the request is
> > reaching the DNS server but the AP is not receiving response.
> >
> > I ran ping on *one device* and captured packets on AP (two interfaces):
> > - tcpdump -i wlan0-ap
> > - tcpdump -i br-lan
> >
> > ping google.com:
> > https://gist.github.com/ironpillow/50cb0e2010ac5bc9acc7abc7e20ab910
> > ping 8.8.8.8: https://gist.github.com/ironpillow/97cb3dd6eb8e9d028a8231f142fae01f
> >
> > Packets are not reaching wifi wlan0-ap interface.
> >
> > I am happy to run more tests.
> >
> > Any advice?
> >
> > _______________________________________________
> > ath10k mailing list
> > ath10k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath10k
> >
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
