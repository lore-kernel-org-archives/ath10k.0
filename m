Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNaMo-0000Ko-Ga
 for ath10k@lists.infradead.org; Tue, 29 May 2018 08:52:32 +0000
Received: by mail-wm0-x231.google.com with SMTP id t11-v6so38264078wmt.0
 for <ath10k@lists.infradead.org>; Tue, 29 May 2018 01:52:18 -0700 (PDT)
Received: from timur-xps ([2001:998:2a:dead:69d9:6ca4:e858:1e60])
 by smtp.gmail.com with ESMTPSA id f14-v6sm550893ljj.15.2018.05.29.01.52.15
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 May 2018 01:52:16 -0700 (PDT)
Message-ID: <c92e04d5b80af2a640ab97efce32d987ffb27ffe.camel@gmail.com>
Subject: Frequent ath10k crashes with QCA6174 on kernels 4.16 and 4.17
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Date: Tue, 29 May 2018 11:52:15 +0300
Mime-Version: 1.0
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
To: ath10k@lists.infradead.org

Hi,

I'm experiencing a lot of ath10k driver crashes on both 4.16 (as
shipped in Fedora) and 4.17 (tried rc5 and rc6) using a Dell XPS 13
9370 with a QCA6174.

With 4.16 the driver crash always results in the whole system hanging.
With 4.17 it does not always hang the system completely, but it still
happends. I also tried to upgrade the firmware which also reduces the
frequency of the crashes but does not eliminate them completely.

The common pattern I see in dmesg is this:
[30372.900832] wlp2s0: AP 64:7c:34:3f:c3:b0 changed bandwidth, new config is 2437 MHz, width 2 (2447/0 MHz)

Searching a bit in kernel sources, this message is printed by this line:
https://github.com/torvalds/linux/blob/master/net/mac80211/mlme.c#L364
And width 2 seems to correspond to NL80211_CHAN_WIDTH_40 here:
https://github.com/torvalds/linux/blob/master/include/uapi/linux/nl80211.h#L3880

So it seems that either the driver or the firmware can't cope with it when the AP changes the bandwidth.
Here is the Fedora bug report:
https://bugzilla.redhat.com/show_bug.cgi?id=1577106

Is there anything that can be done to improve the stability of ath10k on this system?
I see there is a lot going on in the upstream repo, but not sure which branch to try: ath-next or qca?

Best regards,
Tim

ps. I'm not on the mailing list, please add me to CC when you reply. Thanks.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
