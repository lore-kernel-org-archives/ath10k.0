Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xnx5N-0008W6-Kk
 for ath10k@lists.infradead.org; Mon, 10 Nov 2014 22:05:22 +0000
Received: by mail-qg0-f48.google.com with SMTP id q108so6250340qgd.35
 for <ath10k@lists.infradead.org>; Mon, 10 Nov 2014 14:04:59 -0800 (PST)
MIME-Version: 1.0
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Mon, 10 Nov 2014 14:04:29 -0800
Message-ID: <CAD1M060Y+3r_-J12ZqT4TqddUf9tJHKCEPJ0DhFJ1sCiXimdVw@mail.gmail.com>
Subject: htt rx stopped. cannot recover
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello everyone.

I am having issues that occur when I have heavy network traffic in a
wireless bridge. That is:
  {lan1}<--ether-->AP<--wifi-->STA<--ether-->{lan2}

Note that the above scenario requires 4addr to be turned on. Once I
associate the AP and STAtion and begin passing traffic through at a
rate of greater than ~250mbps TCP for several seconds, I see the below
on the STAtion:

> ...
> [   50.437806] wlan0: authenticate with 00:30:1a:4e:00:5d
> [   51.443940] wlan0: send auth to 00:30:1a:4e:00:5d (try 1/3)
> [   51.450692] wlan0: authenticated
> [   51.464272] wlan0: associate with 00:30:1a:4e:00:5d (try 1/3)
> [   51.471328] wlan0: RX AssocResp from 00:30:1a:4e:00:5d (capab=0x1 status=0 aid=1)
> [   51.992991] wlan0: associated
> [   51.996455] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> [   52.005001] br-lan: port 2(wlan0) entered forwarding state
> [   52.010561] br-lan: port 2(wlan0) entered forwarding state
Start passing traffic through
> [   61.614230] br-lan: port 1(eth1) entered forwarding state
> [   63.331225] ath10k_pci 0000:07:00.0: htt rx received chained non A-MSDU frame
> [   67.054654] br-lan: port 2(wlan0) entered forwarding state
> [   68.173786] ath10k_pci 0000:07:00.0: htt rx received chained non A-MSDU frame
> [   76.679431] ath10k_pci 0000:07:00.0: htt rx stopped. cannot recover
> [   76.685770] ath10k_pci 0000:07:00.0: failed to pop amsdu from htt rx ring -1
> [   76.692844] ath10k_pci 0000:07:00.0: htt is confused. refusing rx
> [   76.699005] ath10k_pci 0000:07:00.0: failed to pop amsdu from htt rx ring -1
> [   76.706138] ath10k_pci 0000:07:00.0: htt is confused. refusing rx
> [   76.712256] ath10k_pci 0000:07:00.0: failed to pop amsdu from htt rx ring -1
> [   76.719377] ath10k_pci 0000:07:00.0: htt is confused. refusing rx
> ...

Firmware: 10.1.467.2-1 (I've also tried 10.2-00082-4-2)
Kernel: 3.17.0-rc1-193451-g707b1bbd (From ath-next; I've also tried
several other kernel versions)
ath10k source: Current ath-next
(707b1bbd7e6ec533cfa027054ccbeb90113a40b0; I've also tried
backports-20141023 and backports-20140808)
Arch: arm
Software: Latest (released) wpa_supplicant and latest (released) hostapd
Radios: seen on both the ACE-DB-3 and WLE900VX

I've also tried disabling A-MSDU via "echo "1 64" >
htt_max_amsdu_ampdu", but continue seeing the issue. Any help on this
is appreciated.

Thanks,
Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
