Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22d.google.com ([2607:f8b0:400c:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvEZ8-0001ji-39
 for ath10k@lists.infradead.org; Thu, 12 Jun 2014 23:37:54 +0000
Received: by mail-ve0-f173.google.com with SMTP id db11so2589291veb.32
 for <ath10k@lists.infradead.org>; Thu, 12 Jun 2014 16:37:32 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Thu, 12 Jun 2014 19:37:12 -0400
Message-ID: <CAHqTa-1EDoRwSXWx4JQ_JSpF1_60B3fn=KecE4mDCrLrDJ5odw@mail.gmail.com>
Subject: After shutdown/restart, ath10k sometimes stops receiving packets
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
To: ath10k <ath10k@lists.infradead.org>

Hi all,

We are experiencing a relatively-rare-but-not-rare-enough case which
has approximately these steps:

- run a wifi AP for a while with a station or two connected
- shut down hostapd (stations all get disconnected of course)
- restart hostapd (perhaps on another channel or with different settings)

After that, an external wifi sniffer can see beacons being transmitted
by the AP as expected, but all packets from stations trying to connect
are ignored.  In particular, Probe requests are not answered, and Auth
requests do not even receive a wifi ACK.

Restarting hostapd doesn't fix it.  However, rmmoding and modprobing
the ath10k_pci module does fix it.

This is with a mindspeed c2k host processor, 3.2 kernel, and modules
backported by backports from kvalo's ath-next as of
v3.15-rc1-237-gd9bc4b9 (roughly 2014-04-29).  Firmware is
10.1.467.2-1.

Has anyone else seen this?  Any suggestions where to look to narrow
down the problem?

I can't exactly produce it on demand yet, but if someone suggests
things to look for when it happens, it occurs often enough that I
should be able tor run those things.

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
