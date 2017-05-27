Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEQHY-0006Xc-Lq
 for ath10k@lists.infradead.org; Sat, 27 May 2017 01:12:43 +0000
Received: by mail-wr0-x22f.google.com with SMTP id z52so9629940wrc.2
 for <ath10k@lists.infradead.org>; Fri, 26 May 2017 18:12:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
References: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 26 May 2017 18:12:18 -0700
Message-ID: <CAJ-VmomiKOgV4pJWNKdOCzsUJZYEixvP4p5bQ9X1FBqAGk_o0w@mail.gmail.com>
Subject: Re: [PATCH] Per chain RSSI reporting
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
To: Norik Dzhandzhapanyan <norikd@ethertronics.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

[snip]

hiya,

I have something local that I've been meaning to push up to do this,
but with no smoothing. Ideally (!) smoothing is done optionally in
mac80211.

What do you think about just committing the per-chain RSSI stuff to
mac80211 so it shows up right now, and then we figure out how to
express the smoothing in mac80211 or further up the layers?

(We care about packet-to-packet RSSI values for "reasons" - mostly
bring-up and board validation, but also for runtime link checks.)


-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
