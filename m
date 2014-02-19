Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22b.google.com ([2607:f8b0:400c:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG2US-0007a3-7O
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 08:26:48 +0000
Received: by mail-vc0-f171.google.com with SMTP id le5so61842vcb.16
 for <ath10k@lists.infradead.org>; Wed, 19 Feb 2014 00:26:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmbp2XRRa6gW83RoeWyDhKUzbNcGNV0EjRBZ-Gdz+Khbg@mail.gmail.com>
References: <CAEFj984MeGN=tfBb69rvCm0EvK4txH+vgPyGO7w57v-V1ATHDw@mail.gmail.com>
 <CA+BoTQmbp2XRRa6gW83RoeWyDhKUzbNcGNV0EjRBZ-Gdz+Khbg@mail.gmail.com>
Date: Wed, 19 Feb 2014 15:59:52 +0800
Message-ID: <CAEFj987fQRBU6=MqyXMxXa6W9_gAu5LPNaywfp+tLwoETXuHrQ@mail.gmail.com>
Subject: Re: QoS Control Field Stripped Off
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> From what I know HW generates QoS Control Field for nwifi tx format
> and I don't think there's a way around that.
>
> Your best bet is to get raw tx format working although last time I
> checked it crashed FW.

I try to set the ATH10K_HW_TXRX_RAW for tx format. Unfortunately, the
frame is not transmitted at all. So assume the FW not supports this.

FYI, I need to use FW version 999.999.0.636 since it is best for IBSS mode.

-----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
